<?php
		$edit = tag('img', false, array(
			'src' => $domain.'/resources/icons/edit.png',
		));
		$view = tag('img', false, array(
			'src' => $domain.'/resources/icons/view.png',
		));
		$share = tag('img', false, array(
			'src' => $domain.'/resources/icons/facebook.png',
		));

		$edit .= tag('span', 'Edit', array(
			'class' => 'ml5'
		));
		$view .= tag('span', 'Selengkapnya', array(
			'class' => 'ml5'
		));
		$share .= tag('span', 'Share', array(
			'class' => 'ml5 mr10'
		));

		$url = $domain.'/detail/'.$recipe_id.'/'.$slug;
?>

<div class="action-bottom mt15 tacenter">
	<?php
			echo tag('a', $edit, array(
				'href' => $domain.'/recipe/edit/'.$recipe_id,
				'class' => 'mr10',
			));
			echo tag('a', $view, array(
				'href' => $url,
				'class' => 'mr10',
			));
			echo $share;
	?>
</div>