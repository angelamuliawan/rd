<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Pages extends AB_Controller {

	public function index() {
		$this->load->helper('form');
		$this->load->helper('build_data');
		$this->callDefaultData('search');

		$resNewRecipe = $this->db->query('CALL GetNewlyCreatedRecipe(?)', array(
			$this->session->userdata('userid'),
		));
		$new_recipe = $resNewRecipe->result_array();
		$resNewRecipe->next_result();

		$resPopularRecipe = $this->db->query('CALL GetPopularRecipe(?)', array(
			$this->session->userdata('userid'),
		));
		$popular_recipe = $resPopularRecipe->result_array();

		$this->load->vars(array(
			'valuesNewRecipe' => $new_recipe,
			'valuesPopularRecipe' => $popular_recipe,
		));

		$this->render();
	}
}