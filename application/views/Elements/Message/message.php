<?php
		if( !empty($message) && !empty($status) ) {

			$valid = true;
			if( !empty($display_on_error) && $status == 'success' ) {
				$valid = false;
				echo tag('p', $status, array(
					'class' => 'hide',
					'id' => 'msg-status',
				));
			}

			if( !empty($valid) ) {
				$message_tag = tag('p', $message, array(
					'id' => 'msg-text',
				));
				$status_tag = tag('p', $status, array(
					'class' => 'hide',
					'id' => 'msg-status',
				));

				$alert_type = ( $status == 'error' ) ? 'alert-danger' : 'alert-success';
				$closeButton = tag('a', '&times', array(
					'href' => '#',
					'class' => 'close',
					'data-dismiss' => 'alert',
					'title' => 'Tutup',
				));

				echo tag('div', $closeButton.$message_tag.$status_tag, array(
					'class' => 'alert '.$alert_type
				));
			}
		}
?>