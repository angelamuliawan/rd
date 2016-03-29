<?php
		$_class = isset($_class) ? $_class : false;
		$icon = isset($icon) ? $icon : false;
		$value = isset($value) ? $value : false;
		$style = isset($style) ? $style : false;
		$desc_style = isset($desc_style) ? $desc_style : false;
?>

<li style="<?php echo $style; ?>" class="no-ul-type <?php echo $_class; ?>">
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
					'style' => $desc_style,
				)
			));
	?>
</li>