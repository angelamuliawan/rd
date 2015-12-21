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

<div class="row mb15 holder-template <?php echo $class; ?>">
	<div class="col-sm-1 col-xs-1 extra-small-width">
		<?php
				echo tag('label', ($counter+1), array(
					'class' => 'control-label template-order template-field'
				));
		?>
	</div>
	<div class="col-sm-7 col-xs-7 no-pd">
		<?php
				echo tag('textarea', set_value($step_name), array(
					'id' => 'FoodStepName'.$counter,
					'rows' => 4,
					'name' => $step_name,
					'class' => 'form-control mb5 inputField template-field',
					'placeholder' => 'Masukkan deskripsi langkah apa yang Anda lakukan pada tahap ini secara detil. Contoh: Tuangkan 100mg air ke dalam botol lalu kocok 5 kali.',
					'data-model' => 'FoodStepName',
				));
				echo form_error($step_name); 

				echo tag('input', false, array(
					'id' => 'imageStep'.$counter,
					'type' => 'file',
					'class' => 'inputField template-field',
					'match-name-with-id' => true,
					'name' => 'imageStep'.$counter,
					'data-model' => 'imageStep',
				));
				echo form_error('imageStep'.$counter); 

				// echo tag('a', 'Tambahkan foto pada langkah ini', array(
				// 	'class' => 'mt10',
				// 	'href' => '#',
				// ));
		?>
	</div>
</div>