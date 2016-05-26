<?php
		$heading = isset($heading) ? $heading : false;
		$values = isset($values) ? $values : false;

		if( !empty($values) ) {
?>

<div class="wrapper-popular-user hidden-print">
	<?php
			echo tag('h3', $heading, array(
				'class' => 'mb10 mt20'
			));
	?>
	<ul class="no-pd no-ul-type">
		<?php
				$counter = 0;
  				foreach( $values as $value ) {
					$recipe_id = $value['RecipeID'];
					$title = $value['RecipeName'];
					$image = $value['PrimaryPhoto'];
					$slug = $value['Slug'];
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
								'wrapTag' => 'a',
								'wrapAttributes' => array(
									'href' => $domain.'/resep-masak/'.$recipe_id.'/'.$slug,
								),
							));
					?>
				</div>
				<div class="col-sm-9">
					<?php
							echo tag('a', $title, array(
								'href' => $domain.'/resep-masak/'.$recipe_id.'/'.$slug,
							));
							echo tag('p', sprintf('%s Komentar, %s Recook', $cnt_comment, $cnt_recook), array(
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
</div>
<?php
		}
?>