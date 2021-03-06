<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Pages extends AB_Controller {

	public function index() {
		$this->load->helper('form');
		$this->load->helper('build_data');
		$this->callDefaultData('search');

		$resTopCuisine = $this->db->query('CALL GetTopCuisine()');
		$top_cuisine = $resTopCuisine->result_array();
		$resTopCuisine->next_result();

		// related recipe by recipe
		$resPopularUser = $this->db->query('CALL GetPopularUser()');
		$valuesPopularUser = $resPopularUser->result_array();
		$resPopularUser->next_result();

		$this->load->vars(array(
			'valuesTopCuisine' => $top_cuisine,
			'valuesPopularUser' => $valuesPopularUser,
			// 'additional_css' => array(
			// 	'react/transition',
			// ),
			// 'additional_js' => array(
			// 	'react/react-with-addons.min',
			// 	'react/react-dom.min',
			// 	'react/browser.min',
			// ),
			'additional_jsx' => array(
				'common',
				'components/recipeitem',
				'components/articleitem',
				'pages/index',
			),
		));

		$this->render();
	}

	public function article(){
		$this->load->helper('form');
		$this->load->helper('build_data');
		$this->callDefaultData('search');

		$resArticle = $this->db->query('CALL GetAllArticle()');
		$values = $resArticle->result_array();
		$resArticle->next_result();

		$this->load->vars(array(
			'site_title' => lang('article'),
			'values' => $values,
			'sdk' => array(
				'facebook' => array(
					'like_page' => true,
				)
			)
		));
		$this->render();
	}

	public function article_detail( $article_id = false ){
		$this->load->helper('form');

		$resArticleDetail = $this->db->query('CALL GetArticleDetail(?)', array(
			$article_id,
		));
		$values = $resArticleDetail->result_array();
		$resArticleDetail->next_result();
		
		$slug = $this->uri->segment(3);

		if( !strpos($slug, '-') && ($slug == '' || str_word_count($slug) > 1 ) ) {
			$this->load->helper('url');
			$slug = isset( $values[0]['Slug'] ) ? $values[0]['Slug'] : 'artikel';
			$url = $this->domain.'/artikel/'.$article_id.'/'.$slug;

			return redirect($url);
		}

		// Save article log
		$device = $this->getDevice();
		if( $device['ip'] != '114.121.134.202' && $device['ip'] != '202.62.16.200' ) {
			$resArticleLog = $this->db->query('CALL InsertArticleLog(?,?,?,?,?,?,?)', array(
				$article_id,
				$device['browser'],
				$device['version'],
				$device['ip'],
				$device['device'],
				$device['os'],
				$this->session->userdata('userid'),
			));
			$query_result = $resArticleLog->result();
			$resArticleLog->next_result();
		}

		$resNewestArticle = $this->db->query('CALL GetNewestArticle(?)', array(
			$article_id
		));
		$valuesNewestArticle = $resNewestArticle->result_array();
		$resNewestArticle->next_result();

		$this->load->vars(array(
			'site_title' => $values[0]['ArticleTitle'],
			'values' => $values,
			'valuesNewestArticle' => $valuesNewestArticle,
			'article_id' => $article_id,
			'sdk' => array(
				'facebook' => array(
					'like_share' => true,
				)
			),
			'additional_css' => array(
				'froala/font-awesome.min',
				'froala/froala_editor.min',
				'froala/froala_style.min',
				// 'react/transition',
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
				// 'react/react-with-addons.min',
				// 'react/react-dom.min',
				// 'react/browser.min',
			),
			'additional_jsx' => array(
				'common',
				'components/articleitem',
				'pages/articledetail',
			),
			'og_meta' => array(
				'title' => $values[0]['ArticleTitle'],
				'url' => $this->domain.'/artikel/'.$article_id.'/'.utf8_decode($values[0]['Slug']),
				'image' => $this->domain.'/resources/images/uploads/article/primary/'.$values[0]['ArticleImage'],
				'desc' => substr(strip_tags($values[0]['ArticleContent']), 0, 250),
			),
		));

		$this->render();
	}

	public function about_us() {
		$this->load->vars(array(
			'site_title' => lang('about_us'),
		));

		$this->render(false, 'Pages/' . $this->site_lang . '/about_us');
	}

	public function contact_us() {
		$this->load->helper('form');

		$post = $this->input->post();
		$message = false;
		$status = false;

		if( !empty($post) ) {

			$this->form_validation->set_rules('name', 'Name', 'required');
			$this->form_validation->set_rules('email', 'Email', 'required|valid_email');
			$this->form_validation->set_rules('message', 'Message', 'required');

			if ( $this->form_validation->run() == TRUE ) {

				$resInsertContactUs = $this->db->query('CALL InsertContactUs(?,?,?,?,?)', array(
					$post['name'],
					$post['email'],
					$post['message'],
					$this->session->userdata('userid'),
					$this->getRealUserIp(),
				));

				$query_result = $resInsertContactUs->result();				
				$resInsertContactUs->next_result();

				$message = lang('success_save_data');
				$status = 'success';
			} else {
				$message = lang('failed_save_data');
				$status = 'error';
			}
		}
		
		$this->load->vars(array(
			'site_title' => lang('contact_us'),
		));

		loadMessage($message, $status);
		$this->render($post, 'Pages/' . $this->site_lang . '/contact_us');
	}

	public function terms_of_use() {
		$this->load->vars(array(
			'site_title' => lang('terms_of_use'),
		));
		$this->render(false, 'Pages/' . $this->site_lang . '/terms_of_use');
	}

	public function privacy_policy() {
		$this->load->vars(array(
			'site_title' => lang('privacy_policy'),
		));
		$this->render(false, 'Pages/' . $this->site_lang . '/privacy_policy');
	}
}