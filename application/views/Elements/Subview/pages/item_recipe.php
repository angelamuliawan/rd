<?php
		$recipe_id = isset($recipe_id)?$recipe_id:false;
		$image = isset($image)?$image:false;
		$title = isset($title)?$title:false;
		$cnt_comment = isset($cnt_comment)?$cnt_comment:false;
		$cnt_recook = isset($cnt_recook)?$cnt_recook:false;

		$iconComment = tag('img', false, array(
			'src' => $domain.'/resources/icons/comment_w.png',
		));
		$iconRecook = tag('img', false, array(
			'src' => $domain.'/resources/icons/retweet_w.png',
		));

		$totalComment = tag('span', $cnt_comment);
		$totalRecook = tag('span', $cnt_recook);

		$custom_image = $domain.'/resources/images/uploads/recipe/primary/'.$image;
		if( !@getimagesize($custom_image) ) {
			$custom_image = $domain.'/resources/images/default.png';
		}
?>
<li class="no-ul-type with-border">
	<a href="recipe/detail/<?php echo $recipe_id; ?>">
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
						'class' => 'pull-right mr5'
					));
					echo tag('div', $iconRecook.$totalRecook, array(
						'class' => 'pull-right mr10'
					));
			?>
		</div>
	</a>
</li>