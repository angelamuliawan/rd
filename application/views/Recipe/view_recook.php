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
			$custom_image = $domain.'/resources/images/default.png';
		}

		$recipe_path_image = '/resources/images/uploads/recipe/primary/thumbs/'.$recipe_photo;
		$recipe_custom_image = $domain.$recipe_path_image;
		if( !file_exists( $webroot.$recipe_path_image ) ) {
			$recipe_custom_image = $domain.'/resources/images/default.png';
		}

		$url = $domain.'/resep-masak/'.$recipe_id.'/'.$slug;
?>

<div class="container mt20">
	<div class="detail-recipe-header with-border bg-white">
		<div class="row">
			<div class="col-sm-12 print-floleft">
				<div class="pd15 pb0">
					<?php
							echo tag('h1', $recipe, array(
								'class' => 'mb5',
							));
		        			echo tag('span', 'di Recook oleh ');
		        			echo tag('a', $recook_username, array(
		        				'class' => 'fbold',
		        				'title' => $recook_username,
		        				'href' => $domain.'/users/profile/'.$recook_user_id,
		        			));
							echo tag('p', $recook_date, array(
								'class' => 'mt5',
							));
					?>
				</div>
			</div>
		</div>
	</div>

	<div class="with-border bg-white">
		<div class="row">
			<div class="col-sm-5">
				<div class="wrapper pd15 tacenter">
					<?php
							echo tag('img', false, array(
								'src' => $custom_image,
								'style' => 'width:100%; height:auto;',
							));
					?>
				</div>
				<div class="media pd15"> 
					<div class="pull-left">
						<?php
								echo tag('img', false, array(
									'src' => $recipe_custom_image,
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
								echo tag('p', 'Hasil recook dari :', array(
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

								echo tag('span', 'oleh ', array(
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
				<div class="detail-recipe-content bg-white pd15">
					<div class="row">
						<div class="col-sm-12">
							<div class="wrapper" style="font-size: 14px;">
								<?php
										echo tag('p', $recook_desc);
										echo tag('hr', false, array(
											'class' => 'no-mg'
										));
								?>
							</div>
							<?php
									loadSubview('recipe/comment', array(
										'recipe_id' => $recook_id,
										'valuesRecipeComment' => $valuesRecookComment,
										'_with_padding' => false,
										'_show_title' => false,
										'_show_empty' => false,
										'_url' => 'recipe/recook_comment/',
										'_type' => 'recook',
									));
							?>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>