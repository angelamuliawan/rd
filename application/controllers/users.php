<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Users extends AB_Controller {

	function __construct() {
        parent::__construct();
    }

	public function index() {
		$this->load->helper('form');
		$resUserAccount = $this->db->query('CALL GetSettingUserData(?)', array(
			$this->session->userdata('userid'),
		));
		$valuesUserAccount = $resUserAccount->result_array();

		$this->load->vars(array(
			'valuesUserAccount' => $valuesUserAccount,
		));
		$this->render();
	}

	public function read_notification( $notif_id = false ){
		$this->load->helper('url');

		if( !empty($notif_id) ) {
			$resUpdateNotif = $this->db->query('CALL ReadNotification(?,?)', array(
				$notif_id,
				$this->session->userdata('userid'),
			));	
			$values = $resUpdateNotif->result_array()[0];
			$notif_url = $values['NotificationURL'];

			redirect( $this->domain.'/'.$notif_url );
		} else {
			redirect($_SERVER['HTTP_REFERER']);
		}
	}

	public function update_photo() {
		
		$post = $this->input->post();
		$message = false;
		$status = false;
		
		if( !empty($post) ) {
			
			$this->form_validation->set_rules('photo', 'Profile photo', 'required');

			if ( $this->form_validation->run() == TRUE ) {

				$res = $this->db->query('CALL UploadNewProfilePhoto(?,?)', array(
					$post['photo'],
					$this->session->userdata('userid'),
				));
				$res->next_result();

				$message = 'Sukses menyimpan foto profil';
				$status = 'success';

				$this->session->set_userdata('userphoto', $post['photo']);
				$this->session->set_flashdata('flash_message', array(
					'message' => $message,
					'status' => $status,
				));
			} else {
				$message = 'Gagal menyimpan foto profil';
				$status = 'error';
			}
		}

		$resUserAccount = $this->db->query('CALL GetSettingUserData(?)', array(
			$this->session->userdata('userid'),
		));
		$valuesUserAccount = $resUserAccount->result_array();

		$this->load->vars(array(
			'request' => $post,
			'valuesUserAccount' => $valuesUserAccount,
		));

		loadMessage($message, $status);
		loadSubview('users/photo_profile');
	}

	public function updatePassword(){
		$post = $this->input->post();
		$message = false;
		$status = false;		

		if( !empty($post) ) {
			
			$this->form_validation->set_rules('oldPassword', 'Old Password', 'required');
			$this->form_validation->set_rules('newPassword', 'New Password', 'required');
			$this->form_validation->set_rules('confirmPassword', 'Confirmation Password', 'required|matches[newPassword]');

			if ( $this->form_validation->run() == TRUE ) {

				$res = $this->db->query('CALL ChangePassword(?,?,?)', array(
					sha1($post['oldPassword']), 
					sha1($post['newPassword']),
					$this->session->userdata('userid'),
				));
				$data = $res->result()[0];

				if( $data->result == -1 ) {
					$message = 'Gagal memperbarui password Anda';
					$status = 'error';

					$this->setCustomError('oldPassword', 'Invalid old password');
				} else {
					$message = 'Sukses memperbarui password Anda';
					$status = 'success';

					$this->session->set_flashdata('flash_message', array(
						'message' => $message,
						'status' => $status,
					));
				}
			} else {
				$message = 'Gagal memperbarui password Anda';
				$status = 'error';
			}
		}

		$this->load->vars(array(
			'request' => $post,
		));
		loadMessage($message, $status, true);
		loadSubview('users/tabs/password');
	}

	public function updateAccount(){
		$post = $this->input->post();
		$message = false;
		$status = false;

		if( !empty($post) ) {
			
			$this->form_validation->set_rules('username', 'Full name', 'required');
			$this->form_validation->set_rules('country', 'Country', 'required');
			$this->form_validation->set_rules('city', 'City', 'required');

			if ( $this->form_validation->run() == TRUE ) {

				$res = $this->db->query('CALL ChangeUserData(?,?,?,?)', array(
					$post['username'], 
					$post['city'],
					$post['country'],
					$this->session->userdata('userid'),
				));

				$message = 'Sukses memperbarui data Anda';
				$status = 'success';

				$this->session->set_userdata('username', $post['username']);
				$this->session->set_flashdata('flash_message', array(
					'message' => $message,
					'status' => $status,
				));
			} else {
				$message = 'Gagal memperbarui data Anda';
				$status = 'error';
			}
		}

		$this->load->vars(array(
			'request' => $post,
		));

		loadMessage($message, $status, true);
		loadSubview('users/tabs/account');
	}

	public function login() {
		
		$post = $this->input->post();
		$message = false;
		$status = false;
		
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
					$this->session->set_userdata('userphoto', $data->UserPhoto);

					$message = 'Sukses melakukan login';
					$status = 'success';
				} else {
					$message = 'Email atau Password Anda tidak valid. Silahkan coba lagi';
					$status = 'error';
				}
			} else {
				$message = 'Email atau Password Anda tidak valid. Silahkan coba lagi';
				$status = 'error';
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

				$res = $this->db->query('CALL RegisterUser(?,?,?)', array(
					$post['RegFullname'],
					$post['RegEmail'],
					sha1($post['RegPassword'])
				));
				$data = $res->result()[0];

				if( $data->UserID != -1 ) {
					$this->session->set_userdata('loggedin', true);
					$this->session->set_userdata('userid', $data->UserID);
					$this->session->set_userdata('username', $post['RegFullname']);
					$this->session->set_userdata('useremail', $post['RegEmail']);
					$this->session->set_userdata('userrole', 0);

					$message = 'Sukses melakukan pendaftaran';
					$status = 'success';
				} else {
					$this->setCustomError('RegEmail', 'Email telah terdaftar.');
				}
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