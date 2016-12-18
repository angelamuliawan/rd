<?php
		// $valuesUserAccount = isset( $valuesUserAccount[0] ) ? $valuesUserAccount[0] : false;
		// $user_id = isset( $valuesUserAccount['UserID'] ) ? $valuesUserAccount['UserID'] : false;
		// $username = isset( $valuesUserAccount['UserName'] ) ? $valuesUserAccount['UserName'] : false;
		// $description = isset( $valuesUserAccount['Description'] ) ? $valuesUserAccount['Description'] : false;

		// $valuesUserFollowData = isset( $valuesUserFollowData[0] ) ? $valuesUserFollowData[0] : false;
		// $total_followers = isset( $valuesUserFollowData['Follower'] ) ? $valuesUserFollowData['Follower'] : false;
		// $total_following = isset( $valuesUserFollowData['Following'] ) ? $valuesUserFollowData['Following'] : false;
?>

<div class="container bg-white">
	<div id="wrapper-outer-profile" class="big-wrapper bg-white pd20" style="min-height:600px;">
		<div class="row">
			<div class="wrapper-profile">
				<div class="col-sm-3">
					<?php
							// loadSubview('users/photo_profile', array(
							// 	'_allow_upload' => false,
							// ));
					?>
				</div>
				<div class="col-sm-6" style="padding-left: 0;">
					<?php
							// echo tag('h3', $username, array(
							// 	'class' => 'mb10 ml10 desktop-only'
							// ));

							// if( $description ) {
							// 	echo tag('p', $description, array(
							// 		'class' => 'mb10 ml10 desktop-only'
							// 	));
							// } else if ( $user_id == $this->session->userdata('userid') ) {
							// 	echo tag('a', 'Tulis deskripsi diri', array(
							// 		'href' => '#',
							// 		'class' => 'ml10 desktop-only'
							// 	));
							// }
					?>

					<div id="home-container" class="wrapper-right mt10">
				        <?php
				        		loadSubview('common/background_masker/timeline');
				        ?>
					</div>
				</div>
				<div class="col-sm-3">
					<?php
							loadSubview('users/related_popular_users');
					?>
				</div>
			</div>
		</div>
	</div>
</div>