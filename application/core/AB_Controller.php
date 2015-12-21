<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class AB_Controller extends CI_Controller {
	
	public function __construct() {
		parent::__construct();

		$this->load->library('rest');
		$this->load->helper('common');

		if( isLoggedIn() ) {
			$resNotification = $this->db->query('CALL GetUnreadNotifications(?)', array(
				$this->session->userdata('userid')
			));
			$notifications = $resNotification->result_array();
			$resNotification->next_result();
			$this->load->vars(array(
				'notifications' => $notifications,
			));
		}
		$this->load->vars(array(
			'domain' => 'http://localhost/rd',
		));
	}

	public function render( $data = array(), $content_name = false, $layout = 'default', $is_admin = false ) {
		
		$controller_name = $this->router->fetch_class();
		$method_name = $this->router->fetch_method();

		$default_content_path = $controller_name.'/'.$method_name;

		if( !empty($content_name) ) {
			$default_content_path = $controller_name.'/'.$content_name;
		}

		if( !empty($is_admin) ) {
			$default_content_path = 'Admin/'.$controller_name.'/'.$content_name;
		}

		$this->load->vars(array(
			'request' => $data,
		));

		$content_view = $this->load->view($default_content_path, '',  TRUE);
		$this->load->view('Layouts/'.$layout, array(
			'content_view' => $content_view,
		));
	}

	public function setCustomError( $field_name = false, $error = false ) {
		if( !empty($field_name) && !empty($error) ) {
			$validator = &_get_validation_object();
			$validator->_field_data[$field_name] = array(
				'field' => $field_name,
				'rules' => false,
				'postdata' => false,
				'is_array' => false,
				'error' => $error,
			);
		}
	}

	public function getConfigImage( $path = '', $options = array() ) {
		$default_options = array(
			'upload_path' => 'resources/images/uploads/'.$path,
			'allowed_types' => 'gif|jpg|jpeg|png',
		);
		if( !empty($options) ) {
			$default_options = array_merge($default_options, $options);
		}

		return $default_options;
	}

	public function callDefaultData( $type = 'search', $with_sort = false ) {

		$food_types = $this->db->query('CALL GetAllFoodType()');
		$food_types = buildDataDropdown($food_types, 'FoodTypeID', 'FoodTypeName');

		$cuisines = $this->db->query('CALL GetAllCuisine()');
		$cuisines = buildDataDropdown($cuisines, 'CuisineID', 'CuisineName');

		$food_process = array();
		$price_ranges = array();
		$estimation_peoples = array();
		$measure_sizes = array();
		$compositions = array();
		$sorts = array();

		if( $type == 'create' ) {
			$food_process = $this->db->query('CALL GetAllFoodProcess()');
			$food_process = buildDataDropdown($food_process, 'FoodProcessID', 'FoodProcessName');
			
			$price_ranges = $this->db->query('CALL GetAllPriceRange()');
			$price_ranges = buildDataDropdown($price_ranges, 'PriceRangeID', 'PriceRangeName');
			
			$estimation_peoples = $this->db->query('CALL GetAllEstPeople()');
			$estimation_peoples = buildDataDropdown($estimation_peoples, 'EstPeopleID', 'EstPeopleName');

			$measure_sizes = $this->db->query('CALL GetAllMeasureSize()');
			$measure_sizes = buildDataDropdown($measure_sizes, 'MeasureSizeID', 'MeasureSizeName');

			$compositions = $this->db->query('CALL GetAllComposition()');
			$compositions = buildDataDropdown($compositions, 'CompositionID', 'CompositionName');
		}

		if( !empty($with_sort) ) {
			$sorts = array(
				0 => 'Abjad',
				1 => 'Resep Terbaru',
				2 => 'Resep Populer'
			);
		}

		$this->load->vars(array(
			'food_types' => $food_types,
			'cuisines' => $cuisines,
			'food_process' => $food_process,
			'price_ranges' => $price_ranges,
			'estimation_peoples' => $estimation_peoples,
			'measure_sizes' => $measure_sizes,
			'compositions' => $compositions,
			'sorts' => $sorts,
		));
	}

	public function callSearchRecipe( $post = array() ){
		$strCuisine = NULL;
		$strFoodType = NULL;
		$keyword = isset($post['keyword']) ? $post['keyword'] : NULL;
		$strComposition = isset($post['composition']) ? $post['composition'] : NULL;
		$strFoodProcess = isset($post['FoodProcessID']) ? $post['FoodProcessID'] : NULL;
		$strPriceRange = isset($post['PriceRangeID']) ? $post['PriceRangeID'] : NULL;
		$strEstPeople = isset($post['EstPeopleID']) ? $post['EstPeopleID'] : NULL;
		$sortBy = isset($post['Sorting']) ? $post['Sorting'] : NULL;

		$this->form_validation->set_rules('keyword', 'keyword', 'trim');
		$this->form_validation->run();

		if( isset($post['CuisineID']) ) {
			$strCuisine = implode($post['CuisineID'], ',');
		}
		if( isset($post['FoodTypeID']) ) {
			$strFoodType = implode($post['FoodTypeID'], ',');
		}
		if( isset($post['FoodProcessID']) ) {
			$strFoodProcess = implode($post['FoodProcessID'], ',');
		}
		if( isset($post['PriceRangeID']) ) {
			$strPriceRange = implode($post['PriceRangeID'], ',');
		}
		if( isset($post['EstPeopleID']) ) {
			$strEstPeople = implode($post['EstPeopleID'], ',');
		}

		$resSearchRecipe = $this->db->query('CALL GetRecipeSearchResult(?,?,?,?,?,?,?,?,?,?)', array(
			$strCuisine, 
			$strFoodType,
			$keyword,
			$strComposition,
			$strFoodProcess,
			$strPriceRange,
			$strEstPeople,
			$sortBy,
			12,
			0,
		));
		$data = $resSearchRecipe->result_array();

		$this->load->vars(array(
			'values' => $data,
		));
	}
}

/* End of file AB_Controller.php */