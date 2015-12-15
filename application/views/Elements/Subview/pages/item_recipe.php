<?php
		$image = isset($image)?$image:false;
		$title = isset($title)?$title:false;
		$cntComment = isset($cntComment)?$cntComment:false;
		$cntRecook = isset($cntRecook)?$cntRecook:false;

		$iconComment = tag('img', false, array(
			'src' => $domain.'/resources/icons/comment_w.png',
		));
		$iconRecook = tag('img', false, array(
			'src' => $domain.'/resources/icons/retweet_w.png',
		));

		$totalComment = tag('span', $cntComment);
		$totalRecook = tag('span', $cntRecook);
?>
<li class="no-ul-type with-border">
	<?php
			echo tag('img', false, array(
				'src' => $domain.'/resources/images/food/'.$image,
				'wrapTag' => 'div',
				'wrapAttributes' => array(
					'class' => 'box-header',
				),
			));
			echo tag('h4', $title, array(
				'wrapTag' => 'div',
				'wrapAttributes' => array(
					'class' => 'box-content',
				),
			));
	?>
	<div class="box-footer bg-orange">
		<?php
				echo tag('div', $iconComment.$totalComment, array(
					'class' => 'pull-right mr5'
				));
				echo tag('div', $iconRecook.$totalRecook, array(
					'class' => 'pull-right mr10'
				));
		?>
	</div>
</li>