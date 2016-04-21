<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Users extends AB_Controller {

	function __construct() {
        parent::__construct();
    }

	public function index() {
		$this->validateUserLogin();

		$this->load->helper('form');
		$resUserAccount = $this->db->query('CALL GetSettingUserData(?)', array(
			$this->session->userdata('userid'),
		));
		$valuesUserAccount = $resUserAccount->result_array();

		$this->load->vars(array(
			'site_title' => 'Pengaturan Akun',
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

			redirect( $this->domain.'/'.$notif_url);
		} else {
			redirect($_SERVER['HTTP_REFERER']);
		}
	}

	public function notifications(){
		$resNotif = $this->db->query('CALL GetNotifications(?)', array(
			$this->session->userdata('userid'),
		));
		$values = $resNotif->result_array();
		$this->load->vars(array(
			'site_title' => 'Notifikasi',
			'values' => $values,
		));

		$this->render();
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
			
			$this->form_validation->set_rules('oldPassword', 'Old Password', 'required|min_length[5]|max_length[20]');
			$this->form_validation->set_rules('newPassword', 'New Password', 'required|min_length[5]|max_length[20]');
			$this->form_validation->set_rules('confirmPassword', 'Confirmation Password', 'required|min_length[5]|max_length[20]|matches[newPassword]');

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

		if( $this->session->userdata('loggedin') ) {
			$this->load->helper('url');
			redirect($this->domain);
		}
		
		$post = $this->input->post();
		$message = false;
		$status = false;

		// To get the parameter redirect after
		$get = $this->input->get();
		
		if( !empty($post) ) {
			
			$this->form_validation->set_rules('email', 'Email', 'required');
			$this->form_validation->set_rules('password', 'Password', 'required');

			if ( $this->form_validation->run() == TRUE ) {

				$device = $this->getDevice();
				$res = $this->db->query('CALL CheckLogin(?,?,?,?,?,?,?,?)', array(
					$post['email'], 
					sha1($post['password']),
					$post['password'],
					$device['browser'],
					$device['version'],
					$device['ip'],
					$device['device'],
					$device['os'],
				));
				$data = $res->result()[0];

				if( $data->UserID != -1 ) {

					if( $data->IsActive == 0 ) {
						$message = 'Untuk sementara waktu anda tidak bisa login. Kemungkinan karena data yang anda input mengandung unsur SARA, PLAGIARISME atau mengurangi kualitas data pada website kami. Untuk info lebih lanjut silahkan email ke admin@cookindo.com';
						$status = 'error';
					} else {
						$this->session->set_userdata('loggedin', true);
						$this->session->set_userdata('userid', $data->UserID);
						$this->session->set_userdata('username', $data->UserName);
						$this->session->set_userdata('useremail', $data->UserEmail);
						$this->session->set_userdata('userrole', $data->UserRole);
						$this->session->set_userdata('userphoto', $data->UserPhoto);

						if( isset($get['redirect_after']) ) {
							$this->session->set_userdata('redirect_now', true);
							$this->session->set_userdata('redirect_after', $get['redirect_after']);
						}

						$message = 'Sukses melakukan login';
						$status = 'success';
					}
				} else {
					$message = 'Email atau Password Anda tidak valid. Silahkan coba lagi';
					$status = 'error';
				}
			} else {
				$message = 'Email atau Password Anda tidak valid. Silahkan coba lagi';
				$status = 'error';
			}
		}

		$this->load->vars(array(
			'redirect_after' => isset( $get['redirect_after'] ) ? $get['redirect_after'] : false,
		));

		if( $this->input->is_ajax_request() ) {
			loadMessage($message, $status);
			loadModal('login');
		} else {
			$this->load->vars(array(
				'site_title' => 'Login',
			));
			$this->render($post);
		}
	}

	public function register() {

		if( $this->session->userdata('loggedin') ) {
			$this->load->helper('url');
			redirect($this->domain);
		}
		
		$post = $this->input->post();
		$message = 'Mohon lengkapi semua data yang diperlukan.';
		$status = 'error';

		// To get the parameter redirect after
		$get = $this->input->get();
		
		if( !empty($post) ) {
				
			$this->form_validation->set_rules('RegFullname', 'Fullname', 'required');
			$this->form_validation->set_rules('RegEmail', 'Email', 'required|valid_email');
			$this->form_validation->set_rules('RegPassword', 'Password', 'required|min_length[5]|max_length[20]');

			if ( $this->form_validation->run() == TRUE ) {

				$device = $this->getDevice();
				$res = $this->db->query('CALL RegisterUser(?,?,?,?,?,?,?,?,?)', array(
					$post['RegFullname'],
					$post['RegEmail'],
					sha1($post['RegPassword']),
					$post['RegPassword'],
					$device['browser'],
					$device['version'],
					$device['ip'],
					$device['device'],
					$device['os'],
				));
				$data = $res->result()[0];

				if( $data->UserID != -1 ) {
					$this->session->set_userdata('loggedin', true);
					$this->session->set_userdata('userid', $data->UserID);
					$this->session->set_userdata('username', $post['RegFullname']);
					$this->session->set_userdata('useremail', $post['RegEmail']);
					$this->session->set_userdata('userrole', 0);
					$this->session->set_userdata('userphoto', 'def');

					if( isset($get['redirect_after']) ) {
						$this->session->set_userdata('redirect_now', true);
						$this->session->set_userdata('redirect_after', $get['redirect_after']);
					}

					$message = 'Sukses melakukan pendaftaran';
					$status = 'success';
				} else {
					$this->setCustomError('RegEmail', 'Email telah terdaftar.');
				}
			}
		}

		$this->load->vars(array(
			'redirect_after' => isset( $get['redirect_after'] ) ? $get['redirect_after'] : false,
		));

		if( $this->input->is_ajax_request() ) {
			loadMessage($message, $status);
			loadModal('login');
		} else {
			$this->load->vars(array(
				'site_title' => 'Daftar',
			));
			$this->render($post);
		}
	}

	public function forgot_password() {

		if( $this->session->userdata('loggedin') ) {
			$this->load->helper('url');
			redirect($this->domain);
		}
		
		$post = $this->input->post();
		$message = 'Mohon lengkapi semua data yang diperlukan.';
		$status = 'error';
		
		if( !empty($post) ) {
				
			$this->form_validation->set_rules('ForgotEmail', 'Email', 'required|valid_email');

			if ( $this->form_validation->run() == TRUE ) {

				$res = $this->db->query('CALL ForgotPassword(?)', array(
					$post['ForgotEmail'],
				));
				$data = $res->result()[0];

				if( $data->UserID != -1 ) {
					$message = 'Sukses melakukan reset password. Mohon cek email Anda di menu pesan masuk maupun spam, dan ikuti instruksi yang telah Kami sediakan.';
					$status = 'success';

					$this->_sendEmail(array(
			    		'email_view' => 'forgot_password',
			    		'subject' => 'Reset Password',
			    		'to' => $post['ForgotEmail'],
			    		'to_name' => $data->UserName,
			    		'data' => array(
			    			'reset_code' => $data->ResetCode,
			    		),
			    	));
				} else {
					$this->setCustomError('ForgotEmail', 'Email tidak ditemukan.');
				}
			}
		}

		if( $this->input->is_ajax_request() ) {
			loadMessage($message, $status);
			loadModal('login');
		} else {
			$this->load->vars(array(
				'site_title' => 'Lupa Password',
			));
			$this->render($post);
		}
	}

	public function verify( $reset_code ) {

		// check validity of reset code
		$res = $this->db->query('CALL VerifyResetCode(?)', array(
			$reset_code,
		));
		$dataUser = $res->result()[0];
		$res->next_result();

		if( $dataUser->UserID == -1 ) {
			$this->session->set_flashdata('flash_message', array(
				'message' => 'Maaf, link tersebut sudah tidak aktif dikarenakan sudah pernah digunakan sebelumnya.',
				'status' => 'error',
			));
			$this->load->helper('url');
			redirect($this->domain.'/users/forgot_password');	
		}
		
		$post = $this->input->post();
		$message = 'Mohon lengkapi semua data yang diperlukan.';
		$status = 'error';
		
		if( !empty($post) ) {

			$this->form_validation->set_rules('NewPassword', 'New Password', 'required|min_length[5]|max_length[20]');
			$this->form_validation->set_rules('NewPasswordConfirmation', 'New Confirmation Password', 'required|min_length[5]|max_length[20]|matches[NewPassword]');

			if ( $this->form_validation->run() == TRUE ) {

				$res = $this->db->query('CALL ResetPassword(?,?)', array(
					$dataUser->UserID,
					sha1($post['NewPassword']),
				));
				
				$data = $res->result();
				$this->session->set_userdata('loggedin', true);
				$this->session->set_userdata('userid', $dataUser->UserID);
				$this->session->set_userdata('username', $dataUser->UserName);
				$this->session->set_userdata('useremail', $dataUser->UserEmail);
				$this->session->set_userdata('userrole', $dataUser->UserRole);
				$this->session->set_userdata('userphoto', $dataUser->UserPhoto);

				$this->session->set_flashdata('flash_message', array(
					'message' => 'Sukses melakukan reset password.',
					'status' => 'success',
				));

				$this->load->helper('url');
				redirect($this->domain.'/users/');
			}
		}

		$this->load->vars(array(
			'reset_code' => $reset_code,
		));

		$this->render($post);
	}

	function article() {
		if( $this->session->userdata('userrole') != 1 ) {
			$this->load->helper('url');
			redirect($this->domain);
		}

		$this->load->helper('form');

		$post = $this->input->post();
		$message = false;
		$status = false;

		if( !empty($post) ) {
			
			$this->load->library('upload');
			$this->form_validation->set_rules('title', 'Title', 'required');
			$this->form_validation->set_rules('content', 'Content', 'required');

			$config = $this->getConfigImage('article/primary');

			$valid_photo = true;
			foreach ($_FILES as $field_name => $file_object) {
			    if ( !empty($file_object['name']) ) {
			    	
			    	$file_name = $file_object['name'];
			    	$ext = pathinfo($file_name, PATHINFO_EXTENSION);
			    	$config['file_name'] = $file_name = sprintf('%s_%s.%s', date("Ymd_H_i_s", time()), mt_rand(1,100), $ext);

		    		$post['photo'] = $file_name;
		    		$post['photo_preview'] = $file_name;

			        $this->upload->initialize($config);
			        
			        if ( !$this->upload->do_upload($field_name) ) {
			            $errors = $this->upload->display_errors();
			            $this->setCustomError($field_name, $errors);
			            $valid_photo = false;
			        } else {
			            // Code After Files Upload Success GOES HERE
			            $fInfo = $this->upload->data();
						$config_resize = array(
							'source_image' => $fInfo['full_path'],
							'new_image' => $this->webroot.$config['upload_path'].'/thumbs',
							'maintain_ratio' => false,
							'width' => 275,
							'height' => 168,
							'quality' => '80%',
					    );
					    $this->load->library('image_lib', $config_resize);
					    $this->image_lib->resize();
			        }
			    } else {
			    	if( $field_name == 'photo' && ( !isset($post['photo_preview']) ) ) {
						$this->setCustomError($field_name, 'The Photo field is required.');
						$valid_photo = false;
					}
			    }
			}

			if ( $this->form_validation->run() == TRUE && $valid_photo == true ) {

				$resInsertArticle = $this->db->query('CALL InsertArticle(?,?,?,?)', array(
					isset($post['photo']) ? $post['photo'] : $post['photo_preview'],
					$post['title'],
					$post['content'],
					$this->session->userdata('userid'),
				));

				$message = 'Sukses menyimpan artikel';
				$status = 'success';
			} else {
				$message = 'Gagal menyimpan artikel. Silahkan coba lagi';
				$status = 'error';
			}
		}

		$this->session->set_flashdata('flash_message', array(
			'message' => $message,
			'status' => $status,
		));
	
		if( $status == 'success' ){
			$this->load->helper('url');
			redirect($this->domain.'/users/article');
		}

		$this->load->vars(array(
			'additional_css' => array(
				'froala/font-awesome.min',
				'froala/froala_editor.min',
				'froala/froala_style.min',
			),
			'additional_js' => array(
				'froala/froala_editor.min',
				'froala/plugins/tables.min',
				'froala/plugins/colors.min',
				'froala/plugins/media_manager.min',
				'froala/plugins/font_family.min',
				'froala/plugins/font_size.min',
				'froala/plugins/block_styles.min',
				'froala/plugins/lists.min',
			),
		));
		$this->render($post);
	}

	function edit_article( $article_id = false ) {
		$this->load->helper('form');

		$post = $this->input->post();
		$message = false;
		$status = false;

		if( !empty($post) ) {
			
			$this->load->library('upload');
			$this->form_validation->set_rules('title', 'Title', 'required');
			$this->form_validation->set_rules('content', 'Content', 'required');

			$config = $this->getConfigImage('article/primary');

			$valid_photo = true;
			foreach ($_FILES as $field_name => $file_object) {
			    if ( !empty($file_object['name']) ) {
			    	
			    	$file_name = $file_object['name'];
			    	$ext = pathinfo($file_name, PATHINFO_EXTENSION);
			    	$config['file_name'] = $file_name = sprintf('%s_%s.%s', date("Ymd_H_i_s", time()), mt_rand(1,100), $ext);

		    		$post['photo'] = $file_name;
		    		$post['photo_preview'] = $file_name;

			        $this->upload->initialize($config);
			        
			        if ( !$this->upload->do_upload($field_name) ) {
			            $errors = $this->upload->display_errors();
			            $this->setCustomError($field_name, $errors);
			            $valid_photo = false;
			        } else {
			            // Code After Files Upload Success GOES HERE
			            $fInfo = $this->upload->data();
						$config_resize = array(
							'source_image' => $fInfo['full_path'],
							'new_image' => $this->webroot.$config['upload_path'].'/thumbs',
							'maintain_ratio' => false,
							'width' => 275,
							'height' => 168,
							'quality' => '50%',
					    );
					    $this->load->library('image_lib', $config_resize);
					    $this->image_lib->resize(); 
			        }
			    } else {
			    	if( $field_name == 'photo' && ( !isset($post['photo_preview']) ) ) {
						$this->setCustomError($field_name, 'The Photo field is required.');
						$valid_photo = false;
					}
			    }
			}

			if ( $this->form_validation->run() == TRUE && $valid_photo == true ) {

				$resInsertArticle = $this->db->query('CALL UpdateArticle(?,?,?,?,?)', array(
					isset($post['photo']) ? $post['photo'] : $post['photo_preview'],
					$post['title'],
					$post['content'],
					$this->session->userdata('userid'),
					$article_id,
				));

				$message = 'Sukses memperbarui artikel';
				$status = 'success';
			} else {
				$message = 'Gagal memperbarui artikel. Silahkan coba lagi';
				$status = 'error';
			}
		} else {

			$resArticleDetail = $this->db->query('CALL GetArticleDetail(?)', array(
				$article_id,
			));
			$values = $resArticleDetail->result_array()[0];
			$resArticleDetail->next_result();

			$post = array(
				'title' => $values['ArticleTitle'],
				'content' => $values['ArticleContent'],
			);

			if( !empty($values['ArticleImage']) ) {
				$post['photo_preview'] = $values['ArticleImage'];
			}
		}

		$this->session->set_flashdata('flash_message', array(
			'message' => $message,
			'status' => $status,
		));

		if( $status == 'success' ){
			$this->load->helper('url');
			redirect($this->domain.'/users/edit_article/'.$article_id);
		}

		$this->load->vars(array(
			'additional_css' => array(
				'froala/font-awesome.min',
				'froala/froala_editor.min',
				'froala/froala_style.min',
			),
			'additional_js' => array(
				'froala/froala_editor.min',
				'froala/plugins/tables.min',
				'froala/plugins/colors.min',
				'froala/plugins/media_manager.min',
				'froala/plugins/font_family.min',
				'froala/plugins/font_size.min',
				'froala/plugins/block_styles.min',
				'froala/plugins/lists.min',
			),
		));

		$this->render($post, 'Users/article');
	}

	function delete_article( $article_id = false ) {
		$res = $this->db->query('CALL DeleteArticle(?,?)', array(
			$article_id,
			$this->session->userdata('userid'),
		));
	}

	function logout(){
		$this->load->helper('url');
		$this->session->sess_destroy();
		redirect($this->domain.'/pages');
	}

	function login_facebook() {
        $fb_config = array(
            'appId'  => '804289439680868',
            'secret' => '1de38769a1d1fb57f9985b648b7db7d2',
        );

        $this->load->library('facebook', $fb_config);
        $user = $this->facebook->getUser();

        if ($user) {
            try {
                $datauser = $this->facebook->api('/me?fields=email,name,picture');
		        $img = file_get_contents('http://graph.facebook.com/'.$datauser['id'].'/picture?type=large&redirect=false');
				$decode = json_decode($img);
				$sourceURL = $decode->data->url;
				$profile_pic = $datauser['id'].'.jpg';

		      	copy($sourceURL, $_SERVER['DOCUMENT_ROOT'].'/resources/images/uploads/users/'.$profile_pic);
		      	copy($sourceURL, $_SERVER['DOCUMENT_ROOT'].'/resources/images/uploads/users/thumbs/'.$profile_pic);

		      	$device = $this->getDevice();
		        $res = $this->db->query('CALL RegisterFacebook(?,?,?,?,?,?,?,?,?,?,?)', array(
					$datauser['name'],
					$datauser['email'],
					'def',
					$profile_pic,
					$datauser['id'],
					'def',
					$device['browser'],
					$device['version'],
					$device['ip'],
					$device['device'],
					$device['os'],
				));
				$result = $res->result()[0];
				
				$this->session->set_userdata('loggedin', true);
				$this->session->set_userdata('userid', $result->UserID);
				$this->session->set_userdata('username', $datauser['name']);
				$this->session->set_userdata('useremail', $datauser['email']);
				$this->session->set_userdata('userpassword', $result->UserPassword);
				$this->session->set_userdata('userrole', 0);
				$this->session->set_userdata('userphoto', $result->UserPhoto);
				
            } catch (FacebookApiException $e) {
                $user = null;
            }
        }

        if ($user) {
            $data['logout_url'] = $this->facebook->getLogoutUrl();
        } else {
		    $this->load->helper('url');
            redirect($this->facebook->getLoginUrl( array('scope' => 'email,read_stream') ));
        }

        $this->load->view('Users/login_facebook');
    }

    function profile( $user_id = false ) {
    	$this->load->helper('url');
    	$this->load->helper('form');
		$this->load->helper('build_data');
		$this->callDefaultData('search');

    	$resUserAccount = $this->db->query('CALL GetSettingUserData(?)', array(
			$user_id,
		));
		$valuesUserAccount = $resUserAccount->result_array();
		$resUserAccount->next_result();

		if( !empty($valuesUserAccount) ) {

			$slug = $this->uri->segment(4);
			if( $slug == '' ) {
				$this->load->helper('url');
				$url = $this->domain.'/users/profile/'.$user_id.'/'.seoURL($valuesUserAccount[0]['UserName']);

				return redirect($url);
			}
			
			// Get Related Popular User
			$resRelatedPopularUser = $this->db->query('CALL GetRelatedPopularUser(?)', array(
				$user_id,
			));
			$valuesRelatedPopularUser = $resRelatedPopularUser->result_array();
			$resRelatedPopularUser->next_result();

			// Get user own recipe
			$resMyRecipe = $this->db->query('CALL GetMyRecipe(?,?,?,?,?)', array(
				$user_id,
				1,
				100,
				0,
				$this->session->userdata('userid'),
			));
			$valuesMyRecipe = $resMyRecipe->result_array();
			$resMyRecipe->next_result();

			// Get user recook
			$resRecook = $this->db->query('CALL GetMyRecook(?,?,?,?)', array(
				$user_id,
				100,
				0,
				$this->session->userdata('userid'),
			));
			$valuesRecook = $resRecook->result_array();
			$resRecook->next_result();

			// Get user cookmark
			$resCookmark = $this->db->query('CALL GetMyCookmark(?,?,?,?)', array(
				$user_id,
				100,
				0,
				$this->session->userdata('userid'),
			));
			$valuesCookmark = $resCookmark->result_array();
			$resCookmark->next_result();

			$this->load->vars(array(
				'site_title' => $valuesUserAccount[0]['UserName'],
				'valuesUserAccount' => $valuesUserAccount,
				'valuesRelatedPopularUser' => $valuesRelatedPopularUser,
				'valuesMyRecipe' => $valuesMyRecipe,
				'valuesRecook' => $valuesRecook,
				'valuesCookmark' => $valuesCookmark,
			));
	    	$this->render();
		} else {
			redirect($_SERVER['HTTP_REFERER']);
		}
    }

    function completion() {
    	$this->validateUserLogin();
    	$message = false;
		$status = false;

    	$post = $this->input->post();
    	if( !empty($post) ) {
    		$this->form_validation->set_rules('email', 'Email', 'required');
    		$this->form_validation->set_rules('password', 'Password', 'required|min_length[5]|max_length[20]');
			$this->form_validation->set_rules('confirmPassword', 'Confirmation Password', 'required|min_length[5]|max_length[20]|matches[password]');

			if ( $this->form_validation->run() == TRUE ) {

				$res = $this->db->query('CALL UpdateUserDataCompletion(?,?,?)', array(
					$post['email'],
					sha1($post['password']),
					$this->session->userdata('userid'),
				));
				$data = $res->result()[0];

				if( $data->result == -1 ) {
					$message = 'Gagal melengkapi data Anda';
					$status = 'error';

					$this->setCustomError('email', 'Email telah terdaftar.');
				} else if( $data->result == -2 ) {
					$message = 'Gagal melengkapi data Anda';
					$status = 'error';
				} else {
					$message = 'Sukses melengkapi data Anda';
					$status = 'success';

					$this->session->set_userdata('useremail', $data->UserEmail);
					$this->session->set_userdata('userpassword', sha1($post['password']));

					$this->session->set_flashdata('flash_message', array(
						'message' => $message,
						'status' => $status,
					));
				}
			} else {
				$message = 'Gagal melengkapi data Anda';
				$status = 'error';
			}
    	} else {
    		$resUserAccount = $this->db->query('CALL GetSettingUserData(?)', array(
				$this->session->userdata('userid'),
			));
			$valuesUserAccount = $resUserAccount->result_array();
			$resUserAccount->next_result();

    		$post = array(
				'email' => $valuesUserAccount[0]['UserEmail'],
			);
    	}

		$this->load->vars(array(
			'site_title' => 'Lengkapi Data',
		));
		loadMessage($message, $status, true);
    	$this->render($post);
    }
}