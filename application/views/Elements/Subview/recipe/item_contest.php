<?php
		$counter = isset($counter)?$counter:0;
		$contest_id = isset($contest_id)?$contest_id:false;
		$slug = isset($slug)?$slug:false;
		$image = isset($image)?$image:false;
		$title = isset($title)?$title:false;
		$short_desc = isset($short_desc)?$short_desc:false;
		$start_date = isset($start_date)?$start_date:false;
		$end_date = isset($end_date)?$end_date:false;
		$is_active = isset($is_active)?$is_active:false;
		$cnt_recipe = isset($cnt_recipe)?$cnt_recipe:false;

		$iconCalendar = tag('img', false, array(
			'style' => 'width:15px;',
			'src' => $domain.'/resources/icons/calendar.png',
		));

		$path_image = '/resources/images/uploads/banner/horizontal/'.$image;
		$custom_image = $domain.$path_image;
		if( !file_exists( $webroot.$path_image ) ) {
			$custom_image = $domain.'/resources/images/default.png';
		}

		$url = $domain.'/kontes-masak/'.$contest_id.'/'.$slug;
?>
<li class="no-ul-type">
	<div class="row">
		<div class="col-sm-4 left-side">
			<a href="<?php echo $url; ?>" title="<?php echo $title; ?>">
				<?php
						echo tag('div', false, array(
							'style' => 'background-image:url("'.$custom_image.'"); width:100%; height:170px; background-size: cover; background-position: left top;',
							'wrapTag' => 'div',
							'wrapAttributes' => array(
								'class' => 'box-header',
							),					
						));
				?>
			</a>
			<div class="box-footer">
				<?php
						// echo tag('div', $iconComment.$totalComment, array(
						// 	'class' => 'pull-right mr5',
						// 	'title' => 'Jumlah Komentar',
						// ));
						// echo tag('div', $iconRecook.$totalRecook, array(
						// 	'class' => 'pull-right mr10',
						// 	'title' => 'Jumlah Recook',
						// ));
						// echo tag('div', $iconView.$totalView, array(
						// 	'class' => 'pull-right mr10',
						// 	'title' => 'Jumlah View',
						// ));

						// echo tag('div', '08 : 43 : 12', array(
							// 'class' => 'pull-right mr5 fbold',
							// 'title' => 'Jumlah Komentar',
						// ));

						echo tag('p', (( $is_active == 1 ) ? 'Kontes Sedang Berlangsung' : 'Kontes Telah Berakhir'), array(
							'class' => 'pull-right mr5 fbold',
						));
				?>
			</div>
		</div>
		<div class="col-sm-8 right-side">
			<div class="box-description">
				<?php
						echo tag('h4', $title, array(
							'wrapTag' => 'a',
							'wrapAttributes' => array(
								'href' => $url,
								'title' => $title,
								'class' => 'mb5 text-orange',
							),
						));
						echo $iconCalendar.tag('p', sprintf('%s - %s', $start_date, $end_date), array(
							'class' => 'fbold ml5 dpinline'
						));
						echo '<br>';
						echo tag('p', $short_desc, array(
							'class' => 'mt5 description'
						));
						// echo tag('a', 'Selengkapnya', array(
						// 	'href' => $url,
						// 	'class' => 'btn btn-orange mt5',
						// 	'wrapTag' => 'div',
						// 	'wrapAttributes' => array(
						// 		'class' => 'taright mb5'
						// 	)
						// ));
						// loadSubview('common/action_bottom_contest');
				?>
				<div class="pull-left mr10 mt5">
					<span>
						<?php
								echo tag('a', sprintf('%s Resep', $cnt_recipe), array(
									'title' => sprintf('%s Resep', $cnt_recipe),
									'href' => $domain.'/resep-kontes/'.$contest_id.'/'.$slug,
									'class' => 'fbold mt5',
								));
								echo tag('span', ' - ');
						?>
					</span>
				</div>
				<div class="pull-left mr10 mt5">
					<span>
						<?php
								echo tag('a', 'Lihat Detail', array(
									'title' => 'Lihat Detail',
									'href' => $domain.'/kontes-masak/'.$contest_id.'/'.$slug,
									'class' => 'fbold mt5',
								));

								if( !empty($is_active) ) {
									echo tag('span', ' - ');
								}
						?>
					</span>
				</div>
				<div class="pull-left mr10 mt5">
					<span>
						<?php
								if( !empty($is_active) ) {
									if( isLoggedIn() ) {
										echo tag('a', 'Tulis Resep', array(
											'title' => 'Tulis Resep',
											'href' => $domain.'/recipe/add/'.$contest_id,
											'class' => 'btn btn-orange',
										));
									} else {
										echo tag('a', 'Tulis Resep', array(
											'title' => 'Tulis Resep',
											'href' => $domain.'/users/login?redirect_after=recipe/add/'.$contest_id,
											'class' => 'btn btn-orange ajax-modal',
										));
									}
								} else {
									echo tag('a', 'Lihat Pemenang', array(
										'title' => 'Lihat Pemenang',
										'href' => $domain.'/recipe/contest_winner/'.$contest_id,
										'class' => 'btn btn-orange ajax-modal',
									));
								}
						?>
					</span>
				</div>
			</div>
		</div>
	</div>
</li>