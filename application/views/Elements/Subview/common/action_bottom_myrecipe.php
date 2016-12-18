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
			'class' => 'ml5 iconText'
		));
		$edit .= tag('span', 'Edit', array(
			'class' => 'ml5 iconText'
		));
		$delete .= tag('span', 'Delete', array(
			'class' => 'ml5 iconText'
		));
		$share .= tag('span', 'Share', array(
			'class' => 'ml5 mr10 iconText'
		));

		$url = $domain.'/resep-masak/'.$recipe_id.'/'.$slug;
?>

<div class="action-bottom mt15 tacenter">
	<?php
			echo tag('a', $view, array(
				'title' => 'Selengkapnya',
				'href' => $url,
				'class' => 'mr10',
			));
			echo tag('a', $edit, array(
				'title' => 'Edit',
				'href' => $domain.'/recipe/edit/'.$recipe_id.( !empty( $contest_id ) ? '/'.$contest_id : false ),
				'class' => 'mr10',
			));
			echo tag('a', $delete, array(
				'title' => 'Delete',
				'href' => $domain.'/recipe/delete/'.$recipe_id,
				'class' => 'mr10 ajax-link',
				'with-confirm' => "Yakin ingin menghapus?",
			));
	?>
			<a href="https://www.facebook.com/sharer/sharer.php?u=<?php echo urlencode($url); ?>&t=<?php echo $slug; ?>"
			   onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;"
			   target="_blank" title="Share on Facebook">
			   <?php echo $share; ?>
			</a>
</div>