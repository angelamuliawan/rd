<?php
		loadSubview('header/search_box', array(
			'_with_text' => true
		));
?>
<div class="wrapper-banner hidden-print mt10">
	<div class="container">
		<?php
				echo tag('a', tag('img', false, array(
					'src' => $domain.'/resources/images/uploads/banner/banner.jpg',
					'style' => 'max-width: 100%',
				)), array(
					'href' => $domain.'/kontes-masak/1/lomba-masak-kreatif-berhadiah-microwave-oven-stand-mixer-blender',
				));
		?>
	</div>
</div>
<div class="container mt5">
	<div class="big-wrapper">
		<div class="row">
			<div class="col-sm-10">
				<div class="wrapper-food-list bg-white">
					<div class="header with-border">
						<?php
								echo tag('h3', 'Baru Dibuat', array(
									'class' => 'pull-left mt5 wrapper-text'
								));
								echo tag('a', 'Tampilkan Semua', array(
									'class' => 'btn btn-orange pull-right',
									'href' => $domain.'/recipe/find?Sorting=1',
									'role' => 'button'
								));
						?>
					</div>
					<div class="content with-border">
						<ul>
							<?php
									if( !empty($valuesNewRecipe) ) {
										foreach( $valuesNewRecipe as $key => $value ) {
											$id = $value['RecipeID'];
											$slug = $value['Slug'];
											$image = $value['PrimaryPhoto'];
											$title = $value['RecipeName'];
											$recipe_intro = $value['RecipeIntro'];
											$cnt_comment = $value['NumberOfComment'];
											$cnt_recook = $value['NumberOfRecook'];

											loadSubview('pages/item_recipe', array(
												'recipe_id' => $id,
												'slug' => $slug,
												'image' => $image,
												'title' => $title,
												'cnt_comment' => $cnt_comment,
												'cnt_recook' => $cnt_recook,
											));
										}
									} else {
										echo tag('h4', 'Recipe tidak tersedia', array(
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

				<div class="wrapper-food-list bg-white mt20">
					<div class="header with-border">
						<?php
								echo tag('h3', 'Resep Populer', array(
									'class' => 'pull-left mt5 wrapper-text'
								));
								echo tag('a', 'Tampilkan Semua', array(
									'class' => 'btn btn-orange pull-right',
									'href' => $domain.'/recipe/find?Sorting=2',
									'role' => 'button'
								));
						?>
					</div>
					<div class="content with-border">
						<ul>
							<?php
									if( !empty($valuesPopularRecipe) ) {
										foreach( $valuesPopularRecipe as $key => $value ) {
											$id = $value['RecipeID'];
											$slug = $value['Slug'];
											$image = $value['PrimaryPhoto'];
											$title = $value['RecipeName'];
											$recipe_intro = $value['RecipeIntro'];
											$cnt_comment = $value['NumberOfComment'];
											$cnt_recook = $value['NumberOfRecook'];

											loadSubview('pages/item_recipe', array(
												'recipe_id' => $id,
												'slug' => $slug,
												'image' => $image,
												'title' => $title,
												'cnt_comment' => $cnt_comment,
												'cnt_recook' => $cnt_recook,
											));
										}
									} else {
										echo tag('h4', 'Recipe tidak tersedia', array(
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
						// loadSubview('common/ads');
				?>
			</div>
		</div>
	</div>
</div>