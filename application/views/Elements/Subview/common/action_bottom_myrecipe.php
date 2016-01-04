<?php
		$view = tag('img', false, array(
			'src' => $domain.'/resources/icons/view.png',
		));
		$edit = tag('img', false, array(
			'src' => $domain.'/resources/icons/edit.png',
		));
		$delete = tag('img', false, array(
			'src' => $domain.'/resources/icons/delete.png',
		));
		$share = tag('img', false, array(
			'src' => $domain.'/resources/icons/facebook.png',
		));

		$view .= tag('span', 'Selengkapnya', array(
			'class' => 'ml5'
		));
		$edit .= tag('span', 'Edit', array(
			'class' => 'ml5'
		));
		$delete .= tag('span', 'Delete', array(
			'class' => 'ml5'
		));
		$share .= tag('span', 'Share', array(
			'class' => 'ml5 mr10'
		));

		$url = $domain.'/resep-masak/'.$recipe_id.'/'.$slug;
?>

<div class="action-bottom mt15 tacenter">
	<?php
			echo tag('a', $view, array(
				'href' => $url,
				'class' => 'mr10',
			));
			echo tag('a', $edit, array(
				'href' => $domain.'/recipe/edit/'.$recipe_id,
				'class' => 'mr10',
			));
			echo tag('a', $delete, array(
				'href' => $domain.'/recipe/delete/'.$recipe_id,
				'class' => 'mr10 ajax-link',
				'with-confirm' => "Yakin ingin menghapus?",
			));
			echo $share;
	?>
</div>