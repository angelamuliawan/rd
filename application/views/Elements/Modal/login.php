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
									    	<label for="txtEmail" class="control-label">Email</label>
										    <input type="text" name="email" value="<?php echo set_value('email'); ?>" class="form-control" id="txtEmail">
										    <?php echo form_error('email'); ?>
									  	</div>
										<div class="form-group">
									    	<label for="txtPassword" class="control-label">Password</label>
										    <input type="password" name="password" value="<?php echo set_value('password'); ?>" class="form-control" id="txtPassword">
										    <?php echo form_error('password'); ?>
									  	</div>
									  	<div class="checkbox">
										    <label>
										      	<input type="checkbox"> Remember me on this device
										    </label>
										</div>
									  	<div class="form-group">
									  		<input type="submit" value="Login" class="btn btn-success col-sm-12">
									    </div>
									    <div class="form-group">
									    	<a href="#">Forgot your password?</a>
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
									    	<label for="txtRegFullname" class="control-label">Nama Lengkap</label>
										    <input type="text" name="RegFullname" value="<?php echo set_value('RegFullname'); ?>" class="form-control" id="txtRegFullname">
									  		<?php echo form_error('RegFullname'); ?>
									  	</div>
									  	<div class="form-group">
									    	<label for="txtRegEmail" class="control-label">Email</label>
										    <input type="text" name="RegEmail" value="<?php echo set_value('RegEmail'); ?>" class="form-control" id="txtRegEmail">
										    <?php echo form_error('RegEmail'); ?>
									  	</div>
										<div class="form-group">
									    	<label for="txtRegPassword" class="control-label">Password</label>
										    <input type="password" name="RegPassword" value="<?php echo set_value('RegPassword'); ?>" class="form-control" id="txtRegPassword">
										    <?php echo form_error('RegPassword'); ?>
									  	</div>
									  	<div class="form-group mb40">
									  		<input type="submit" value="Register" class="btn btn-success col-sm-12">
									    </div>
									</form>
								</div>
							</div>

							<div class="wrapper-social pd10">
								<div class="with-border" style="width:100%; height:50px; background-color:#3C579C;">
									<div style="width:15%; display:inline-block; height:100%; background-color:#283F6D; color: #FFFFFF;padding-left: 25px; line-height: 45px; font-weight: bold; font-size: 24px;">
										<span>F</span>
									</div>
									<div style="width: 85%; float: right; color: #FFFFFF;line-height: 45px; padding-left: 90px;">
										<span>Sign in with Facebook</span>
									</div>
								</div>
								<div class="with-border" style="width:100%; height:50px; background-color:#DD4C39;">
									<div style="width:15%; display:inline-block; height:100%; background-color:#B12818; color: #FFFFFF;padding-left: 15px; line-height: 45px; font-weight: bold; font-size: 24px;">
										<span>G+</span>
									</div>
									<div style="width: 85%; float: right; color: #FFFFFF;line-height: 45px; padding-left: 90px;">
										<span>Sign in with Google+</span>
									</div>
								</div>
							</div>
		      			</div>
		      		</div>
	      		</div>
	      	</div>
	    </div>
	</div>
</div>