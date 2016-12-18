<form id="formRegister" role="form" action="users/register<?php echo isset($redirect_after) ? '?redirect_after='.$redirect_after : false; ?>" data-reload="true" class="ajax-form" method="post" accept-charset="utf-8">
	<?php
  			if( isset($alert) ) {
				echo $alert;
			}
  	?>
	<div class="form-group">
		<?php
				echo tag('label', sprintf('%s *', lang('fullname')), array(
					'for' => 'RegFullname',
					'class' => 'control-label',
				));
				echo tag('input', false, array(
					'type' => 'text',
					'name' => 'RegFullname',
					'maxlength' => 100,
					'value' => set_value('RegFullname'),
					'class' => 'form-control',
				));
				echo form_error('RegFullname');
		?>
  	</div>
  	<div class="form-group">
  		<?php
  				echo tag('label', 'Email *', array(
  					'for' => 'RegEmail',
  					'class' => 'control-label',
  				));
  				echo tag('input', false, array(
  					'type' => 'text',
  					'name' => 'RegEmail',
  					'maxlength' => 100,
  					'value' => set_value('RegEmail'),
  					'class' => 'form-control',
  				));
  				echo form_error('RegEmail');
  		?>
  	</div>
	<div class="form-group">
		<?php
  				echo tag('label', 'Password *', array(
  					'for' => 'RegPassword',
  					'class' => 'control-label',
  				));
  				echo tag('input', false, array(
  					'type' => 'password',
  					'name' => 'RegPassword',
  					'maxlength' => 20,
  					'value' => set_value('RegPassword'),
  					'class' => 'form-control',
  				));
  				echo form_error('RegPassword');
  		?>
    </div>
  	<div class="form-group mb40">
  		<?php
  				echo tag('input', false, array(
  					'type' => 'submit',
  					'value' => lang('register'),
  					'class' => 'btn btn-success full-width',
  				));
  		?>
    </div>
</form>