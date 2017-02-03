<?php
		loadSubview('header/search_box', array(
			'_class' => 'pd10'
		));
		
		// Recipe Header
		$valueRecipeHeader = isset($valuesRecipeHeader[0]) ? $valuesRecipeHeader[0] : false;
		$recipe_id = isset($valueRecipeHeader['RecipeID']) ? $valueRecipeHeader['RecipeID'] : false;
		$slug = isset($valueRecipeHeader['Slug']) ? $valueRecipeHeader['Slug'] : false;
		$image = isset($valueRecipeHeader['PrimaryPhoto']) ? $valueRecipeHeader['PrimaryPhoto'] : false;
		$title = isset($valueRecipeHeader['RecipeName']) ? $valueRecipeHeader['RecipeName'] : false;
		$created_date = isset($valueRecipeHeader['CreatedDate']) ? $valueRecipeHeader['CreatedDate'] : false;
		$recipe_intro = isset($valueRecipeHeader['RecipeIntro']) ? $valueRecipeHeader['RecipeIntro'] : false;

		$cnt_love = isset($valueRecipeHeader['NumberOfLove']) ? $valueRecipeHeader['NumberOfLove'] : false;
		$cnt_comment = isset($valueRecipeHeader['NumberOfComment']) ? $valueRecipeHeader['NumberOfComment'] : false;
		$cnt_recook = isset($valueRecipeHeader['NumberOfRecook']) ? $valueRecipeHeader['NumberOfRecook'] : false;
		$cnt_view = isset($valueRecipeHeader['NumberOfView']) ? $valueRecipeHeader['NumberOfView'] : false;;

		$flag_love = isset($valueRecipeHeader['FlagLove']) ? $valueRecipeHeader['FlagLove'] : false;
		$flag_cookmark = isset($valueRecipeHeader['FlagCookmark']) ? $valueRecipeHeader['FlagCookmark'] : false;
		$flag_recook = isset($valueRecipeHeader['FlagRecook']) ? $valueRecipeHeader['FlagRecook'] : false;
		$flag_creator = isset($valueRecipeHeader['FlagCreator']) ? $valueRecipeHeader['FlagCreator'] : false;

		$cuisine_name = isset($valueRecipeHeader['CuisineName']) ? $valueRecipeHeader['CuisineName'] : false;
		$food_type_name = isset($valueRecipeHeader['FoodTypeName']) ? $valueRecipeHeader['FoodTypeName'] : false;
		$food_process_name = isset($food_process[$valueRecipeHeader['FoodProcessID']]) ? $food_process[$valueRecipeHeader['FoodProcessID']] : false;

		$est_people = isset($valueRecipeHeader['EstPeople']) ? $valueRecipeHeader['EstPeople'] : false;
		$est_time = isset($valueRecipeHeader['TimeEst']) ? $valueRecipeHeader['TimeEst'] : false;
		$est_price = isset($valueRecipeHeader['EstPrice']) ? $valueRecipeHeader['EstPrice'] : false;

		$user_id = isset($valueRecipeHeader['UserID']) ? $valueRecipeHeader['UserID'] : false;
		$username = isset($valueRecipeHeader['UserName']) ? $valueRecipeHeader['UserName'] : false;
		$userphoto = isset($valueRecipeHeader['UserPhoto']) ? $valueRecipeHeader['UserPhoto'] : false;

		// Check for user image
		$path_image = '/resources/images/uploads/users/thumbs/'.$userphoto;
		$custom_image = $domain.$path_image;

		if( !file_exists( $webroot.$path_image ) ) {
			$firstLetter =  !empty( $username ) ? strtoupper($username[0]) : false;
			$userImage = tag('div', $firstLetter, array(
				'class' => 'alphabet-placeholder',
			));
		} else {
			$userImage = tag('img', false, array(
				'src' => $custom_image,
				'data-disable-progressive' => 1,
			));
		}

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

		// Check for recipe
		$path_image = '/resources/images/uploads/recipe/primary/'.$image;
		$custom_image = $domain.$path_image;
		if( !file_exists( $webroot.$path_image ) ) {
			$custom_image = $domain.'/resources/images/placeholder/recipe.jpg';
		}

		// Recipe Composition
		$valuesRecipeComposition = isset($valuesRecipeComposition) ? $valuesRecipeComposition : false;

		// Recipe Recook
		$valueRecipeRecook = isset($valuesRecipeRecook[0]) ? $valuesRecipeRecook[0] : false;

		$url = $domain.'/p/'.$recipe_id.'/'.$slug;
