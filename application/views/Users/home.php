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