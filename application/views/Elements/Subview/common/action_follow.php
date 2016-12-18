<?php
		$user_id_viewer = isset( $user_id_viewer ) ? $user_id_viewer : false;
		$follow_status = isset( $follow_status ) ? $follow_status : false;
?>

<div class="wrapper-follow-button wrapper-ajax-link">
	<?php
			if( isset($alert) ) {
				echo $alert;
			}
			
			if( !isLoggedIn() ) {
	?>
				<a title="Follow" href="<?php echo $domain.'/users/login/'; ?>" class="ajax-modal">
					<button class="btn btn-orange follow-button" type="button">
						<span class="glyphicon glyphicon-plus"></span>
						Follow
					</button>
				</a>
	<?php
			} else if( $user_id_viewer != $this->session->userdata('userid') ) {

				if( $follow_status == '1' ) {
	?>
					<a title="Following" href="<?php echo $domain.'/users/unfollow/'.$user_id_viewer; ?>" class="ajax-link">
						<button class="btn btn-success following-button" type="button">
							<span class="glyphicon glyphicon-ok"></span>
							Following
						</button>
					</a>
	<?php
				} else {
	?>
					<a title="Follow" href="<?php echo $domain.'/users/follow/'.$user_id_viewer; ?>" class="ajax-link">
						<button class="btn btn-orange follow-button" type="button">
							<span class="glyphicon glyphicon-plus"></span>
							Follow
						</button>
					</a>
	<?php
				}
			}
	?>
</div>