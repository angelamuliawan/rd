<?php
		loadSubview('header/search_box', array(
			'_with_text' => true
		));
?>

<div class="container mt20">
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
											$image = $value['PrimaryPhoto'];
											$title = $value['RecipeName'];
											$recipe_intro = $value['RecipeIntro'];
											$cnt_comment = $value['NumberOfComment'];
											$cnt_recook = $value['NumberOfRecook'];

											loadSubview('pages/item_recipe', array(
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