<div class="container">
	<div class="big-wrapper">
		<div class="row">
			<div class="col-sm-12">
				<div class="wrapper-contact-us bg-white">
					<div class="header">
						<?php
								echo tag('h1', 'Kontak Kami', array(
									'class' => 'pull-left mt5 wrapper-text'
								));
						?>
					</div>
					<div class="content">
						<p>
							Untuk hal-hal yang berkaitan dengan bisnis, pemasangan iklan, penawaran kerja sama ataupun investasi dapat 
							menghubungi kami melalui <b>admin@cookindo.com</b> atau melalui form dibawah ini.
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
					  				echo tag('label', 'Nama', array(
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
						    				'placeholder' => 'Ketik nama Anda disini &hellip;',
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
						    				'placeholder' => 'Ketik email Anda disini &hellip;',
						    				'value' => ( isset($request['email']) ? $request['email']: set_value('email') ),
						    			));
						    			echo form_error('email');
						    	?>
						    </div>
					  	</div>
						<div class="form-group">
							<?php
					  				echo tag('label', 'Pesan', array(
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
						    				'placeholder' => 'Ketik pesan Anda disini &hellip;',
						    			));
										echo form_error('message'); 
								?>
							</div>
						</div>
						<div class="form-group">
					  		<?php
					  				echo tag('button', 'Simpan', array(
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