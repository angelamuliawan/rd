<?php
		loadSubview('header/search_box', array(
			'_class' => 'pd10'
		));
?>

<div class="container mt20">
	<div class="big-wrapper">
		<div class="row bg-white no-mg">
			<div class="col-sm-3 pd20">
				<form role="form" action="find" method="GET" accept-charset="utf-8">
				 	<div class="form-group">
						<label for="txtKeyword">Kata Kunci</label>
						<?php
								echo tag('input', false, array(
									'id' => 'txtKeyword',
				    				'type' => 'text',
				    				'class' => 'form-control',
				    				'name' => 'keyword',
				    				'value' => $this->input->get('keyword')
				    			));
						?>
				  	</div>
				  	<div class="form-group">
						<label for="txtRawMaterial">Bahan Baku</label>
						<input type="text" class="form-control" id="txtRawMaterial" name="CompositionID" placeholder="Bahan Baku">
				  	</div>
					<div class="form-group">
						<label for="CuisineID">Masakan</label>
						<?php
								echo form_dropdown('CuisineID', $cuisines, (isset($request['CuisineID'])?$request['CuisineID']:false), 'class="form-control multiple-select" multiple="multiple"');
						?>
					</div>
					<div class="form-group">
						<label for="FoodTypeID">Jenis</label>
						<?php
								echo form_dropdown('FoodTypeID', $food_types, (isset($request['FoodTypeID'])?$request['FoodTypeID']:false), 'class="form-control multiple-select" multiple="multiple"');
						?>
					</div>
					<div class="form-group">
						<label for="FoodProcessID">Proses Masak</label>
						<?php
								echo form_dropdown('FoodProcessID', $food_process, (isset($request['FoodProcessID'])?$request['FoodProcessID']:false), 'class="form-control multiple-select" multiple="multiple"');
						?>
					</div>
					<div class="form-group">
						<label for="PriceRangeID">Estimasi Biaya</label>
						<?php
								echo form_dropdown('PriceRangeID', $price_ranges, (isset($request['PriceRangeID'])?$request['PriceRangeID']:false), 'class="form-control multiple-select" multiple="multiple"');
						?>
					</div>
					<div class="form-group">
						<label for="EstPeopleID">Estimasi Orang</label>
						<?php
								echo form_dropdown('EstPeopleID', $estimation_peoples, (isset($request['EstPeopleID'])?$request['EstPeopleID']:false), 'class="form-control multiple-select" multiple="multiple"');
						?>
					</div>
					<div class="form-group">
						<label for="Sorting">Urutkan Berdasarkan</label>
						<?php
								echo form_dropdown('Sorting', $sorts, (isset($request['Sorting'])?$request['Sorting']:false), 'class="form-control"');
						?>
					</div>
					<div class="form-group">
				  		<?php
				  				echo tag('button', 'Cari', array(
				  					'class' => 'btn btn-orange full-width',
				  					'type' => 'submit',
				  				));
				  		?>
				  	</div>
				</form>
			</div>
			<div class="col-sm-9 no-pd">
				<div class="wrapper-food-list-vertical">
					<div class="content">
						<ul>
							<?php
									if( !empty($values) ) {
										foreach( $values as $key => $value ) {
											$image = $value['PrimaryPhoto'];
											$title = $value['RecipeName'];
											$cuisine = $value['CuisineName'];
											$food_type = $value['FoodTypeName'];
											$recipe_intro = $value['RecipeIntro'];

											$cnt_comment = $value['NumberOfComment'];
											$cnt_recook = $value['NumberOfRecook'];

											loadSubview('recipe/item_recipe', array(
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