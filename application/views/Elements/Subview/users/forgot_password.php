<form id="formForgotPassword" role="form" action="users/forgot_password" class="ajax-form" method="post" accept-charset="utf-8">
	<?php
  			if( isset($alert) ) {
				echo $alert;
			}

			echo tag('p', lang('forgot_password_description'), array(
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
  					'class' => 'btn btn-success full-width',
  				));
  		?>
    </div>
</form>