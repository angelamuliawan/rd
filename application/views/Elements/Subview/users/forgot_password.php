<form id="formForgotPassword" role="form" action="users/forgot_password" class="ajax-form" method="post" accept-charset="utf-8">
	<?php
  			if( isset($alert) ) {
				echo $alert;
			}

			echo tag('p', 'Masukkan alamat email Anda dan kami akan mengirimkan instruksi untuk mengganti password Anda.', array(
				'class' => 'tajustify',
				'wrapTag' => 'label',
			));
  	?>
  	<div class="form-group">
  		<?php
  				echo tag('label', 'Email', array(
  					'for' => 'ForgotEmail',
  					'class' => 'control-label',
  				));
  				echo tag('input', false, array(
  					'type' => 'text',
  					'name' => 'ForgotEmail',
  					'maxlength' => 100,
  					'value' => set_value('ForgotEmail'),
  					'class' => 'form-control',
  				));
  				echo form_error('ForgotEmail');
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