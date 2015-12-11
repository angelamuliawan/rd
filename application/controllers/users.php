<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Users extends AB_Controller {

	public function index() {

		$this->render();
	}

	public function login() {
		
		$post = $this->rest->post();
		$res = $this->db->query('CALL CheckLogin(?,?)', array(
			$post->username, 
			sha1($post->password)
		));
		$data = $res->result()[0];
		

		if( $data->UserID != -1 ) {
			$this->session->set_userdata('loggedin', true);
			$this->session->set_userdata('userid', $data->UserID);
			$this->session->set_userdata('username', $data->UserName);
			$this->session->set_userdata('useremail', $data->UserEmail);
			$this->session->set_userdata('userrole', $data->UserRole);
		}

		// return $this->load->view('json_view', array('json' => $data));
	}
}