<?php
		loadSubview('header/search_box');
?>
<div class="container mt20">
	<div class="big-wrapper">
		<div class="row">
			<div class="col-sm-10">
				<div id="recook" class="wrapper-food-list-vertical">
					<div class="content with-border">
						<ul>
							<?php
									if( !empty($values) ) {
										foreach( $values as $key => $value ) {
											$image = $value['RecookPhoto'];
											$title = $value['RecipeName'];
											$recook_desc = $value['RecookDesc'];
											$cnt_comment = $value['NumberOfComment'];
											$date = $value['RecookDate'];

											loadSubview('recipe/item_recipe_recook', array(
												'image' => $image,
												'title' => $title,
												'recook_desc' => $recook_desc,
												'cnt_comment' => $cnt_comment,
												'date' => $date,
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