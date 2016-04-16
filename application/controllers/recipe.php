<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Recipe extends AB_Controller {

	function __construct() {
        parent::__construct();

        $this->session->keep_flashdata('flash_message');
    }

	public function index() {
		$this->validateUserLogin();

		$this->load->helper('form');
		$this->load->helper('build_data');

		$post = $this->input->get();
		$this->callDefaultData('search', true);

		$sortBy = isset($post['Sorting']) ? $post['Sorting'] : 1;
		$resMyRecipe = $this->db->query('CALL GetMyRecipe(?,?,?,?,?)', array(
			$this->session->userdata('userid'),
			$sortBy,
			10,
			0,
			$this->session->userdata('userid'),
		));
		$data = $resMyRecipe->result_array();

		$this->load->vars(array(
			'site_title' => 'Resep Saya',
			'values' => $data,
		));
		$this->render($post);
	}

	public function find( $page = 1 ) {
		$this->load->helper('form');
		$this->load->helper('build_data');

		$post = $this->input->get();
		$this->callDefaultData('create', true);
		$this->callSearchRecipe($post, $page);

		$this->load->vars(array(
			'site_title' => 'Cari Resep',
		));
		$this->render($post);
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
		if( $device['ip'] != '114.121.134.202' && $device['ip'] != '202.62.16.200' ) {
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
		}

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

		// Recipe Comment
		$resRecipeComment = $this->db->query('CALL GetRecipeComment(?)', array(
			$recipe_id
		));
		$valuesRecipeComment = $resRecipeComment->result_array();
		$resRecipeComment->next_result();

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

		$this->load->vars(array(
			'valuesRecipeHeader' => $valuesRecipeHeader,
			'valuesRecipeRecook' => $valuesRecipeRecook,
			'valuesRecipeComposition' => $valuesRecipeComposition,
			'valuesRecipeStep' => $valuesRecipeStep,
			'valuesRecipeComment' => $valuesRecipeComment,
			'valuesRelatedByAuthor' => $valuesRelatedByAuthor,
			'valuesRelatedRecipe' => $valuesRelatedRecipe,
			'recipe_id' => $recipe_id,
			'site_title' => $valuesRecipeHeader[0]['RecipeName'],
			'og_meta' => array(
				'title' => $valuesRecipeHeader[0]['RecipeName'],
				'url' => $this->domain.'/resep-masak/'.$recipe_id.'/'.utf8_decode($valuesRecipeHeader[0]['Slug']),
				'image' => $this->domain.'/resources/images/uploads/recipe/primary/'.$valuesRecipeHeader[0]['PrimaryPhoto'],
				'desc' => $valuesRecipeHeader[0]['RecipeIntro'],
			)
		));

		$this->render();
	}

	public function add() {
		$this->validateUserLogin();

		$this->load->helper('form');
		$this->load->helper('build_data');

		$post = $this->input->post();
		$message = false;
		$status = false;

		$this->callDefaultData('create');

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
								'width' => 258,
								'height' => 170,
								'quality' => '50%',
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
					NULL,
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

				// debug($post); die();
				
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

				$message = 'Sukses menyimpan resep';
				$status = 'success';
			} else {
				$message = 'Gagal menyimpan resep. Silahkan coba lagi';
				$status = 'error';
			}
		}

		if( $status == 'success' ) {
			$this->session->set_flashdata('flash_message', array(
				'message' => $message,
				'status' => $status,
			));
			$this->load->helper('url');
			redirect($this->domain.'/recipe/add');
		} else {
			loadMessage($message, $status);
		}

		$this->load->vars(array(
			'site_title' => 'Tulis Resep',
		));
		$this->render($post);
	}

	public function edit( $recipe_id = false ) {
		$this->validateUserLogin();

		$this->load->helper('form');
		$this->load->helper('build_data');

		$post = $this->input->post();
		$message = false;
		$status = false;

		$this->callDefaultData('create');

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
								'width' => 258,
								'height' => 170,
								'quality' => '50%',
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
					NULL,
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

				$message = 'Sukses menyimpan resep';
				$status = 'success';
			} else {
				$message = 'Gagal menyimpan resep. Silahkan coba lagi';
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

		$this->load->vars(array(
			'site_title' => 'Edit Resep',
		));

		loadMessage($message, $status);
		$this->render($post, 'Recipe/add');
	}

	public function recook() {
		$this->load->helper('form');
		$this->load->helper('build_data');

		$post = $this->input->get();
		$this->callDefaultData();

		$resRecook = $this->db->query('CALL GetMyRecook(?,?,?,?)', array(
			$this->session->userdata('userid'),
			10,
			0,
			$this->session->userdata('userid'),
		));
		$data = $resRecook->result_array();

		$this->load->vars(array(
			'site_title' => 'Recook',
			'values' => $data,
		));
		$this->render($post);
	}

	public function cookmark() {
		$this->validateUserLogin();

		$this->load->helper('form');
		$this->load->helper('build_data');

		$post = $this->input->get();
		$this->callDefaultData();

		$resCookmark = $this->db->query('CALL GetMyCookmark(?,?,?,?)', array(
			$this->session->userdata('userid'),
			10,
			0,
			$this->session->userdata('userid'),
		));
		$data = $resCookmark->result_array();

		$this->load->vars(array(
			'site_title' => 'Cookmark',
			'values' => $data,
		));
		$this->render($post);
	}

	public function recook_item( $recipe_id = false ) {
		
		$post = $this->input->post();
		$message = false;
		$status = false;
		
		if( !empty($post) ) {
			
			$this->form_validation->set_rules('photo', 'Recook photo', 'required');
			$this->form_validation->set_rules('RecookDesc', 'Recook Description', 'required');

			if ( $this->form_validation->run() == TRUE ) {

				$res = $this->db->query('CALL InsertRecook(?,?,?,?)', array(
					$this->session->userdata('userid'),
					$recipe_id,
					$post['RecookDesc'],
					$post['photo'],
				));

				$message = 'Sukses menyimpan data recook';
				$status = 'success';
			} else {
				$message = 'Gagal menyimpan data recook. Silahkan coba lagi';
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

	public function view_recook_item( $recook_id = false ) {
		
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

		$resRecipeRecook = $this->db->query('CALL GetRecookHeader(?)', array(
			$recook_id,
		));
		$valuesRecipeRecook = $resRecipeRecook->result_array();
		$resRecipeRecook->next_result();

		$resRecookComment = $this->db->query('CALL GetRecookComment(?)', array(
			$recook_id,
		));
		$valuesRecookComment = $resRecookComment->result_array();
		$resRecookComment->next_result();

		$this->load->vars(array(
			'request' => $post,
			'valuesRecipeRecook' => $valuesRecipeRecook,
			'valuesRecookComment' => $valuesRecookComment,
			'recook_id' => $recook_id,
		));

		loadModal('view_recook');
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
		));
		loadSubview('recipe/comment');
	}

	public function delete_recipe_comment( $comment_id = false ) {
		$res = $this->db->query('CALL DeleteRecipeComment(?,?)', array(
			$comment_id,
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

		$message = 'Gagal menyimpan data cookmark';
		$status = 'error';

		if( !empty($recipe_id) ) {    		
			$message = 'Sukses menyimpan data cookmark';
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

			$flag_cookmark = $value['FlagCookmark'];
			$flag_recook = $value['FlagRecook'];
			$flag_creator = $value['FlagCreator'];
			loadSubview('common/action_bottom_find', array(
				'recipe_id' => $recipe_id,
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

		$message = 'Gagal menghapus cookmark';
		$status = 'error';

		if( !empty($cookmark_id) ) {    		
			$message = 'Sukses menghapus data cookmark';
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

			$flag_cookmark = $value['FlagCookmark'];
			$flag_recook = $value['FlagRecook'];
			$flag_creator = $value['FlagCreator'];
			loadSubview('common/action_bottom_find', array(
				'recipe_id' => $recipe_id,
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

		$this->callDefaultData();
		$this->load->vars(array(
			'site_title' => 'Kontes Masak',
			'og_meta' => array(
				'title' => 'Lomba Masak Kreatif berhadiah Microwave Oven, Stand Mixer, Blender',
				'url' => $this->domain.'/kontes-masak/1/lomba-masak-kreatif-berhadiah-microwave-oven-stand-mixer-blender',
				'image' => $this->domain.'/resources/images/uploads/poster/poster-lomba.jpg',
				'desc' => 'Hai, Cookindo Lovers! Bersamaan dengan launching website, www.cookindo.com mengadakan lomba menulis resep kreatif berhadiah jutaan rupiah loh… Ikutan yuk! Caranya gampang, yaitu...',
			),
		));
		$this->render();
	}

	public function my_contest() {
		$this->validateUserLogin();
		
		$this->load->helper('form');
		$this->load->helper('build_data');

		$this->callDefaultData();
		$this->load->vars(array(
			'site_title' => 'Kontes Saya',
		));
		$this->render(false, 'coming_soon');
	}
}