<?php
		$notif_id = isset( $notif_id ) ? $notif_id : false;
		$notif = isset( $notif ) ? $notif : false;
		$notif_date = isset( $notif_date ) ? $notif_date : false;
		$isRead = isset( $isRead ) ? $isRead : true;
?>
<li>
	<a href="<?php echo $domain.'/users/read_notification/'.$notif_id; ?>">
		<div class="row">
			<div class="col-sm-12">
				<?php
						echo tag('p', $notif, array(
							'class' => 'fbold'
						));
						echo tag('span', $notif_date, array(
							'class' => 'notif-date'
						));

						if( empty($isRead) ) {
							echo tag('span', 'Baru', array(
								'class' => 'label label-success ml5'
							));
						}

						echo tag('hr', false, array(
							'class' => 'separator'
						));
				?>
			</div>
		</div>
	</a>
</li>