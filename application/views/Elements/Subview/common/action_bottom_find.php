<?php
		$recipe_id = isset( $recipe_id ) ? $recipe_id : false;
		$recook_id = isset( $recook_id ) ? $recook_id : false;
		$slug = isset( $slug ) ? $slug : false;

		$show_recook_menu = isset($show_recook_menu)?$show_recook_menu:true;

		$flag_love = isset($flag_love)?$flag_love:false;
		$flag_cookmark = isset($flag_cookmark)?$flag_cookmark:false;
		$flag_recook = isset($flag_recook)?$flag_recook:false;
		$flag_creator = isset($flag_creator)?$flag_creator:false;

		$love = tag('img', false, array(
			'src' => $domain.'/resources/icons/love.png',
			'data-disable-progressive' => true,
			'class' => 'love-icon',
		));
		$recook = tag('img', false, array(
			'src' => $domain.'/resources/icons/retweet.png',
			'data-disable-progressive' => true,
		));
		$share = tag('img', false, array(
			'src' => $domain.'/resources/icons/facebook.png',
			'data-disable-progressive' => true,
		));
		$cookmark = tag('img', false, array(
			'src' => $domain.'/resources/icons/cookmark.png',
			'data-disable-progressive' => true,
		));
		$print = tag('img', false, array(
			'src' => $domain.'/resources/icons/print.png',
			'data-disable-progressive' => true,
		));

		$textRecook = 'Recook';
		$textCookmark = 'Cookmark';

		if( isLoggedIn() ) {

			if( !empty($flag_love) ) {
				$love = tag('img', false, array(
					'src' => $domain.'/resources/icons/love_r.png',
					'data-disable-progressive' => true,
					'style' => 'height: 20px;',
				));
			}

			if( !empty($flag_recook) ) {
				$textRecook = 'Recooked';
				$recook = tag('img', false, array(
					'src' => $domain.'/resources/icons/retweet_o.png',
					'data-disable-progressive' => true,
				));
			}

			if( !empty($flag_creator) ) {
				$textCookmark = '';
			} else if( !empty($flag_cookmark) ) {
				// $textCookmark = 'Uncookmark';
				$cookmark = tag('img', false, array(
					'src' => $domain.'/resources/icons/cookmark_o.png',
					'data-disable-progressive' => true,
				));
			}
		}

		$love .= tag('span', 'Love', array(
			'class' => 'ml5 mr10 iconText'
		));
		$recook .= tag('span', $textRecook, array(
			'class' => 'ml5 mr10 iconText'
		));
		$cookmark .= tag('span', $textCookmark, array(
			'class' => 'ml5 iconText'
		));
		$share .= tag('span', 'Share', array(
			'class' => 'iconText'
		));

		$print .= tag('span', 'Print', array(
			'class' => 'ml5 iconText'
		));
		$_print = isset( $_print ) ? $_print : false;

		$urlLove = false;
		$urlRecook = false;
		$urlCookmark = false;

		if( isLoggedIn() ) {
			$urlLove = $domain.'/recipe/love_item/'.$recipe_id.'/'.$_print;
			if( !empty($recook_id) ) {
				$urlLove = $domain.'/recipe/love_item_recook/'.$recook_id.'/'.$_print;
			}

			$urlRecook = $domain.'/recipe/recook_item/'.$recipe_id;
			$urlCookmark = $domain.'/recipe/cookmark_item/'.$recipe_id.'/'.$_print;

			if( empty($flag_love) ) {
				$love = tag('a', $love, array(
					'title' => 'Love',
					'href' => $urlLove,
					'class' => 'ajax-link',
				));
			} else {
				if( !empty($recook_id) ) {
					$love = tag('a', $love, array(
						'title' => 'Unlove',
						'href' => $domain.'/recipe/unlove_item_recook/'.$recook_id.'/'.$_print,
						'class' => 'ajax-link',
					));
				} else {
					$love = tag('a', $love, array(
						'title' => 'Unlove',
						'href' => $domain.'/recipe/unlove_item/'.$recipe_id.'/'.$_print,
						'class' => 'ajax-link',
					));
				}
			}
			
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
			$urlLove = $urlRecook = $urlCookmark = $domain.'/users/login';
			
			$love = tag('a', $love, array(
				'title' => 'Love',
				'class' => 'ajax-modal',
				'href' => $urlLove,
			));
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
			echo $love;

			if( $show_recook_menu ) {
				if( !empty($flag_recook) && empty($recook_id) ) {
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
			}

			if( empty($recook_id) ) {
				echo $cookmark;
			}
	?>

	<a href="https://www.facebook.com/sharer/sharer.php?u=<?php echo urlencode($url); ?>&t=<?php echo $slug; ?>"
	   onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;"
	   target="_blank" title="Share on Facebook">
	   <?php echo $share; ?>
	</a>
</div>