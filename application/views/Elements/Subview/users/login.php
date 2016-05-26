<form id="formLogin" role="form" action="users/login<?php echo isset($redirect_after) ? '?redirect_after='.$redirect_after : false; ?>" data-reload="true" class="ajax-form" method="post" accept-charset="utf-8">
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
	      	<input type="checkbox"> Ingat saya
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
    			$direct_link = isset( $direct_link ) ? $direct_link : false;

    			if( !empty($direct_link) ) {
    				echo tag('a', 'Lupa password?', array(
	    				'href' => $domain.'/users/forgot_password',
	    			));
    			} else {
	    			echo tag('a', 'Lupa password?', array(
	    				'href' => '#tabs-forgot-password',
	    				'text-value' => 'Lupa Password',
	    				'class' => 'custom-nav-tabs replace-text',
						'text-target' => '.modal-title',
						'hide-on-click' => '.nav.nav-tabs',
						'show-on-click' => '.backToLogin',
	    			));
	    		}
    	?>
    </div>
</form>