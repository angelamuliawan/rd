<?php
		$type = !empty($type)?$type:'load';
		$class = '';
		$model = 'FoodComposition';

		$counter = isset($counter)?$counter:'';
		$measure = !empty($measure)?$measure:false;
		$measure_size = !empty($measure_size)?$measure_size:false;
		$composition = !empty($composition)?$composition:false;

		$measure_name = $model.'['.$counter.'][Measure]';
		$measure_size_name = $model.'['.$counter.'][MeasureSizeID]';
		$composition_name = $model.'['.$counter.'][CompositionName]';
		$composition_id_name = $model.'['.$counter.'][CompositionID]';

		if( $type == 'init' ) {
			$class = 'clone-template-material hide wrapper-template';
			$measure_name = 'Measure';
			$measure_size_name = 'MeasureSizeID';
			$composition_name = 'CompositionName';
			$composition_id_name = 'CompositionID';
		}
?>
<div class="row mb15 list-material holder-template <?php echo $class; ?>">
	<div class="col-sm-1 col-xs-1 extra-small-width">
		<?php
				echo tag('label', ($counter+1), array(
					'class' => 'control-label template-order template-field'
				));
		?>
	</div>
	<div class="col-sm-2 col-xs-2 no-pd">
		<?php
				echo form_input(array(
					'id' => 'txtMeasure',
					'name' => $measure_name,
					'type' => 'text',
					'value' => ( !empty($measure) ) ? $measure : set_value($measure_name),
					'class' => 'form-control inputField template-field freeField',
					'placeholder' => 'contoh: 100',
					'data-model' => 'Measure',
					( $measure_size == 10 && $type == 'load' ) ? 'disabled' : 'false',
				));
				echo form_error($measure_name);
		?>
	</div>
	<div class="col-sm-3 col-xs-3 custom-field">
		<?php
				echo form_dropdown($measure_size_name, $measure_sizes, $measure_size, 'id="ddlMeasureSize" class="form-control inputField"');
		?>
	</div>
	<div class="col-sm-3 col-xs-2 no-pd custom-field">
		<?php
				echo form_input(array(
					'id' => 'Composition'.$counter,
					'name' => $composition_name,
					'data-class' => 'acpComposition',
					'type' => 'text',
					'data-provide' => 'typeahead',
					'data-url' => $domain.'/ajax/list_composition',
					'value' => ( !empty($composition) ) ? $composition : set_value($composition_name),
					'class' => 'form-control inputField autocomplete template-field',
					'autocomplete' => 'off',
					'data-model' => 'CompositionName',
					'maxlength' => 100,
				));
				echo form_error($composition_name);
		
				echo tag('input', false, array(
					'type' => 'hidden',
					'id' => 'hdnFieldComposition'.$counter,
					'class' => 'inputField template-field',
					'name' => $composition_id_name,
					'value' => ( !empty($composition_id) ) ? $composition_id : set_value($composition_id_name),
					'data-model' => 'CompositionID',
				));
		?>
	</div>
	<div class="col-sm-3 col-xs-4">
		<div class="icon-holder">
			<?php
					$hideActionDelete = ' hide';
					if( $type == 'init' || ( $type == 'load' && !empty($counter) ) ) {
						$hideActionDelete = '';
					}

					echo tag('span', false, array(
						'class' => 'glyphicon glyphicon-circle-arrow-up reorder-data move-data-up'
					));
					echo tag('span', false, array(
						'class' => 'glyphicon glyphicon-circle-arrow-down reorder-data move-data-down'
					));
					echo tag('span', false, array(
						'class' => 'glyphicon glyphicon-trash reorder-data remove-data'.$hideActionDelete
					));
			?>
		</div>
	</div>
</div>