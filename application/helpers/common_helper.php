<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if ( ! function_exists('loadSubview')) {

    function loadSubview( $view, $data = false ) { 
	    $CI = get_instance();
	    return $CI->load->view( 'Elements/Subview/'.$view, $data );
	}
}

if ( ! function_exists('loadModal')) {

    function loadModal( $view, $data = false ) { 
	    $CI = get_instance();
	    return $CI->load->view( 'Elements/Modal/'.$view, $data );
	}
}

if ( ! function_exists('tag')) {

	function tag( $tag, $text, $attributes = array() ) {
		$stringify_attributes = '';
		$wrapTag = false;
		$stringify_wrapper_attributes = '';

		if( !empty($attributes) ) {
			foreach ($attributes as $attribute => $value) {
				if( $attribute == 'wrapTag' ) {
					$wrapTag = $value;
				} else if( $attribute == 'wrapAttributes' ) {
					foreach ($value as $wrapperAttribute => $wrapperValue) {
						$stringify_wrapper_attributes .= " $wrapperAttribute='$wrapperValue'";
					}
				} else {
					$stringify_attributes .= " $attribute='$value'";
		    	}
		    }
		}

		$tag = "<$tag" . $stringify_attributes . ">$text</$tag>";
		if( !empty($wrapTag) ) {
			$tag = "<$wrapTag" . $stringify_wrapper_attributes . ">$tag</$wrapTag>";
		}
	    return $tag;
	}
}

if ( ! function_exists('load_script')) {

	function load_script( $scripts = array(), $domain = 'http://localhost/rd/' ) {
		$stringify_script = '';
		if( !empty($scripts) ) {
			foreach ($scripts as $script) {
		        $stringify_script .= "<script type='text/javascript' src='".$domain.'resources/js/'.$script.".js'></script>";
		    }
		}
	    
	    echo $stringify_script;
	}
}

if ( ! function_exists('load_css')) {

	function load_css( $scripts = array(), $domain = 'http://localhost/rd/' ) {
		$stringify_script = '';
		if( !empty($scripts) ) {
			foreach ($scripts as $script) {
		        $stringify_script .= "<link href='".$domain.'resources/css/'.$script.".css' rel='stylesheet'>";
		    }
		}
	    
	    echo $stringify_script;
	}
}

if ( ! function_exists('debug')) {

	function debug( $param ){
		echo '<pre>';
		print_r($param);
		echo '</pre>';
	}
}

if ( ! function_exists('isLoggedIn')) {

	function isLoggedIn(){
		$CI = & get_instance();
		return ( $CI->session->userdata('loggedin') != NULL ) ? true : false;
	}
}

if ( ! function_exists('loadMessage')) {

	function loadMessage( $message = 'Field yang dibutuhkan tidak valid', $status = 'error' ) {
		$data = array(
			'message' => $message,
			'status' => $status,
		);
		$CI = get_instance();
	    return $CI->load->view( 'Elements/Message/message', $data, FALSE );
	}
}

if ( ! function_exists('divider')) {

	function divider( $tag = 'li' ) {
		return "<$tag class='divider'></$tag>";
	}
}