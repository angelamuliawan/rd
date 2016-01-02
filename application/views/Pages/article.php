<?php
		loadSubview('header/search_box');
?>

<div class="container mt20">
	<div class="big-wrapper">
		<div class="row">
			<div class="col-sm-10">
				<div id="article-list" class="wrapper-food-list-vertical bg-white">
					<div class="header with-border">
						<?php
								echo tag('h3', 'Artikel', array(
									'class' => 'pull-left mt5 wrapper-text'
								));
						?>
					</div>
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
											$date = $value['ArticleDate'];

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
			<div class="col-sm-2">
				<div class="wrapper-ads">
					<ul class="no-pd">
						<?php
								echo tag('img', false, array(
									'src' => $domain.'/resources/images/160x120.jpg',
									'wrapTag' => 'li',
									'wrapAttributes' => array(
										'class' => 'no-ul-type mb20',
									),
								));
								echo tag('img', false, array(
									'src' => $domain.'/resources/images/sample-ads.jpg',
									'wrapTag' => 'li',
									'wrapAttributes' => array(
										'class' => 'no-ul-type mb20',
									),
								));
								echo tag('img', false, array(
									'src' => $domain.'/resources/images/sample-ads.jpg',
									'wrapTag' => 'li',
									'wrapAttributes' => array(
										'class' => 'no-ul-type mb20',
									),
								));
						?>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>