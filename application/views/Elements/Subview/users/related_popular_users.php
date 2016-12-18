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
					$cnt_recipe = $value['NumberOfRecipe'];
					$cnt_recook = $value['NumberOfRecook'];

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

							// echo tag('p', sprintf('%s Resep, %s Recook', $cnt_recipe, $cnt_recook), array(
							// 	'class' => 'stats',
							// ));
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