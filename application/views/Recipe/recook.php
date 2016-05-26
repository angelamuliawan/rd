<?php
		loadSubview('header/search_box');
?>
<div class="container mt20">
	<div class="big-wrapper">
		<div class="row">
			<div class="col-sm-10">
				<div id="recook" class="wrapper-food-list-vertical">
					<div class="content with-border">
						<?php
								echo tag('h2', 'Recook', array(
									'class' => 'pd20 with-border-bottom	'
								));
						?>
						<ul>
							<?php
									if( !empty($values) ) {
										foreach( $values as $key => $value ) {
											$recipe_id = $value['RecipeID'];
											$recook_id = $value['RecookID'];
											$slug = $value['Slug'];
											$image = $value['RecookPhoto'];
											$title = $value['RecipeName'];
											$recook_desc = $value['RecookDesc'];
											$cnt_comment = $value['NumberOfComment'];
											$date = $value['RecookDate'];

											loadSubview('recipe/item_recipe_recook', array(
												'recipe_id' => $recipe_id,
												'recook_id' => $recook_id,
												'slug' => $slug,
												'image' => $image,
												'title' => $title,
												'recook_desc' => $recook_desc,
												'cnt_comment' => $cnt_comment,
												'date' => $date,
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