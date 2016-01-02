<?php
		$article_id = isset($article_id)?$article_id:false;
		$image = isset($image)?$image:false;
		$title = isset($title)?$title:false;
		$slug = isset($slug)?$slug:false;

		$content = isset($content)? strip_tags($content) :false;
		$date = isset($date)?$date:false;

		$custom_image = $domain.'/resources/images/uploads/article/primary/'.$image;
		if( !@getimagesize($custom_image) ) {
			$custom_image = $domain.'/resources/images/default.png';
		}

		$url = $domain.'/artikel/'.$article_id.'/'.$slug;
?>
<li class="no-ul-type wrapper-ajax-link">
	<div class="row">
		<div class="col-sm-4 left-side">
			<a href="<?php echo $url; ?>">
				<?php
						echo tag('img', false, array(
							'src' => $custom_image,
							'wrapTag' => 'div',
							'wrapAttributes' => array(
								'class' => 'box-header',
							),
						));

						if( isLoggedIn() && $this->session->userdata('userrole') == 1 ) {
							echo tag('a', 'Edit', array(
								'href' => $domain.'/users/edit_article/'.$article_id,
								'class' => 'pd5',
							));
							echo tag('a', 'Delete', array(							
								'href' => $domain.'/users/delete_article/'.$article_id,
								'class' => 'ajax-link pd5',
								'with-confirm' => "Yakin ingin menghapus?",
							));
						}
				?>
			</a>
		</div>
		<div class="col-sm-8 right-side">
			<div class="box-description">
				<?php
						echo tag('h2', $title, array(
							'class' => 'header-text',
							'wrapTag' => 'a',
							'wrapAttributes' => array(
								'href' => $url,
							),
						));
						echo tag('p', $content, array(
							'class' => 'mt10 description'
						));

						echo tag('a', 'Selengkapnya', array(
							'href' => $url,
							'class' => 'btn btn-orange mt5',
							'wrapTag' => 'div',
							'wrapAttributes' => array(
								'class' => 'taright mb5'
							)
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