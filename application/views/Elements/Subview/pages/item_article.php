<?php
		$article_id = isset($article_id)?$article_id:false;
		$image = isset($image)?$image:false;
		$title = isset($title)?$title:false;
		$slug = isset($slug)?$slug:false;

		$content = isset($content)? strip_tags($content) :false;
		$date = isset($date)?$date:false;

		$path_image = '/resources/images/uploads/article/primary/thumbs/'.$image;
		$custom_image = $domain.$path_image;
		if( !file_exists( $webroot.$path_image ) ) {
			$custom_image = $domain.'/resources/images/default.png';
		}

		$url = $domain.'/artikel/'.$article_id.'/'.$slug;
?>
<li class="no-ul-type wrapper-ajax-link item-article">
	<div class="row">
		<div class="col-md-4 left-side">
			<a href="<?php echo $url; ?>">
				<?php
						echo tag('div', false, array(
							'class' => 'bg-holder',
							'data-src' => $custom_image,
							'data-is-progressive' => true,
						));

						if( isLoggedIn() && $this->session->userdata('userrole') == 1 ) {
							echo tag('a', lang('edit'), array(
								'href' => $domain.'/users/edit_article/'.$article_id,
								'class' => 'pd5',
							));
							echo tag('a', lang('delete'), array(							
								'href' => $domain.'/users/delete_article/'.$article_id,
								'class' => 'ajax-link pd5',
								'with-confirm' => "Yakin ingin menghapus?",
							));
						}
				?>
			</a>
		</div>
		<div class="col-md-8 right-side">
			<div class="box-description">
				<?php
						echo tag('h2', $title, array(
							'class' => 'header-text',
							'style' => 'line-height: 3.3rem',
							'wrapTag' => 'a',
							'wrapAttributes' => array(
								'title' => $title,
								'href' => $url,
								'style' => 'width: 100%;',
							),
						));
						
						echo tag('p', $content, array(
							'class' => 'mt10 description',
							'style' => 'line-height: 2rem;',
						));

						echo tag('p', $date, array(
							'class' => 'pull-right mt10',
							'style' => 'opacity:0.8;',
						));
				?>
			</div>
		</div>
	</div>
</li>