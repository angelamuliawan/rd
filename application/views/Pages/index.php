<?php
		loadSubview('header/search_box', array(
			'_with_text' => true
		));
?>
<div class="container mt5 bg-white">
	<div class="big-wrapper">
		<div class="row">
			<div class="col-sm-10">
				<div class="wrapper-food-list cuisine bg-white">
					<div class="header">
						<?php
								echo tag('h3', lang('popular_cuisine'), array(
									'class' => 'pull-left mt5 wrapper-text'
								));
						?>
					</div>
					<div class="content">
						<ul>
							<?php
									if( !empty($valuesTopCuisine) ) {
										foreach( $valuesTopCuisine as $key => $value ) {
											$id = $value['CuisineID'];
											$name = $value['CuisineName'];
											$photo = $value['CuisinePhoto'];
											$cnt = $value['Total'];
											
											loadSubview('pages/item_cuisine', array(
												'cuisine_id' => $id,
												'cuisine_name' => $name,
												'image' => $photo,
												'cnt' => $cnt,
												'style' => 'height:170px; width: 100%;',
											));
										}
									} else {
										echo tag('h4', lang('data_not_available'), array(
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

				<div class="wrapper-food-list bg-white">
					<div class="header">
						<?php
								echo tag('h3', lang('latest_recipe'), array(
									'class' => 'pull-left mt5 wrapper-text'
								));
								echo tag('a', lang('show_all') .' '. tag('span', false, array('class' => 'glyphicon glyphicon-chevron-down')), array(
									'class' => 'btn btn-default pull-right',
									'href' => $domain.'/recipe/find?Sorting=1',
									'role' => 'button'
								));
						?>
					</div>
					<div class="content">
						<ul>
							<?php
									if( !empty($valuesNewRecipe) ) {
										foreach( $valuesNewRecipe as $key => $value ) {
											$id = $value['RecipeID'];
											$slug = $value['Slug'];
											$image = $value['PrimaryPhoto'];
											$title = $value['RecipeName'];
											$recipe_intro = $value['RecipeIntro'];

											$cnt_love = $value['NumberOfLove'];
											$cnt_comment = $value['NumberOfComment'];
											$cnt_recook = $value['NumberOfRecook'];
											$cnt_view = $value['NumberOfView'];

											loadSubview('pages/item_recipe', array(
												'recipe_id' => $id,
												'slug' => $slug,
												'image' => $image,
												'title' => $title,
												'cnt_love' => $cnt_love,
												'cnt_comment' => $cnt_comment,
												'cnt_recook' => $cnt_recook,
												'cnt_view' => $cnt_view,
											));
										}
									} else {
										echo tag('h4', lang('data_not_available'), array(
											'wrapTag' => 'li',
											'wrapAttributes' => array(
												'class' => 'no-border'
											)
										));
									}
							?>
						</ul>
					</div>
					<div class="header custom mobile-only">
						<?php
								echo tag('a', lang('show_all') .' '. tag('span', false, array('class' => 'glyphicon glyphicon-chevron-down')), array(
									'class' => 'btn btn-default full-width',
									'href' => $domain.'/recipe/find?Sorting=1',
									'role' => 'button',
								));
						?>
					</div>
				</div>

				<div class="wrapper-food-list bg-white mt20">
					<div class="header">
						<?php
								echo tag('h3', lang('popular_recipe'), array(
									'class' => 'pull-left mt5 wrapper-text'
								));
								echo tag('a', lang('show_all') .' '.tag('span', false, array('class' => 'glyphicon glyphicon-chevron-down')), array(
									'class' => 'btn btn-default pull-right',
									'href' => $domain.'/recipe/find?Sorting=2',
									'role' => 'button'
								));
						?>
					</div>
					<div class="content">
						<ul>
							<?php
									if( !empty($valuesPopularRecipe) ) {
										foreach( $valuesPopularRecipe as $key => $value ) {
											$id = $value['RecipeID'];
											$slug = $value['Slug'];
											$image = $value['PrimaryPhoto'];
											$title = $value['RecipeName'];
											$recipe_intro = $value['RecipeIntro'];

											$cnt_love = $value['NumberOfLove'];
											$cnt_comment = $value['NumberOfComment'];
											$cnt_recook = $value['NumberOfRecook'];
											$cnt_view = $value['NumberOfView'];

											loadSubview('pages/item_recipe', array(
												'recipe_id' => $id,
												'slug' => $slug,
												'image' => $image,
												'title' => $title,
												'cnt_love' => $cnt_love,
												'cnt_comment' => $cnt_comment,
												'cnt_recook' => $cnt_recook,
												'cnt_view' => $cnt_view,
											));
										}
									} else {
										echo tag('h4', lang('data_not_available'), array(
											'wrapTag' => 'li',
											'wrapAttributes' => array(
												'class' => 'no-border'
											)
										));
									}
							?>
						</ul>
					</div>
					<div class="header custom mobile-only">
						<?php
								echo tag('a', lang('show_all') .' '.tag('span', false, array('class' => 'glyphicon glyphicon-chevron-down')), array(
									'class' => 'btn btn-default full-width',
									'href' => $domain.'/recipe/find?Sorting=2',
									'role' => 'button',
								));
						?>
					</div>
				</div>
			</div>
			<div class="col-sm-2">
				<?php
						loadSubview('users/top_users', array(
							'heading' => lang('popular_chef'),
							'values' => $valuesPopularUser,
						));

						loadSubview('common/ads');
				?>
			</div>
		</div>
		<div class="row">
			<?php
					loadSubview('article/item_article');
			?>
		</div>
	</div>
</div>