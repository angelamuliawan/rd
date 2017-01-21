<?php
		$value = isset($values[0]) ? $values[0] : false;
		$id = $value['ArticleID'];
		$image = $value['ArticleImage'];
		$title = $value['ArticleTitle'];
		$slug = $value['Slug'];
		$content = $value['ArticleContent'];
		$date = $value['ArticleDate'];

		$url = $domain.'/artikel/'.$id.'/'.$slug;

		$path_image = '/resources/images/uploads/article/primary/'.$image;
		$custom_image = $domain.$path_image;
		if( !file_exists( $webroot.$path_image ) ) {
			$custom_image = $domain.'/resources/images/default.png';
		}
?>

<div class="container bg-white">
	<div class="big-wrapper">
		<div class="row">
			<div class="col-sm-12">
				<div id="article-detail" class="bg-white">
					<div class="wrapper-background-article">
						<?php
								echo tag('div', false, array(
									'class' => 'bg-holder',
									'data-src' => $custom_image,
									'data-is-progressive' => true,
								));
								echo tag('h1', $title, array(
									'wrapTag' => 'div',
									'wrapAttributes' => array(
										'class' => 'article-title'
									),
								));
						?>
						<!-- <div class="right-side">
							<?php
									echo $comment;
									echo tag('span', $total_comment);
							?>
						</div> -->
					</div>
					<div class="content with-border pd15">
						<?php
								loadSubview('common/sdk');
								loadSubview('common/adsense');

								echo tag('div', $content, array(
									'class' => 'mt10',
								));
						?>
						<div class="wrapper-social">
							<div class="wrapper-facebook with-border">
								<a href="https://www.facebook.com/sharer/sharer.php?u=<?php echo urlencode($url); ?>&t=<?php echo $slug; ?>"
								   onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;"
								   target="_blank" title="<?php echo lang('share_to_facebook'); ?>">
									<div class="wrapper-inner">
										<?php
												echo tag('span', lang('share_to_facebook'));
										?>
									</div>
								</a>
							</div>
						</div>
						<div class="fb-comments" data-href="<?php echo('http://'.$_SERVER['HTTP_HOST'].$_SERVER['PATH_INFO']); ?>" data-numposts="10" data-width="100%"></div>
					</div>
				</div>
				<div class="wrapper-item-article bg-white pd10">
					<div class="header">
						<?php
								echo tag('h3', lang('latest_article'));
						?>
					</div>
					<div id="newest-article-container">
						<div class="tacenter">
							<img src="<?php echo $domain; ?>/resources/images/reload.gif" data-disable-progressive="1" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>