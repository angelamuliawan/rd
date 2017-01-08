<?php
		// loadSubview('header/search_box');

		if( !empty($values) ) {
			$first = $values[0];
			unset($values[0]);
			$values = array_values($values);
		}
?>

<div class="container bg-white">
	<div class="big-wrapper">
		<div class="row">
			<div class="col-sm-9">
				<div id="article-list" class="wrapper-food-list-vertical bg-white">
					<!-- <div class="header with-border"> -->
						<?php
								// echo tag('h3', 'Artikel', array(
								// 	'class' => 'pull-left mt5 wrapper-text'
								// ));
						?>
					<!-- </div> -->

					<?php
							if( isset($first) ) {
								$id = $first['ArticleID'];
								$image = $first['ArticleImage'];
								$title = $first['ArticleTitle'];
								$slug = $first['Slug'];

								// $comment = tag('img', false, array(
								// 	'src' => $domain.'/resources/icons/comment_w.png',
								// ));
								// $total_comment = count($valuesArticleComment);

								$url = $domain.'/artikel/'.$id.'/'.$slug;

								$path_image = '/resources/images/uploads/article/primary/'.$image;
								$custom_image = $domain.$path_image;
								if( !file_exists( $webroot.$path_image ) ) {
									$custom_image = $domain.'/resources/images/default.png';
								}
					?>	
								<div id="article-detail">
									<div class="wrapper-background-article">
										<?php
												echo tag('div', false, array(
													'class' => 'bg-holder',
													'data-src' => $custom_image,
													'data-is-progressive' => true,
												));
										?>
										<div class="article-title">
											<?php
													echo tag('h1', $title, array(
														'wrapTag' => 'a',
														'wrapAttributes' => array(
															'href' => $url,
															'title' => $title,
														),
													));
											?>
										</div>
										<!-- <div class="right-side">
											<img src="http://localhost/cookindo/resources/icons/comment_w.png">
											<span>1</span>						
										</div> -->
									</div>
								</div>
					<?php
							}
					?>

					<div class="content with-border">
						<ul>
							<?php
									if( !empty($values) ) {
										foreach( $values as $key => $value ) {
											$id = $value['ArticleID'];
											$image = $value['ArticleImage'];
											$title = $value['ArticleTitle'];
											$slug = $value['Slug'];
											$content = $value['ArticleContent'];
											$date = timeAgoFormat($value['ArticleDate']);

											loadSubview('pages/item_article', array(
												'article_id' => $id,
												'image' => $image,
												'title' => $title,
												'slug' => $slug,
												'content' => $content,
												'date' => $date,
											));
										}
									} else {
										echo tag('h4', 'Artikel tidak tersedia', array(
											'wrapTag' => 'li',
											'wrapAttributes' => array(
												'class' => 'no-border'
											)
										));
									}
							?>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<?php
						loadSubview('common/sdk');
				?>
			</div>
		</div>
	</div>
</div>