?>

<div class="container bg-white">
	<div class="detail-recipe-header bg-white">
		<div class="row">
			<div class="col-sm-9 print-floleft">
				<div class="wrapper top-side">
					<div class="pull-left left-side">
						<?php
								echo tag('h1', $title);
								echo tag('p', timeAgoFormat($created_date), array(
									'class' => 'mt5 mb10',
								));
						?>
								<div class="mb10">
						<?php
									echo $iconView;
									echo tag('span', $cnt_view);

									echo $iconLove;
									echo tag('span', $cnt_love);

									echo $iconComment;
									echo tag('span', $cnt_comment);

									if( $cnt_recook ) {
										echo $iconRecook;
										echo tag('span', $cnt_recook);
									}
						?>
								</div>
					</div>

					<?php
							if( isLoggedIn() && $user_id == $this->session->userdata('userid') ) {
					?>
								<div class="pull-right">
									<div class="btn-group">
										<button type="button" class="btn btn-default dropdown-toggle no-pd" data-toggle="dropdown" style="border-color: rgb(255, 255, 255);">
											<span class="glyphicon glyphicon-chevron-down"></span>
										</button>
										<ul class="dropdown-menu custom-recipe-detail">
											<?php
													echo tag('a', lang('edit'), array(
														'href' => $domain.'/recipe/edit/' . $recipe_id,
														'title' => lang('edit'),
														'wrapTag' => 'li',
													));

													echo tag('a', lang('delete'), array(
														'href' => $domain.'/recipe/delete/' . $recipe_id,
														'title' => lang('delete'),
														'class' => 'ajax-link',
														'with-confirm' => lang('confirm_delete'),
														'data-redirect' => 'users/profile/' . $user_id,
														'wrapTag' => 'li',
													));
											?>
										</ul>
									</div>
								</div>
					<?php
							}
					?>

					<div class="clearfix"></div>
				</div>
			</div>
			<div class="col-sm-3 print-floright">
				<div class="wrapper wrapper-right-side">
					<div class="pull-left">
						<a title="<?php echo $username; ?>" href="<?php echo $domain.'/users/profile/'.$user_id; ?>">
							<?php
									echo $userImage;
							?>
						</a>
					</div>
					<div class="pull-left ml10">
						<?php
								echo tag('p', sprintf('%s:', lang('created_by')));
								echo tag('a', $username, array(
									'href' => $domain.'/users/profile/'.$user_id,
									'class' => 'fbold',
									'title' => $username,
									'wrapTag' => 'p',
									'wrapAttributes' => array(
										'class' => 'mb5'
									)
								));

								loadSubview('common/action_follow', array(
									'user_id_viewer' => $user_id,
									'follow_status' => $valuesUserFollowStatus,
								));
						?>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="detail-recipe-banner with-border bg-white">
		<div class="row">
			<div class="col-sm-9">
				<div class="wrapper pd15 mb5 tacenter">

					<?php
							echo tag('img', false, array(
								'src' => $custom_image,
								'alt' => $title,
								'title' => $title,
								'wrapTag' => 'div',
								'wrapAttributes' => array(
									'class' => 'wrapper-banner'
								)
							));

							loadSubview('common/action_bottom_find', array(
								'recipe_id' => $recipe_id,
								'slug' => $slug,
								'flag_love' => $flag_love,
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
												echo tag('p', 'Foto Recook');
											
									?>
									<div class="carousel slide" id="recook-carousel">
									  	<div class="carousel-inner">
									  		<?php
									  				$counter = 0;
									  				foreach( $valuesRecipeRecook as $value ) {
														$recook_id = $value['RecookID'];
														$recook_photo = $value['RecookPhoto'];
														$recook_slug = $value['Slug'];

														loadSubview('recipe/carousel_recook', array(
															'recook_id' => $recook_id,
															'recook_photo' => $recook_photo,
															'recook_slug' => $recook_slug,
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
													'value' => sprintf('%s %s', $est_people, lang('people')),
													'style' => 'padding: 15px 5px;',
													'desc_style' => 'position: absolute; top: 14px; bottom: 14px;',
												));
												loadSubview('common/recipe_summary', array(
													'icon' => 'clock.png',
													'value' => sprintf('%s %s', $est_time, lang('minute')),
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
							<div class="wrapper pd15" style="font-size: 16px;">
								<?php
										echo tag('p', $recipe_intro, array(
											'id' => 'recipeIntro'
										));
										echo tag('h3', lang('composition'));
										echo tag('hr', false, array(
											'class' => 'mt5 mb10'
										));

										if( !empty($valuesRecipeComposition) ) {
								?>
											<table class="table table-striped">
												<tbody>
													<?php
															foreach( $valuesRecipeComposition as $key => $value ) {
																// $measure = $value['Measure'];
																$measure_value = $value['MeasureValue'];
																$food_composition = $value['CompositionName'];
																$measure = isset($measure_sizes[$value['MeasureSizeID']]) ? $measure_sizes[$value['MeasureSizeID']] : false;
																$measure_text = sprintf("%s %s", $measure_value, $measure);

																if( $value['MeasureSizeID'] == 9 || $value['MeasureSizeID'] == 10 ) {
																	$measure_text = $measure;
																}

																echo tableCell(array(
																	$measure_text,
																	$food_composition,
																));
															}
													?>
												</tbody>
											</table>

								<?php
										}

										echo tag('h3', lang('step'));
										echo tag('hr', false, array(
											'class' => 'mt5 mb10'
										));

										if( !empty($valuesRecipeStep) ) {
								?>
											<ol class="simple-list">
												<?php
														foreach( $valuesRecipeStep as $key => $value ) {
															$food_step = $value['FoodStepName'];
															$food_step_image = $value['FoodStepImage'];

															$content = tag('p', $food_step);
															if( !empty($food_step_image) ) {

																$path_image = '/resources/images/uploads/recipe/step/'.$food_step_image;
																$custom_image = $domain.$path_image;

																if( !file_exists( $webroot.$path_image ) ) {
																	$custom_image = $domain.'/resources/images/placeholder/recipe.jpg';
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
										}
								?>
							</div>
						</div>
					</div>
				</div>
				<div class="wrapper-social pd15 hidden-print">
					<div class="wrapper-facebook with-border">
						<a href="https://www.facebook.com/sharer/sharer.php?u=<?php echo urlencode($url); ?>&t=<?php echo $slug; ?>"
						   onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;"
						   target="_blank" title="<?php echo lang('share_to_facebook'); ?>">
							<div class="wrapper-inner">
								<?php
									echo tag('span', lang('share_to_facebook'));
								?>
							</div>
						</a>
					</div>
					<?php
							if( isLoggedIn() ) {
	      						echo tag('a', lang('create_recipe'), array(
	      							'class' => 'btn btn-success full-width mt5',
									'href' => $domain.'/recipe/add',
								));
	      					} else {
	      						echo tag('a', lang('create_recipe'), array(
									'href' => $domain.'/users/login?redirect_after=recipe/add',
			        				'data-title' => 'Login',
			        				'class' => 'ajax-modal btn btn-success full-width mt5',
								));
	      					}
					?>
				</div>
				<div id="comment-container" class="hidden-print">
					<div class="mt20 ml15">
						<?php
								loadSubview('common/background_masker/comment');
						?>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<?php
						// loadSubview('users/related_recipe', array(
						// 	'heading' => 'Chef yang Sama',
						// 	'values' => $valuesRelatedByAuthor,
						// ));
						loadSubview('users/related_recipe', array(
							'heading' => lang('related_recipe'),
							'values' => $valuesRelatedRecipe,
						));

						loadSubview('common/ads');
				?>
			</div>
		</div>
	</div>
</div>

<input type="hidden" id="recipeId" value="<?php echo $recipe_id; ?>" />