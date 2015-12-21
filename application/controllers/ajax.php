<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Ajax extends AB_Controller {

	public function list_composition() {
		$this->load->helper('build_data');

		$compositions = $this->db->query('CALL GetAllComposition()')->result_array();
		$compositions = buildDataAutocomplete($compositions, 'CompositionID', 'CompositionName');
		echo json_encode($compositions);
	}
}