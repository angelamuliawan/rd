<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Users extends AB_Controller {

	function __construct() {
        parent::__construct();
    }

	public function index() {

		$this->render();
	}

	public function login() {
		
		$post = $this->input->post();
		$message = 'Email atau Password Anada tidak valid. Silahkan coba lagi';
		$status = 'error';
		
		if( !empty($post) ) {
			
			$this->form_validation->set_rules('email', 'Email', 'required');
			$this->form_validation->set_rules('password', 'Password', 'required');

			if ( $this->form_validation->run() == TRUE ) {

				$res = $this->db->query('CALL CheckLogin(?,?)', array(
					$post['email'], 
					sha1($post['password'])
				));
				$data = $res->result()[0];

				if( $data->UserID != -1 ) {
					$this->session->set_userdata('loggedin', true);
					$this->session->set_userdata('userid', $data->UserID);
					$this->session->set_userdata('username', $data->UserName);
					$this->session->set_userdata('useremail', $data->UserEmail);
					$this->session->set_userdata('userrole', $data->UserRole);

					$message = 'Sukses melakukan login';
					$status = 'success';
				}

			}
		}

		loadMessage($message, $status);
		loadModal('login');
	}

	public function register() {
		
		$post = $this->input->post();
		$message = 'Mohon lengkapi semua data yang diperlukan.';
		$status = 'error';
		
		if( !empty($post) ) {
				
			$this->form_validation->set_rules('RegFullname', 'Fullname', 'required');
			$this->form_validation->set_rules('RegEmail', 'Email', 'required');
			$this->form_validation->set_rules('RegPassword', 'Password', 'required');

			if ( $this->form_validation->run() == TRUE ) {

				// $res = $this->db->query('CALL CheckLogin(?,?)', array(
				// 	$post['email'], 
				// 	sha1($post['password'])
				// ));
				// $data = $res->result()[0];

				// if( $data->UserID != -1 ) {
					// $this->session->set_userdata('loggedin', true);
					// $this->session->set_userdata('userid', $data->UserID);
					// $this->session->set_userdata('username', $data->UserName);
					// $this->session->set_userdata('useremail', $data->UserEmail);
					// $this->session->set_userdata('userrole', $data->UserRole);

					// $message = 'Sukses melakukan login';
					// $status = 'success';
				// }
			}
		}

		loadMessage($message, $status);
		loadModal('login');
	}

	function logout(){
		$this->load->helper('url');
		$this->session->sess_destroy();
		redirect('http://localhost/rd/pages');
	}
}