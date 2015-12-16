<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Recipe extends AB_Controller {

	public function index() {
		$this->render();
	}

	public function find() {
		$this->render();
	}

	public function detail() {
		$this->render();
	}

	public function add() {
		$this->load->helper('form');
		$post = $this->input->post();
		$message = 'Gagal menyimpan data. Silahkan coba lagi';
		$status = 'error';

		$food_types = $this->db->query('CALL GetAllFoodType()');
		$food_types = $this->buildDataDropdown($food_types, 'FoodTypeID', 'FoodTypeName');
		
		$food_process = $this->db->query('CALL GetAllFoodProcess()');
		$food_process = $this->buildDataDropdown($food_process, 'FoodProcessID', 'FoodProcessName');
		
		$price_ranges = $this->db->query('CALL GetAllPriceRange()');
		$price_ranges = $this->buildDataDropdown($price_ranges, 'PriceRangeID', 'PriceRangeName');
		
		$estimation_peoples = $this->db->query('CALL GetAllEstPeople()');
		$estimation_peoples = $this->buildDataDropdown($estimation_peoples, 'EstPeopleID', 'EstPeopleName');

		$measure_sizes = $this->db->query('CALL GetAllMeasureSize()');
		$measure_sizes = $this->buildDataDropdown($measure_sizes, 'MeasureSizeID', 'MeasureSizeName');

		$compositions = $this->db->query('CALL GetAllComposition()');
		$compositions = $this->buildDataDropdown($compositions, 'CompositionID', 'CompositionName');
		

		if( !empty($post) ) {
			
			// debug($post); die();

			$this->form_validation->set_rules('RecipeName', 'Recipe Name', 'required');
			// $this->form_validation->set_rules('password', 'Password', 'required');

			if ( $this->form_validation->run() == TRUE ) {

				// $res = $this->db->query('CALL CheckLogin(?,?)', array(
				// 	$post['email'], 
				// 	sha1($post['password'])
				// ));
				// $data = $res->result()[0];

				// if( $data->UserID != -1 ) {
				// 	$this->session->set_userdata('loggedin', true);
				// 	$this->session->set_userdata('userid', $data->UserID);
				// 	$this->session->set_userdata('username', $data->UserName);
				// 	$this->session->set_userdata('useremail', $data->UserEmail);
				// 	$this->session->set_userdata('userrole', $data->UserRole);

				// 	$message = 'Sukses melakukan login';
				// 	$status = 'success';
				// }
			}
		}

		// loadMessage($message, $status);

		$this->load->vars(array(
			'food_types' => $food_types,
			'food_process' => $food_process,
			'price_ranges' => $price_ranges,
			'estimation_peoples' => $estimation_peoples,
			'measure_sizes' => $measure_sizes,
			'compositions' => $compositions,
		));
		$this->render($post);
	}

	public function recook() {
		$this->render();
	}

	public function cookmark() {
		$this->render();
	}

	public function buildDataDropdown( $data = false, $optionValueName = false, $optionTextName = false ){
		$result = array();
		if( !empty($data) && !empty($optionValueName) && !empty($optionTextName) ) {

			$values = $data->result_array();
			$data->next_result();

			foreach( $values as $row ) {
				$value = $row[$optionValueName];
				$text = $row[$optionTextName];
				$result[$value] = $text;
			}
		}

		return $result;
	}
}