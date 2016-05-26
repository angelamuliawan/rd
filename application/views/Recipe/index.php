<div class="container">
	<div class="big-wrapper">
		<div class="row">
			<div class="col-sm-12">
				<div id="my-recipe" class="wrapper-food-list-vertical">
					<div class="content with-border">
						<?php
								echo tag('h2', 'Resep Saya', array(
									'class' => 'pd20 with-border-bottom	'
								));
						?>
						<ul>
							<?php
									if( !empty($values) ) {
										foreach( $values as $key => $value ) {
											$id = $value['RecipeID'];
											$slug = $value['Slug'];
											$image = $value['PrimaryPhoto'];
											$title = $value['RecipeName'];
											$cuisine = $value['CuisineName'];
											$food_type = $value['FoodTypeName'];
											$recipe_intro = $value['RecipeIntro'];
											$contest_id = $value['ContestID'];

											$cnt_comment = $value['NumberOfComment'];
											$cnt_recook = $value['NumberOfRecook'];
											$cnt_view = $value['NumberOfView'];;

											loadSubview('recipe/my_item_recipe', array(
												'recipe_id' => $id,
												'slug' => $slug,
												'image' => $image,
												'title' => $title,
												'cuisine' => $cuisine,
												'food_type' => $food_type,
												'recipe_intro' => $recipe_intro,
												'contest_id' => $contest_id,
												'cnt_comment' => $cnt_comment,
												'cnt_recook' => $cnt_recook,
												'cnt_view' => $cnt_view,
											));
										}
									} else {
										echo tag('h4', 'Data tidak ditemukan', array(
											'wrapTag' => 'li',
											'wrapAttributes' => array(
												'class' => 'no-border'
											)
										));
									}
							?>
						</ul>
					</div>
				</div>
			</div>
			<!-- <div class="col-sm-2">
				<?php
						loadSubview('common/ads');
				?>
			</div> -->
		</div>
	</div>
</div>