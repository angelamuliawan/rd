<div class="container bg-white">
	<div class="big-wrapper">
		<div class="row">
			<div class="col-sm-12">
				<div class="wrapper-contact-us bg-white">
					<div class="header">
						<?php
								echo tag('h1', 'Contact Us', array(
									'class' => 'pull-left mt5 wrapper-text'
								));
						?>
					</div>
					<div class="content">
						<p>
							For anything related to business, advertising, cooperation, investation, or if you have any problem when using our
							systems, just email us through  
							<b>admin@cookindo.com</b> / <b>angela@cookindo.com</b> or by using this form below.
						</p>
					</div>

					<form id="formContactUs" action="pages/contact_us" class="form-horizontal mt20 pb20 ajax-form" role="form" method="post" accept-charset="utf-8">
					  	<?php
					  			if( isset($alert) ) {
									echo $alert;
								}
					  	?>
					  	<div class="form-group">
					  		<?php
					  				echo tag('label', 'Full name', array(
					  					'for' => 'name',
					  					'class' => 'col-sm-2 control-label',
					  				));
					  		?>
						    <div class="col-sm-7">
						    	<?php
						    			echo tag('input', false, array(
						    				'type' => 'text',
						    				'class' => 'form-control',
						    				'name' => 'name',
						    				'placeholder' => 'Type your fullname here &hellip;',
						    				'value' => ( isset($request['name']) ? $request['name']: set_value('name') ),
						    			));
						    			echo form_error('name');
						    	?>
						    </div>
					  	</div>
					  	<div class="form-group">
					  		<?php
					  				echo tag('label', 'Email', array(
					  					'for' => 'email',
					  					'class' => 'col-sm-2 control-label',
					  				));
					  		?>
						    <div class="col-sm-7">
						    	<?php
						    			echo tag('input', false, array(
						    				'type' => 'text',
						    				'class' => 'form-control',
						    				'name' => 'email',
						    				'placeholder' => 'Type your email here &hellip;',
						    				'value' => ( isset($request['email']) ? $request['email']: set_value('email') ),
						    			));
						    			echo form_error('email');
						    	?>
						    </div>
					  	</div>
						<div class="form-group">
							<?php
					  				echo tag('label', 'Message', array(
					  					'for' => 'message',
					  					'class' => 'col-sm-2 control-label',
					  				));
					  		?>
							<div class="col-sm-7">
								<?php
										echo tag('textarea', ( isset($request['message']) ? $request['message']: set_value('message') ) , array(
						    				'rows' => 4,
						    				'class' => 'form-control',
						    				'name' => 'message',
						    				'placeholder' => 'Type your message here &hellip;',
						    			));
										echo form_error('message'); 
								?>
							</div>
						</div>
						<div class="form-group">
					  		<?php
					  				echo tag('button', 'Save', array(
					  					'class' => 'btn btn-orange',
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
			</div>
		</div>
	</div>
</div>