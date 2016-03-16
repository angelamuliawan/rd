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
									<?php
											loadSubview('users/login');
									?>
								</div>
								<div class="tab-pane" id="tabs-register">
									<?php
											loadSubview('users/register');
									?>
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