<?php
		$recipe_id = isset($recipe_id)?$recipe_id:false;
		$slug = isset($slug)?$slug:false;
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

		$path_image = '/resources/images/uploads/recipe/primary/thumbs/'.$image;
		$custom_image = $domain.$path_image;
		if( !file_exists( $webroot.$path_image ) ) {
			$custom_image = $domain.'/resources/images/default.png';
		}

		$totalComment = tag('span', $cnt_comment);
		$totalRecook = tag('span', $cnt_recook);

		$url = $domain.'/resep-masak/'.$recipe_id.'/'.$slug;
?>
<li class="no-ul-type wrapper-ajax-link">
	<div class="row">
		<div class="col-sm-5 left-side">
			<a href="<?php echo $url; ?>">
				<?php
						echo tag('img', false, array(
							'src' => $custom_image,
							'wrapTag' => 'div',
							'wrapAttributes' => array(
								'class' => 'box-header',
							),
						));
				?>
			</a>
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
		<div class="col-sm-7 right-side">
			<div class="box-description">
				<?php
						echo tag('a', tag('h4', $title, array(
							'class' => 'mb10 title',
						)), array(
							'href' => $url,
						));
						echo tag('p', $cuisine, array(
							'class' => 'no-mg stats'
						));
						echo tag('p', $food_type, array(
							'class' => 'stats'
						));
						echo tag('p', $recipe_intro, array(
							'class' => 'mt10 description'
						));
						
						loadSubview('common/action_bottom_find');
				?>
			</div>
		</div>
	</div>
</li>