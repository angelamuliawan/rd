<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class AB_Controller extends CI_Controller {
	
	public function __construct() {
		parent::__construct();

		$this->load->library('rest');
	}

	public function render( $content_name = false, $layout = 'default', $is_admin = false ) {
		
		$controller_name = $this->router->fetch_class();
		$method_name = $this->router->fetch_method();

		$default_content_path = $controller_name.'/'.$method_name;

		if( !empty($content_name) ) {
			$default_content_path = $controller_name.'/'.$content_name;
		}

		if( !empty($is_admin) ) {
			$default_content_path = 'Admin/'.$controller_name.'/'.$content_name;
		}

		$content_view = $this->load->view($default_content_path, '',  TRUE);
		$this->load->view('Layouts/'.$layout, array(
			'content_view' => $content_view
		));
	}

	public function debug( $param ){
		echo '<pre>';
		print_r($param); die();
		echo '</pre>';
	}
}

/* End of file AB_Controller.php */