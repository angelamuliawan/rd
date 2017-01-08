<?php
		$valuesUserAccount = isset( $valuesUserAccount[0] ) ? $valuesUserAccount[0] : false;
		$user_id = isset( $valuesUserAccount['UserID'] ) ? $valuesUserAccount['UserID'] : false;
		$username = isset( $valuesUserAccount['UserName'] ) ? $valuesUserAccount['UserName'] : false;
		$description = isset( $valuesUserAccount['Description'] ) ? $valuesUserAccount['Description'] : false;

		$valuesUserFollowData = isset( $valuesUserFollowData[0] ) ? $valuesUserFollowData[0] : false;
		$total_followers = isset( $valuesUserFollowData['Follower'] ) ? $valuesUserFollowData['Follower'] : false;
		$total_following = isset( $valuesUserFollowData['Following'] ) ? $valuesUserFollowData['Following'] : false;
?>

<div class="container bg-white">
	<div id="wrapper-outer-profile" class="big-wrapper bg-white pd20" style="min-height:600px;">
		<div class="row">
			<div class="wrapper-profile">
				<div class="col-sm-3">
					<?php
							loadSubview('users/photo_profile', array(
								'_allow_upload' => false,
							));
					?>
				</div>
				<div class="col-sm-6" style="padding-left: 0;">
					<?php
							echo tag('h3', $username, array(
								'class' => 'mb10 ml10 desktop-only'
							));

							if( $description ) {
								echo tag('p', $description, array(
									'class' => 'mb10 ml10 desktop-only'
								));
							} else if ( $user_id == $this->session->userdata('userid') ) {
								echo tag('a', 'Tulis deskripsi diri', array(
									'href' => $domain.'/users',
									'class' => 'ml10 desktop-only'
								));
							}
					?>

					<div class="row follower-following-section">
						<div class="col-sm-6 col-xs-6 middle">
							<div class="tacenter">
								<span class="text-title">Followers</span>
								<p class="text-content">
									<?php
											echo tag('a', number_format($total_followers, 0, '.', ','), array(
												'href' => $domain.'/users/follower_list/'.$user_id_viewer,
												'class' => 'ajax-modal',
											));
									?>
								</p>
							</div>
						</div>
						<div class="col-sm-6 col-xs-6">
							<div class="tacenter">
								<span class="text-title">Following</span>
								<p class="text-content">
									<?php
											echo tag('a', number_format($total_following, 0, '.', ','), array(
												'href' => $domain.'/users/following_list/'.$user_id_viewer,
												'class' => 'ajax-modal',
											));
									?>
								</p>
							</div>
						</div>
					</div>

					<div id="profile-container" class="wrapper-right mt10">
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

<input type="hidden" id="userIdViewer" value="<?php echo $user_id_viewer; ?>" />