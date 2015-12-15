<?php
		$message_tag = tag('p', $message, array(
			'id' => 'msg-text',
		));
		$status_tag = tag('p', $status, array(
			'id' => 'msg-status',
		));

		echo tag('div', $message_tag.$status_tag);
?>