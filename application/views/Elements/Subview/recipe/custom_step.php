<?php
		$type = !empty($type)?$type:'load';
		$class = '';

		$counter = !empty($counter)?$counter:0;
		$step = !empty($step)?$step:false;

		$step_name = 'FoodProcess['.$counter.'][FoodStepName]';

		if( $type == 'init' ) {
			$class = 'clone-template-step hide wrapper-template';
			$step_name = 'FoodStepName';
		}
?>

<div class="row mb15 <?php echo $class; ?>">
	<div class="col-sm-1 col-xs-1 extra-small-width">
		<?php
				echo tag('label', ($counter+1), array(
					'class' => 'control-label template-order'
				));
		?>
	</div>
	<div class="col-sm-7 col-xs-7 no-pd">
		<?php
				echo tag('textarea', set_value($step_name), array(
					'rows' => 4,
					'name' => $step_name,
					'class' => 'form-control mb5 inputField',
					'placeholder' => 'Masukkan deskripsi langkah apa yang Anda lakukan pada tahap ini secara detil. Contoh: Tuangkan 100mg air ke dalam botol lalu kocok 5 kali.',
				));
				echo form_error($step_name); 

				echo tag('a', 'Tambahkan foto pada langkah ini', array(
					'class' => 'mt10',
					'href' => '#',
				));
		?>
	</div>
</div>