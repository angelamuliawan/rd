<?php
		loadSubview('header/search_box');
?>

<div class="container mt20">
	<div class="big-wrapper">
		<div class="row">
			<div class="col-sm-10">
				<div id="my-recipe" class="wrapper-food-list-vertical">
					<div class="content with-border">
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

											$cnt_comment = $value['NumberOfComment'];
											$cnt_recook = $value['NumberOfRecook'];

											loadSubview('recipe/my_item_recipe', array(
												'recipe_id' => $id,
												'slug' => $slug,
												'image' => $image,
												'title' => $title,
												'cuisine' => $cuisine,
												'food_type' => $food_type,
												'recipe_intro' => $recipe_intro,
												'cnt_comment' => $cnt_comment,
												'cnt_recook' => $cnt_recook,
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
				<div class="wrapper-ads">
					<ul class="no-pd">
						<?php
								echo tag('img', false, array(
									'src' => $domain.'/resources/images/160x120.jpg',
									'wrapTag' => 'li',
									'wrapAttributes' => array(
										'class' => 'no-ul-type mb20',
									),
								));
								echo tag('img', false, array(
									'src' => $domain.'/resources/images/sample-ads.jpg',
									'wrapTag' => 'li',
									'wrapAttributes' => array(
										'class' => 'no-ul-type mb20',
									),
								));
								echo tag('img', false, array(
									'src' => $domain.'/resources/images/sample-ads.jpg',
									'wrapTag' => 'li',
									'wrapAttributes' => array(
										'class' => 'no-ul-type mb20',
									),
								));
						?>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>