<?php
		$heading = isset($heading) ? $heading : false;
		$values = isset($values) ? $values : false;

		if( !empty($values) ) {
?>

<div class="wrapper-popular-user wrapper-popular-recipe hidden-print" data-spy="affix" data-offset-top="180" data-offset-bottom="150">
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

					$cnt_recook = !empty( $value['NumberOfRecook'] ) ? sprintf('%s %s', $value['NumberOfRecook'], lang('recook')) : false;
					$cnt_comment = !empty( $value['NumberOfComment'] ) ? sprintf('%s %s', $value['NumberOfComment'], lang('comment')) : false;
					$concat_recook_comment = customConcat($cnt_recook, $cnt_comment);

					$path_image = '/resources/images/uploads/recipe/primary/thumbs/'.$image;
					$custom_image = $domain.$path_image;
					if( !file_exists( $webroot.$path_image ) ) {
						$custom_image = $domain.'/resources/images/placeholder/recipe.jpg';
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
									'title' => $title,
								),
							));
					?>
				</div>
				<div class="col-sm-9">
					<?php
							echo tag('a', $title, array(
								'href' => $domain.'/resep-masak/'.$recipe_id.'/'.$slug,
								'title' => $title,
								'class' => 'fbold',
							));

							echo tag('p', $concat_recook_comment, array(
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