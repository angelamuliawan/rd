<?php
		$valuesUserAccount = isset( $valuesUserAccount[0] ) ? $valuesUserAccount[0] : false;
?>

<div class="container bg-white">
	<div class="big-wrapper bg-white pd20" style="min-height:500px;">
		<div class="row">
			<div class="wrapper-profile">
				<div class="col-sm-3">
					<?php
							loadSubview('users/photo_profile');
					?>
				</div>
				<div class="col-sm-9">
					<div class="wrapper-right">
						<ul class="nav nav-tabs">
							<?php
									echo tag('a', lang('account'), array(
										'href' => '#tabs-account',
										'wrapTag' => 'li',
										'wrapAttributes' => array(
											'class' => 'active',
										)
									));
									echo tag('a', lang('password'), array(
										'href' => '#tabs-change-password',
										'wrapTag' => 'li',
									));
							?>
						</ul>

						<div class="tab-content pd15">
							<div class="tab-pane active" id="tabs-account">
								<?php
										echo tag('h2', lang('account'));
										loadSubview('users/tabs/account');
								?>
							</div>
							<div class="tab-pane" id="tabs-change-password">
								<?php
										echo tag('h2', lang('password'));
										loadSubview('users/tabs/password');
								?>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>