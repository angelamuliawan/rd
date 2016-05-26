<div class="container">
	<div class="big-wrapper bg-white pd20">
		<?php
				if( isset($alert) ) {
					echo $alert;
				}
				echo tag('h2', 'Lupa Password', array(
					'class' => 'tacenter mb10',
				));
		?>
		<div class="wrapper-forgot-password">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<?php
							loadSubview('users/forgot_password');
					?>
				</div>
			</div>
		</div>
	</div>
</div>