<?php
		loadSubview('header/search_box', array(
			'_class' => 'pd10'
		));
?>

<div class="container bg-white">
	<div class="big-wrapper">
		<div class="row bg-white no-mg">
			<div class="col-sm-12 no-pd">
				<div id="contest" class="wrapper-food-list-vertical">
					<div class="content">
						<ul>
							<?php
									if( !empty($values) ) {
										foreach( $values as $key => $value ) {

											$id = $value['ContestID'];
											$slug = $value['Slug'];
											$image = $value['ContestBanner'];
											$title = $value['ContestName'];
											$short_desc = $value['ContestShortDesc'];
											$start_date = $value['ContestStartDate'];
											$end_date = $value['ContestEndDate'];
											$is_active = $value['isActive'];
											$cnt_recipe = $value['TotalRecipe'];

											loadSubview('recipe/item_contest', array(
												'counter' => $key,
												'contest_id' => $id,
												'slug' => $slug,
												'image' => $image,
												'title' => $title,
												'short_desc' => $short_desc,
												'start_date' => $start_date,
												'end_date' => $end_date,
												'is_active' => $is_active,
												'cnt_recipe' => $cnt_recipe,
											));
										}
									} else {
										echo tag('h4', 'Pencarian tidak ditemukan', array(
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
		</div>
	</div>
</div>