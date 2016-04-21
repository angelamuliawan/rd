<div class="container mt5 bg-white">
	<div class="big-wrapper">
		<div class="row">
			<div class="col-sm-12">
				<div class="wrapper-food-list bg-white wrapper-recipe-contest">
					<?php
							echo tag('h2', $contest_name, array(
								'class' => 'mt10 tacenter'
							));
					?>
					<div class="content mt15">
						<ul id="form-target-holder">
							<?php
									if( !empty($valuesContestRecipe) ) {
										foreach( $valuesContestRecipe as $key => $value ) {
											$id = $value['RecipeID'];
											$title = $value['RecipeName'];
											$image = $value['PrimaryPhoto'];
											$slug = $value['Slug'];											
											$username = $value['UserName'];
											$user_id = $value['UserID'];

											loadSubview('recipe/item_recipe_contest', array(
												'recipe_id' => $id,
												'title' => $title,
												'image' => $image,
												'slug' => $slug,
												'username' => $username,
												'user_id' => $user_id,
											));
										}
									}
							?>
						</ul>
					</div>
				</div>
			</div>
			<form id="formLoadMore" selector-target="#form-target-holder" role="form" action="recipe/contest_recipe/<?php echo $contest_id; ?>" class="ajax-form tacenter mb20 disable-overlay ajax-load-more" method="post" accept-charset="utf-8">
				<?php
						echo tag('input', false, array(
							'type' => 'hidden',
							'name' => 'next_page',
							'value' => $page+1,
						));
						echo tag('input', false, array(
							'type' => 'Submit',
							'class' => 'hide',
						));
				?>
			</form>
		</div>
	</div>
</div>