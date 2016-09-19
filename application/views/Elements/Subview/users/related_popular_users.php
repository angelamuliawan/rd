<div class="wrapper-popular-user">
	<?php
			echo tag('h3', 'Chef Terkait', array(
				'class' => 'mb20'
			));

			if( !empty($valuesRelatedPopularUser) ) {
	?>
	<ul class="no-pd no-ul-type">
		<?php
				$counter = 0;
  				foreach( $valuesRelatedPopularUser as $value ) {
					$user_id = $value['UserID'];
					$username = $value['UserName'];
					$userphoto = $value['UserPhoto'];
					$cnt_recipe = $value['NumberOfRecipe'];
					$cnt_recook = $value['NumberOfRecook'];

					$path_image = '/resources/images/uploads/users/thumbs/'.$userphoto;
					$custom_image = $domain.$path_image;
					if( !file_exists( $webroot.$path_image ) ) {
						$custom_image = $domain.'/resources/images/64x64.png';
					}

					$counter++;
		?>
		<li>
			<div class="row">
				<div class="col-sm-3">
					<?php
							echo tag('img', false, array(
								'src' => $custom_image,
								// 'style' => 'width: 64px; height: 40px;',
								'wrapTag' => 'a',
								'wrapAttributes' => array(
									'href' => $domain.'/users/profile/'.$user_id.'/'.seoURL($username),
								),
								'img-progressive-type' => 'users',
							));
					?>
				</div>
				<div class="col-sm-9">
					<?php
							echo tag('a', $username, array(
								'class' => 'fbold',
								'title' => $username,
								'href' => $domain.'/users/profile/'.$user_id.'/'.seoURL($username),
							));
							echo tag('p', sprintf('%s Resep, %s Recook', $cnt_recipe, $cnt_recook), array(
								'class' => 'stats',
							));
					?>
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