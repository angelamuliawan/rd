<?php
		$heading = isset($heading) ? $heading : false;
		$values = isset($values) ? $values : false;
?>

<div class="wrapper-popular-user">
	<?php
			echo tag('h4', $heading, array(
				'class' => 'mb20 mt10'
			));

			if( !empty($values) ) {
	?>
	<ul class="no-pd no-ul-type">
		<?php
				$counter = 0;
  				foreach( $values as $value ) {
					$recipe_id = $value['RecipeID'];
					$title = $value['RecipeName'];
					$image = $value['PrimaryPhoto'];
					$cnt_recook = $value['NumberOfRecook'];
					$cnt_comment = $value['NumberOfComment'];

					$path_image = '/resources/images/uploads/recipe/primary/'.$image;
					$custom_image = $domain.$path_image;
					if( !file_exists( $webroot.$path_image ) ) {
						$custom_image = $domain.'/resources/images/default.png';
					}

					$counter++;
		?>
		<li>
			<div class="row">
				<div class="col-sm-3">
					<?php
							echo tag('img', false, array(
								'src' => $custom_image,
								'style' => 'width: 64px; height: 40px;',
								'wrapTag' => 'a',
								'wrapAttributes' => array(
									'href' => $domain.'/resep-masak/'.$recipe_id.'/',
								),
							));
					?>
				</div>
				<div class="col-sm-9">
					<?php
							echo tag('a', $title, array(
								'href' => $domain.'/resep-masak/'.$recipe_id.'/',
							));
							echo tag('p', sprintf('%s Comment, %s Recook', $cnt_comment, $cnt_recook), array(
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