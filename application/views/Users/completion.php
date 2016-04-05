<div class="container">
	<div class="big-wrapper bg-white pd20">
		<?php
				if( isset($alert) ) {
					echo $alert;
				}
				echo tag('h2', 'Lengkapi Data Anda', array(
					'class' => 'tacenter mb10',
				));
				echo tag('p', 'Selangkah lagi untuk bergabung dengan komunitas masak terbaik di Indonesia.', array(
					'class' => 'tacenter mb20',
				));
		?>
		<div class="wrapper-login">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<form id="formCompletion" role="form" action="users/completion" data-redirect="users" class="ajax-form" method="post" accept-charset="utf-8">
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
					  					'value' => ( isset($request['email']) ? $request['email']: set_value('email') ),
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
					  					'class' => 'form-control',
					  				));
					  				echo form_error('password');
					  		?>
					  	</div>
					  	<div class="form-group">
							<?php
					  				echo tag('label', 'Konfirmasi Password', array(
					  					'for' => 'confirmPassword',
					  					'class' => 'control-label',
					  				));
					  				echo tag('input', false, array(
					  					'type' => 'password',
					  					'name' => 'confirmPassword',
					  					'maxlength' => 20,
					  					'class' => 'form-control',
					  				));
					  				echo form_error('confirmPassword');
					  		?>
					  	</div>
					  	<div class="form-group">
					  		<?php
					  				echo tag('input', false, array(
					  					'type' => 'submit',
					  					'value' => 'Simpan',
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