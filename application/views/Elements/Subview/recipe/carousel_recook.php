<?php
		$recook_id = isset( $recook_id ) ? $recook_id : false;
		$recook_photo = isset( $recook_photo ) ? $recook_photo : false;

		$counter = isset( $counter ) ? $counter : false;
		$is_first_item = ( $counter == 0 ) ? 'active' : '';

		$path_image = '/resources/images/uploads/recipe/recook/thumbs/'.$recook_photo;
		$custom_image = $domain.$path_image;
		if( !file_exists( $webroot.$path_image ) ) {
			$custom_image = $domain.'/resources/images/default.png';
		}
?>
<div class="item <?php echo $is_first_item; ?>">
  	<div class="col-xs-6 item-recook">
  		<?php
  				echo tag('img', false, array(
  					'class' => 'img-responsive',
  					'src' => $custom_image,
  					'style' => 'width:86px; height:64px;',
  					'wrapTag' => 'a',
  					'wrapAttributes' => array(
  						'href' => $domain.'/recipe/view_recook_item/'.$recook_id,
  						'class' => 'ajax-modal',
  					)
  				));
  		?>
  	</div>
</div>