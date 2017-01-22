<?php
		$notif_id = isset( $notif_id ) ? $notif_id : false;
		$notif = isset( $notif ) ? $notif : false;
		$notif_date = isset( $notif_date ) ? $notif_date : false;
		$isRead = isset( $isRead ) ? $isRead : true;
		$notif_icon = isset( $notif_icon ) ? $notif_icon : true;
?>
<li class="<?php echo empty($isRead) ? 'new' : ''; ?>">
	<a href="<?php echo $domain.'/users/read_notification/'.$notif_id; ?>">
		<?php 
				echo tag('span', strip_tags($notif, '<b>'));
		?>
		<div style="height:40px;position:relative;">
			<?php
					echo $notif_icon;

					echo tag('span', timeAgoFormat($notif_date), array(
						'class' => 'notif-date pull-left',
						'wrapTag' => 'div',
						'wrapAttributes' => array(
							'style' => 'width:20%; height:auto; display:inline;',
						),
					));

					if( empty($isRead) ) {
						echo tag('span', lang('new'), array(
							'class' => 'pull-right label label-success mt20',
							'wrapTag' => 'div',
							'wrapAttributes' => array(
								'style' => 'width:80%; height:auto; display:inline;',
							),
						));
					}
			?>
		</div>
	</a>
</li>