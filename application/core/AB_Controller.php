<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class AB_Controller extends CI_Controller {

	public $domain;
	public $site_lang;
	public $allowSendEmail = false;

	public function __construct() {
		parent::__construct();
		ini_set('memory_limit', '-1');

		$this->domain = 'http://localhost/cookindo';
		$this->webroot = $_SERVER['DOCUMENT_ROOT'].'/cookindo/';

		// $this->domain = 'http://'.$_SERVER['SERVER_NAME'];
		// $this->webroot = $_SERVER['DOCUMENT_ROOT'];

		if( isLoggedIn() ) {

			if( $this->session->userdata('userpassword') == 'def' && strtolower($this->router->method) != 'completion' && strtolower($this->router->method) != 'logout' ) {
				$this->load->helper('url');
	            redirect($this->domain.'/users/completion');
			}

			$resNotification = $this->db->query('CALL GetNotifications(?)', array(
				$this->session->userdata('userid')
			));
			$notifications = $resNotification->result_array();
			$resNotification->next_result();
			$this->load->vars(array(
				'notifications' => $notifications,
			));
		}

		if( $this->session->userdata('redirect_now') == true ) {
			$this->session->set_userdata('redirect_now', false);
			if( !empty($this->session->userdata('redirect_after')) ) {
				$redirect_after = $this->session->userdata('redirect_after');
				$this->session->set_userdata('redirect_after', false);
				$this->load->helper('url');
	            redirect($this->domain.'/'.$redirect_after);
			}
		}

		$this->site_lang = ( get_cookie('site_lang') ) ? get_cookie('site_lang') : 'indonesian';
		$this->lang->load($this->site_lang, $this->site_lang);
		$this->load->vars(array(
			'domain' => $this->domain,
			'webroot' => $this->webroot,
			'site_lang' => $this->site_lang,
		));
	}

	function getDevice(){
		$browser = $this->getBrowser();
		$ip = $this->getRealUserIp();
		$device = 'Desktop';
		if( isMobile() ) {
			$device = 'Mobile';
		}

		return array(
			'browser' => ( isset($browser['browser']) ? $browser['browser'] : false ),
			'version' => ( isset($browser['version']) ? $browser['browser'] : false ),
			'ip' => ( !empty($ip) ? $ip : false ),
			'device' => ( !empty($device) ? $device : false ),
			'os' => ( isset($browser['os']) ? $browser['os'] : false ),
		);
	}

	function validateUserLogin(){
		if( empty($this->session->userdata('loggedin')) ) {
			$this->load->helper('url');
			redirect($this->domain);
		}
	}

	public function savePageViewLog( $browser, $ip, $device ) {
		$resPageViewLog = $this->db->query('CALL InsertPageViewLog(?,?,?,?,?,?,?)', array(
			$_SERVER['REQUEST_URI'],
			( isset($browser['browser']) ? $browser['browser'] : false ),
			( isset($browser['version']) ? $browser['browser'] : false ),
			( !empty($ip) ? $ip : false ),
			( !empty($device) ? $device : false ),
			( isset($browser['os']) ? $browser['os'] : false ),
			$this->session->userdata('userid'),
		));
		$query_result = $resPageViewLog->result();
		$resPageViewLog->next_result();
	}

	public function saveUserLog( $browser, $ip, $device ) {
		$resUserLog = $this->db->query('CALL InsertUserLog(?,?,?,?,?,?)', array(
			( isset($browser['browser']) ? $browser['browser'] : false ),
			( isset($browser['version']) ? $browser['browser'] : false ),
			( !empty($ip) ? $ip : false ),
			( !empty($device) ? $device : false ),
			( isset($browser['os']) ? $browser['os'] : false ),
			$this->session->userdata('userid'),
		));
		$query_result = $resUserLog->result();
		$resUserLog->next_result();
	}

	public function saveSearchLog( $CuisineID, $FoodTypeID, $Keyword, $Composition, $FoodProcess, $PriceRange, $EstPeople ) {

		$browser = $this->getBrowser();
		$ip = $this->getRealUserIp();
		$device = 'Desktop';
		if( isMobile() ) {
			$device = 'Mobile';
		}

		$resUserLog = $this->db->query('CALL InsertSearchLog(?,?,?,?,?,?,?,?,?,?,?,?,?)', array(
			$CuisineID,
			$FoodTypeID, 
			$Keyword, 
			$Composition,
			$FoodProcess, 
			$PriceRange, 
			$EstPeople,
			$this->session->userdata('userid'),
			( isset($browser['browser']) ? $browser['browser'] : false ),
			( isset($browser['version']) ? $browser['browser'] : false ),
			( !empty($ip) ? $ip : false ),
			( !empty($device) ? $device : false ),
			( isset($browser['os']) ? $browser['os'] : false ),
		));
		$query_result = $resUserLog->result();
		$resUserLog->next_result();
	}

	public function render( $data = array(), $content_name = false, $layout = 'default', $is_admin = false ) {
		
		$controller_name = ucwords($this->router->fetch_class());
		$method_name = $this->router->fetch_method();

		$default_content_path = $controller_name.'/'.$method_name;

		if( !empty($content_name) ) {
			$default_content_path = $content_name;
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
		// For translation purpose, we will hardcode Food process from db
		if( $this->site_lang == 'indonesian' ){
			$food_process = array(
			    7 => lang('grilled'),
			    1 => lang('fried'),
			    3 => lang('steamed'),
			    2 => lang('baked'),
			    5 => lang('boiled'),
			    6 => lang('not_cooked'),
			    4 => lang('stir_fry'),
			);
		} else if( $this->site_lang == 'english' ) {
			$food_process = array(
				2 => lang('baked'),
				5 => lang('boiled'),
				1 => lang('fried'),
			    7 => lang('grilled'),
			    6 => lang('not_cooked'),
			    3 => lang('steamed'),
			    4 => lang('stir_fry'),
			);
		}
		
		$price_ranges = array();
		$estimation_peoples = array();
		$measure_sizes = array();
		$compositions = array();
		$sorts = array();

		if( $type == 'create' ) {
			// $food_process = $this->db->query('CALL GetAllFoodProcess()');
			// $food_process = buildDataDropdown($food_process, 'FoodProcessID', 'FoodProcessName');

			$price_ranges = $this->db->query('CALL GetAllPriceRange()');
			$price_ranges = buildDataDropdown($price_ranges, 'PriceRangeID', 'PriceRangeName');
			
			$estimation_peoples = $this->db->query('CALL GetAllEstPeople()');
			$estimation_peoples = buildDataDropdown($estimation_peoples, 'EstPeopleID', 'EstPeopleName');

			// Add word 'People', need to do it here for translation purpose
			$lengthEP = count($estimation_peoples);
			for( $n = 1; $n <= $lengthEP; $n++ ){
				$estimation_peoples[$n] = sprintf('%s %s', $estimation_peoples[$n], $this->lang->line('people'));
			}

			$measure_sizes = $this->db->query('CALL GetAllMeasureSize()');
			$measure_sizes = buildDataDropdown($measure_sizes, 'MeasureSizeID', 'MeasureSizeName');

			$compositions = $this->db->query('CALL GetAllComposition()');
			$compositions = buildDataAutocomplete($compositions, 'CompositionID', 'CompositionName');
		}

		if( !empty($with_sort) ) {
			$sorts = array(
				0 => $this->lang->line('alphabet'),
				1 => $this->lang->line('latest_recipe'),
				2 => $this->lang->line('popular_recipe')
			);
		}

		$this->load->vars(array(
			'food_types' => $food_types,
			'cuisines' => $cuisines,
			'food_process' => $food_process,
			'price_ranges' => $price_ranges,
			'estimation_peoples' => $estimation_peoples,
			'measure_sizes' => $measure_sizes,
			'compositions' => json_encode($compositions),
			'sorts' => $sorts,
		));
	}

	public function callSearchRecipe( $post = array(), $page = 1 ){
		$strCuisine = NULL;
		$strFoodType = NULL;
		$keyword = isset($post['keyword']) ? $post['keyword'] : NULL;
		$strComposition = isset($post['CompositionID']) ? $post['CompositionID'] : NULL;
		$strFoodProcess = isset($post['FoodProcessID']) ? $post['FoodProcessID'] : NULL;
		$strPriceRange = isset($post['PriceRangeID']) ? $post['PriceRangeID'] : NULL;
		$strEstPeople = isset($post['EstPeopleID']) ? $post['EstPeopleID'] : NULL;
		$sortBy = isset($post['Sorting']) ? $post['Sorting'] : NULL;

		$this->form_validation->set_rules('keyword', 'keyword', 'trim');
		$this->form_validation->run();

		if( isset($post['CompositionID']) ) {
			$strComposition = implode($post['CompositionID'], ',');
		}
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

		$this->saveSearchLog($strCuisine, $strFoodType, $keyword, $strComposition, $strFoodProcess, $strPriceRange, $strEstPeople);

		$resSearchRecipe = $this->db->query('CALL GetRecipeSearchResult(?,?,?,?,?,?,?,?,?,?,?)', array(
			$strCuisine, 
			$strFoodType,
			$keyword,
			$strComposition,
			$strFoodProcess,
			$strPriceRange,
			$strEstPeople,
			$this->session->userdata('userid'),
			$sortBy,
			10,
			($page-1) * 10,
		));
		$data = $resSearchRecipe->result_array();
		$resSearchRecipe->next_result();

		$resRowData = $this->db->query('CALL GetRowDataSearchResult(?,?,?,?,?,?,?,?)', array(
			$strCuisine, 
			$strFoodType,
			$keyword,
			$strComposition,
			$strFoodProcess,
			$strPriceRange,
			$strEstPeople,
			$this->session->userdata('userid'),
		));
		$valuesRowData = $resRowData->result_array();
		$resRowData->next_result();

		$totalRowData = 0;
		if( isset($valuesRowData[0]['RowData']) ) {
			$totalRowData = $valuesRowData[0]['RowData'];
		}

		$this->load->vars(array(
			'values' => $data,
			'totalRowData' => $totalRowData,
			'currentPage' => $page,
		));
	}

	function getBrowser() {
		$u_agent = $_SERVER['HTTP_USER_AGENT'];
		$bname = 'Unknown';
		$os = 'Unknown';
		$version= "";

		// get operating system
		if (preg_match('/linux/i', $u_agent)) {
			$os = 'linux';
		}
		else if (preg_match('/macintosh|mac os x/i', $u_agent)) {
			$os = 'mac';
		}
		else if (preg_match('/windows|win32/i', $u_agent)) {
			$os = 'windows';
		}

		// Next get the name of the useragent yes separately and for good reason.
		if (preg_match('/MSIE/i',$u_agent) && !preg_match('/Opera/i',$u_agent))
		{
			$bname = 'Internet Explorer';
			$ub = "MSIE";
		}
		else if (preg_match('/Firefox/i',$u_agent))
		{
			$bname = 'Mozilla Firefox';
			$ub = "Firefox";
		}
		else if (preg_match('/Chrome/i',$u_agent))
		{
			$bname = 'Google Chrome';
			$ub = "Chrome";
		}
		else if (preg_match('/Safari/i',$u_agent))
		{
			$bname = 'Apple Safari';
			$ub = "Safari";
		}
		else if (preg_match('/Opera/i',$u_agent))
		{
			$bname = 'Opera';
			$ub = "Opera";
		}
		else if (preg_match('/Netscape/i',$u_agent))
		{
			$bname = 'Netscape';
			$ub = "Netscape";
		}
		else
		{
			$bname = 'Mozilla Firefox';
			$ub = "Firefox";
		}

		$known = array('Version', $ub, 'other');
		$pattern = '#(?<browser>' . join('|', $known) .')[/ ]+(?<version>[0-9.|a-zA-Z.]*)#';
		if (!preg_match_all($pattern, $u_agent, $matches)) {
			// we have no matching number just continue
		}

		// See how many we have.
		$i = count($matches['browser']);
		if ($i != 1) {
			if (strripos($u_agent,"Version") < strripos($u_agent,$ub) && !empty($matches['version'][0])){
				$version = $matches['version'][0];
			}
			else if(!empty($matches['version'][1])) {
				$version = $matches['version'][1];
			}
		}
		else {
			$version = $matches['version'][0];
		}

		if ( $version == null || $version == "" ) {
			$version = "?";
		}

		return array(
			'userAgent' => $u_agent,
			'browser'	  => $bname,
			'version'   => $version,
			'os'  => $os,
		);
	}

	public function isMobile() {
	    return preg_match("/(android|avantgo|blackberry|bolt|boost|cricket|docomo|fone|hiptop|mini|mobi|palm|phone|pie|tablet|up\.browser|up\.link|webos|wos)/i", $_SERVER["HTTP_USER_AGENT"]);
	}

	function getRealUserIp(){
	    switch(true){
	      case (!empty($_SERVER['HTTP_X_REAL_IP'])) : return $_SERVER['HTTP_X_REAL_IP'];
	      case (!empty($_SERVER['HTTP_CLIENT_IP'])) : return $_SERVER['HTTP_CLIENT_IP'];
	      case (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) : return $_SERVER['HTTP_X_FORWARDED_FOR'];
	      default : return $_SERVER['REMOTE_ADDR'];
	    }
	}

	function _sendEmail( $params = array() ) {
    	if( !empty($params) ) {
   //  		$config = array(
			// 	'protocol' => 'smtp',
			// 	'smtp_host' => 'ssl://smtp.gmail.com',
			// 	'smtp_port' => 465,
			// 	'smtp_user' => 'cookindo.official@gmail.com',
			// 	'smtp_pass' => 'cookindo123',
			// 	'mailtype' => 'html',
			// 	'charset' => 'utf-8',
			// 	'wordwrap' => TRUE
			// );

    		$view 		= isset($params['email_view']) ? $params['email_view'] : false;
    		$data 		= isset($params['data']) ? $params['data'] : false;
    		$to 		= isset($params['to']) ? $params['to'] : false;
    		$to_name 	= isset($params['to_name']) ? $params['to_name'] : false;
    		$subject 	= isset($params['subject']) ? $params['subject'] : false;

    		if( !empty($view) && !empty($data) && !empty($to) && !empty($subject) ) {
    			$mail_view = $this->load->view('Emails/'.$view, $data, true);
    			$mail_body = $this->load->view('Layouts/Emails/default', array(
					'content_view' => $mail_view,
					'subject' => $subject,
					'to_name' => $to_name,
				), true);

				// echo $mail_body; die;
				
				// To send HTML mail, the Content-type header must be set
				$headers  = 'MIME-Version: 1.0' . "\r\n";
				$headers .= 'Content-type: text/html; charset=utf-8' . "\r\n";
				
				// Additional headers
				$headers .= 'To: '.$to_name.' <'.$to.'>' . "\r\n";
				$headers .= 'From: admin@cookindo.com' . "\r\n";
				// $headers .= 'Cc: birthdayarchive@example.com' . "\r\n";
				// $headers .= 'Bcc: birthdaycheck@example.com' . "\r\n";
				
				// Mail it
				mail($to, $subject, $mail_body, $headers);

				// echo $mail_body;
				
				/*
				$this->load->library('email', $config);
				$this->email->from('admin@cookindo.com');
				$this->email->to($to);
				$this->email->subject($subject);
				$this->email->message($mail_view);
				
				
				$ci = get_instance();
				$ci->load->library('email');
				$ci->email->initialize($config);
				$ci->email->from('admin@cookindo.com');
				$ci->email->to($to);
				$ci->email->subject($subject);
				$ci->email->message($mail_view);
				// $ci->email->send();
				
				if( $this->email->send() ) {
					// echo 'Email sent.';
				} else {
					// show_error($this->email->print_debugger());
				}
				*/
    		}
    	}
    }
}

/* End of file AB_Controller.php */