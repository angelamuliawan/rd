<?php
		$type = !empty($type)?$type:'load';
		$class = '';

		$counter = isset($counter)?$counter:'';
		$step = !empty($step)?$step:false;
		$step_vid = !empty($step_vid)?$step_vid:false;

		$step_name = 'FoodProcess['.$counter.'][FoodStepName]';
		$step_video = 'FoodProcess['.$counter.'][FoodStepVideo]';
		// $step_sequence = 'FoodProcess['.$counter.'][FoodStepSequence]';

		if( $type == 'init' ) {
			$class = 'clone-template-step hide wrapper-template';
			$step_name = 'FoodStepName';
			$step_video = 'FoodStepVideo';
			// $step_sequence = 'FoodStepSequence';
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
					'placeholder' => 'Masukkan deskripsi langkah apa yang Anda lakukan pada tahap ini secara detil. Contoh: Tuangkan 100mg air ke dalam botol lalu kocok 5 kali.',
					'data-model' => 'FoodStepName',
					'maxlength' => 1200,
				));
				echo form_error($step_name);

				echo tag('input', false, array(
					'id' => 'FoodStepVideo'.$counter,
					'value' => ( !empty($step_vid) ) ? $step_vid : set_value($step_video),
					'name' => $step_video,
					'class' => 'form-control mb10 mt10 inputField template-field',
					'placeholder' => 'Masukkan URL video youtube (optional).',
					'data-model' => 'FoodStepVideo',
				));

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

				if( !empty($step_vid) ) {
					$videoID = getYoutubeIDFromURL($step_vid);
					if( isExistsYoutubeVideo($videoID) ) {
						echo tag('iframe', false, array(
							'width' => 258,
							'height' => 170,
							'src' => 'https://www.youtube.com/embed/'.$videoID,
							'frameborder' => 0,
							'allowfullscreen' => 'allowfullscreen',
							'wrapTag' => 'div',
							'wrapAttributes' => array(
								'class' => 'wrapper-video'
							),
						));
					}
					echo form_error($step_video);
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