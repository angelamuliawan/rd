<?php
		if( !isMobile() ) {
			loadSubview('header/search_box', array(
				'_class' => 'pd10'
			));
		}
?>

<div class="container bg-white">
	<div class="big-wrapper">
		<div class="row bg-white no-mg">
			<div class="col-sm-3" style="padding: 20px 20px 0px;">
				<?php
						if( !isMobile() ) {
				?>
							<form class="desktop-only" role="form" action="<?php echo $domain; ?>/recipe/find" method="GET" accept-charset="utf-8">
							  	<div class="wrapper-adv-search">
								 	<div class="form-group autocomplete-small">
										<label for="txtKeyword">
											<?php
													echo lang('keyword');
											?>
										</label>
										<?php
												echo tag('input', false, array(
													'id' => 'txtKeyword',
								    				'type' => 'text',
								    				'class' => 'form-control autocomplete',
								    				'name' => 'keyword',
								    				'placeholder' => lang('type_search_keyword'). ' &hellip;',
								    				'value' => $this->input->get('keyword'),
								    				'maxlength' => 200,
								    				'autocomplete' => 'off',
								    				'data-class' => 'acpRecipe',
													'data-provide' => 'typeahead',
													'data-url' => $domain.'/ajax/list_recipe',
													'data-path' => 'resources/images/uploads/recipe/primary/thumbs/',
													'redirect-on-selected-path' => 'p/',
								    			));
										?>
								  	</div>
								  	<div class="form-group">
										<label for="Composition">
											<?php
													echo lang('composition');
											?>
										</label>
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
													'value' => (isset($request['CompositionID'])? implode($request['CompositionID'], ','):false),
												));
										?>
								  	</div>
									<div class="form-group">
										<label for="CuisineID">
											<?php
													echo lang('cuisine');
											?>
										</label>
										<?php
												echo form_dropdown('CuisineID', $cuisines, (isset($request['CuisineID'])?$request['CuisineID']:false), 'class="form-control multiple-select" multiple="multiple" whenNonSelected="'.lang('choose').'"');
										?>
									</div>
									<div class="form-group">
										<label for="FoodTypeID">
											<?php
													echo lang('cuisine_type');
											?>
										</label>
										<?php
												echo form_dropdown('FoodTypeID', $food_types, (isset($request['FoodTypeID'])?$request['FoodTypeID']:false), 'class="form-control multiple-select" multiple="multiple" whenNonSelected="'.lang('choose').'"');
										?>
									</div>
									<div class="form-group">
										<label for="FoodProcessID">
											<?php
													echo lang('cooking_process');
											?>
										</label>
										<?php
												echo form_dropdown('FoodProcessID', $food_process, (isset($request['FoodProcessID'])?$request['FoodProcessID']:false), 'class="form-control multiple-select" multiple="multiple" whenNonSelected="'.lang('choose').'"');
										?>
									</div>
									<div class="form-group">
										<label for="PriceRangeID">
											<?php
													echo lang('price_estimation');
											?>
										</label>
										<?php
												echo form_dropdown('PriceRangeID', $price_ranges, (isset($request['PriceRangeID'])?$request['PriceRangeID']:false), 'class="form-control multiple-select" multiple="multiple" whenNonSelected="'.lang('choose').'"');
										?>
									</div>
									<div class="form-group">
										<label for="EstPeopleID">
											<?php
													echo lang('people_estimation');
											?>
										</label>
										<?php
												echo form_dropdown('EstPeopleID', $estimation_peoples, (isset($request['EstPeopleID'])?$request['EstPeopleID']:false), 'class="form-control multiple-select" multiple="multiple" whenNonSelected="'.lang('choose').'"');
										?>
									</div>
									<div class="form-group">
										<label for="Sorting">
											<?php
													echo lang('sort_by');
											?>
										</label>
										<?php
												echo form_dropdown('Sorting', $sorts, (isset($request['Sorting'])?$request['Sorting']:false), 'class="form-control"');
										?>
									</div>
									<div class="form-group">
								  		<?php
								  				echo tag('button', lang('search'), array(
								  					'class' => 'btn btn-orange full-width with-loading',
								  					'type' => 'submit',
								  				));
								  		?>
								  	</div>
								</div>
							</form>
				<?php
						}
				?>
			</div>
			<div class="col-sm-9 no-pd">
				<div class="wrapper-food-list-vertical">
					<div class="content">
						<ul id="form-target-holder">
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

											$user_id = $value['UserID'];
											$username = $value['UserName'];

											$cnt_love = $value['NumberOfLove'];
											$cnt_comment = $value['NumberOfComment'];
											$cnt_recook = $value['NumberOfRecook'];
											$cnt_view = $value['NumberOfView'];

											$flag_love = $value['FlagLove'];
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
												'user_id' => $user_id,
												'username' => $username,
												'cnt_love' => $cnt_love,
												'cnt_comment' => $cnt_comment,
												'cnt_recook' => $cnt_recook,
												'cnt_view' => $cnt_view,
												'flag_love' => $flag_love,
												'flag_cookmark' => $flag_cookmark,
												'flag_recook' => $flag_recook,
												'flag_creator' => $flag_creator,
											));
										}
									}
							?>
						</ul>
					</div>
				</div>
			</div>
			<form id="formLoadMore" selector-target="#form-target-holder" role="form" action="recipe/find?<?php echo $param_get; ?>" class="ajax-form tacenter mb20 disable-overlay ajax-load-more" method="post" accept-charset="utf-8">
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

