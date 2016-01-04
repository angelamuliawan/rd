<div class="container">
	<div class="big-wrapper bg-white pd20">
		<?php
				if( isset($alert) ) {
					echo $alert;
				}
				echo tag('h2', 'Tulis Resep');
		?>
		<div class="wrapper-create-recipe">
			<form class="form-horizontal mt20" enctype="multipart/form-data" role="form" method="post" accept-charset="utf-8">
			  	<div class="form-group">
			  		<?php
			  				echo tag('label', 'Judul Resep', array(
			  					'for' => 'RecipeName',
			  					'class' => 'col-sm-2 control-label',
			  				));
			  		?>
				    <div class="col-sm-7">
				    	<?php
				    			echo tag('input', false, array(
				    				'type' => 'text',
				    				'class' => 'form-control',
				    				'name' => 'RecipeName',
				    				'placeholder' => 'contoh: Nasi Cumi Cabe Garam, etc',
				    				'maxlength' => 100,
				    				'value' => ( isset($request['RecipeName']) ? $request['RecipeName']: set_value('RecipeName') ),
				    			));
				    			echo form_error('RecipeName');
				    	?>
				    </div>
			  	</div>
				<div class="form-group">
					<?php
			  				echo tag('label', 'Cerita dibalik Resep', array(
			  					'for' => 'RecipeIntro',
			  					'class' => 'col-sm-2 control-label',
			  				));
			  		?>
					<div class="col-sm-7">
						<?php
								echo tag('textarea', ( isset($request['RecipeIntro']) ? $request['RecipeIntro']: set_value('RecipeIntro') ) , array(
				    				'rows' => 4,
				    				'class' => 'form-control',
				    				'name' => 'RecipeIntro',
				    				'maxlength' => 500,
				    			));
								echo form_error('RecipeIntro'); 
						?>
					</div>
				</div>
				<div class="form-group">
					<?php
			  				echo tag('label', 'Gambar Utama', array(
			  					'for' => 'PrimaryPhoto',
			  					'class' => 'col-sm-2 control-label',
			  				));
			  		?>
					<div class="col-sm-7">
						<?php
								if( isset($request['PrimaryPhoto_preview']) ) {
									$custom_image = $domain.'/resources/images/uploads/recipe/primary/'.$request['PrimaryPhoto_preview'];
									if( @getimagesize($custom_image) ) {
										echo tag('img', false, array(
											'src' => $domain.'/resources/images/uploads/recipe/primary/'.$request['PrimaryPhoto_preview'],
											'style' => 'width: 100%; max-width: 200px;',
										));
										echo tag('input', false, array(
											'type' => 'hidden',
											'name' => 'PrimaryPhoto_preview',
											'value' => $request['PrimaryPhoto_preview'],
										));
									}
								}
								echo tag('input', false, array(
									'type' => 'file',
									'name' => 'PrimaryPhoto',
								));
								echo form_error('PrimaryPhoto'); 
						?>
					</div>
				</div>
				<div class="form-group">
					<?php
			  				echo tag('label', 'Masakan', array(
			  					'for' => 'CuisineID',
			  					'class' => 'col-sm-2 control-label',
			  				));
			  		?>
					<div class="col-sm-3">
						<?php
								echo form_dropdown('CuisineID', $cuisines, (isset($request['CuisineID'])?$request['CuisineID']:false), 'id="ddlCuisine" max-selected="2" class="form-control multiple-select" multiple="multiple"');
								echo form_error('CuisineID'); 
						?>
					</div>
				</div>
				<div class="form-group">
					<?php
			  				echo tag('label', 'Jenis', array(
			  					'for' => 'FoodTypeID',
			  					'class' => 'col-sm-2 control-label',
			  				));
			  		?>
					<div class="col-sm-7">
						<?php
								echo form_dropdown('FoodTypeID', $food_types, $request['FoodTypeID'], 'class="form-control"');
						?>
					</div>
				</div>
				<div class="form-group">
					<?php
			  				echo tag('label', 'Proses Masak', array(
			  					'for' => 'FoodProcessID',
			  					'class' => 'col-sm-2 control-label',
			  				));
			  		?>
					<div class="col-sm-7">
						<?php
								echo form_dropdown('FoodProcessID', $food_process, $request['FoodProcessID'], 'class="form-control"');
						?>
					</div>
				</div>
				<div class="form-group">
					<?php
			  				echo tag('label', 'Estimasi Biaya', array(
			  					'for' => 'PriceRangeID',
			  					'class' => 'col-sm-2 control-label',
			  				));
			  		?>
					<div class="col-sm-7">
						<?php
								echo form_dropdown('PriceRangeID', $price_ranges, $request['PriceRangeID'], 'class="form-control"');
						?>
					</div>
				</div>
				<div class="form-group">
					<?php
			  				echo tag('label', 'Estimasi Orang', array(
			  					'for' => 'EstPeopleID',
			  					'class' => 'col-sm-2 control-label',
			  				));
			  		?>
					<div class="col-sm-7">
						<?php
								echo form_dropdown('EstPeopleID', $estimation_peoples, $request['EstPeopleID'], 'class="form-control"');
						?>
					</div>
				</div>
				<div class="form-group">
					<?php
			  				echo tag('label', 'Estimasi Waktu Membuat', array(
			  					'for' => 'EstTime',
			  					'class' => 'col-sm-2 control-label',
			  				));
			  		?>
					<div class="col-sm-2 inputNumberField">
						<div class="input-group">
							<?php
									echo tag('input', false, array(
					    				'type' => 'number',
					    				'class' => 'form-control',
					    				'name' => 'EstTime',
					    				'value' => ( isset($request['EstTime']) ? $request['EstTime']: set_value('EstTime') ),
					    			));
							?>
							<span class="input-group-addon">Menit</span>
						</div>
						<?php
								echo form_error('EstTime');
						?>
					</div>
				</div>
				<div class="form-group">
					<?php
			  				echo tag('label', 'Bahan', array(
			  					'class' => 'col-sm-2 control-label',
			  				));
			  		?>
					<div class="col-sm-7 parent-template" model="FoodComposition">
						<?php
								loadSubview('recipe/custom_material', array(
									'type' => 'init',
									'counter' => '',
								));
								
								$counter = 0;
								if( !empty($request['FoodComposition']) ) {
									
									foreach( $request['FoodComposition'] as $key => $value ) {
										$measure = $value['Measure'];
										$measure_size = $value['MeasureSizeID'];
										$composition = $value['CompositionName'];
										$composition_id = $value['CompositionID'];

										loadSubview('recipe/custom_material', array(
											'type' => 'load',
											'measure' => $measure,
											'measure_size' => $measure_size,
											'composition' => $composition,
											'composition_id' => $composition_id,
											'counter' => $counter,
										));
										$counter++;
									}
								} else {
									loadSubview('recipe/custom_material', array(
										'type' => 'load',
										'counter' => $counter,
									));
								}
						?>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-7 col-sm-offset-2 clone-button cpointer" data-clone="clone-template-material">
						<?php
								echo tag('span', false, array(
									'class' => 'glyphicon glyphicon-plus'
								));
								echo 'Tambah Bahan';
						?>
					</div>
				</div>
				<div class="form-group">
					<?php
							echo tag('label', 'Langkah', array(
								'class' => 'col-sm-2 control-label'
							));
					?>
					<div class="col-sm-7 parent-template" model="FoodProcess">
						<?php
								loadSubview('recipe/custom_step', array(
									'type' => 'init',
									'counter' => '',
								));

								$counter = 0;
								if( !empty($request['FoodProcess']) ) {
									foreach( $request['FoodProcess'] as $key => $value ) {
										$step = $value['FoodStepName'];
										
										loadSubview('recipe/custom_step', array(
											'type' => 'load',
											'step' => $step,
											'counter' => $counter,
										));
										$counter++;
									}
								} else {
									loadSubview('recipe/custom_step', array(
										'type' => 'load',
										'counter' => $counter,
									));
								}
						?>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-7 col-sm-offset-2 clone-button cpointer" data-clone="clone-template-step">
						<?php
								echo tag('span', false, array(
									'class' => 'glyphicon glyphicon-plus'
								));
								echo 'Tambah Langkah';
						?>
					</div>
				</div>
			  	<div class="form-group">
			  		<?php
			  				echo tag('button', 'Simpan Resep', array(
			  					'class' => 'btn btn-orange',
			  					'type' => 'submit',
			  					'wrapTag' => 'div',
			  					'wrapAttributes' => array(
			  						'class' => 'col-sm-offset-2 col-sm-2'
			  					)
			  				));
			  		?>
			  	</div>
			</form>
		</div>
	</div>
</div>