<?php
		$recipe_id = isset($recipe_id)?$recipe_id:false;
		$slug = isset($slug)?$slug:false;
		$image = isset($image)?$image:false;
		$title = isset($title)?$title:false;
		$cnt_comment = isset($cnt_comment)?$cnt_comment:false;
		$cnt_recook = isset($cnt_recook)?$cnt_recook:false;
		$cnt_view = isset($cnt_view)?$cnt_view:false;

		$iconComment = tag('img', false, array(
			'src' => $domain.'/resources/icons/comment_w.png',
		));
		$iconRecook = tag('img', false, array(
			'src' => $domain.'/resources/icons/retweet_w.png',
		));
		$iconView = tag('img', false, array(
			'src' => $domain.'/resources/icons/view_w.png',
		));

		$totalComment = tag('span', $cnt_comment);
		$totalRecook = tag('span', $cnt_recook);
		$totalView = tag('span', $cnt_view);

		$path_image = '/resources/images/uploads/recipe/primary/'.$image;
		$custom_image = $domain.$path_image;
		if( !file_exists( $webroot.$path_image ) ) {
			$custom_image = $domain.'/resources/images/default.png';
		}

		$url = $domain.'/resep-masak/'.$recipe_id.'/'.$slug;
?>
<li class="no-ul-type with-border">
	<a href="<?php echo $url; ?>">
		<?php
				echo tag('img', false, array(
					'src' => $custom_image,
					'wrapTag' => 'div',
					'wrapAttributes' => array(
						'class' => 'box-header',
					),
				));
				// echo tag('div', false, array(
				// 	'style' => 'background-image:url('.$custom_image.'); width:100%; height:170px; background-size: cover; background-position: center;',
				// 	'wrapTag' => 'div',
				// 	'wrapAttributes' => array(
				// 		'class' => 'box-header',
				// 	),					
				// ));
				echo tag('h4', $title, array(
					'wrapTag' => 'div',
					'wrapAttributes' => array(
						'class' => 'box-content',
					),
				));
		?>
		<div class="box-footer bg-orange">
			<?php
					echo tag('div', $iconComment.$totalComment, array(
						'class' => 'pull-right mr5',
						'title' => 'Jumlah Komentar',
					));
					echo tag('div', $iconRecook.$totalRecook, array(
						'class' => 'pull-right mr10',
						'title' => 'Jumlah Recook',
					));
					// echo tag('div', $iconView.$totalView, array(
					// 	'class' => 'pull-right mr10',
					// 	'title' => 'Jumlah View',
					// ));
			?>
		</div>
	</a>
	<!-- <a href="<?php echo $url; ?>">
	    <div class="box-header">
			<?php
					echo tag('span', $title, array(
						'class' => 'wrapper-inner'
					));
					echo tag('img', false, array(
						'src' => $custom_image,
					));
			?>
			<div class="box-footer">
				<?php
						echo tag('div', $iconComment.$totalComment, array(
							'class' => 'pull-right mr5',
							'title' => 'Jumlah Komentar',
						));
						echo tag('div', $iconRecook.$totalRecook, array(
							'class' => 'pull-right mr10',
							'title' => 'Jumlah Recook',
						));
				?>
			</div>
		</div>
	</a> -->
</li>