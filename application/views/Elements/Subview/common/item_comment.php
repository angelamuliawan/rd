<?php
		$image = isset($image) ? $image : false;
		$user_id = isset($user_id) ? $user_id : false;
		$username = isset($username) ? $username : false;
		$comment = isset($comment) ? $comment : false;
		$comment_id = isset($comment_id) ? $comment_id : false;
		$comment_date = isset($comment_date) ? $comment_date : false;
?>
<div class="media wrapper-ajax-link"> 
	<div class="pull-left">
		<?php
				echo tag('img', false, array(
					'src' => $image,
					'class' => 'media-object',
					'style' => 'width: 64px; height: 64px;',
					'wrapTag' => 'a',
					'wrapAttributes' => array(
						'href' => '#',
					),
				));
		?>
	</div>
	<div class="media-body">
		<?php
				echo tag('h4', $username, array(
					'class' => 'media-heading fbold',
				));
				echo tag('p', $comment, array(
					'class' => 'tajustify comment wrapper-comment',
					'style' => 'font-size:13px;'
				));

				if( $user_id == $this->session->userdata('userid') ) {
					echo tag('span', 'Delete', array(
						'style' => 'font-size:13px; opacity:0.8; color:#000000;',
						'wrapTag' => 'a',
						'wrapAttributes' => array(
							'class' => 'ajax-link',
							'with-confirm' => "Yakin ingin menghapus?",
							'href' => $domain.'/recipe/delete_recipe_comment/'.$comment_id,
						),
					));
					echo tag('span', '&middot;', array(
						'style' => 'margin: auto 8px;'
					));
				}

				echo tag('span', $comment_date, array(
					'class' => 'tajustify',
					'style' => 'font-size:13px; opacity:0.8;',
				));
		?>
	</div>
</div>