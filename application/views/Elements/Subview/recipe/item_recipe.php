<?php
		$image = isset($image)?$image:false;
		$title = isset($title)?$title:false;
		$cuisine = isset($cuisine)?$cuisine:false;
		$food_type = isset($food_type)?$food_type:false;
		$recipe_intro = isset($recipe_intro)?$recipe_intro:false;

		$cnt_comment = isset($cnt_comment)?$cnt_comment:false;
		$cnt_recook = isset($cnt_recook)?$cnt_recook:false;

		$iconComment = tag('img', false, array(
			'src' => $domain.'/resources/icons/comment.png',
		));
		$iconRecook = tag('img', false, array(
			'src' => $domain.'/resources/icons/retweet.png',
		));

		$custom_image = $domain.'/resources/images/food/'.$image;
		if( !file_exists($custom_image) ) {
			$custom_image = $domain.'/resources/images/default.png';
		}

		$totalComment = tag('span', $cnt_comment);
		$totalRecook = tag('span', $cnt_recook);
?>
<li class="no-ul-type">
	<div class="row">
		<div class="col-sm-4 left-side">
			<?php
					echo tag('img', false, array(
						'src' => $custom_image,
						'wrapTag' => 'div',
						'wrapAttributes' => array(
							'class' => 'box-header',
						),
					));

			?>
			<div class="box-footer">
				<?php
						echo tag('div', $iconComment.$totalComment, array(
							'class' => 'pull-right mr5'
						));
						echo tag('div', $iconRecook.$totalRecook, array(
							'class' => 'pull-right mr10'
						));
				?>
			</div>
		</div>
		<div class="col-sm-8 right-side">
			<div class="box-description">
				<?php
						echo tag('h4', $title);
						echo tag('p', $cuisine);
						echo tag('p', $food_type);
						echo tag('p', $recipe_intro, array(
							'class' => 'mt10 description'
						));
						echo tag('a', 'Selengkapnya', array(
							'href' => $domain.'/recipe/detail',
							'class' => 'btn btn-orange mt5',
							'wrapTag' => 'div',
							'wrapAttributes' => array(
								'class' => 'taright mb5'
							)
						));
						loadSubview('common/action_bottom_find');
				?>
			</div>
		</div>
	</div>
</li>