<?php
		$notif_id = isset( $notif_id ) ? $notif_id : false;
		$notif = isset( $notif ) ? $notif : false;
		$notif_date = isset( $notif_date ) ? $notif_date : false;
		$isRead = isset( $isRead ) ? $isRead : true;
?>
<li>
	<a href="<?php echo $domain.'/users/read_notification/'.$notif_id; ?>">
		<?php 
				echo tag('span', $notif, array(
					'class' => 'fbold',
				));
		?>
		<div style="height:40px;position:relative;">
			<?php
					echo tag('span', $notif_date, array(
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