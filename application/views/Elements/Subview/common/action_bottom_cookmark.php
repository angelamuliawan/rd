<?php
		$recipe_id = isset( $recipe_id ) ? $recipe_id : false;
		$flag_recook = isset($flag_recook)?$flag_recook:false;
		
		$recook = tag('img', false, array(
			'src' => $domain.'/resources/icons/retweet.png',
		));
		$share = tag('img', false, array(
			'src' => $domain.'/resources/icons/facebook.png',
		));

		$textRecook = 'Recook';

		if( isLoggedIn() ) {
			if( !empty($flag_recook) ) {
				$textRecook = 'Recooked';
			}
		}

		$recook .= tag('span', $textRecook, array(
			'class' => 'ml5'
		));
		$share .= tag('span', 'Share', array(
			'class' => 'ml5 mr10'
		));

		$urlRecook = false;
		if( isLoggedIn() ) {
			$urlRecook = $domain.'/recipe/recook_item/'.$recipe_id;
		} else {
			$urlRecook = $urlCookmark = $domain.'/users/login';
		}
?>

<div class="action-bottom mt15 tacenter">
	<?php
			echo tag('a', $recook, array(
				'class' => 'ajax-modal',
				'href' => $urlRecook,
			));
			echo $share;
	?>
</div>