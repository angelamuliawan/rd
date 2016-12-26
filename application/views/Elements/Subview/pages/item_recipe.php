<?php
		$recipe_id = isset($recipe_id)?$recipe_id:false;
		$slug = isset($slug)?$slug:false;
		$image = isset($image)?$image:false;
		$title = isset($title)?$title:false;

		$cnt_love = isset($cnt_love)?$cnt_love:false;
		$cnt_comment = isset($cnt_comment)?$cnt_comment:false;
		$cnt_view = isset($cnt_view)?$cnt_view:false;

		$iconLove = tag('img', false, array(
			'src' => $domain.'/resources/icons/love_w.png',
			'data-disable-progressive' => true,
			'style' => 'height: 20px;',
		));

		$iconComment = tag('img', false, array(
			'src' => $domain.'/resources/icons/comment_w.png',
			'data-disable-progressive' => true,
		));

		$iconView = tag('img', false, array(
			'src' => $domain.'/resources/icons/view_w.png',
			'data-disable-progressive' => true,
		));

		$totalLove = tag('span', $cnt_love);
		$totalComment = tag('span', $cnt_comment);
		$totalView = tag('span', $cnt_view);

		$path_image = '/resources/images/uploads/recipe/primary/thumbs/'.$image;
		$custom_image = $domain.$path_image;
		if( !file_exists( $webroot.$path_image ) ) {
			$custom_image = $domain.'/resources/images/placeholder/recipe.jpg';
		}

		$url = $domain.'/p/'.$recipe_id.'/'.$slug;
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
						'title' => lang('total_comment'),
					));
					
					echo tag('div', $iconLove.$totalLove, array(
						'class' => 'pull-right mr10',
						'title' => lang('total_like'),
					));

					echo tag('div', $iconView.$totalView, array(
						'class' => 'pull-right mr10',
						'title' => lang('total_view'),
					));
			?>
		</div>
	</a>
</li>