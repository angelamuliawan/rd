<div class="wrapper">
	<form id="formChangePassword" data-reload="true" class="form-horizontal mt20 ajax-form" role="form" action="users/updatePassword" method="post" accept-charset="utf-8">
		<?php
				if( isset($alert) ) {
					echo $alert;
				}
		?>
		<div class="form-group">
	  		<?php
	  				echo tag('label', lang('old_password'), array(
	  					'class' => 'col-sm-2 control-label taleft',
	  					'for' => 'oldPassword',
	  				));
	  		?>
		    <div class="col-sm-6">
		      	<?php
		      			echo tag('input', false, array(
		    				'type' => 'password',
		    				'class' => 'form-control',
		    				'name' => 'oldPassword',
		    				'placeholder' => lang('old_password') .' &hellip;',
		    				'value' => set_value('oldPassword'),
		    				'maxlength' => 20,
		    			));
		    			echo form_error('oldPassword');
		      	?>
		    </div>
	  	</div>
	  	<div class="form-group">
	  		<?php
	  				echo tag('label', lang('new_password'), array(
	  					'class' => 'col-sm-2 control-label taleft',
	  					'for' => 'newPassword',
	  				));
	  		?>
		    <div class="col-sm-6">
		      	<?php
		      			echo tag('input', false, array(
		    				'type' => 'password',
		    				'class' => 'form-control',
		    				'name' => 'newPassword',
		    				'placeholder' => lang('new_password') .' &hellip;',
		    				'value' => set_value('newPassword'),
		    				'maxlength' => 20,
		    			));
		    			echo form_error('newPassword');
		      	?>
		    </div>
	  	</div>
	  	<div class="form-group">
	  		<?php
	  				echo tag('label', lang('confirm_password'), array(
	  					'class' => 'col-sm-2 control-label taleft',
	  					'for' => 'confirmPassword',
	  				));
	  		?>
		    <div class="col-sm-6">
		      	<?php
		      			echo tag('input', false, array(
		    				'type' => 'password',
		    				'class' => 'form-control',
		    				'name' => 'confirmPassword',
		    				'placeholder' => lang('confirm_password') .' &hellip;',
		    				'value' => set_value('confirmPassword'),
		    				'maxlength' => 20,
		    			));
		    			echo form_error('confirmPassword');
		      	?>
		    </div>
	  	</div>
	  	<div class="form-group">
	  		<?php
	  				echo tag('button', lang('save'), array(
	  					'class' => 'btn btn-orange with-loading',
	  					'type' => 'submit',
	  					'wrapTag' => 'div',
	  					'wrapAttributes' => array(
	  						'class' => 'col-sm-offset-2 col-sm-2'
	  					)
	  				));
	  		?>
	  	</div>
	</form>
</div>