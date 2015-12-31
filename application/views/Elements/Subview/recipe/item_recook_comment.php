<?php
		$comment_username = isset($comment_username) ? $comment_username : false;
		$comment = isset($comment) ? $comment : false;
		$comment_time = isset($comment_time) ? $comment_time : false;
		$photo = isset($photo) ? $photo : false;
?>
<div class="media"> 
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
				));
				echo tag('p', $comment, array(
					'class' => 'tajustify comment',
					'style' => 'font-size: 13px;',
				));
				echo tag('p', $comment_time, array(
					'class' => 'taright',
					'style' => 'font-size: 13px;',
				));
		?>
	</div>
</div>