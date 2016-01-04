<?php
		loadSubview('header/search_box');
?>

<div class="container mt20">
	<div class="big-wrapper">
		<div class="row">
			<div class="col-sm-10">
				<div id="cookmark" class="wrapper-food-list-vertical">
					<div class="content with-border">
						<ul>
							<?php
									if( !empty($values) ) {
										foreach( $values as $key => $value ) {
											$cookmark_id = $value['CookmarkID'];
											$id = $value['RecipeID'];
											$slug = $value['Slug'];
											$image = $value['PrimaryPhoto'];
											$title = $value['RecipeName'];
											$cuisine = $value['CuisineName'];
											$food_type = $value['FoodTypeName'];
											$recipe_intro = $value['RecipeIntro'];

											$cnt_comment = $value['NumberOfComment'];
											$cnt_recook = $value['NumberOfRecook'];

											$flag_recook = $value['FlagRecook'];
											
											$cooked_by_id = $value['UserID'];
											$cooked_by = $value['UserName'];

											loadSubview('recipe/item_recipe_cookmark', array(
												'cookmark_id' => $cookmark_id,
												'recipe_id' => $id,
												'slug' => $slug,
												'image' => $image,
												'title' => $title,
												'cuisine' => $cuisine,
												'food_type' => $food_type,
												'recipe_intro' => $recipe_intro,
												'cnt_comment' => $cnt_comment,
												'cnt_recook' => $cnt_recook,
												'flag_recook' => $flag_recook,
												'cooked_by_id' => $cooked_by_id,
												'cooked_by' => $cooked_by,
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
			<div class="col-sm-2">
				<?php
						loadSubview('common/ads');
				?>
			</div>
		</div>
	</div>
</div>