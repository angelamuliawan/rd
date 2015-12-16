<?php
		if( isset($request) ) {
			// debug($request); die();
		}

		// debug($food_types); die();
?>

<div class="container">
	<div class="big-wrapper bg-white pd20">

		<?php
				echo tag('h2', 'Tulis Resep');
		?>
		<div class="wrapper-create-recipe">
			<form class="form-horizontal mt20" role="form" action="add" method="post" accept-charset="utf-8">
			  	<div class="form-group">
			    	<label for="RecipeName" class="col-sm-2 control-label">Judul Resep</label>
				    <div class="col-sm-7">
				      	<input type="text" class="form-control" name="RecipeName" placeholder="contoh: Nasi Cumi Cabe Garam, etc">
				      	<?php echo form_error('RecipeName'); ?>
				    </div>
			  	</div>
				<div class="form-group">
					<label for="RecipeIntro" class="col-sm-2 control-label">Cerita dibalik Resep</label>
					<div class="col-sm-7">
						<textarea rows="4" name="RecipeIntro" class="form-control"></textarea>
						<?php echo form_error('RecipeIntro'); ?>
					</div>
				</div>
				<div class="form-group">
					<label for="FoodTypeID" class="col-sm-2 control-label">Jenis</label>
					<div class="col-sm-7">
						<?php
								echo form_dropdown('FoodTypeID', $food_types, $request['FoodTypeID'], 'class="form-control"');
						?>
					</div>
				</div>
				<div class="form-group">
					<label for="FoodProcessID" class="col-sm-2 control-label">Proses Masak</label>
					<div class="col-sm-7">
						<?php
								echo form_dropdown('FoodProcessID', $food_process, $request['FoodProcessID'], 'class="form-control"');
						?>
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">Estimasi Biaya</label>
					<div class="col-sm-7">
						<?php
								echo form_dropdown('PriceRangeID', $price_ranges, $request['PriceRangeID'], 'class="form-control"');
						?>
					</div>
				</div>
				<div class="form-group">
					<label for="EstPeopleID" class="col-sm-2 control-label">Estimasi Orang</label>
					<div class="col-sm-7">
						<?php
								echo form_dropdown('EstPeopleID', $estimation_peoples, $request['EstPeopleID'], 'class="form-control"');
						?>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Bahan</label>
					<div class="col-sm-7 parent-template" model="FoodComposition">
						<div class="row mb15 list-material clone-template-material hide wrapper-template">
							<div class="col-sm-1 col-xs-1 extra-small-width">
								<label class="control-label template-order">1</label>
							</div>
							<div class="col-sm-2 col-xs-2 no-pd">
								<input name="Measure" type="text" class="form-control inputField" placeholder="contoh: 100" />
							</div>
							<div class="col-sm-3 col-xs-3">
								<?php
										echo form_dropdown('MeasureSizeID', $measure_sizes, false, 'class="form-control inputField"');
								?>
							</div>
							<div class="col-sm-3 col-xs-2 no-pd">
								<?php
										echo form_dropdown('CompositionID', $compositions, false, 'class="form-control inputField"');
								?>
							</div>
							<div class="col-sm-3 col-xs-4">
								<div class="icon-holder">
									<span class="glyphicon glyphicon-circle-arrow-up"></span>
									<span class="glyphicon glyphicon-circle-arrow-down"></span>
									<span class="glyphicon glyphicon-trash"></span>
								</div>
							</div>
						</div>

						<?php
								if( !empty($request['FoodComposition']) ) {
									$counter = 0;
									foreach( $request['FoodComposition'] as $key => $value ) {
										$measure = $value['Measure'];
										$measure_size = $value['MeasureSizeID'];
										$composition = $value['CompositionID'];
									?>
										<div class="row mb15 list-material">
											<div class="col-sm-1 col-xs-1 extra-small-width">
												<label class="control-label template-order"><?php echo ($counter+1); ?></label>
											</div>
											<div class="col-sm-2 col-xs-2 no-pd">
												<?php
														echo form_input(array(
															'name' => 'FoodComposition['.$counter.'][Measure]',
															'type' => 'text',
															'value' => $measure,
															'class' => 'form-control inputField',
															'placeholder' => 'contoh: 100',
														));
												?>
											</div>
											<div class="col-sm-3 col-xs-3">
												<?php
														echo form_dropdown('FoodComposition['.$counter.'][MeasureSizeID]', $measure_sizes, $measure_size, 'class="form-control inputField"');
												?>
											</div>
											<div class="col-sm-3 col-xs-2 no-pd">
												<?php
														echo form_dropdown('FoodComposition['.$counter.'][CompositionID]', $compositions, $composition, 'class="form-control inputField"');
												?>
											</div>
											<div class="col-sm-3 col-xs-4">
												<div class="icon-holder">
													<span class="glyphicon glyphicon-circle-arrow-up"></span>
													<span class="glyphicon glyphicon-circle-arrow-down"></span>
													<span class="glyphicon glyphicon-trash"></span>
												</div>
											</div>
										</div>
									<?php
										$counter++;
									}
								}
						?>
					</div>
					<div class="form-group">
						<div class="col-sm-2 col-sm-offset-2 extra-margin clone-button cpointer" data-clone="clone-template-material">
							<span class="glyphicon glyphicon-plus"></span>
							Tambah Bahan
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Langkah</label>
					<div class="col-sm-7 parent-template" model="FoodProcess">
						<div class="row mb15 clone-template-step hide wrapper-template">
							<div class="col-sm-1 col-xs-1 extra-small-width">
								<label class="control-label template-order">No.</label>
							</div>
							<div class="col-xs-7 no-pd">
								<textarea rows="4" name="FoodStepName" class="form-control mb5 inputField" placeholder="Masukkan deskripsi langkah apa yang Anda lakukan pada tahap ini secara detil. Contoh: Tuangkan 100mg air ke dalam botol lalu kocok 5 kali."></textarea>
								<a class="mt10" href="#">Tambahkan foto pada langkah ini</a>
							</div>
						</div>
						<?php
								if( !empty($request['FoodProcess']) ) {
									$counter = 0;
									foreach( $request['FoodProcess'] as $key => $value ) {
										$step = $value['FoodStepName'];
									?>
										<div class="row mb15">
											<div class="col-sm-1 col-xs-1 extra-small-width">
												<label class="control-label"><?php echo ($counter+1); ?></label>
											</div>
											<div class="col-sm-7 col-xs-7 no-pd">
												<?php
														echo tag('textarea', $step, array(
															'rows' => 4,
															'name' => 'FoodProcess['.$counter.'][FoodStepName]',
															'class' => 'form-control mb5 inputField',
															'placeholder' => 'Masukkan deskripsi langkah apa yang Anda lakukan pada tahap ini secara detil. Contoh: Tuangkan 100mg air ke dalam botol lalu kocok 5 kali.',
														));
												?>
												<a class="mt10" href="#">Tambahkan foto pada langkah ini</a>
											</div>
										</div>
									<?php
										$counter++;
									}
								}
						?>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-7 col-sm-offset-2 clone-button cpointer" data-clone="clone-template-step">
						<span class="glyphicon glyphicon-plus"></span>
						Tambah Langkah
					</div>
				</div>
			  	<div class="form-group">
			    	<div class="col-sm-offset-2 col-sm-2">
			      		<button type="submit" class="btn btn-orange">Simpan Resep</button>
			    	</div>
			  	</div>
			</form>
		</div>
	</div>
</div>