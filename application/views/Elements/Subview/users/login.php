<form id="formLogin" role="form" action="users/login" data-reload="true" class="ajax-form" method="post" accept-charset="utf-8">
  	<?php
  			if( isset($alert) ) {
				echo $alert;
			}
  	?>
  	<div class="form-group">
  		<?php
  				echo tag('label', 'Email', array(
  					'for' => 'email',
  					'class' => 'control-label',
  				));
  				echo tag('input', false, array(
  					'type' => 'text',
  					'name' => 'email',
  					'maxlength' => 100,
  					'value' => set_value('email'),
  					'class' => 'form-control',
  				));
  				echo form_error('email');
  		?>
  	</div>
	<div class="form-group">
		<?php
  				echo tag('label', 'Password', array(
  					'for' => 'password',
  					'class' => 'control-label',
  				));
  				echo tag('input', false, array(
  					'type' => 'password',
  					'name' => 'password',
  					'maxlength' => 20,
  					'value' => set_value('password'),
  					'class' => 'form-control',
  				));
  				echo form_error('password');
  		?>
  	</div>
  	<div class="checkbox">
	    <label>
	      	<input type="checkbox"> Remember me on this device
	    </label>
	</div>
  	<div class="form-group">
  		<?php
  				echo tag('input', false, array(
  					'type' => 'submit',
  					'value' => 'Login',
  					'class' => 'btn btn-success col-sm-12 col-xs-12',
  				));
  		?>
    </div>
    <div class="form-group">
    	<?php
    			echo tag('a', 'Forgot your password?', array(
    				'href' => '#',
    			));
    	?>
    </div>
</form>