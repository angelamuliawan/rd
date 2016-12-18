<?php
		$counter = isset($counter)?$counter:0;
		$recipe_id = isset($recipe_id)?$recipe_id:false;
		$slug = isset($slug)?$slug:false;
		$image = isset($image)?$image:false;
		$title = isset($title)?$title:false;
		$cuisine = isset($cuisine)?$cuisine:false;
		$food_type = isset($food_type)?$food_type:false;
		$recipe_intro = isset($recipe_intro)?$recipe_intro:false;

		$user_id = isset($user_id)?$user_id:false;
		$username = isset($username)?$username:false;

		$cnt_love = isset($cnt_love)?$cnt_love:false;
		$cnt_comment = isset($cnt_comment)?$cnt_comment:false;
		$cnt_recook = isset($cnt_recook)?$cnt_recook:false;
		$cnt_view = isset($cnt_view)?$cnt_view:false;

		$iconCuisine = tag('img', false, array(
			'style' => 'width:15px;',
			'src' => $domain.'/resources/icons/spoon.png',
			'data-disable-progressive' => true,
		));
		$iconFoodType = tag('img', false, array(
			'style' => 'width:15px;',
			'src' => $domain.'/resources/icons/flag.png',
			'data-disable-progressive' => true,
		));
		$iconCreator = tag('img', false, array(
			'style' => 'width:15px;',
			'src' => $domain.'/resources/icons/user.png',
			'data-disable-progressive' => true,
		));

		$iconLove = tag('img', false, array(
			'src' => $domain.'/resources/icons/love.png',
			'data-disable-progressive' => true,
			'style' => 'height: 20px;',
		));
		$iconComment = tag('img', false, array(
			'src' => $domain.'/resources/icons/comment.png',
			'data-disable-progressive' => true,
		));
		$iconRecook = tag('img', false, array(
			'src' => $domain.'/resources/icons/retweet.png',
			'data-disable-progressive' => true,
		));
		$iconView = tag('img', false, array(
			'src' => $domain.'/resources/icons/view.png',
			'data-disable-progressive' => true,
		));

		$path_image = '/resources/images/uploads/recipe/primary/thumbs/'.$image;
		$custom_image = $domain.$path_image;
		if( !file_exists( $webroot.$path_image ) ) {
			$custom_image = $domain.'/resources/images/placeholder/recipe.jpg';
		}

		$totalLove = tag('span', $cnt_love);
		$totalComment = tag('span', $cnt_comment);
		$totalRecook = tag('span', $cnt_recook);
		$totalView = tag('span', $cnt_view);

		$url = $domain.'/resep-masak/'.$recipe_id.'/'.$slug;
		$userURL = $domain.'/users/profile/'.$user_id;
?>
<li class="no-ul-type">
	<div class="row">
		<div class="col-sm-4 left-side">
			<div class="box-header">
				<?php
						echo tag('img', false, array(
							'src' => $custom_image,
							'wrapTag' => 'a',
							'wrapAttributes' => array(
								'href' => $url,
							),
						));

				?>
			</div>
			<div class="box-footer">
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
		</div>
		<div class="col-sm-8 right-side">
			<div class="box-description">
				<?php
						echo tag('h4', $title, array(
							'wrapTag' => 'a',
							'wrapAttributes' => array(
								'href' => $url,
								'title' => $title,
								'class' => 'mb5',
							),
						));
						echo $iconFoodType.tag('p', $cuisine, array(
							'class' => 'fbold ml5 dpinlineblock'
						));
						echo '<br>';
						echo $iconCuisine.tag('p', $food_type, array(
							'class' => 'fbold ml5 dpinlineblock'
						));
						echo '<br>';
						echo $iconCreator.tag('a', $username, array(
							'href' => $userURL,
							'title' => $username,
							'class' => 'fbold ml5 dpinlineblock'
						));
						echo tag('p', $recipe_intro, array(
							'class' => 'mt10 description'
						));
						echo tag('a', lang('view_detail'), array(
							'href' => $url,
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