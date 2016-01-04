<?php
		$recipe_id = isset( $recipe_id ) ? $recipe_id : false;
		$flag_cookmark = isset($flag_cookmark)?$flag_cookmark:false;
		$flag_recook = isset($flag_recook)?$flag_recook:false;
		$flag_creator = isset($flag_creator)?$flag_creator:false;

		$recook = tag('img', false, array(
			'src' => $domain.'/resources/icons/retweet.png',
		));
		$share = tag('img', false, array(
			'src' => $domain.'/resources/icons/facebook.png',
		));
		$cookmark = tag('img', false, array(
			'src' => $domain.'/resources/icons/cookmark.png',
		));
		$print = tag('img', false, array(
			'src' => $domain.'/resources/icons/print.png',
		));

		$textRecook = 'Recook';
		$textCookmark = 'Cookmark';

		if( isLoggedIn() ) {
			if( !empty($flag_recook) ) {
				$textRecook = 'Recooked';
			}
			if( !empty($flag_creator) ) {
				$textCookmark = '';
			} else if( !empty($flag_cookmark) ) {
				$textCookmark = 'Uncookmark';
			}
		}

		$recook .= tag('span', $textRecook, array(
			'class' => 'ml5'
		));
		$share .= tag('span', 'Share', array(
			'class' => 'ml5 mr10'
		));
		$cookmark .= tag('span', $textCookmark, array(
			'class' => 'ml5 mr10'
		));
		$print .= tag('span', 'Print', array(
			'class' => 'ml5'
		));
		$_print = isset( $_print ) ? $_print : false;

		$urlRecook = false;
		$urlCookmark = false;
		if( isLoggedIn() ) {
			$urlRecook = $domain.'/recipe/recook_item/'.$recipe_id;
			$urlCookmark = $domain.'/recipe/cookmark_item/'.$recipe_id.'/'.$_print;
			
			if( !empty($flag_creator) ) {
				$cookmark = $recook = '';
			} else {
				if( empty($flag_cookmark) ) {
					$cookmark = tag('a', $cookmark, array(
						'href' => $urlCookmark,
						'class' => 'ajax-link',
					));
				} else {
					$cookmark = tag('a', $cookmark, array(
						'href' => $domain.'/recipe/uncookmark_item/'.$recipe_id.'/'.$flag_cookmark.'/'.$_print,
						'class' => 'ajax-link',
					));
				}
			}
		} else {
			$urlRecook = $urlCookmark = $domain.'/users/login';
			$cookmark = tag('a', $cookmark, array(
				'class' => 'ajax-modal',
				'href' => $urlCookmark,
			));
		}
?>

<div class="action-bottom mt15 tacenter wrapper-ajax-link">
	<?php
			// bisa recook makanan yang sudah direcook ga ?
			if( !empty($flag_recook) ) {
				echo $recook;
			} else if( empty($flag_creator) ) {
				echo tag('a', $recook, array(
					'class' => 'ajax-modal',
					'href' => $urlRecook,
				));
			}

			echo $share;
			echo $cookmark;

			if( !empty($_print) ) {
				echo tag('a', $print, array(
					'class' => 'btnPrint',
					'title' => 'Print Resep',
					'href' => '#',
				));
			}
	?>
</div>