<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Pages extends AB_Controller {

	public function index() {
		$this->load->helper('form');
		$this->load->helper('build_data');

		$post = $this->input->post();
		$message = 'Gagal menyimpan data. Silahkan coba lagi';
		$status = 'error';

		$food_types = $this->db->query('CALL GetAllFoodType()');
		$food_types = buildDataDropdown($food_types, 'FoodTypeID', 'FoodTypeName');

		$cuisines = $this->db->query('CALL GetAllCuisine()');
		$cuisines = buildDataDropdown($cuisines, 'CuisineID', 'CuisineName');

		$this->load->vars(array(
			'food_types' => $food_types,
			'cuisines' => $cuisines,
		));

		$this->render();
	}
}