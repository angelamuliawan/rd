<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class LangSwitch extends AB_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->helper('url');
    }

    function switch_language( $language = "" ) {
        $language = ($language != "") ? $language : "indonesian";
        set_cookie(array(
        	'name' => 'site_lang',
        	'value' => $language,
        	'expire' => time() + (10 * 365 * 24 * 60 * 60),
        ));

        redirect($_SERVER['HTTP_REFERER']);
    }
}