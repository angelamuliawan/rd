<div class="container">
	<div class="big-wrapper bg-white pd20">
		<?php
				echo tag('h2', 'Tulis Resep');
		?>
		<div class="wrapper-create-recipe">
			<form class="form-horizontal mt20" role="form" action="add" method="post" accept-charset="utf-8">
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
				    				'value' => set_value('RecipeName'),
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
								echo tag('textarea', set_value('RecipeIntro'), array(
				    				'rows' => 4,
				    				'class' => 'form-control',
				    				'name' => 'RecipeIntro',
				    			));
								echo form_error('RecipeIntro'); 
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
					<div class="col-sm-7">
						<?php
								echo form_dropdown('CuisineID', $cuisines, $request['CuisineID'], 'class="form-control"');
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
			  				echo tag('label', 'Bahan', array(
			  					'class' => 'col-sm-2 control-label',
			  				));
			  		?>
					<div class="col-sm-7 parent-template" model="FoodComposition">
						<?php
								loadSubview('recipe/custom_material', array(
									'type' => 'init'
								));
								
								$counter = 0;
								if( !empty($request['FoodComposition']) ) {
									
									foreach( $request['FoodComposition'] as $key => $value ) {
										$measure = $value['Measure'];
										$measure_size = $value['MeasureSizeID'];
										$composition = $value['CompositionID'];

										loadSubview('recipe/custom_material', array(
											'type' => 'load',
											'measure' => $measure,
											'measure_size' => $measure_size,
											'composition' => $composition,
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
									'type' => 'init'
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