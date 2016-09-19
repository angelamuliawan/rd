<?php
		$valuesUserAccount = isset( $valuesUserAccount[0] ) ? $valuesUserAccount[0] : false;
		$username = isset( $valuesUserAccount['UserName'] ) ? $valuesUserAccount['UserName'] : false;

		$cntMyRecipe = count($valuesMyRecipe);
		$cntRecook = count($valuesRecook);
		$cntCookmark = count($valuesCookmark);
?>
<div class="container">
	<div class="big-wrapper bg-white pd20" style="min-height:500px;">
		<div class="row">
			<div class="wrapper-profile">
				<div class="col-sm-3">
					<?php
							loadSubview('users/photo_profile', array(
								'_allow_upload' => false,
							));
					?>
				</div>
				<div class="col-sm-6">
					<?php
							echo tag('h2', $username, array(
								'class' => 'mb20'
							));
					?>
					<div class="wrapper-right">
						<ul class="nav nav-tabs">
							<?php
									echo tag('a', sprintf('Resep (%s)', $cntMyRecipe), array(
										'href' => '#tabs-my-recipe',
										'wrapTag' => 'li',
										'wrapAttributes' => array(
											'class' => 'active',
										)
									));
									echo tag('a', sprintf('Recook (%s)', $cntRecook), array(
										'href' => '#tabs-recook',
										'wrapTag' => 'li',
									));
									echo tag('a', sprintf('Cookmark (%s)', $cntCookmark), array(
										'href' => '#tabs-cookmark',
										'wrapTag' => 'li',
									));
							?>
						</ul>

						<div class="tab-content pd15 wrapper-public-profile">
							<div class="tab-pane active" id="tabs-my-recipe">
								<ul class="no-pd mt10">
								<?php
										if( !empty($valuesMyRecipe) ) {
											foreach( $valuesMyRecipe as $key => $value ) {
												$id = $value['RecipeID'];
												$slug = $value['Slug'];
												$image = $value['PrimaryPhoto'];
												$title = $value['RecipeName'];
												$cuisine = $value['CuisineName'];
												$food_type = $value['FoodTypeName'];
												$recipe_intro = $value['RecipeIntro'];

												$cnt_comment = $value['NumberOfComment'];
												$cnt_recook = $value['NumberOfRecook'];
												$cnt_view = $value['NumberOfView'];

												$flag_cookmark = $value['FlagCookmark'];
												$flag_recook = $value['FlagRecook'];
												$flag_creator = $value['FlagCreator'];

												loadSubview('recipe/public_profile_recipe', array(
													'recipe_id' => $id,
													'slug' => $slug,
													'image' => $image,
													'title' => $title,
													'cuisine' => $cuisine,
													'food_type' => $food_type,
													'recipe_intro' => $recipe_intro,
													'cnt_comment' => $cnt_comment,
													'cnt_recook' => $cnt_recook,
													'cnt_view' => $cnt_view,
													'flag_cookmark' => $flag_cookmark,
													'flag_recook' => $flag_recook,
													'flag_creator' => $flag_creator,
													'type' => 'primary',
												));
											}
										} else {
											echo tag('h4', 'Data tidak ditemukan');
										}
								?>
								</ul>
							</div>
							<div class="tab-pane" id="tabs-recook">
								<ul class="no-pd mt10">
								<?php
										if( !empty($valuesRecook) ) {
											foreach( $valuesRecook as $key => $value ) {
												$id = $value['RecipeID'];
												$slug = $value['Slug'];
												$image = $value['RecookPhoto'];
												$title = $value['RecipeName'];
												$cuisine = $value['CuisineName'];
												$food_type = $value['FoodTypeName'];
												$recipe_intro = $value['RecookDesc'];

												$cnt_comment = $value['NumberOfComment'];
												$cnt_recook = $value['NumberOfRecook'];
												$cnt_view = 0;

												$flag_cookmark = $value['FlagCookmark'];
												$flag_recook = $value['FlagRecook'];
												$flag_creator = $value['FlagCreator'];

												loadSubview('recipe/public_profile_recipe', array(
													'recipe_id' => $id,
													'slug' => $slug,
													'image' => $image,
													'title' => $title,
													'cuisine' => $cuisine,
													'food_type' => $food_type,
													'recipe_intro' => $recipe_intro,
													'cnt_comment' => $cnt_comment,
													'cnt_recook' => $cnt_recook,
													'cnt_view' => $cnt_view,
													'flag_cookmark' => $flag_cookmark,
													'flag_recook' => $flag_recook,
													'flag_creator' => $flag_creator,
													'type' => 'recook',
												));
											}
										} else {
											echo tag('h4', 'Data tidak ditemukan');
										}
								?>
								</ul>
							</div>
							<div class="tab-pane" id="tabs-cookmark">
								<ul class="no-pd mt10">
								<?php
										if( !empty($valuesCookmark) ) {
											foreach( $valuesCookmark as $key => $value ) {
												$id = $value['RecipeID'];
												$slug = $value['Slug'];
												$image = $value['PrimaryPhoto'];
												$title = $value['RecipeName'];
												$cuisine = $value['CuisineName'];
												$food_type = $value['FoodTypeName'];
												$recipe_intro = $value['RecipeIntro'];

												$cnt_comment = $value['NumberOfComment'];
												$cnt_recook = $value['NumberOfRecook'];
												$cnt_view = $value['NumberOfView'];

												$flag_cookmark = $value['FlagCookmark'];
												$flag_recook = $value['FlagRecook'];
												$flag_creator = $value['FlagCreator'];

												loadSubview('recipe/public_profile_recipe', array(
													'recipe_id' => $id,
													'slug' => $slug,
													'image' => $image,
													'title' => $title,
													'cuisine' => $cuisine,
													'food_type' => $food_type,
													'recipe_intro' => $recipe_intro,
													'cnt_comment' => $cnt_comment,
													'cnt_recook' => $cnt_recook,
													'cnt_view' => $cnt_view,
													'flag_cookmark' => $flag_cookmark,
													'flag_recook' => $flag_recook,
													'flag_creator' => $flag_creator,
													'type' => 'primary',
												));
											}
										} else {
											echo tag('h4', 'Data tidak ditemukan');
										}
								?>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<?php
							loadSubview('users/related_popular_users');
					?>
				</div>
			</div>
		</div>
	</div>
</div>