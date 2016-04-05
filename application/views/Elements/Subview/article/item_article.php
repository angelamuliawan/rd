<div class="wrapper-item-article bg-white pd15">
<?php
		echo tag('h3', 'Artikel Terbaru');

		if( !empty($valuesNewestArticle) ) {
?>
			<ul>
				<?php
						foreach( $valuesNewestArticle as $value ) {
							$id = $value['ArticleID'];
							$image = $value['ArticleImage'];
							$title = $value['ArticleTitle'];
							$slug = $value['Slug'];

							$path_image = '/resources/images/uploads/article/primary/thumbs/'.$image;
							$custom_image = $domain.$path_image;
							if( !file_exists( $webroot.$path_image ) ) {
								$custom_image = $domain.'/resources/images/default.png';
							}

							$url = $domain.'/artikel/'.$id.'/'.$slug;
				?>
							<li class="no-ul-type">
								<a href="<?php echo $url; ?>" title="<?php echo $title; ?>">
								<?php
										echo tag('div', false, array(
											'class' => 'bg-holder',
											'style' => 'background-image:url('.$custom_image.');',
										));
										echo tag('p', $title, array(
											'class' => 'article-title',
										));
								?>
								</a>
							</li>
				<?php
						}
				?>
			</ul>
<?php
		} else {
			echo tag('p', 'Artikel tidak tersedia', array(
				'class' => 'article-title',
			));
		}
?>
</div>