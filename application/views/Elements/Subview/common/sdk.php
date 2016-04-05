<?php
		if( isset($sdk) ) {
			if( $sdk['facebook'] ) {
				if( isset($sdk['facebook']['like_page']) ) {
					loadSubview('sdk/view/facebook/like_page');
				}
				if( isset($sdk['facebook']['like_share']) ) {
					loadSubview('sdk/view/facebook/like_share');
				}
			}
		}
?>