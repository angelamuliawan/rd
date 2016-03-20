<div class="container">
	<div class="big-wrapper bg-white pd20">
		<?php
				if( isset($alert) ) {
					echo $alert;
				}
				echo tag('h2', 'Reset Password', array(
					'class' => 'tacenter mb10',
				));
		?>
		<div class="wrapper-verify">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<form id="formVerify" role="form" method="post" accept-charset="utf-8">
						<?php
					  			if( isset($alert) ) {
									echo $alert;
								}
					  	?>
					  	<div class="form-group">
					  		<?php
					  				echo tag('label', 'Password Baru', array(
					  					'for' => 'NewPassword',
					  					'class' => 'control-label',
					  				));
					  				echo tag('input', false, array(
					  					'type' => 'password',
					  					'name' => 'NewPassword',
					  					'maxlength' => 100,
					  					'class' => 'form-control',
					  				));
					  				echo form_error('NewPassword');
					  		?>
					  	</div>
					  	<div class="form-group">
					  		<?php
					  				echo tag('label', 'Konfirmasi Password Baru', array(
					  					'for' => 'NewPasswordConfirmation',
					  					'class' => 'control-label',
					  				));
					  				echo tag('input', false, array(
					  					'type' => 'password',
					  					'name' => 'NewPasswordConfirmation',
					  					'maxlength' => 100,
					  					'class' => 'form-control',
					  				));
					  				echo form_error('NewPasswordConfirmation');
					  		?>
					  	</div>
					  	<div class="form-group mb40">
					  		<?php
					  				echo tag('input', false, array(
					  					'type' => 'submit',
					  					'value' => 'Reset Password',
					  					'class' => 'btn btn-success col-sm-12 col-xs-12',
					  				));
					  		?>
					    </div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>