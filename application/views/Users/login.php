<div class="container">
	<div class="big-wrapper bg-white pd20">
		<?php
				if( isset($alert) ) {
					echo $alert;
				}
				echo tag('h2', 'Login', array(
					'class' => 'tacenter mb10',
				));
		?>
		<div class="wrapper-login">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<?php
							loadSubview('users/login');
					?>

					<div class="wrapper-social">
						<div class="wrapper-facebook with-border">
							<a href="#" class="facebook-link">
								<?php
										echo tag('span', 'Sign in with Facebook', array(
											'class' => 'fbold',
											'wrapTag' => 'div',
											'wrapAttributes' => array(
												'class' => 'wrapper-inner',
											),
										));
								?>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>