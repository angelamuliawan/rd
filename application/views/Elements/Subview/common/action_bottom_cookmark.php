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
			'class' => 'ml5 iconText'
		));
		$share .= tag('span', 'Share', array(
			'class' => 'ml5 mr10 iconText'
		));
		$cookmark .= tag('span', 'Uncookmark', array(
			'class' => 'ml5 mr10 iconText'
		));

		$urlRecook = false;
		if( isLoggedIn() ) {
			$urlRecook = $domain.'/recipe/recook_item/'.$recipe_id;
		} else {
			$urlRecook = $urlCookmark = $domain.'/users/login';
		}

		$url = $domain.'/p/'.$recipe_id.'/'.$slug;
?>

<div class="action-bottom mt15 tacenter">
	<?php
			// bisa recook makanan yang sudah direcook ga ?
			if( !empty($flag_recook) ) {
				echo $recook;
			} else {
				echo tag('a', $recook, array(
					'title' => $textRecook,
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
			echo tag('a', $cookmark, array(
				'class' => 'ajax-link',
				'href' => $domain.'/recipe/uncookmark_item/'.$recipe_id.'/'.$cookmark_id,
				'remove' => true,
			));
	?>
</div>