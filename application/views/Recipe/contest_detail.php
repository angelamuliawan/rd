<?php
		$value = isset($values[0]) ? $values[0] : false;
		$contest_id = $value['ContestID'];
		$image = $value['ContestBanner'];
		$title = $value['ContestName'];
		$short_desc = $value['ContestShortDesc'];
		$content = $value['ContestDesc'];
		$start_date = $value['ContestStartDate'];
		$end_date = $value['ContestEndDate'];
		$is_active = $value['isActive'];
		$slug = $value['Slug'];

		$url = $domain.'/kontes-masak/'.$contest_id.'/'.$slug;

		$path_image = '/resources/images/uploads/banner/horizontal/'.$image;
		$custom_image = $domain.$path_image;
		if( !file_exists( $webroot.$path_image ) ) {
			$custom_image = $domain.'/resources/images/default.png';
		}
?>

<div class="container">
	<div class="big-wrapper">
		<div class="row">
			<div class="col-sm-12">
				<div id="article-detail" class="bg-white wrapper-contest">
					<div class="wrapper-background-article">
						<?php
								echo tag('div', false, array(
									'class' => 'bg-holder',
									'style' => 'background-image:url("'.$custom_image.'");'
								));
						?>
					</div>
					<div class="content with-border pd15">
						<div class="contest-title">
							<?php
									echo tag('h2', $title, array(
										'class' => 'fbold'
									));

									if( !empty($is_active) ) {
										if( isLoggedIn() ) {
											echo tag('a', 'Tulis Resep', array(
												'title' => 'Tulis Resep',
												'href' => $domain.'/recipe/add/'.$contest_id,
												'class' => 'btn btn-orange mt10'
											));
										} else {
											echo tag('a', 'Tulis Resep', array(
												'title' => 'Tulis Resep',
												'href' => $domain.'/users/login?redirect_after=recipe/add/'.$contest_id,
												'class' => 'btn btn-orange mt10 ajax-modal'
											));
										}
									} else {
										echo tag('a', 'Kontes Telah Berakhir', array(
											'title' => 'Kontes Telah Berakhir',
											'href' => '#',
											'class' => 'btn btn-orange mt20 disabled'
										));
									}
							?>
						</div>
						<?php
								echo tag('div', $content, array(
									'class' => 'mt10',
								));

								if( !empty($is_active) ) {
									if( isLoggedIn() ) {
										echo tag('a', 'Tulis Resep', array(
											'title' => 'Tulis Resep',
											'href' => $domain.'/recipe/add/'.$contest_id,
											'class' => 'btn btn-orange mb5 fbold full-width mb5'
										));
									} else {
										echo tag('a', 'Tulis Resep', array(
											'title' => 'Tulis Resep',
											'href' => $domain.'/users/login?redirect_after=recipe/add/'.$contest_id,
											'class' => 'btn btn-orange fbold full-width mb5 ajax-modal'
										));
									}
								}
						?>
						<div class="wrapper-social">
							<div class="wrapper-facebook with-border">
								<a href="https://www.facebook.com/sharer/sharer.php?u=<?php echo urlencode($url); ?>&t=<?php echo $slug; ?>"
								   onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;"
								   target="_blank" title="Share on Facebook">
									<div class="wrapper-inner">
										<span class="fbold">Bagikan ke facebook</span>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>