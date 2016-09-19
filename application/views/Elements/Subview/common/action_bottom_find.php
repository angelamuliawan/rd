<?php
		$recipe_id = isset( $recipe_id ) ? $recipe_id : false;
		$recook_id = isset( $recook_id ) ? $recook_id : false;
		$slug = isset( $slug ) ? $slug : false;
		$flag_cookmark = isset($flag_cookmark)?$flag_cookmark:false;
		$flag_recook = isset($flag_recook)?$flag_recook:false;
		$flag_creator = isset($flag_creator)?$flag_creator:false;

		$recook = tag('img', false, array(
			'src' => $domain.'/resources/icons/retweet.png',
			'disable_progressive' => true,
		));
		$share = tag('img', false, array(
			'src' => $domain.'/resources/icons/facebook.png',
			'disable_progressive' => true,
		));
		$cookmark = tag('img', false, array(
			'src' => $domain.'/resources/icons/cookmark.png',
			'disable_progressive' => true,
		));
		$print = tag('img', false, array(
			'src' => $domain.'/resources/icons/print.png',
			'disable_progressive' => true,
		));

		$textRecook = 'Recook';
		$textCookmark = 'Cookmark';

		if( isLoggedIn() ) {
			if( !empty($flag_recook) ) {
				$textRecook = 'Recooked';
				$recook = tag('img', false, array(
					'src' => $domain.'/resources/icons/retweet_o.png',
					'disable_progressive' => true,
				));
			}
			if( !empty($flag_creator) ) {
				$textCookmark = '';
			} else if( !empty($flag_cookmark) ) {
				$textCookmark = 'Uncookmark';
				$cookmark = tag('img', false, array(
					'src' => $domain.'/resources/icons/cookmark_o.png',
					'disable_progressive' => true,
				));
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
						'title' => $textCookmark,
						'href' => $urlCookmark,
						'class' => 'ajax-link',
					));
				} else {
					$cookmark = tag('a', $cookmark, array(
						'title' => $textCookmark,
						'href' => $domain.'/recipe/uncookmark_item/'.$recipe_id.'/'.$flag_cookmark.'/'.$_print,
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


		$url = $domain.'/resep-masak/'.$recipe_id.'/'.$slug;
		if( !empty($recook_id) ) {
			$url = $domain.'/recipe/view_recook/'.$recook_id.'/'.$slug;
		}
?>

<div class="action-bottom mt15 tacenter wrapper-ajax-link">
	<?php
			if( !empty($flag_recook) ) {
				echo tag('a', $recook, array(
					'title' => 'Recooked',
					'href' => '#',
					'style' => 'pointer-events:none;'
				));
			} else if( empty($flag_creator) ) {
				echo tag('a', $recook, array(
					'title' => 'Recook',
					'class' => 'ajax-modal',
					'href' => $urlRecook,
				));
			}
	?>
			
			<a href="https://www.facebook.com/sharer/sharer.php?u=<?php echo urlencode($url); ?>&t=<?php echo $slug; ?>"
			   onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;"
			   target="_blank" title="Share on Facebook">
			   <?php echo $share; ?>
			</a>
	<?php
			if( empty($recook_id) ) {
				echo $cookmark;
			}

			if( !empty($_print) ) {
				echo tag('a', $print, array(
					'class' => 'btnPrint',
					'title' => 'Print Resep',
					'href' => '#',
				));
			}
	?>
</div>