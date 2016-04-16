<?php
		loadSubview('header/search_box');

		// Recipe Header
		$valueRecipeHeader = isset($valuesRecipeHeader[0]) ? $valuesRecipeHeader[0] : false;
		$recipe_id = isset($valueRecipeHeader['RecipeID']) ? $valueRecipeHeader['RecipeID'] : false;
		$slug = isset($valueRecipeHeader['Slug']) ? $valueRecipeHeader['Slug'] : false;
		$image = isset($valueRecipeHeader['PrimaryPhoto']) ? $valueRecipeHeader['PrimaryPhoto'] : false;
		$title = isset($valueRecipeHeader['RecipeName']) ? $valueRecipeHeader['RecipeName'] : false;
		$recipe_intro = isset($valueRecipeHeader['RecipeIntro']) ? $valueRecipeHeader['RecipeIntro'] : false;
		$cnt_comment = isset($valueRecipeHeader['NumberOfComment']) ? $valueRecipeHeader['NumberOfComment'] : false;
		$cnt_recook = isset($valueRecipeHeader['NumberOfRecook']) ? $valueRecipeHeader['NumberOfRecook'] : false;
		$cnt_view = 0;

		$flag_cookmark = isset($valueRecipeHeader['FlagCookmark']) ? $valueRecipeHeader['FlagCookmark'] : false;
		$flag_recook = isset($valueRecipeHeader['FlagRecook']) ? $valueRecipeHeader['FlagRecook'] : false;
		$flag_creator = isset($valueRecipeHeader['FlagCreator']) ? $valueRecipeHeader['FlagCreator'] : false;

		$cuisine_name = isset($valueRecipeHeader['CuisineName']) ? $valueRecipeHeader['CuisineName'] : false;
		$food_type_name = isset($valueRecipeHeader['FoodTypeName']) ? $valueRecipeHeader['FoodTypeName'] : false;
		$food_process_name = isset($valueRecipeHeader['FoodProcessName']) ? $valueRecipeHeader['FoodProcessName'] : false;
		$est_people = isset($valueRecipeHeader['EstPeople']) ? $valueRecipeHeader['EstPeople'] : false;
		$est_time = isset($valueRecipeHeader['TimeEst']) ? $valueRecipeHeader['TimeEst'] : false;
		$est_price = isset($valueRecipeHeader['EstPrice']) ? $valueRecipeHeader['EstPrice'] : false;

		$user_id = isset($valueRecipeHeader['UserID']) ? $valueRecipeHeader['UserID'] : false;
		$username = isset($valueRecipeHeader['UserName']) ? $valueRecipeHeader['UserName'] : false;
		$iconComment = tag('img', false, array(
			'src' => $domain.'/resources/icons/comment.png',
		));
		$iconRecook = tag('img', false, array(
			'src' => $domain.'/resources/icons/retweet.png',
		));
		$iconView = tag('img', false, array(
			'src' => $domain.'/resources/icons/view.png',
		));

		$path_image = '/resources/images/uploads/recipe/primary/'.$image;
		$custom_image = $domain.$path_image;
		if( !file_exists( $webroot.$path_image ) ) {
			$custom_image = $domain.'/resources/images/default.png';
		}

		// Recipe Composition
		$valuesRecipeComposition = isset($valuesRecipeComposition) ? $valuesRecipeComposition : false;

		// Recipe Recook
		$valueRecipeRecook = isset($valuesRecipeRecook[0]) ? $valuesRecipeRecook[0] : false;

		$url = $domain.'/resep-masak/'.$recipe_id.'/'.$slug;
?>

