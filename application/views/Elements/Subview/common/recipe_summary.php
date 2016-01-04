<?php
		$_class = isset($_class) ? $_class : false;
		$icon = isset($icon) ? $icon : false;
		$value = isset($value) ? $value : false;
?>

<li class="no-ul-type <?php echo $_class; ?>">
	<?php
			echo tag('img', false, array(
				'src' => $domain.'/resources/icons/'.$icon,
				'wrapTag' => 'div',
				'wrapAttributes' => array(
					'class' =>'wrapper-icon',
				)
			));
			echo tag('span', $value, array(
				'wrapTag' => 'div',
				'wrapAttributes' => array(
					'class' =>'wrapper-description',
				)
			));
	?>
</li>