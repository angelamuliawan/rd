<div class="wrapper-popular-user">
	<?php
			echo tag('h3', lang('related_chef'), array(
				'class' => 'mb20'
			));

			if( !empty($valuesRelatedPopularUser) ) {
	?>
	<ul class="no-pd no-ul-type">
		<?php
  				foreach( $valuesRelatedPopularUser as $value ) {
					$user_id = $value['UserID'];
					$username = $value['UserName'];
					$userphoto = $value['UserPhoto'];

					$cnt_follower = !empty( $value['NumberOfFollower'] ) ? sprintf('%s %s', $value['NumberOfFollower'], 'Follower') : false;
					$cnt_recipe = !empty( $value['NumberOfRecipe'] ) ? sprintf('%s %s', $value['NumberOfRecipe'], lang('recipe')) : false;
					$concat_follower_recipe = customConcat($cnt_follower, $cnt_recipe);

					$path_image = '/resources/images/uploads/users/thumbs/'.$userphoto;
					$custom_image = $domain.$path_image;

					if( !file_exists( $webroot.$path_image ) ) {
						$firstLetter =  !empty( $username[0] ) ? strtoupper($username[0]) : false;
						$userImage = tag('div', $firstLetter, array(
							'class' => 'alphabet-placeholder',
							'wrapTag' => 'a',
							'wrapAttributes' => array(
								'title' => $username,
								'href' => $domain.'/users/profile/'.$user_id.'/'.seoURL($username),
							),
						));
					} else {
						$userImage = tag('img', false, array(
							'src' => $custom_image,
							'wrapTag' => 'a',
							'wrapAttributes' => array(
								'title' => $username,
								'href' => $domain.'/users/profile/'.$user_id.'/'.seoURL($username),
							),
							'img-progressive-type' => 'users',
						));
					}
		?>
					<li>
						<div class="row">
							<div class="col-sm-3">
								<?php
										echo $userImage;
								?>
							</div>
							<div class="col-sm-9">
								<?php
										echo tag('a', $username, array(
											'class' => 'fbold',
											'title' => $username,
											'href' => $domain.'/users/profile/'.$user_id.'/'.seoURL($username),
										));

										echo tag('p', $concat_follower_recipe, array(
											'class' => 'stats',
										));
								?>

								<div class="mt5">
									<?php
											loadSubview('common/action_follow', array(
												'user_id_viewer' => $user_id,
												'follow_status' => '0',
											));
									?>
								</div>
							</div>
						</div>
					</li>
		<?php
				}
		?>
	</ul>
	<?php
			}
	?>
</div>