<div class="container mt20">
	<div class="detail-recipe-header with-border bg-white">
		<div class="row">
			<div class="col-sm-9 print-floleft">
				<?php
						echo tag('h1', $title, array(
							'wrapTag' => 'div',
							'wrapAttributes' => array(
								'class' => 'wrapper pd15'
							)
						));
				?>
			</div>
			<div class="col-sm-3 print-floright">
				<div class="wrapper pd10 taright">
					<?php
							echo tag('p', 'Dibuat oleh:');
							echo tag('a', $username, array(
								'href' => $domain.'/users/profile/'.$user_id,
								'wrapTag' => 'p',
								'wrapAttributes' => array(
									'class' => 'mb5'
								)
							));

							// echo $iconView;
							// echo tag('span', $cnt_view);

							echo $iconRecook;
							echo tag('span', $cnt_recook);

							echo $iconComment;
							echo tag('span', $cnt_comment);
					?>
				</div>
			</div>
		</div>
	</div>

	<div class="detail-recipe-banner with-border bg-white">
		<div class="row">
			<div class="col-sm-9">
				<div class="wrapper pd15 tacenter">
					<?php
							echo tag('img', false, array(
								'src' => $custom_image,
								'wrapTag' => 'div',
								'wrapAttributes' => array(
									'class' => 'wrapper-banner with-border'
								)
							));
							loadSubview('common/action_bottom_find', array(
								'recipe_id' => $recipe_id,
								'slug' => $slug,
								'flag_cookmark' => $flag_cookmark,
								'flag_recook' => $flag_recook,
								'flag_creator' => $flag_creator,
								'_print' => true,
							));
					?>
				</div>
				<div class="detail-recipe-content bg-white">
					<div class="row">
						<div class="col-sm-4 with-border-right">
							<div class="wrapper pd15">
								<div class="wrapper-top hidden-print">

									<?php
											if( !empty($valuesRecipeRecook) ) {

												$cntRecookPhoto = count($valuesRecipeRecook);

												echo tag('h3', $cntRecookPhoto);
												echo tag('p', 'Recook Photos');
											
									?>
									<div class="carousel slide" id="recook-carousel">
									  	<div class="carousel-inner">
									  		<?php
									  				$counter = 0;
									  				foreach( $valuesRecipeRecook as $value ) {
														$recook_id = $value['RecookID'];
														$recook_photo = $value['RecookPhoto'];

														loadSubview('recipe/carousel_recook', array(
															'recook_id' => $recook_id,
															'recook_photo' => $recook_photo,
															'counter' => $counter,
														));
														$counter++;
													}
									  		?>
									  	</div>
									  	<?php
									  			echo tag('i', false, array(
									  				'class' => 'glyphicon glyphicon-chevron-left',
									  				'wrapTag' => 'a',
									  				'wrapAttributes' => array(
									  					'class' => 'left carousel-control',
									  					'href' => '#recook-carousel',
									  					'data-slide' => 'prev',
									  				),
									  			));

									  			echo tag('i', false, array(
									  				'class' => 'glyphicon glyphicon-chevron-right',
									  				'wrapTag' => 'a',
									  				'wrapAttributes' => array(
									  					'class' => 'right carousel-control',
									  					'href' => '#recook-carousel',
									  					'data-slide' => 'next',
									  				),
									  			));
									  	?>
									</div>
									<?php
												echo tag('hr', false, array(
													'class' => 'hidden-print'
												));
											} 
											// else {
											// 	echo tag('h4', 'Recook tidak tersedia');
											// }
									?>
								</div>								
								<div class="wrapper-bottom hidden-print">
									<ul class="no-pd">
										<?php
												loadSubview('common/recipe_summary', array(
													'icon' => 'money.png',
													'value' => $est_price,
													'_class' => 'print-floleft',
													'style' => 'padding: 15px 5px;',
													'desc_style' => 'position: absolute; top: 18px; bottom: 18px;',
												));
												loadSubview('common/recipe_summary', array(
													'icon' => 'flag.png',
													'value' => $cuisine_name,
													'style' => 'padding: 15px 5px;',
													'desc_style' => 'position: absolute; top: 14px; bottom: 14px;',
												));
												loadSubview('common/recipe_summary', array(
													'icon' => 'spoon.png',
													'value' => $food_type_name,
													'style' => 'padding: 15px 5px;',
													'desc_style' => 'position: absolute; top: 16px; bottom: 16px;',
												));
												loadSubview('common/recipe_summary', array(
													'icon' => 'people.png',
													'value' => $est_people,
													'style' => 'padding: 15px 5px;',
													'desc_style' => 'position: absolute; top: 14px; bottom: 14px;',
												));
												loadSubview('common/recipe_summary', array(
													'icon' => 'clock.png',
													'value' => sprintf('%s Menit', $est_time),
													'style' => 'padding: 15px 5px;',
													'desc_style' => 'position: absolute; top: 14px; bottom: 14px;',
												));
												loadSubview('common/recipe_summary', array(
													'icon' => 'oven.png',
													'value' => $food_process_name,
													'style' => 'padding: 15px 5px;',
													'desc_style' => 'position: absolute; top: 14px; bottom: 14px;',
												));
										?>
									</ul>
								</div>
								<div class="wrapper-bottom page-break visible-print">
									<ul class="no-pd">
										<?php
												loadSubview('common/recipe_summary', array(
													'icon' => 'money.png',
													'value' => $est_price,
													'_class' => 'print-floleft',
												));
												loadSubview('common/recipe_summary', array(
													'icon' => 'flag.png',
													'value' => $cuisine_name,
												));
												loadSubview('common/recipe_summary', array(
													'icon' => 'spoon.png',
													'value' => $food_type_name,
												));
												loadSubview('common/recipe_summary', array(
													'icon' => 'people.png',
													'value' => $est_people,
												));
												loadSubview('common/recipe_summary', array(
													'icon' => 'clock.png',
													'value' => sprintf('%s Menit', $est_time),
												));
												loadSubview('common/recipe_summary', array(
													'icon' => 'oven.png',
													'value' => $food_process_name,
												));
										?>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-sm-8">
							<div class="wrapper pd15" style="font-size:16px;">
								<?php
										echo tag('p', $recipe_intro);
										echo tag('h3', 'Bahan');
										echo tag('hr');

										if( !empty($valuesRecipeComposition) ) {
								?>
								<table class="table table-striped">
									<tbody>
										<?php
												foreach( $valuesRecipeComposition as $key => $value ) {
													$measure = $value['Measure'];
													$food_composition = $value['CompositionName'];

													echo tableCell(array(
														$measure,
														$food_composition,
													));
												}
										?>
									</tbody>
								</table>

								<?php
										} else {
											echo tag('h4', 'Komposisi tidak tersedia');
											echo tag('br');
										}

										echo tag('h3', 'Langkah');
										echo tag('hr');

										if( !empty($valuesRecipeStep) ) {
								?>
								<ol style="padding:0 20px;">
									<?php
											foreach( $valuesRecipeStep as $key => $value ) {
												$food_step = $value['FoodStepName'];
												$food_step_image = $value['FoodStepImage'];

												$content = tag('p', $food_step);
												if( !empty($food_step_image) ) {

													$custom_image = $domain.'/resources/images/uploads/recipe/step/'.$food_step_image;
													if( !@getimagesize($custom_image) ) {
														$custom_image = $domain.'/resources/images/default.png';
													}

													$content .= tag('img', false, array(
														'src' => $custom_image,
														'wrapTag' => 'div',
														'wrapAttributes' => array(
															'class' => 'tacenter',
														)
													));
												}

												echo tag('li', $content);
											}
									?>
								</ol>

								<?php
										} else {
											echo tag('h3', 'Langkah tidak tersedia');
										}
								?>
							</div>
						</div>
					</div>
				</div>
				<div class="wrapper-social pd15">
					<div class="wrapper-facebook with-border">
						<a href="https://www.facebook.com/sharer/sharer.php?u=<?php echo urlencode($url); ?>&t=<?php echo $slug; ?>"
						   onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;"
						   target="_blank" title="Share on Facebook">
							<div class="wrapper-inner">
								<span class="fbold">Bagikan ke facebook</span>
							</div>
						</a>
					</div>
				</div>
				<?php
						loadSubview('recipe/comment');
				?>
			</div>
			<div class="col-sm-3">
				<?php
						loadSubview('users/related_recipe', array(
							'heading' => 'Same Author',
							'values' => $valuesRelatedByAuthor,
						));
						loadSubview('users/related_recipe', array(
							'heading' => 'Related Recipe',
							'values' => $valuesRelatedRecipe,
						));

						loadSubview('common/ads');
				?>
			</div>
		</div>
	</div>
</div>