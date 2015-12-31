<?php
		$recook_id = isset( $recook_id ) ? $recook_id : false;
		$recook_photo = isset( $recook_photo ) ? $recook_photo : false;

		$counter = isset( $counter ) ? $counter : false;
		$is_first_item = ( $counter == 0 ) ? 'active' : '';
?>
<div class="item <?php echo $is_first_item; ?>">
  	<div class="col-xs-6">
  		<?php
  				echo tag('img', false, array(
  					'class' => 'img-responsive',
  					'src' => $domain.'/resources/images/uploads/recipe/recook/'.$recook_photo,
  					'wrapTag' => 'a',
  					'wrapAttributes' => array(
  						'href' => $domain.'/recipe/view_recook_item/'.$recook_id,
  						'class' => 'ajax-modal',
  					)
  				));
  		?>
  	</div>
</div>