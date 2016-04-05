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
						// echo tag('img', false, array(
						// 	'src' => $custom_image,
						// 	'wrapTag' => 'div',
						// 	'wrapAttributes' => array(
						// 		'class' => 'box-header',
						// 	),
						// ));

						echo tag('div', false, array(
							'class' => 'bg-holder',
							'style' => 'background-image:url('.$custom_image.');'
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
							),
						));
						echo tag('p', $content, array(
							'class' => 'mt10 description',
							'style' => 'line-height: 2rem;',
						));
				?>
				<!-- <div class="wrapper-button taright">
					<?php
							echo tag('a', 'Selengkapnya', array(
								'title' => 'Selengkapnya',
								'href' => $url,
								'class' => 'btn btn-orange mt5',
								'wrapTag' => 'div',
								'wrapAttributes' => array(
									'class' => 'mb5 mr10',
								)
							));
					?>
					<div class="mb5">
						<a class="btn btn-facebook mt5" href="https://www.facebook.com/sharer/sharer.php?u=<?php echo urlencode($url); ?>&t=<?php echo $slug; ?>"
						   onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;"
						   target="_blank" title="Share on Facebook">
						   Share
						</a>
					</div>
				</div> -->
				<?php
						echo tag('p', $date, array(
							'class' => 'pull-right mt10',
							'style' => 'opacity:0.8;',
						));
				?>
			</div>
		</div>
	</div>
</li>