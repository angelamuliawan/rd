<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Pages extends AB_Controller {

	public function index() {

		$this->render();

		// $pageContent = $this->load->view('content/backend', '',  TRUE);
		// $this->load->view('master/master', array('pageContent' => $pageContent));
	}
}