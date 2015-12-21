<?php
		$_class = isset($_class)?$_class:'';
		$_with_text = isset($_with_text)?$_with_text:false;
?>

<div class="wrapper-background <?php echo $_class; ?>">
	<div class="container">
		<div class="search-box">
			<div class="row">
				<div class="col-sm-12">
					<div class="mt10 mb20 tacenter">
						<?php
								if( !empty($_with_text) ) {
									echo tag('h3', 'Cari Resep Terbaikmu Disini !');
									echo tag('p', 'Lebih dari 100.000 resep', array(
										'class' => 'mt10'
									));
								}
						?>
						<form role="form" action="<?php echo $domain; ?>/recipe/find" method="GET" accept-charset="utf-8">
							<div class="row">
								<div class="col-sm-2">
									<?php
											echo form_dropdown('CuisineID', $cuisines, (isset($request['CuisineID'])?$request['CuisineID']:false), 'class="form-control multiple-select" multiple="multiple"');
									?>
								</div>
								<div class="col-sm-2">
									<?php
											echo form_dropdown('FoodTypeID', $food_types, (isset($request['FoodTypeID'])?$request['FoodTypeID']:false), 'class="form-control multiple-select" multiple="multiple"');
									?>
								</div>
								<div class="col-sm-6">
									<?php
											echo tag('input', false, array(
							    				'type' => 'text',
							    				'class' => 'form-control',
							    				'name' => 'keyword',
							    				'value' => $this->input->get('keyword')
							    			));
									?>
								</div>
								<div class="col-sm-2">
									<input type="submit" class="btn btn-orange btn-block" value="Cari" />
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>