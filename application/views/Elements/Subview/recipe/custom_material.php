<?php
		$type = !empty($type)?$type:'load';
		$class = '';

		$counter = !empty($counter)?$counter:0;
		$measure = !empty($measure)?$measure:false;
		$measure_size = !empty($measure_size)?$measure_size:false;
		$composition = !empty($composition)?$composition:false;

		$measure_name = 'FoodComposition['.$counter.'][Measure]';
		$measure_size_name = 'FoodComposition['.$counter.'][MeasureSizeID]';
		$composition_name = 'FoodComposition['.$counter.'][CompositionID]';

		if( $type == 'init' ) {
			$class = 'clone-template-material hide wrapper-template';
			$measure_name = 'Measure';
			$measure_size_name = 'MeasureSizeID';
			$composition_name = 'CompositionID';
		}
?>
<div class="row mb15 list-material <?php echo $class; ?>">
	<div class="col-sm-1 col-xs-1 extra-small-width">
		<?php
				echo tag('label', ($counter+1), array(
					'class' => 'control-label template-order'
				));
		?>
	</div>
	<div class="col-sm-2 col-xs-2 no-pd">
		<?php
				echo form_input(array(
					'name' => $measure_name,
					'type' => 'text',
					'value' => set_value($measure_name),
					'class' => 'form-control inputField',
					'placeholder' => 'contoh: 100',
				));
				echo form_error($measure_name);
		?>
	</div>
	<div class="col-sm-3 col-xs-3">
		<?php
				echo form_dropdown($measure_size_name, $measure_sizes, $measure_size, 'class="form-control inputField"');
		?>
	</div>
	<div class="col-sm-3 col-xs-2 no-pd">
		<?php
				echo form_dropdown($composition_name, $compositions, $composition, 'class="form-control inputField"');
		?>
	</div>
	<div class="col-sm-3 col-xs-4">
		<div class="icon-holder">
			<?php
					echo tag('span', false, array(
						'class' => 'glyphicon glyphicon-circle-arrow-up'
					));
					echo tag('span', false, array(
						'class' => 'glyphicon glyphicon-circle-arrow-down'
					));

					if( $type == 'init' || ( $type == 'load' && !empty($counter) ) ) {
						echo tag('span', false, array(
							'class' => 'glyphicon glyphicon-trash'
						));
					}
			?>
		</div>
	</div>
</div>