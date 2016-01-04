<?php
		loadSubview('header/search_box', array(
			'_class' => 'pd10'
		));
?>

<div class="container mt20">
	<div class="big-wrapper">
		<div class="row bg-white no-mg">
			<div class="col-sm-3 pd20">
				<form role="form" action="<?php echo $domain; ?>/recipe/find" method="GET" accept-charset="utf-8">
				 	<div class="form-group">
						<label for="txtKeyword">Kata Kunci</label>
						<?php
								echo tag('input', false, array(
									'id' => 'txtKeyword',
				    				'type' => 'text',
				    				'class' => 'form-control',
				    				'name' => 'keyword',
				    				'placeholder' => 'Ketik kata kunci masakan &hellip;',
				    				'value' => $this->input->get('keyword'),
				    				'maxlength' => 200,
				    			));
						?>
				  	</div>
				  	<div class="form-group">
						<label for="Composition">Bahan Baku</label>
						<?php
								echo tag('div', false, array(
									'class' => 'ms-custom form-control'
								));
								echo tag('input', false, array(
									'type' => 'hidden',
									'id' => 'hdnSuggestValue',
									'name' => 'hdnSuggestValue',
									'value' => $compositions,
								));
								echo tag('input', false, array(
									'type' => 'hidden',
									'id' => 'hdnSubmittedMsValue',
									'name' => 'hdnSubmittedMsValue',
									'value' => (isset($request['CompositionID'])? implode($request['CompositionID'], ','):false)
								));
						?>
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

											$id = $value['RecipeID'];
											$slug = $value['Slug'];
											$image = $value['PrimaryPhoto'];
											$title = $value['RecipeName'];
											$cuisine = $value['CuisineName'];
											$food_type = $value['FoodTypeName'];
											$recipe_intro = $value['RecipeIntro'];

											$cnt_comment = $value['NumberOfComment'];
											$cnt_recook = $value['NumberOfRecook'];

											$flag_cookmark = $value['FlagCookmark'];
											$flag_recook = $value['FlagRecook'];
											$flag_creator = $value['FlagCreator'];										

											loadSubview('recipe/item_recipe', array(
												'counter' => $key,
												'recipe_id' => $id,
												'slug' => $slug,
												'image' => $image,
												'title' => $title,
												'cuisine' => $cuisine,
												'food_type' => $food_type,
												'recipe_intro' => $recipe_intro,
												'cnt_comment' => $cnt_comment,
												'cnt_recook' => $cnt_recook,
												'flag_cookmark' => $flag_cookmark,
												'flag_recook' => $flag_recook,
												'flag_creator' => $flag_creator,
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
			<?php
					if( isset($totalRowData) && !empty($totalRowData) ) {

						$curPage = isset( $currentPage ) ? $currentPage : 1;
						$last_item = $curPage*10;
						if( $last_item > $totalRowData ) {
							$last_item = $totalRowData;
						} 
			?>
					<div class="col-sm-3 col-sm-offset-3">
						<?php
								echo tag( 'span', sprintf('%s - %s dari %s Resep', (($curPage-1)*10)+1, $last_item, $totalRowData) );
						?>
					</div>
					<div class="col-sm-6">
						<div class="wrapper-pagination taright">
							<ul class="pagination">
								<?php
										$query_string = $this->input->server('QUERY_STRING');
										$totalPage = ceil($totalRowData / 10);

										$first = 0;
										$last = $totalPage;

										echo tag('a', '&laquo;', array(
											'href' => $domain.'/recipe/find/1/?'.$query_string,
											'wrapTag' => 'li',
										));
										echo tag('a', '&lsaquo;', array(
											'href' => $domain.'/recipe/find/'.( ($curPage == 1 ) ? $curPage : ($curPage-1) ).'/?'.$query_string,
											'wrapTag' => 'li',
										));

										if( $totalPage > 5 ) {
											$first = $curPage - 2;
											$last = $curPage + 2;
											while( $first < 1 ) {
												$first++;
												$last++;
											}
											while( $last > $totalPage ) {
												$first--;
												$last--;
											}
										}

										for( $i = $first; $i < $last; $i++ ) {
											$_class = '';
											if( ($i+1) == $curPage ) {
												$_class = 'active';
											}
											echo tag('a', ($i+1), array(
												'href' => $domain.'/recipe/find/'.($i+1).'/?'.$query_string,
												'class' => $_class,
												'wrapTag' => 'li',
											));
										}

										echo tag('a', '&rsaquo;', array(
											'href' => $domain.'/recipe/find/'.( ($curPage == $totalPage ) ? $totalPage : ($curPage+1) ).'/?'.$query_string,
											'wrapTag' => 'li',
										));
										echo tag('a', '&raquo;', array(
											'href' => $domain.'/recipe/find/'.$totalPage.'/?'.$query_string,
											'wrapTag' => 'li',
										));
								?>
							</ul>
						</div>
					</div>
			<?php
					}
			?>
		</div>
	</div>
</div>