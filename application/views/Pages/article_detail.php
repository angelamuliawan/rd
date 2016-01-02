<?php
		$value = isset($values[0]) ? $values[0] : false;
		$id = $value['ArticleID'];
		$image = $value['ArticleImage'];
		$title = $value['ArticleTitle'];
		$slug = $value['Slug'];
		$content = $value['ArticleContent'];
		$date = $value['ArticleDate'];
?>

<div class="container mt20">
	<div class="big-wrapper">
		<div class="row">
			<div class="col-sm-10">
				<div id="article-detail" class="bg-white">
					<div class="header with-border pd15">
						<?php
								echo tag('h2', $title, array(
									'class' => 'wrapper-text',
									'style' => 'padding-bottom:5px;',
								));
								echo tag('span', 'Created on '.$date, array(
									// 'class' => 'mt20',
									'style' => 'opacity:0.8;',
								));
						?>
					</div>
					<div class="content with-border pd15">
						<?php
								echo $content;
						?>
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