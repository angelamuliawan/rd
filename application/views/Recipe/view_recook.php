<?php
		loadSubview('header/search_box', array(
			'_class' => 'pd10'
		));

		// Recipe Header
		$valuesRecipeRecook = isset( $valuesRecipeRecook[0] ) ? $valuesRecipeRecook[0] : false;
		$recook_id = $valuesRecipeRecook['RecookID'];
		$recook_user_id = $valuesRecipeRecook['UserID'];
		$recook_username = $valuesRecipeRecook['UserName'];
		$recook_photo = $valuesRecipeRecook['RecookPhoto'];
		$recook_desc = $valuesRecipeRecook['RecookDesc'];
		$recook_date = $valuesRecipeRecook['RecookDate'];
		
		$recipe = $valuesRecipeRecook['RecipeName'];
		$recipe_id = $valuesRecipeRecook['RecipeID'];
		$slug = $valuesRecipeRecook['Slug'];
		$recipe_photo = $valuesRecipeRecook['PrimaryPhoto'];

		$creator_username = $valuesRecipeRecook['UserNameCreator'];
		$creator_userid = $valuesRecipeRecook['UserIDCreator'];

		$path_image = '/resources/images/uploads/recipe/recook/'.$recook_photo;
		$custom_image = $domain.$path_image;
		if( !file_exists( $webroot.$path_image ) ) {
			$custom_image = $domain.'/resources/images/placeholder/recipe.jpg';
		}

		$recipe_path_image = '/resources/images/uploads/recipe/primary/thumbs/'.$recipe_photo;
		$recipe_custom_image = $domain.$recipe_path_image;
		if( !file_exists( $webroot.$recipe_path_image ) ) {
			$recipe_custom_image = $domain.'/resources/images/placeholder/recipe.jpg';
		}

		$cnt_love = isset($valuesRecipeRecook['NumberOfLove']) ? $valuesRecipeRecook['NumberOfLove'] : false;
		$flag_love = isset($valuesRecipeRecook['FlagRecookLove']) ? $valuesRecipeRecook['FlagRecookLove'] : false;
		$iconLove = tag('img', false, array(
			'src' => $domain.'/resources/icons/love.png',
			'data-disable-progressive' => true,
			'style' => 'height: 20px;',
		));

		$url = $domain.'/p/'.$recipe_id.'/'.$slug;
?>

<div class="container bg-white">
	<div class="detail-recipe-header">
		<div class="row">
			<div class="col-sm-12 print-floleft">
				<div class="pd15 pb0 top-side">
					<div class="pull-left">
						<?php
								echo tag('h1', $recipe, array(
									'class' => 'mb5',
								));
			        			echo tag('span', sprintf('%s ', lang('recooked_by')));
			        			echo tag('a', $recook_username, array(
			        				'class' => 'fbold',
			        				'title' => $recook_username,
			        				'href' => $domain.'/users/profile/'.$recook_user_id,
			        			));
								echo tag('p', timeAgoFormat($recook_date), array(
									'class' => 'mt5',
								));
						?>
					</div>
					<?php
							if( isLoggedIn() && $recook_user_id == $this->session->userdata('userid') ) {
					?>
								<div class="pull-right">
									<div class="btn-group">
										<button type="button" class="btn btn-default dropdown-toggle no-pd" data-toggle="dropdown" style="border-color: rgb(255, 255, 255);">
											<span class="glyphicon glyphicon-chevron-down"></span>
										</button>
										<ul class="dropdown-menu custom-recipe-detail">
											<?php
													echo tag('a', lang('delete'), array(
														'href' => $domain.'/recipe/delete_recook/' . $recook_id,
														'title' => lang('delete'),
														'class' => 'ajax-link',
														'with-confirm' => lang('confirm_delete'),
														'data-redirect' => 'users/profile/' . $recook_user_id,
														'wrapTag' => 'li',
													));
											?>
										</ul>
									</div>
								</div>
					<?php
							}
					?>
				</div>
			</div>
		</div>
	</div>

	<div class="detail-recipe-banner with-border">
		<div class="row">
			<div class="col-sm-5">
				<div class="wrapper pd15 tacenter">
					<?php
							echo tag('img', false, array(
								'src' => $custom_image,
								'style' => 'width:100%; height:auto;',
								'alt' => $recipe,
								'title' => $recipe,
							));

							loadSubview('common/action_bottom_find', array(
								'recipe_id' => $recipe_id,
								'recook_id' => $recook_id,
								'slug' => $slug,
								'flag_love' => $flag_love,
								'flag_recook' => 1,
								'flag_creator' => 1,
							));
					?>
				</div>
				<div class="media pd15"> 
					<div class="pull-left">
						<?php
								echo tag('img', false, array(
									'src' => $recipe_custom_image,
									'alt' => $recipe,
									'title' => $recipe,
									'class' => 'media-object',
									'style' => 'width: 64px; height: 64px;',
									'wrapTag' => 'a',
									'wrapAttributes' => array(
										'href' => $url,
									),
								));
						?>
					</div>
					<div class="media-body">
						<?php
								echo tag('p', sprintf('%s :', lang('recooked_from_recipe')), array(
									'class' => 'tajustify comment wrapper-comment',
									'style' => 'font-size:13px; margin-bottom: 5px;'
								));
								echo tag('h4', $recipe, array(
									'class' => 'media-heading fbold',
									'wrapTag' => 'a',
									'wrapAttributes' => array(
										'href' => $url,
									),
								));

								echo tag('span', sprintf('%s ', lang('by')), array(
									'class' => 'tajustify',
									'style' => 'font-size:13px;',
								));
								echo tag('a', $creator_username, array(
									'class' => 'fbold',
									'href' => $domain.'/users/profile/'.$creator_userid,
									'style' => 'font-size:13px;',
								));
						?>
					</div>
				</div>
			</div>
			<div class="col-sm-7">
				<div class="detail-recipe-content pd15">
					<div class="row">
						<div class="col-sm-12">
							<div class="wrapper" style="font-size: 14px;">
								<?php
										echo tag('p', $recook_desc, array(
											'id' => 'recookDesc',
											'class' => 'fs16',
										));
										echo tag('hr', false, array(
											'class' => 'no-mg'
										));
								?>
							</div>
							<div id="comment-container">
								<div class="mt10">
									<?php
											loadSubview('common/background_masker/comment');
									?>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<input type="hidden" id="recookId" value="<?php echo $recook_id; ?>" />