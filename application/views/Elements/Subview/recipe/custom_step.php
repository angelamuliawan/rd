<?php
		$type = !empty($type)?$type:'load';
		$class = '';

		$counter = isset($counter)?$counter:'';
		$step = !empty($step)?$step:false;

		$step_name = 'FoodProcess['.$counter.'][FoodStepName]';

		if( $type == 'init' ) {
			$class = 'clone-template-step hide wrapper-template';
			$step_name = 'FoodStepName';
		}
?>

<div class="row mb15 list-step holder-template <?php echo $class; ?>">
	<div class="col-sm-1 col-xs-1 extra-small-width">
		<?php
				echo tag('label', ($counter+1), array(
					'class' => 'control-label template-order template-field'
				));
		?>
	</div>
	<div class="col-sm-7 col-xs-9 no-pd">
		<?php
				echo tag('textarea', ( !empty($step) ) ? $step : set_value($step_name), array(
					'id' => 'FoodStepName'.$counter,
					'rows' => 4,
					'name' => $step_name,
					'class' => 'form-control mb5 inputField template-field',
					'placeholder' => lang('example_step'),
					'data-model' => 'FoodStepName',
					'maxlength' => 1200,
				));
				echo form_error($step_name);

				if( isset($request['FoodProcess'][$counter]['FoodStepImage_preview']) ) {

					$path_image = '/resources/images/uploads/recipe/step/'.$request['FoodProcess'][$counter]['FoodStepImage_preview'];
					$custom_image = $domain.$path_image;

					if( file_exists( $webroot.$path_image ) ) {
						echo tag('img', false, array(
							'src' => $custom_image,
							'style' => 'width: 100%; max-width: 200px;',
						));
						echo tag('input', false, array(
							'type' => 'hidden',
							'name' => sprintf('FoodProcess[%s][FoodStepImage_preview]', $counter),
							'value' => $request['FoodProcess'][$counter]['FoodStepImage_preview'],
						));	
					}
				}

				echo tag('input', false, array(
					'id' => 'imageStep'.$counter,
					'type' => 'file',
					'class' => 'mt5 inputField template-field',
					'match-name-with-id' => true,
					'name' => 'imageStep'.$counter,
					'data-model' => 'imageStep',
				));
				echo form_error('imageStep'.$counter);
		?>
	</div>
	<div class="col-sm-3 col-xs-2">
		<div class="icon-holder">
			<?php
					$hideActionDelete = ' hide';
					if( $type == 'init' || ( $type == 'load' && !empty($counter) ) ) {
						$hideActionDelete = '';
					}

					echo tag('span', false, array(
						'class' => 'glyphicon glyphicon-trash reorder-data remove-data'.$hideActionDelete
					));
			?>
		</div>
	</div>
</div>