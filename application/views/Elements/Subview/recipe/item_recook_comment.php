<?php
		$user_id = isset($user_id) ? $user_id : false;
		$recook_comment_id = isset($recook_comment_id) ? $recook_comment_id : false;
		$comment_username = isset($comment_username) ? $comment_username : false;
		$comment = isset($comment) ? $comment : false;
		$comment_time = isset($comment_time) ? $comment_time : false;
		$photo = isset($photo) ? $photo : false;
?>
<div class="media wrapper-ajax-link"> 
	<div class="pull-left">
		<?php
				echo tag('img', false, array(
					'src' => $photo,
					'class' => 'media-object',
					'style' => 'width: 48px; height: 48px;',
					'wrapTag' => 'a',
					'wrapAttributes' => array(
						'href' => '#',
					),
				));
		?>
	</div>
	<div class="media-body" style="width:auto; padding-right:20px;">
		<?php
				echo tag('h4', $comment_username, array(
					'class' => 'media-heading fbold',
					'wrapTag' => 'a',
					'wrapAttributes' => array(
						'href' => $domain.'/users/profile/'.$user_id,
					),
				));
				echo tag('p', $comment, array(
					'class' => 'tajustify comment',
					'style' => 'font-size: 13px;',
				));
				
				if( $user_id == $this->session->userdata('userid') ) {
					echo tag('p', 'Delete', array(
						'style' => 'font-size:13px; opacity:0.8; color:#000000;',
						'wrapTag' => 'a',
						'wrapAttributes' => array(
							'class' => 'ajax-link pull-left',
							'with-confirm' => "Yakin ingin menghapus?",
							'href' => $domain.'/recipe/delete_recook_comment/'.$recook_comment_id,
						),
					));
				}

				echo tag('span', $comment_time, array(
					'class' => 'pull-right',
					'style' => 'font-size: 13px;',
				));
		?>
	</div>
</div>