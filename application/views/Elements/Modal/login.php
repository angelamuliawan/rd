<!-- MODAL LOGIN -->
<div id="myModal" class="modal fade">
	<div class="modal-dialog modal-md" role="document" style="width:500px;">
	    <div class="modal-content">
	      	<div class="modal-header">
	        	<button type="button" class="close close-modal" data-dismiss="modal" aria-hidden="true">&times;</button>
	        	<h3 id="myModalLabel" class="modal-title">Login</h3>
	      	</div>
	      	<div class="modal-body pd15 pb20">
	      		<div class="row">
		      		<div class="col-sm-12">
		      			<div class="big-wrapper wrapper-login">
				        	<ul class="nav nav-tabs replace-text" text-target="modal-title">
							  	<?php
							  			echo tag('a', 'Login', array(
							  				'class' => 'tacenter',
							  				'href' => '#tabs-login',
							  				'wrapTag' => 'li',
							  				'wrapAttributes' => array(
							  					'style' => 'width:50%;',
							  					'class' => 'active'
							  				)
							  			));
							  			echo tag('a', 'Register', array(
							  				'class' => 'tacenter',
							  				'href' => '#tabs-register',
							  				'wrapTag' => 'li',
							  				'wrapAttributes' => array(
							  					'style' => 'width:50%;',
							  				)
							  			));
							  	?>
							</ul>

							<div class="tab-content pd10 pt15">
								<div class="tab-pane active" id="tabs-login">
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
									  					'class' => 'btn btn-success col-sm-12',
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
								</div>
								<div class="tab-pane" id="tabs-register">
									<form id="formRegister" role="form" action="users/register" data-reload="true" class="ajax-form" method="post" accept-charset="utf-8">
										<?php
									  			if( isset($alert) ) {
													echo $alert;
												}
									  	?>
										<div class="form-group">
											<?php
													echo tag('label', 'Nama Lengkap', array(
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
									  				echo tag('label', 'Email', array(
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
									  				echo tag('label', 'Password', array(
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
									  					'value' => 'Register',
									  					'class' => 'btn btn-success col-sm-12',
									  				));
									  		?>
									    </div>
									</form>
								</div>
							</div>

							<div class="wrapper-social pd10">
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
	</div>
</div>