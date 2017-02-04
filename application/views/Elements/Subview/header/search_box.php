<?php
		$_class = isset($_class)?$_class:'';
		$_with_text = isset($_with_text)?$_with_text:false;

		$header_img = $domain.'/resources/images/background/bg.jpg';
?>

<div class="wrapper-background hidden-print <?php echo $_class; ?>" data-src="<?php echo $header_img; ?>" data-is-progressive="1">
	<div class="container no-pd">
		<div class="search-box">
			<div class="row">
				<div class="col-sm-12">
					<div class="mt10 mb20">
						<?php
								if( !empty($_with_text) ) {
									echo tag('h3', sprintf('%s !', lang('find_best_recipe')), array(
										'wrapTag' => 'div',
										'wrapAttributes' => array(
											'class' => 'tacenter mb10'
										)
									));
								}
						?>
						<form role="form" action="<?php echo $domain; ?>/recipe/find" method="GET" accept-charset="utf-8">
							<div class="row row-centered">
								<div class="col-sm-2 col-xs-8 col-centered">
									<?php
											echo form_dropdown('CuisineID', $cuisines, (isset($request['CuisineID'])?$request['CuisineID']:false), 'class="form-control multiple-select" multiple="multiple" whenNonSelected="'.lang('cuisine').'"');
									?>
								</div>
								<div class="col-sm-2 col-xs-8 col-centered">
									<?php
											echo form_dropdown('FoodTypeID', $food_types, (isset($request['FoodTypeID'])?$request['FoodTypeID']:false), 'class="form-control multiple-select" multiple="multiple" whenNonSelected="'.lang('cuisine_type').'"');
									?>
								</div>
								<div class="col-sm-6 col-xs-8 col-centered">
									<?php
											echo tag('input', false, array(
							    				'type' => 'text',
							    				'class' => 'form-control autocomplete peventnone',
							    				'name' => 'keyword',
							    				'placeholder' => lang('type_search_keyword'). ' &hellip;',
							    				'value' => !empty( $this->input->get('keyword') ) ? htmlspecialchars(strip_tags($this->input->get('keyword')), ENT_QUOTES) : (isset( $request['RecipeName'] ) ? htmlspecialchars(strip_tags($request['RecipeName']), ENT_QUOTES) : false),
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
								<div class="col-sm-2 col-xs-8 col-centered">
									<?php
											echo tag('input', false, array(
												'type' => 'submit',
												'class' => 'btn btn-orange btn-block with-loading',
												'value' => lang('search'),
											));
									?>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>