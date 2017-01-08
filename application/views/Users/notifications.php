<div class="container bg-white">
	<div class="big-wrapper bg-white pd20">
		<?php
				if( isset($alert) ) {
					echo $alert;
				}
				echo tag('h2', lang('notification'));
		?>
	</div>
	<div class="wrapper-notification bg-white">
		<ul class="no-ul-type">
			<?php
					if( isset($values) && !empty($values) ) {
						foreach( $values as $value ) {
							$notif_id = $value['NotificationID'];
							$notif = translateNotification($value, $site_lang);
							$notif_date = $value['NotificationDate'];
							$isRead = $value['isRead'];
							$notif_icon = getNotificationIcon($value['NotificationCode']);

							loadSubview('users/item_notification', array(
								'notif_id' => $notif_id,
								'notif' => $notif,
								'notif_date' => $notif_date,
								'isRead' => $isRead,
								'notif_icon' => $notif_icon,
							));
						}
					} else {
						echo tag('h4', lang('data_not_available'), array(
							'wrapTag' => 'li',
						));
					}
			?>
		</ul>
	</div>
</div>