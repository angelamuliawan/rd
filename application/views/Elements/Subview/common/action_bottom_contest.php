<?php
		$recipe_id = isset( $recipe_id ) ? $recipe_id : false;
		$slug = isset( $slug ) ? $slug : false;
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
			'class' => 'ml5 iconText'
		));
		$share .= tag('span', 'Share', array(
			'class' => 'ml5 mr10 iconText'
		));
		$cookmark .= tag('span', $textCookmark, array(
			'class' => 'ml5 mr10 iconText'
		));

		$urlRecook = false;
		$urlCookmark = false;
		if( isLoggedIn() ) {
			$urlRecook = $domain.'/recipe/recook_item/'.$recipe_id;
			$urlCookmark = $domain.'/recipe/cookmark_item/'.$recipe_id;
			
			if( !empty($flag_creator) ) {
				$cookmark = $recook = '';
			} else {
				if( empty($flag_cookmark) ) {
					$cookmark = tag('a', $cookmark, array(
						'title' => $textCookmark,
						'href' => $urlCookmark,
						'class' => 'ajax-link',
					));
				} else {
					$cookmark = tag('a', $cookmark, array(
						'title' => $textCookmark,
						'href' => $domain.'/recipe/uncookmark_item/'.$recipe_id.'/'.$flag_cookmark,
						'class' => 'ajax-link',
					));
				}
			}
		} else {
			$urlRecook = $urlCookmark = $domain.'/users/login';
			$cookmark = tag('a', $cookmark, array(
				'title' => 'Cookmark',
				'class' => 'ajax-modal',
				'href' => $urlCookmark,
			));
		}


		$url = $domain.'/p/'.$recipe_id.'/'.$slug;
?>

<div class="action-bottom mt15 tacenter wrapper-ajax-link">
	<?php
			// if( !empty($flag_recook) ) {
			// 	echo $recook;
			// } else if( empty($flag_creator) ) {
			// 	echo tag('a', $recook, array(
			// 		'title' => 'Recook',
			// 		'class' => 'ajax-modal',
			// 		'href' => $urlRecook,
			// 	));
			// }
	?>
			
			<a href="https://www.facebook.com/sharer/sharer.php?u=<?php echo urlencode($url); ?>&t=<?php echo $slug; ?>"
			   onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;"
			   target="_blank" title="Share on Facebook">
			   <?php echo $share; ?>
			</a>
	<?php
			// echo $cookmark;
	?>
</div>