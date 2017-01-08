<?php
		$notif_id = isset( $notif_id ) ? $notif_id : false;
		$notif = isset( $notif ) ? $notif : false;
		$notif_date = isset( $notif_date ) ? $notif_date : false;
		$isRead = isset( $isRead ) ? $isRead : true;
		$notif_icon = isset( $notif_icon ) ? $notif_icon : true;
?>
<li class="<?php echo empty($isRead) ? 'new' : ''; ?>">
	<a href="<?php echo $domain.'/users/read_notification/'.$notif_id; ?>">
		<div class="row">
			<div class="col-sm-12">
				<?php
						echo tag('p', $notif);

						echo $notif_icon;
						echo tag('span', timeAgoFormat($notif_date), array(
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