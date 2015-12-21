<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Recipe extends AB_Controller {

	public function index() {
		$this->load->helper('form');
		$this->load->helper('build_data');

		$post = $this->input->get();
		$this->callDefaultData('seach', true);

		$sortBy = isset($post['Sorting']) ? $post['Sorting'] : NULL;
		$resMyRecipe = $this->db->query('CALL GetMyRecipe(?,?,?,?)', array(
			$this->session->userdata('userid'),
			$sortBy,
			10,
			0,
		));
		$data = $resMyRecipe->result_array();

		$this->load->vars(array(
			'values' => $data,
		));
		$this->render($post);
	}

	public function find() {
		$this->load->helper('form');
		$this->load->helper('build_data');

		$post = $this->input->get();
		$this->callDefaultData('create', true);
		$this->callSearchRecipe($post);
		$this->render($post);
	}

	public function detail() {
		$this->render();
	}

	public function add() {
		$this->load->helper('form');
		$this->load->helper('build_data');

		$post = $this->input->post();
		$message = 'Gagal menyimpan data. Silahkan coba lagi';
		$status = 'error';

		$this->callDefaultData('create');

		if( !empty($post) ) {

			$this->load->library('upload');
			$this->form_validation->set_rules('RecipeName', 'Recipe Name', 'required');
			$this->form_validation->set_rules('RecipeIntro', 'Recipe Intro', 'required');
			$this->form_validation->set_rules('CuisineID', 'Cuisine', 'required');
			$this->form_validation->set_rules('EstTime', 'Estimated Time', 'required');

			$config = $this->getConfigImage('recipe/step');

			$photo_counter = 0;
			$valid_photo = true;
			foreach ($_FILES as $field_name => $file_object) {
			    if ( !empty($file_object['name']) ) {
			    	
			    	$file_name = $file_object['name'];
			    	$ext = pathinfo($file_name, PATHINFO_EXTENSION);
			    	$config['file_name'] = $file_name = sprintf('%s_%s.%s', date("Ymd_H_i_s", time()), mt_rand(1,100), $ext);

			    	if( $field_name == 'PrimaryPhoto' ) {
			    		$post['PrimaryPhoto'] = $file_name;
						$config['upload_path'] = 'resources/images/uploads/recipe/primary';
					} else {
						$post['FoodProcess'][$photo_counter]['FoodStepImage'] = $file_name;
						$photo_counter++;
					}

			        $this->upload->initialize($config);
			        
			        if ( !$this->upload->do_upload($field_name) ) {
			            $errors = $this->upload->display_errors();
			            $this->setCustomError($field_name, $errors);
			            $valid_photo = false;
			        } else {
			             // Code After Files Upload Success GOES HERE
			        }
			    } else {
			    	if( $field_name == 'PrimaryPhoto' ) {
						$this->setCustomError($field_name, 'The Primary Photo field is required.');
						$valid_photo = false;
					}
			    }
			}

			foreach( $post['FoodComposition'] as $key => $value ) {
				$this->form_validation->set_rules('FoodComposition['.$key.'][Measure]', 'Measure', 'required');
				$this->form_validation->set_rules('FoodComposition['.$key.'][CompositionName]', 'CompositionName', 'required');
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
					$post['RecipeIntro'],
					$post['FoodTypeID'],
					$post['FoodProcessID'],
					$post['EstPeopleID'],
					$post['PriceRangeID'],
					$post['EstTime'],
					$post['PrimaryPhoto'],
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
							$composition_id,
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
						$step = $value['FoodStepName'];
						$step_image = isset($value['FoodStepImage']) ? $value['FoodStepImage'] : NULL;

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
			}
		}

		$this->render($post);
	}

	public function recook() {
		$this->load->helper('form');
		$this->load->helper('build_data');

		$post = $this->input->get();
		$this->callDefaultData();

		$resRecook = $this->db->query('CALL GetMyRecook(?,?,?)', array(
			$this->session->userdata('userid'),
			10,
			0,
		));
		$data = $resRecook->result_array();

		$this->load->vars(array(
			'values' => $data,
		));
		$this->render($post);
	}

	public function cookmark() {
		$this->load->helper('form');
		$this->load->helper('build_data');

		$post = $this->input->get();
		$this->callDefaultData();

		$resCookmark = $this->db->query('CALL GetMyCookmark(?,?,?)', array(
			$this->session->userdata('userid'),
			10,
			0,
		));
		$data = $resCookmark->result_array();

		$this->load->vars(array(
			'values' => $data,
		));
		$this->render($post);
	}
}