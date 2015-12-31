<?php
		$valuesUserAccount = isset( $valuesUserAccount[0] ) ? $valuesUserAccount[0] : false;
?>

<div class="container">
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
						  	<li class="active"><a href="#tabs-statistic">Statistik</a></li>
						  	<li><a href="#tabs-change-password">Kata Sandi</a></li>
						  	<li><a href="#tabs-account">Akun</a></li>
						</ul>

						<div class="tab-content pd15">
							<div class="tab-pane active" id="tabs-statistic">
								<?php
										echo tag('h2', 'Statistik');
										loadSubview('users/tabs/statistic');
								?>
							</div>
							<div class="tab-pane" id="tabs-change-password">
								<?php
										echo tag('h2', 'Kata Sandi');
										loadSubview('users/tabs/password');
								?>
							</div>
							<div class="tab-pane" id="tabs-account">
								<?php
										echo tag('h2', 'Akun');
										loadSubview('users/tabs/account');
								?>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>