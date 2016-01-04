<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Pages extends AB_Controller {

	public function index() {
		$this->load->helper('form');
		$this->load->helper('build_data');
		$this->callDefaultData('search');

		$resNewRecipe = $this->db->query('CALL GetNewlyCreatedRecipe(?)', array(
			$this->session->userdata('userid'),
		));
		$new_recipe = $resNewRecipe->result_array();
		$resNewRecipe->next_result();

		$resPopularRecipe = $this->db->query('CALL GetPopularRecipe(?)', array(
			$this->session->userdata('userid'),
		));
		$popular_recipe = $resPopularRecipe->result_array();

		$this->load->vars(array(
			'valuesNewRecipe' => $new_recipe,
			'valuesPopularRecipe' => $popular_recipe,
		));

		$this->render();
	}

	public function article(){
		$this->load->helper('form');
		$this->load->helper('build_data');
		$this->callDefaultData('search');

		$resArticle = $this->db->query('CALL GetArticle()');
		$values = $resArticle->result_array();
		$resArticle->next_result();

		$this->load->vars(array(
			'values' => $values,
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
			$slug = isset( $values[0]['Slug'] ) ? $values[0]['Slug'] : 'resep-masak';
			$url = $this->domain.'/artikel/'.$article_id.'/'.$slug;

			return redirect($url);
		}

		$this->load->vars(array(
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
		));
		$this->render();
	}

	public function about_us() {
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
					$this->getIP(),
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
		
		loadMessage($message, $status);
		$this->render($post);
	}

	public function terms_of_use() {
		$this->render();
	}

	public function privacy_policy() {
		$this->render();
	}
}