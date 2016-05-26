<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Pages extends AB_Controller {

	public function index() {
		$this->load->helper('form');
		$this->load->helper('build_data');
		$this->callDefaultData('search');

		$resTopCuisine = $this->db->query('CALL GetTopCuisine()');
		$top_cuisine = $resTopCuisine->result_array();
		$resTopCuisine->next_result();

		$resNewRecipe = $this->db->query('CALL GetNewlyCreatedRecipe(?)', array(
			$this->session->userdata('userid'),
		));
		$new_recipe = $resNewRecipe->result_array();
		$resNewRecipe->next_result();

		$resPopularRecipe = $this->db->query('CALL GetPopularRecipe(?)', array(
			$this->session->userdata('userid'),
		));
		$popular_recipe = $resPopularRecipe->result_array();
		$resPopularRecipe->next_result();

		// related recipe by recipe
		$resPopularUser = $this->db->query('CALL GetPopularUser()');
		$valuesPopularUser = $resPopularUser->result_array();
		$resPopularUser->next_result();

		// Newest Article
		$resNewestArticle = $this->db->query('CALL GetNewestArticle(?)', array(
			NULL
		));
		$valuesNewestArticle = $resNewestArticle->result_array();
		$resNewestArticle->next_result();

		$this->load->vars(array(
			'valuesTopCuisine' => $top_cuisine,
			'valuesNewRecipe' => $new_recipe,
			'valuesPopularRecipe' => $popular_recipe,
			'valuesPopularUser' => $valuesPopularUser,
			'valuesNewestArticle' => $valuesNewestArticle,
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
			'site_title' => 'Artikel',
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

		// Article Comment
		$resArticleComment = $this->db->query('CALL GetArticleComment(?)', array(
			$article_id
		));
		$valuesArticleComment = $resArticleComment->result_array();
		$resArticleComment->next_result();
		
		$slug = $this->uri->segment(3);

		if( !strpos($slug, '-') && ($slug == '' || str_word_count($slug) > 1 ) ) {
			$this->load->helper('url');
			$slug = isset( $values[0]['Slug'] ) ? $values[0]['Slug'] : 'resep-masak';
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
			'valuesArticleComment' => $valuesArticleComment,
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
				'title' => $values[0]['ArticleTitle'],
				'url' => $this->domain.'/artikel/'.$article_id.'/'.utf8_decode($values[0]['Slug']),
				'image' => $this->domain.'/resources/images/uploads/article/primary/'.$values[0]['ArticleImage'],
				'desc' => substr(strip_tags($values[0]['ArticleContent']), 0, 250),
			),
		));
		$this->render();
	}

	public function article_comment( $article_id = false ) {
		
		$post = $this->input->post();
		if( !empty($post) ) {
			
			$this->form_validation->set_rules('comment', 'Comment', 'required');
			if ( $this->form_validation->run() == TRUE ) {
				$res = $this->db->query('CALL InsertArticleComment(?,?,?)', array(
					$post['comment'],
					$this->session->userdata('userid'),
					$article_id,
				));
				$res->next_result();

				$post['comment'] = false;
			}
		}

		// Recipe Comment
		$resArticleComment = $this->db->query('CALL GetArticleComment(?)', array(
			$article_id
		));
		$valuesArticleComment = $resArticleComment->result_array();
		$resArticleComment->next_result();

		$this->load->vars(array(
			'valuesArticleComment' => $valuesArticleComment,
			'article_id' => $article_id,
		));
		loadSubview('article/comment');
	}

	public function delete_article_comment( $comment_id = false ) {
		$res = $this->db->query('CALL DeleteArticleComment(?,?)', array(
			$comment_id,
			$this->session->userdata('userid'),
		));
	}

	public function about_us() {
		$this->load->vars(array(
			'site_title' => 'Tentang Kami',
		));
		$this->render();
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

				$message = 'Sukses menyimpan data';
				$status = 'success';
			} else {
				$message = 'Gagal menyimpan data. Silahkan coba lagi';
				$status = 'error';
			}
		}
		
		$this->load->vars(array(
			'site_title' => 'Kontak Kami',
		));

		loadMessage($message, $status);
		$this->render($post);
	}

	public function terms_of_use() {
		$this->load->vars(array(
			'site_title' => 'Tata Cara Penggunaan',
		));
		$this->render();
	}

	public function privacy_policy() {
		$this->load->vars(array(
			'site_title' => 'Kebijakan Pribadi',
		));
		$this->render();
	}
}