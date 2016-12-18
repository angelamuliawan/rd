<?php
		$heading = isset($heading) ? $heading : false;
		$values = isset($values) ? $values : false;
?>

<div class="wrapper-top-user hidden-print tacenter">
	<?php
			echo tag('h3', $heading, array(
				'class' => 'mb10 mt20'
			));

			if( !empty($values) ) {
	?>
	<ul class="no-pd no-ul-type">
		<?php
				$counter = 0;
  				foreach( $values as $value ) {
					$user_id = $value['UserID'];
					$username = $value['UserName'];
					$image = $value['UserPhoto'];
					$cnt_recipe = $value['NumberOfRecipe'];
					$cnt_recook = $value['NumberOfRecook'];

					$path_image = '/resources/images/uploads/users/thumbs/'.$image;
					$custom_image = $domain.$path_image;
					
					if( !file_exists( $webroot.$path_image ) ) {
						$firstLetter =  !empty( $username[0] ) ? strtoupper($username[0]) : false;
						$userImage = tag('div', $firstLetter, array(
							'class' => 'alphabet-placeholder',
							'style' => 'width: 64px; height: 64px; line-height: 68px; font-size: 32px; margin: 0 auto 10px;',
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

						$userImage .= '<br>';
					}

					$counter++;
		?>
		<li>
			<div class="row">
				<div class="col-sm-12 wrapper-desc">
					<?php
							echo $userImage;
							echo tag('a', $username, array(
								'title' => $username,
								'class' => 'fbold',
								'href' => $domain.'/users/profile/'.$user_id.'/'.seoURL($username),
							));

							$text_stats = sprintf('%s %s', $cnt_recipe, lang('recipe'));
							if( !empty($cnt_recook) ) {
								$text_stats .= ', '.$cnt_recook.' Recook';
							}
							echo tag('p', $text_stats, array(
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
			// else {
			// 	echo tag('p', 'Data tidak tersedia');
			// }
	?>
</div>