<?php
		if( isMobile() ) {
?>
			<div class="wrapper-adv-search-mobile">
				<div class="custom-navbar-header">
					<?php
							echo tag('div', 'Filter', array(
								'class' => 'left-side'
							));
							echo tag('span', false, array(
								'class' => 'glyphicon glyphicon-remove',
								'wrapTag' => 'div',
								'wrapAttributes' => array(
									'class' => 'right-side',
									'toggle-oveflow' => 'true',
									'toggle-on-click' => '.wrapper-adv-search-mobile',
								),
							));
					?>
				</div>

				<div class="row no-mg" style="padding: 20px 10px 35px;">
					<div class="col-sm-12">
						<form role="form" action="<?php echo $domain; ?>/recipe/find" method="GET" accept-charset="utf-8">
						 	<div class="form-group">
								<label for="txtKeyword">
									<?php
											echo lang('keyword');
									?>
								</label>
								<?php
										echo tag('input', false, array(
											'id' => 'txtKeyword',
						    				'type' => 'text',
						    				'class' => 'form-control',
						    				'name' => 'keyword',
						    				'placeholder' => lang('type_search_keyword') . ' &hellip;',
						    				'value' => $this->input->get('keyword'),
						    				'maxlength' => 200,
						    			));
								?>
						  	</div>
						  	<div class="form-group">
								<label for="Composition">
									<?php
											echo lang('composition');
									?>
								</label>
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
								<label for="CuisineID">
									<?php
											echo lang('cuisine');
									?>
								</label>
								<?php
										echo form_dropdown('CuisineID', $cuisines, (isset($request['CuisineID'])?$request['CuisineID']:false), 'class="form-control multiple-select" multiple="multiple" whenNonSelected="'.lang('choose').'"');
								?>
							</div>
							<div class="form-group">
								<label for="FoodTypeID">
									<?php
											echo lang('cuisine_type');
									?>
								</label>
								<?php
										echo form_dropdown('FoodTypeID', $food_types, (isset($request['FoodTypeID'])?$request['FoodTypeID']:false), 'class="form-control multiple-select" multiple="multiple" whenNonSelected="'.lang('choose').'"');
								?>
							</div>
							<div class="form-group">
								<label for="FoodProcessID">
									<?php
											echo lang('cooking_process');
									?>
								</label>
								<?php
										echo form_dropdown('FoodProcessID', $food_process, (isset($request['FoodProcessID'])?$request['FoodProcessID']:false), 'class="form-control multiple-select" multiple="multiple" whenNonSelected="'.lang('choose').'"');
								?>
							</div>
							<div class="form-group">
								<label for="PriceRangeID">
									<?php
											echo lang('price_estimation');
									?>
								</label>
								<?php
										echo form_dropdown('PriceRangeID', $price_ranges, (isset($request['PriceRangeID'])?$request['PriceRangeID']:false), 'class="form-control multiple-select" multiple="multiple" whenNonSelected="'.lang('choose').'"');
								?>
							</div>
							<div class="form-group">
								<label for="EstPeopleID">
									<?php
											echo lang('people_estimation');
									?>
								</label>
								<?php
										echo form_dropdown('EstPeopleID', $estimation_peoples, (isset($request['EstPeopleID'])?$request['EstPeopleID']:false), 'class="form-control multiple-select" multiple="multiple" whenNonSelected="'.lang('choose').'"');
								?>
							</div>
							<div class="form-group">
								<label for="Sorting">
									<?php
											echo lang('sort_by');
									?>
								</label>
								<?php
										echo form_dropdown('Sorting', $sorts, (isset($request['Sorting'])?$request['Sorting']:false), 'class="form-control"');
								?>
							</div>
							<div class="form-group">
						  		<?php
						  				echo tag('button', lang('search'), array(
						  					'class' => 'btn btn-orange full-width with-loading',
						  					'type' => 'submit',
						  				));
						  		?>
						  	</div>
						</form>
					</div>
				</div>
			</div>

			<div class="wrapper-search-icon-mobile mobile-only" toggle-oveflow="true" toggle-on-click=".wrapper-adv-search-mobile">
				<span class="glyphicon glyphicon-search"></span>
			</div>

<?php
		}
?>