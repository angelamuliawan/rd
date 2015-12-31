<?php
		$image = isset($image) ? $image : false;
		$username = isset($username) ? $username : false;
		$comment = isset($comment) ? $comment : false;
		$comment_date = isset($comment_date) ? $comment_date : false;
?>
<div class="media"> 
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
					'class' => 'tajustify comment',
					'style' => 'font-size:13px;'
				));
				echo tag('p', $comment_date, array(
					'class' => 'tajustify',
					'style' => 'font-size:13px; opacity:0.8;',
				));
		?>
	</div>
</div>