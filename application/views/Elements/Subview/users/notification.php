<?php
		$notif_id = isset( $notif_id ) ? $notif_id : false;
		$notif = isset( $notif ) ? $notif : false;
		$notif_date = isset( $notif_date ) ? $notif_date : false;
?>
<li>
	<a href="<?php echo $domain.'/users/read_notification/'.$notif_id; ?>">
		<?php 
				echo tag('span', $notif, array(
					'class' => 'fbold',
				));
				echo tag('p', $notif_date);
		?>
	</a>
</li>