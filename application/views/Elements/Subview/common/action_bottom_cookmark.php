<?php
		$cookmark_id = isset($cookmark_id)?$cookmark_id:false;
		$recipe_id = isset($recipe_id)?$recipe_id:false;
		$flag_recook = isset($flag_recook)?$flag_recook:false;
		
		$recook = tag('img', false, array(
			'src' => $domain.'/resources/icons/retweet.png',
		));
		$share = tag('img', false, array(
			'src' => $domain.'/resources/icons/facebook.png',
		));
		$cookmark = tag('img', false, array(
			'src' => $domain.'/resources/icons/cookmark.png',
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
		$cookmark .= tag('span', 'Uncookmark', array(
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
			// bisa recook makanan yang sudah direcook ga ?
			if( !empty($flag_recook) ) {
				echo $recook;
			} else {
				echo tag('a', $recook, array(
					'class' => 'ajax-modal',
					'href' => $urlRecook,
				));
			}

			echo $share;
			echo tag('a', $cookmark, array(
				'class' => 'ajax-link',
				'href' => $domain.'/recipe/uncookmark_item/'.$recipe_id.'/'.$cookmark_id,
				'remove' => true,
			));
	?>
</div>