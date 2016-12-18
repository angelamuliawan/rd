<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Recipe extends AB_Controller {

	function __construct() {
        parent::__construct();

        $this->session->keep_flashdata('flash_message');
    }

	public function find() {
		$this->load->helper('url');
		$this->load->helper('form');
		$this->load->helper('build_data');

		$get = $this->input->get();
		$post = $this->input->post(); 

		$page = 1;
		if( !empty($post) && $this->input->is_ajax_request() ) {
			$page = $post['next_page'];
		}

		$this->callDefaultData('create', true);
		$this->callSearchRecipe($get, $page);

		$this->load->vars(array(
			'site_title' => lang('search_recipe'),
			'page' => $page,
			'param_get' => $this->input->server('QUERY_STRING'),
		));
		$this->render($get);
	}

	public function detail( $recipe_id = false ) {
		$this->load->helper('form');
		$this->load->helper('build_data');
		$this->callDefaultData('search');

		// Recipe Header
		$resRecipeHeader = $this->db->query('CALL GetRecipeDetailHeader(?,?)', array(
			$recipe_id,
			$this->session->userdata('userid'),
		));
		$valuesRecipeHeader = $resRecipeHeader->result_array();
		$resRecipeHeader->next_result();

		if( empty($valuesRecipeHeader) ) {
			$this->load->helper('url');
			return redirect($this->domain);
		}

		$slug = $this->uri->segment(3);
		$recipe_creator_id = $valuesRecipeHeader[0]['UserID'];

		if( !strpos($slug, '-') && ($slug == '' || str_word_count($slug) > 1 ) ) {
			$this->load->helper('url');
			$slug = isset( $valuesRecipeHeader[0]['Slug'] ) ? $valuesRecipeHeader[0]['Slug'] : 'resep-masak';
			$url = $this->domain.'/resep-masak/'.$recipe_id.'/'.$slug;

			return redirect($url);
		}

		// Save recipe log
		$device = $this->getDevice();
		$resRecipeLog = $this->db->query('CALL InsertRecipeLog(?,?,?,?,?,?,?)', array(
			$recipe_id,
			$device['browser'],
			$device['version'],
			$device['ip'],
			$device['device'],
			$device['os'],
			$this->session->userdata('userid'),
		));
		$query_result = $resRecipeLog->result();
		$resRecipeLog->next_result();

		// Recipe Recook
		$resRecipeRecook = $this->db->query('CALL GetRecipeDetailRecook(?)', array(
			$recipe_id,
		));
		$valuesRecipeRecook = $resRecipeRecook->result_array();
		$resRecipeRecook->next_result();

		// Recipe Composition
		$resRecipeComposition = $this->db->query('CALL GetRecipeDetailComposition(?)', array(
			$recipe_id
		));
		$valuesRecipeComposition = $resRecipeComposition->result_array();
		$resRecipeComposition->next_result();
		
		// Recipe Detail
		$resRecipeStep = $this->db->query('CALL GetRecipeDetailStep(?)', array(
			$recipe_id
		));
		$valuesRecipeStep = $resRecipeStep->result_array();
		$resRecipeStep->next_result();

		// related recipe by authors
		$resRelatedByAuthor = $this->db->query('CALL GetRelatedRecipeByAuthor(?,?)', array(
			$recipe_id,
			$recipe_creator_id,
		));
		$valuesRelatedByAuthor = $resRelatedByAuthor->result_array();
		$resRelatedByAuthor->next_result();

		// related recipe by recipe
		$resRelatedByRecipe = $this->db->query('CALL GetRelatedRecipesByRecipe(?)', array(
			$recipe_id,
		));
		$valuesRelatedRecipe = $resRelatedByRecipe->result_array();
		$resRelatedByRecipe->next_result();

		// Get user follow status
		$resUserFollowStatus = $this->db->query('CALL GetFollowStatus(?,?)', array(
			$this->session->userdata('userid'),
			$recipe_creator_id,
		));
		$valuesUserFollowStatus = $resUserFollowStatus->result_array();
		$resUserFollowStatus->next_result();

		$this->load->vars(array(
			'valuesRecipeHeader' => $valuesRecipeHeader,
			'valuesRecipeRecook' => $valuesRecipeRecook,
			'valuesRecipeComposition' => $valuesRecipeComposition,
			'valuesRecipeStep' => $valuesRecipeStep,
			'valuesRelatedByAuthor' => $valuesRelatedByAuthor,
			'valuesRelatedRecipe' => $valuesRelatedRecipe,
			'valuesUserFollowStatus' => $valuesUserFollowStatus[0]['RESULT'],
			'recipe_id' => $recipe_id,
			'site_title' => $valuesRecipeHeader[0]['RecipeName'],
			'og_meta' => array(
				'title' => $valuesRecipeHeader[0]['RecipeName'],
				'url' => $this->domain.'/resep-masak/'.$recipe_id.'/'.utf8_decode($valuesRecipeHeader[0]['Slug']),
				'image' => $this->domain.'/resources/images/uploads/recipe/primary/'.$valuesRecipeHeader[0]['PrimaryPhoto'],
				'desc' => $valuesRecipeHeader[0]['RecipeIntro'],
			),
			'additional_css' => array(
				'react/transition',
				'emoticon/emoticons',
			),
			'additional_js' => array(
				'react/react-with-addons',
				'react/react-dom.min',
				'react/browser.min',
				'emoticon/emoticons',
			),
			'additional_jsx' => array(
				'common',
				'mixins/form',
				'components/replycomment',
				'components/comment',
				'recipe/detail',
			),
		));

		$this->render(array(
			'RecipeName' => $valuesRecipeHeader[0]['RecipeName'],
		));
	}

	public function add( $contest_id = NULL ) {
		$this->validateUserLogin();

		$this->load->helper('form');
		$this->load->helper('build_data');

		$post = $this->input->post();
		$message = false;
		$status = false;

		$this->callDefaultData('create');

		$contest_name = false;
		if( !empty($contest_id) ) {
			$resContest = $this->db->query('CALL GetContestDetail(?)', array(
				$contest_id,
			));
			$valuesContest = $resContest->result_array();
			$resContest->next_result();

			$contest_name = $valuesContest[0]['ContestName'];
		}

		if( !empty($post) ) {

			$this->load->library('upload');
			$this->form_validation->set_rules('RecipeName', 'Recipe Name', 'trim|required');
			$this->form_validation->set_rules('RecipeIntro', 'Recipe Intro', 'trim|required');
			$this->form_validation->set_rules('CuisineID', 'Cuisine', 'required');
			$this->form_validation->set_rules('EstTime', 'Estimated Time', 'trim|required|greater_than[0]|numeric');

			$valid_photo = true;
			$is_primary_photo = true;
			foreach ($_FILES as $field_name => $file_object) {
				$config = $this->getConfigImage('recipe/step');

			    // if ( $file_object['size'] > 2097152 ) {
		    	// 	$this->setCustomError($field_name, 'Max file size is 2MB.');
				// 	$valid_photo = false;
				// } else 
				
				if ( !empty($file_object['name']) ) {
			    	
			    	$file_name = $file_object['name'];
			    	$ext = pathinfo($file_name, PATHINFO_EXTENSION);
			    	$config['file_name'] = $file_name = sprintf('%s_%s.%s', date("Ymd_H_i_s", time()), mt_rand(1,100), $ext);

			    	if( $field_name == 'PrimaryPhoto' ) {
			    		$post['PrimaryPhoto'] = $file_name;
			    		$post['PrimaryPhoto_preview'] = $file_name;
						$config['upload_path'] = 'resources/images/uploads/recipe/primary';
					} else {
						$photo_counter = str_replace("imageStep","",$field_name);
						$post['FoodProcess'][$photo_counter]['FoodStepImage'] = $file_name;
						$post['FoodProcess'][$photo_counter]['FoodStepImage_preview'] = $file_name;
						$is_primary_photo = false;
					}

			        $this->upload->initialize($config);
			        
			        if ( !$this->upload->do_upload($field_name) ) {
			            $errors = $this->upload->display_errors();
			            $this->setCustomError($field_name, $errors);
			            $valid_photo = false;
			        } else {
			     		// Code After Files Upload Success GOES HERE
			        	if( !empty($is_primary_photo) ) {
			        		$fInfo = $this->upload->data();
							$config_resize = array(
								'source_image' => $fInfo['full_path'],
								'new_image' => $this->webroot.$config['upload_path'].'/thumbs',
								'maintain_ratio' => false,
								'width' => 450,
								'height' => 300,
								'quality' => '100%',
						    );
						    $this->load->library('image_lib', $config_resize);
						    $this->image_lib->resize();
			        	}
			        }
			    } else {
			    	if( $field_name == 'PrimaryPhoto' && ( !isset($post['PrimaryPhoto_preview']) ) ) {
						$this->setCustomError($field_name, 'The Primary Photo field is required.');
						$valid_photo = false;
					}
			    }
			}

			foreach( $post['FoodComposition'] as $key => $value ) {
				$this->form_validation->set_rules('FoodComposition['.$key.'][Measure]', 'Measure', 'trim|required|greater_than[0]|numeric');
				$this->form_validation->set_rules('FoodComposition['.$key.'][CompositionName]', 'CompositionName', 'trim|required');
				$this->form_validation->set_rules('FoodComposition['.$key.'][CompositionID]', 'CompositionID', 'trim');
			}

			foreach( $post['FoodProcess'] as $key => $value ) {
				$this->form_validation->set_rules('FoodProcess['.$key.'][FoodStepName]', 'Food Step', 'required');
			}

			if ( $this->form_validation->run() == TRUE && $valid_photo == true ) {

				$cuisine = $post['CuisineID'];
				if( !isset($cuisine[1]) ) {
					$cuisine[1] = NULL;
				}

				// Create Recipe
				$resInsertRecipe = $this->db->query('CALL InsertRecipe(?,?,?,?,?,?,?,?,?,?,?,?)', array(
					$post['RecipeName'], 
					nl2br($post['RecipeIntro']),
					$post['FoodTypeID'],
					$post['FoodProcessID'],
					$post['EstPeopleID'],
					$post['PriceRangeID'],
					$post['EstTime'],
					( isset($post['PrimaryPhoto']) ? $post['PrimaryPhoto'] : $post['PrimaryPhoto_preview'] ),
					$this->session->userdata('userid'),
					$contest_id,
					$cuisine[0],
					$cuisine[1]
				));

				$query_result = $resInsertRecipe->result();
				$recipe_id = $query_result[0]->RecipeID;
				
				$resInsertRecipe->next_result();

				if( isset($post['FoodComposition']) ) {
					foreach( $post['FoodComposition'] as $key => $value ) {
						$measure = $value['Measure'];
						$measure_size_id = $value['MeasureSizeID'];
						$composition = $value['CompositionName'];
						$composition_id = $value['CompositionID'];

						$resInsertFoodComposition = $this->db->query('CALL InsertFoodComposition(?,?,?,?,?,?,?)', array(
							($key+1),
							$composition, 
							$measure,
							( $composition_id == '' ) ? NULL : $composition_id,
							$recipe_id,
							$measure_size_id,
							$this->session->userdata('userid'),
						));

						$query_result = $resInsertFoodComposition->result();
						$resInsertFoodComposition->next_result();
					}
				}
				
				if( isset($post['FoodProcess']) ) {
					foreach( $post['FoodProcess'] as $key => $value ) {
						$step = nl2br($value['FoodStepName']);
						$step_image = isset($value['FoodStepImage']) ? $value['FoodStepImage'] : NULL;
						if( $step_image == NULL && isset($post['FoodProcess'][$key]['FoodStepImage_preview']) ) {
							$step_image = $post['FoodProcess'][$key]['FoodStepImage_preview'];
						}

						$resInsertFoodStep = $this->db->query('CALL InsertFoodStep(?,?,?,?,?)', array(
							($key+1), 
							$step,
							$step_image,
							$recipe_id,
							$this->session->userdata('userid'),
						));

						$query_result = $resInsertFoodStep->result();
						$resInsertFoodStep->next_result();
					}
				}

				// Save recipe log
				$device = $this->getDevice();
				$resRecipeLog = $this->db->query('CALL InsertRecipeLog(?,?,?,?,?,?,?)', array(
					$recipe_id,
					$device['browser'],
					$device['version'],
					$device['ip'],
					$device['device'],
					$device['os'],
					$this->session->userdata('userid'),
				));
				$query_result = $resRecipeLog->result();
				$resRecipeLog->next_result();

				$message = lang('success_save_recipe');
				$status = 'success';
			} else {
				$message = lang('failed_save_recipe');
				$status = 'error';
			}
		}

		if( $status == 'success' ) {
			// $this->session->set_flashdata('flash_message', array(
			// 	'message' => $message,
			// 	'status' => $status,
			// ));
			$this->load->helper('url');
			redirect($this->domain.'/users/profile/'.$this->session->userdata('userid').'/'.seoURL($this->session->userdata('username')));
		} else {
			loadMessage($message, $status);
		}

		$this->load->vars(array(
			'site_title' => lang('create_recipe'),
			'contest_name' => $contest_name,
		));
		$this->render($post);
	}

	public function edit( $recipe_id = false, $contest_id = NULL ) {
		$this->validateUserLogin();

		$this->load->helper('form');
		$this->load->helper('build_data');

		$post = $this->input->post();
		$message = false;
		$status = false;

		$this->callDefaultData('create');

		$contest_name = false;
		if( !empty($contest_id) ) {
			$resContest = $this->db->query('CALL GetContestDetail(?)', array(
				$contest_id,
			));
			$valuesContest = $resContest->result_array();
			$resContest->next_result();

			$contest_name = $valuesContest[0]['ContestName'];
		}

		if( !empty($post) ) {

			$this->load->library('upload');
			$this->form_validation->set_rules('RecipeName', 'Recipe Name', 'trim|required');
			$this->form_validation->set_rules('RecipeIntro', 'Recipe Intro', 'trim|required');
			$this->form_validation->set_rules('CuisineID', 'Cuisine', 'required');
			$this->form_validation->set_rules('EstTime', 'Estimated Time', 'trim|required|greater_than[0]|numeric');

			$valid_photo = true;
			$is_primary_photo = true;
			foreach ($_FILES as $field_name => $file_object) {
				$config = $this->getConfigImage('recipe/step');
				
			    // if ( $file_object['size'] > 2097152 ) {
		    	// 	$this->setCustomError($field_name, 'Max file size is 2MB.');
				// 	$valid_photo = false;
				// } else 

				if ( !empty($file_object['name']) ) {
			    	
			    	$file_name = $file_object['name'];
			    	$ext = pathinfo($file_name, PATHINFO_EXTENSION);
			    	$config['file_name'] = $file_name = sprintf('%s_%s.%s', date("Ymd_H_i_s", time()), mt_rand(1,100), $ext);

			    	if( $field_name == 'PrimaryPhoto' ) {
			    		$post['PrimaryPhoto'] = $file_name;
			    		$post['PrimaryPhoto_preview'] = $file_name;
						$config['upload_path'] = 'resources/images/uploads/recipe/primary';
					} else {
						$photo_counter = str_replace("imageStep","",$field_name);
						$post['FoodProcess'][$photo_counter]['FoodStepImage'] = $file_name;
						$post['FoodProcess'][$photo_counter]['FoodStepImage_preview'] = $file_name;
						$is_primary_photo = false;
					}

			        $this->upload->initialize($config);
			        
			        if ( !$this->upload->do_upload($field_name) ) {
			            $errors = $this->upload->display_errors();
			            $this->setCustomError($field_name, $errors);
			            $valid_photo = false;
			        } else {
			            // Code After Files Upload Success GOES HERE
			        	if( !empty($is_primary_photo) ) {
			        		$fInfo = $this->upload->data();
							$config_resize = array(
								'source_image' => $fInfo['full_path'],
								'new_image' => $this->webroot.$config['upload_path'].'/thumbs',
								'maintain_ratio' => false,
								'width' => 450,
								'height' => 300,
								'quality' => '100%',
						    );
						    $this->load->library('image_lib', $config_resize);
						    $this->image_lib->resize();
			        	}
			        }
			    } else {
			    	if( $field_name == 'PrimaryPhoto' && ( !isset($post['PrimaryPhoto_preview']) ) ) {
						$this->setCustomError($field_name, 'The Primary Photo field is required.');
						$valid_photo = false;
					}
			    }
			}

			foreach( $post['FoodComposition'] as $key => $value ) {
				$this->form_validation->set_rules('FoodComposition['.$key.'][Measure]', 'Measure', 'trim|required|greater_than[0]|numeric');
				$this->form_validation->set_rules('FoodComposition['.$key.'][CompositionName]', 'CompositionName', 'trim|required');
				$this->form_validation->set_rules('FoodComposition['.$key.'][CompositionID]', 'CompositionID', 'trim');
			}

			foreach( $post['FoodProcess'] as $key => $value ) {
				$this->form_validation->set_rules('FoodProcess['.$key.'][FoodStepName]', 'Food Step', 'required');
			}

			if ( $this->form_validation->run() == TRUE && $valid_photo == true ) {

				$cuisine = $post['CuisineID'];
				if( !isset($cuisine[1]) ) {
					$cuisine[1] = NULL;
				}

				// Create Recipe
				$resUpdateRecipe = $this->db->query('CALL UpdateRecipe(?,?,?,?,?,?,?,?,?,?,?,?,?)', array(
					$recipe_id,
					$post['RecipeName'], 
					nl2br($post['RecipeIntro']),
					$post['FoodTypeID'],
					$post['FoodProcessID'],
					$post['EstPeopleID'],
					$post['PriceRangeID'],
					$post['EstTime'],
					( isset($post['PrimaryPhoto']) ? $post['PrimaryPhoto'] : $post['PrimaryPhoto_preview'] ),
					$this->session->userdata('userid'),
					$contest_id,
					$cuisine[0],
					$cuisine[1]
				));

				$query_result = $resUpdateRecipe->result();
				$resUpdateRecipe->next_result();

				if( isset($post['FoodComposition']) ) {

					// Delete first, insert new one
					$resDeleteFoodComposition = $this->db->query('CALL DeleteFoodComposition(?,?)', array(
						$recipe_id,
						$this->session->userdata('userid'),
					));
					$query_result = $resDeleteFoodComposition->result();
					$resDeleteFoodComposition->next_result();

					foreach( $post['FoodComposition'] as $key => $value ) {
						$measure = $value['Measure'];
						$measure_size_id = $value['MeasureSizeID'];
						$composition = $value['CompositionName'];
						$composition_id = $value['CompositionID'];

						$resUpdateFoodComposition = $this->db->query('CALL UpdateFoodComposition(?,?,?,?,?,?,?)', array(
							($key+1),
							$composition, 
							$measure,
							( $composition_id == '' ) ? NULL : $composition_id,
							$recipe_id,
							$measure_size_id,
							$this->session->userdata('userid'),
						));

						$query_result = $resUpdateFoodComposition->result();
						$resUpdateFoodComposition->next_result();
					}
				}
				
				if( isset($post['FoodProcess']) ) {

					// Delete first, insert new one
					$resDeleteFoodStep = $this->db->query('CALL DeleteFoodStep(?,?)', array(
						$recipe_id,
						$this->session->userdata('userid'),
					));
					$query_result = $resDeleteFoodStep->result();
					$resDeleteFoodStep->next_result();

					foreach( $post['FoodProcess'] as $key => $value ) {
						$step = nl2br($value['FoodStepName']);
						$step_image = isset($value['FoodStepImage']) ? $value['FoodStepImage'] : NULL;
						if( $step_image == NULL && isset($post['FoodProcess'][$key]['FoodStepImage_preview']) ) {
							$step_image = $post['FoodProcess'][$key]['FoodStepImage_preview'];
						}

						$resUpdateFoodStep = $this->db->query('CALL UpdateFoodStep(?,?,?,?,?)', array(
							($key+1), 
							$step,
							$step_image,
							$recipe_id,
							$this->session->userdata('userid'),
						));

						$query_result = $resUpdateFoodStep->result();
						$resUpdateFoodStep->next_result();
					}
				}

				$message = lang('success_save_recipe');
				$status = 'success';
			} else {
				$message = lang('failed_save_recipe');
				$status = 'error';
			}
		} else {

			// Recipe Header
			$resRecipeDetailHeader = $this->db->query('CALL GetRecipeDetailHeader(?,?)', array(
				$recipe_id,
				$this->session->userdata('userid'),
			));

			$valuesRecipeDetailHeader = $resRecipeDetailHeader->result_array()[0];
			$resRecipeDetailHeader->next_result();

			// Food Composition
			$resFoodComposition = $this->db->query('CALL GetRecipeDetailComposition(?)', array(
				$recipe_id,
			));

			$valuesFoodComposition = $resFoodComposition->result_array();
			$resFoodComposition->next_result();

			// Food Step
			$resFoodStep = $this->db->query('CALL GetRecipeDetailStep(?)', array(
				$recipe_id,
			));

			$valuesFoodStep = $resFoodStep->result_array();
			$resFoodStep->next_result();
			
			$post = array(
				'RecipeName' => $valuesRecipeDetailHeader['RecipeName'],
				'RecipeIntro' => strip_tags($valuesRecipeDetailHeader['RecipeIntro']),
				'CuisineID' => explode(',', $valuesRecipeDetailHeader['CuisineID']),
				'FoodTypeID' => $valuesRecipeDetailHeader['FoodTypeID'],
				'FoodProcessID' => $valuesRecipeDetailHeader['FoodProcessID'],
				'PriceRangeID' => $valuesRecipeDetailHeader['PriceRangeID'],
				'EstPeopleID' => $valuesRecipeDetailHeader['EstPeopleID'],
				'EstTime' => $valuesRecipeDetailHeader['TimeEst'],
			);

			if( !empty($valuesRecipeDetailHeader['PrimaryPhoto']) ) {
				$post['PrimaryPhoto_preview'] = $valuesRecipeDetailHeader['PrimaryPhoto'];
			}

			foreach( $valuesFoodComposition as $row ) {
				$post['FoodComposition'][] = array(
					'Measure' => $row['MeasureValue'],
					'MeasureSizeID' => $row['MeasureSizeID'],
					'CompositionName' => $row['CompositionName'],
					'CompositionID' => $row['CompositionID'],
				);
			}

			foreach( $valuesFoodStep as $row ) {
				$step_arr = array(
					'FoodStepName' => strip_tags($row['FoodStepName']),
				);
				if( !empty($row['FoodStepImage']) ) {
					$step_arr['FoodStepImage_preview'] = $row['FoodStepImage'];
				}
				$post['FoodProcess'][] = $step_arr;
			}
		}


		if( $status == 'success' ) {
			$this->load->helper('url');
			redirect($this->domain.'/users/profile/'.$this->session->userdata('userid').'/'.seoURL($this->session->userdata('username')));
		} else {
			loadMessage($message, $status);
		}

		$this->load->vars(array(
			'site_title' => lang('edit_recipe'),
			'contest_name' => $contest_name,
		));

		loadMessage($message, $status);
		$this->render($post, 'Recipe/add');
	}

	public function recook_item( $recipe_id = false ) {
		
		$post = $this->input->post();
		$message = false;
		$status = false;
		
		if( !empty($post) ) {
			
			$this->form_validation->set_rules('photo', 'Recook photo', 'required');
			$this->form_validation->set_rules('RecookDesc', 'Recook Description', 'trim|required');

			if ( $this->form_validation->run() == TRUE ) {

				$res = $this->db->query('CALL InsertRecook(?,?,?,?)', array(
					$this->session->userdata('userid'),
					$recipe_id,
					nl2br($post['RecookDesc']),
					$post['photo'],
				));

				$valuesRecook = $res->result_array()[0];
				$res->next_result();
				$recook_id = $valuesRecook['RecookID'];

				// Send email to the recipe owner, notify his recipe is commented
				$resRecipeOwner = $this->db->query('CALL GetRecipeDetailHeader(?,?)', array(
					$recipe_id,
					NULL
				));
				$valuesRecipeOwner = $resRecipeOwner->result_array()[0];
				$resRecipeOwner->next_result();

				if( $this->session->userdata('userid') != $valuesRecipeOwner['UserID'] && $this->allowSendEmail ) {
					$this->_sendEmail(array(
			    		'email_view' => 'recook',
			    		'subject' => $valuesRecipeOwner['RecipeName'] . ' - Recooked',
			    		'to' => $valuesRecipeOwner['UserEmail'],
			    		'to_name' => $valuesRecipeOwner['UserName'],
			    		'data' => array(
			    			'recook_desc' => $post['RecookDesc'],
			    			'recipe_id' => $recipe_id,
			    			'recipe_name' => $valuesRecipeOwner['RecipeName'],
			    			'slug' => $valuesRecipeOwner['Slug'],
			    			'user_id' => $this->session->userdata('userid'),
			    			'username' => $this->session->userdata('username'),
			    			'recook_id' => $recook_id,
			    		),
			    	));
				}

				$message = lang('success_save_data');
				$status = 'success';
			} else {
				$message = lang('failed_save_data');
				$status = 'error';
			}
		}

		$resRecipeHeader = $this->db->query('CALL GetRecipeDetailHeader(?,?)', array(
			$recipe_id,
			$this->session->userdata('userid'),
		));
		$valuesRecipeHeader = $resRecipeHeader->result_array();
		$resRecipeHeader->next_result();

		$this->load->vars(array(
			'request' => $post,
			'valuesRecipeHeader' => $valuesRecipeHeader,
			'recipe_id' => $recipe_id,
		));

		loadMessage($message, $status);
		loadModal('recook');
	}

	public function view_recook( $recook_id = false ) {
		$this->load->helper('form');
		$this->load->helper('build_data');
		$this->callDefaultData();

		$post = $this->input->post();
		
		if( !empty($post) ) {
			
			$this->form_validation->set_rules('recook_comment', 'Comment', 'required');

			if ( $this->form_validation->run() == TRUE ) {

				$res = $this->db->query('CALL InsertRecookComment(?,?,?)', array(
					$post['recook_comment'],
					$this->session->userdata('userid'),
					$recook_id,
				));
			}
		}

		$resRecipeRecook = $this->db->query('CALL GetRecookHeader(?,?)', array(
			$recook_id,
			$this->session->userdata('userid'),
		));
		$valuesRecipeRecook = $resRecipeRecook->result_array();
		$resRecipeRecook->next_result();

		$this->load->vars(array(
			'valuesRecipeRecook' => $valuesRecipeRecook,
			'recook_id' => $recook_id,
			'site_title' => $valuesRecipeRecook[0]['RecipeName'],
			'og_meta' => array(
				'title' => $valuesRecipeRecook[0]['RecipeName'],
				'url' => $this->domain.'/recipe/view_recook/'.$recook_id.'/'.utf8_decode($valuesRecipeRecook[0]['Slug']),
				'image' => $this->domain.'/resources/images/uploads/recipe/recook/'.$valuesRecipeRecook[0]['RecookPhoto'],
				'desc' => $valuesRecipeRecook[0]['RecookDesc'],
			),
			'additional_css' => array(
				'react/transition',
				'emoticon/emoticons',
			),
			'additional_js' => array(
				'react/react-with-addons',
				'react/react-dom.min',
				'react/browser.min',
				'emoticon/emoticons',
			),
			'additional_jsx' => array(
				'common',
				'mixins/form',
				'components/replycomment',
				'components/comment',
				'recipe/view_recook',
			),
		));

		$this->render($post);
	}

	public function recipe_comment( $recipe_id = false ) {
		
		$post = $this->input->post();
		if( !empty($post) ) {
			
			$this->form_validation->set_rules('comment', 'Comment', 'required');
			if ( $this->form_validation->run() == TRUE ) {
				$res = $this->db->query('CALL InsertFoodComment(?,?,?)', array(
					$post['comment'],
					$this->session->userdata('userid'),
					$recipe_id,
				));
				$res->next_result();

				// Send email to the recipe owner, notify his recipe is commented
				$resRecipeOwner = $this->db->query('CALL GetRecipeDetailHeader(?,?)', array(
					$recipe_id,
					NULL
				));
				$valuesRecipeOwner = $resRecipeOwner->result_array()[0];
				$resRecipeOwner->next_result();

				if( $this->session->userdata('userid') != $valuesRecipeOwner['UserID'] && $this->allowSendEmail ) {
					$this->_sendEmail(array(
			    		'email_view' => 'recipe_comment',
			    		'subject' => 'Komentar Resep',
			    		'to' => $valuesRecipeOwner['UserEmail'],
			    		'to_name' => $valuesRecipeOwner['UserName'],
			    		'data' => array(
			    			'comment' => $post['comment'],
			    			'recipe_id' => $valuesRecipeOwner['RecipeID'],
			    			'recipe_name' => $valuesRecipeOwner['RecipeName'],
			    			'slug' => $valuesRecipeOwner['Slug'],
			    			'user_id' => $this->session->userdata('userid'),
			    			'username' => $this->session->userdata('username'),
			    		),
			    	));
				}

				$post['comment'] = false;
			}
		}

		// Recipe Comment
		$resRecipeComment = $this->db->query('CALL GetRecipeComment(?)', array(
			$recipe_id
		));
		$valuesRecipeComment = $resRecipeComment->result_array();
		$resRecipeComment->next_result();

		$this->load->vars(array(
			'valuesRecipeComment' => $valuesRecipeComment,
			'recipe_id' => $recipe_id,
			'comment' => $post['comment'],
		));
		loadSubview('recipe/comment');
	}

	public function delete_recipe_comment( $comment_id = false ) {
		$res = $this->db->query('CALL DeleteRecipeComment(?,?)', array(
			$comment_id,
			$this->session->userdata('userid'),
		));
	}

	public function recook_comment( $recook_id = false ) {
		
		$post = $this->input->post();
		if( !empty($post) ) {
			
			$this->form_validation->set_rules('comment', 'Comment', 'required');
			if ( $this->form_validation->run() == TRUE ) {
				$res = $this->db->query('CALL InsertRecookComment(?,?,?)', array(
					$post['comment'],
					$this->session->userdata('userid'),
					$recook_id,
				));
				$res->next_result();

				// Send email to the recipe owner, notify his recipe is commented
				$resRecookOwner = $this->db->query('CALL GetRecookHeader(?)', array(
					$recook_id
				));
				$valuesRecookOwner = $resRecookOwner->result_array()[0];
				$resRecookOwner->next_result();

				if( $this->session->userdata('userid') != $valuesRecookOwner['UserID'] && $this->allowSendEmail ) {
					$this->_sendEmail(array(
			    		'email_view' => 'recook_comment',
			    		'subject' => 'Komentar Recook',
			    		'to' => $valuesRecookOwner['UserEmail'],
			    		'to_name' => $valuesRecookOwner['UserName'],
			    		'data' => array(
			    			'comment' => $post['comment'],
			    			'recipe_name' => $valuesRecookOwner['RecipeName'],
			    			'slug' => $valuesRecookOwner['Slug'],
			    			'user_id' => $this->session->userdata('userid'),
			    			'username' => $this->session->userdata('username'),
			    			'recook_id' => $recook_id,
			    		),
			    	));
				}

				$post['comment'] = false;
			}
		}

		// Recipe Comment
		$resRecookComment = $this->db->query('CALL GetRecookComment(?)', array(
			$recook_id
		));
		$valuesRecookComment = $resRecookComment->result_array();
		$resRecookComment->next_result();

		$this->load->vars(array(
			'valuesRecipeComment' => $valuesRecookComment,
			'recipe_id' => $recook_id,
			'comment' => $post['comment'],
			'_with_padding' => false,
			'_show_title' => false,
			'_show_empty' => false,
			'_url' => 'recipe/recook_comment/',
			'_type' => 'recook',
		));
		loadSubview('recipe/comment');
	}

	public function delete_recook( $recook_id = false ) {
		$res = $this->db->query('CALL DeleteRecook(?,?)', array(
			$recook_id,
			$this->session->userdata('userid'),
		));
	}

	public function delete_recook_comment( $recook_comment_id = false ) {
		$res = $this->db->query('CALL DeleteRecookComment(?,?)', array(
			$recook_comment_id,
			$this->session->userdata('userid'),
		));
	}

	public function delete( $recipe_id = false ) {
		$res = $this->db->query('CALL DeleteRecipe(?,?)', array(
			$recipe_id,
			$this->session->userdata('userid'),
		));
	}

	public function cookmark_item( $recipe_id = false, $allow_print = false ) {	

		$message = lang('failed_save_data');
		$status = 'error';

		if( !empty($recipe_id) ) {    		
			$message = lang('success_save_data');
			$status = 'success';

			$resCookmark = $this->db->query('CALL InsertCookmark(?,?)', array(
				$this->session->userdata('userid'),
				$recipe_id
			));
			$resCookmark->next_result();

			$resRecipeHeader = $this->db->query('CALL GetRecipeDetailHeader(?,?)', array(
				$recipe_id,
				$this->session->userdata('userid'),
			));
			$valuesRecipeHeader = $resRecipeHeader->result_array();
			$resRecipeHeader->next_result();

			$value = $valuesRecipeHeader[0];

			$flag_love = $value['FlagLove'];
			$flag_cookmark = $value['FlagCookmark'];
			$flag_recook = $value['FlagRecook'];
			$flag_creator = $value['FlagCreator'];

			loadSubview('common/action_bottom_find', array(
				'recipe_id' => $recipe_id,
				'flag_love' => $flag_love,
				'flag_cookmark' => $flag_cookmark,
				'flag_recook' => $flag_recook,
				'flag_creator' => $flag_creator,
				'_print' => $allow_print,
			));
		} else {
			loadMessage($message, $status);
		}
	}

	public function uncookmark_item( $recipe_id = false, $cookmark_id = false, $allow_print = false ) {	

		$message = lang('failed_save_data');
		$status = 'error';

		if( !empty($cookmark_id) ) {    		
			$message = lang('success_save_data');
			$status = 'success';

			$resCookmark = $this->db->query('CALL DeleteCookmark(?,?)', array(
				$cookmark_id,
				$this->session->userdata('userid'),
			));
			$resCookmark->next_result();

			$resRecipeHeader = $this->db->query('CALL GetRecipeDetailHeader(?,?)', array(
				$recipe_id,
				$this->session->userdata('userid'),
			));
			$valuesRecipeHeader = $resRecipeHeader->result_array();
			$resRecipeHeader->next_result();

			$value = $valuesRecipeHeader[0];

			$flag_love = $value['FlagLove'];
			$flag_cookmark = $value['FlagCookmark'];
			$flag_recook = $value['FlagRecook'];
			$flag_creator = $value['FlagCreator'];

			loadSubview('common/action_bottom_find', array(
				'recipe_id' => $recipe_id,
				'flag_love' => $flag_love,
				'flag_cookmark' => $flag_cookmark,
				'flag_recook' => $flag_recook,
				'flag_creator' => $flag_creator,
				'_print' => $allow_print,
			));
		} else {
			loadMessage($message, $status);
		}
	}

	public function contest() {
		$this->load->helper('form');
		$this->load->helper('build_data');
		$this->callDefaultData('search');

		$resContest = $this->db->query('CALL GetAllContest()');
		$values = $resContest->result_array();
		$resContest->next_result();

		$this->load->vars(array(
			'site_title' => 'Kontes',
			'values' => $values,
				// 'sdk' => array(
				// 	'facebook' => array(
				// 		'like_page' => true,
				// 	)
				// )
		));
		$this->render();
	}

	public function my_contest() {
		$this->validateUserLogin();
		
		$this->load->helper('form');
		$this->load->helper('build_data');
		$this->callDefaultData();

		$this->load->vars(array(
			'site_title' => lang('contest'),
		));

		$this->render(false, 'coming_soon');
	}

	public function contest_detail( $contest_id ) {
		$resContest = $this->db->query('CALL GetContestDetail(?)', array(
			$contest_id,
		));
		$values = $resContest->result_array();
		$resContest->next_result();

		$this->load->vars(array(
			'site_title' => $values[0]['ContestName'],
			'values' => $values,
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
				'froala/plugins/video.min',
				'froala/plugins/lists.min',
			),
			'og_meta' => array(
				'title' => $values[0]['ContestName'],
				'url' => $this->domain.'/kontes-masak/'.$contest_id.'/'.utf8_decode($values[0]['Slug']),
				'image' => $this->domain.'/resources/images/uploads/banner/horizontal/'.$values[0]['ContestBanner'],
				'desc' => substr(strip_tags($values[0]['ContestDesc']), 0, 250),
			),
		));

		$this->render();
	}

	public function contest_recipe( $contest_id = false ) {
		$this->load->helper('form');
		$this->load->helper('build_data');
		$this->callDefaultData('search');

		$resContest = $this->db->query('CALL GetContestDetail(?)', array(
			$contest_id,
		));
		$valuesContestDetail = $resContest->result_array();
		$resContest->next_result();

		$post = $this->input->post();
		$page = 1;
		if( !empty($post) && $this->input->is_ajax_request() ) {
			$page = $post['next_page'];
		}
		$resContestRecipe = $this->db->query('CALL GetContestRecipe(?,?,?)', array(
			$contest_id,
			16,
			($page-1) * 16,
		));
		$valuesContestRecipe = $resContestRecipe->result_array();
		$resContestRecipe->next_result();

		$this->load->vars(array(
			'site_title' => lang('contest'),
			'contest_name' => $valuesContestDetail[0]['ContestName'],
			'contest_id' => $contest_id,
			'page' => $page,
			'valuesContestRecipe' => $valuesContestRecipe,
		));

		$this->render();
	}

	public function contest_winner( $contest_id = NULL ) {
		$this->load->vars(array(
			'contest_id' => $contest_id,
		));

		loadModal('contest_winner');
	}

	public function love_item( $recipe_id = false, $allow_print = false ) {	

		$message = lang('failed_save_data');
		$status = 'error';

		if( !empty($recipe_id) ) {    		
			$message = lang('success_save_data');
			$status = 'success';

			$resLoveRecipe = $this->db->query('CALL LoveRecipe(?,?)', array(
				$this->session->userdata('userid'),
				$recipe_id
			));
			$resLoveRecipe->next_result();

			$resRecipeHeader = $this->db->query('CALL GetRecipeDetailHeader(?,?)', array(
				$recipe_id,
				$this->session->userdata('userid'),
			));
			$valuesRecipeHeader = $resRecipeHeader->result_array();
			$resRecipeHeader->next_result();

			$value = $valuesRecipeHeader[0];

			$flag_love = $value['FlagLove'];
			$flag_cookmark = $value['FlagCookmark'];
			$flag_recook = $value['FlagRecook'];
			$flag_creator = $value['FlagCreator'];

			loadSubview('common/action_bottom_find', array(
				'recipe_id' => $recipe_id,
				'flag_love' => $flag_love,
				'flag_cookmark' => $flag_cookmark,
				'flag_recook' => $flag_recook,
				'flag_creator' => $flag_creator,
				'_print' => $allow_print,
			));
		} else {
			loadMessage($message, $status);
		}
	}

	public function unlove_item( $recipe_id = false, $allow_print = false ) {	

		$message = lang('failed_save_data');
		$status = 'error';

		if( !empty($recipe_id) ) {    		
			$message = lang('success_save_data');
			$status = 'success';

			$resUnloveRecipe = $this->db->query('CALL UnloveRecipe(?,?)', array(
				$this->session->userdata('userid'),
				$recipe_id
			));
			$resUnloveRecipe->next_result();

			$resRecipeHeader = $this->db->query('CALL GetRecipeDetailHeader(?,?)', array(
				$recipe_id,
				$this->session->userdata('userid'),
			));
			$valuesRecipeHeader = $resRecipeHeader->result_array();
			$resRecipeHeader->next_result();

			$value = $valuesRecipeHeader[0];

			$flag_love = $value['FlagLove'];
			$flag_cookmark = $value['FlagCookmark'];
			$flag_recook = $value['FlagRecook'];
			$flag_creator = $value['FlagCreator'];

			loadSubview('common/action_bottom_find', array(
				'recipe_id' => $recipe_id,
				'flag_love' => $flag_love,
				'flag_cookmark' => $flag_cookmark,
				'flag_recook' => $flag_recook,
				'flag_creator' => $flag_creator,
				'_print' => $allow_print,
			));
		} else {
			loadMessage($message, $status);
		}
	}

	public function love_item_recook( $recook_id = false, $allow_print = false ) {	

		$message = lang('failed_save_data');
		$status = 'error';

		if( !empty($recook_id) ) {    		
			$message = lang('success_save_data');
			$status = 'success';

			$resLoveRecook = $this->db->query('CALL LoveRecook(?,?)', array(
				$recook_id,
				$this->session->userdata('userid'),
			));
			$resLoveRecook->next_result();

			$resRecookHeader = $this->db->query('CALL GetRecookHeader(?,?)', array(
				$recook_id,
				$this->session->userdata('userid'),
			));
			$valuesRecookHeader = $resRecookHeader->result_array();
			$resRecookHeader->next_result();

			$value = $valuesRecookHeader[0];

			$recipe_id 	= $value['RecipeID'];
			$slug 		= $value['Slug'];
			$flag_love 	= $value['FlagRecookLove'];

			loadSubview('common/action_bottom_find', array(
				'recipe_id' => $recipe_id,
				'recook_id' => $recook_id,
				'slug' => $slug,
				'flag_love' => $flag_love,
				'flag_recook' => 1,
				'flag_creator' => 1,
			));
		} else {
			loadMessage($message, $status);
		}
	}

	public function unlove_item_recook( $recook_id = false, $allow_print = false ) {	

		$message = lang('failed_save_data');
		$status = 'error';

		if( !empty($recook_id) ) {    		
			$message = lang('success_save_data');
			$status = 'success';

			$resLoveRecook = $this->db->query('CALL UnloveRecook(?,?)', array(
				$recook_id,
				$this->session->userdata('userid'),
			));
			$resLoveRecook->next_result();

			$resRecookHeader = $this->db->query('CALL GetRecookHeader(?,?)', array(
				$recook_id,
				$this->session->userdata('userid'),
			));
			$valuesRecookHeader = $resRecookHeader->result_array();
			$resRecookHeader->next_result();

			$value = $valuesRecookHeader[0];

			$recipe_id 	= $value['RecipeID'];
			$slug 		= $value['Slug'];
			$flag_love 	= $value['FlagRecookLove'];

			loadSubview('common/action_bottom_find', array(
				'recipe_id' => $recipe_id,
				'recook_id' => $recook_id,
				'slug' => $slug,
				'flag_love' => $flag_love,
				'flag_recook' => 1,
				'flag_creator' => 1,
			));
		} else {
			loadMessage($message, $status);
		}
	}
}