<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Ajax extends AB_Controller {

	public function list_composition() {
		$this->load->helper('build_data');

		$compositions = $this->db->query('CALL GetAllComposition()');
		$compositions = buildDataAutocomplete($compositions, 'CompositionID', 'CompositionName');
		echo json_encode($compositions);
	}

	public function upload_image( $action_type = 'recook' ) {
		$this->load->library('upload');
		$path = false;
		$default_style = 'width:auto; height:100%;';

		switch( $action_type ){
			case 'users':
				$path = 'users';
				$default_style = 'width:100%; height:auto; max-height:230px; display:inline-block';
				break;
			case 'recook':
				$path = 'recipe/recook';
				break;
		}

		$config = $this->getConfigImage($path);
		$result = 'Gagal mengunggah foto. Silahkan coba lagi.';

		foreach ($_FILES as $field_name => $file_object) {
		    if ( !empty($file_object['name']) ) {
		    	
		    	$file_name = $file_object['name'];
		    	$ext = pathinfo($file_name, PATHINFO_EXTENSION);
		    	$config['file_name'] = $file_name = sprintf('%s_%s.%s', date("Ymd_H_i_s", time()), mt_rand(1,100), $ext);				

		        $this->upload->initialize($config);
		        
		        if ( !$this->upload->do_upload($field_name) ) {
		            $errors = $this->upload->display_errors();
		            $this->setCustomError($field_name, $errors);
		        } else {
		        	$result = tag('img', false, array(
		        		'src' => $this->domain.'/'.$config['upload_path'].'/'.$config['file_name'],
		        		'data-name' => $config['file_name'],
		        		'style' => $default_style,
		        	));
		        }
		    } else {
		    	$this->setCustomError($field_name, 'Photo field required.');
			}
		}

		echo $result;
	}

	public function upload_image_article(){
		// Allowed extentions.
		$allowedExts = array("gif", "jpeg", "jpg", "png");

		// Get filename.
		$temp = explode(".", $_FILES["file"]["name"]);

		// Get extension.
		$extension = end($temp);

		// An image check is being done in the editor but it is best to
		// check that again on the server side.
		// Do not use $_FILES["file"]["type"] as it can be easily forged.
		// $finfo = finfo_open(FILEINFO_MIME_TYPE);
		// $mime = finfo_file($finfo, $_FILES["file"]["tmp_name"]);

		// if (( ($mime == "image/gif") || ($mime == "image/jpeg") || ($mime == "image/pjpeg") || ($mime == "image/x-png") || ($mime == "image/png")) && in_array($extension, $allowedExts)) {
		    // Generate new random name.
		    $name = sha1(microtime()) . "." . $extension;
		    $config = $this->getConfigImage('article/content/');

		    // Save file in the uploads folder.
		    move_uploaded_file($_FILES["file"]["tmp_name"], $config['upload_path'].$name);

		    // Generate response.

		    $response = new StdClass;
		    $response->link = $this->domain."/".$config['upload_path'].$name;
			echo stripslashes(json_encode($response));
		// }
	}
}