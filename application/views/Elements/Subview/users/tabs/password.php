<div class="wrapper">
	<form id="formChangePassword" data-reload="true" class="form-horizontal mt20 ajax-form" role="form" action="users/updatePassword" method="post" accept-charset="utf-8">
		<?php
				if( isset($alert) ) {
					echo $alert;
				}
		?>
		<div class="form-group">
	  		<?php
	  				echo tag('label', 'Password Lama', array(
	  					'class' => 'col-sm-3 control-label taleft',
	  					'for' => 'oldPassword',
	  				));
	  		?>
		    <div class="col-sm-6">
		      	<?php
		      			echo tag('input', false, array(
		    				'type' => 'password',
		    				'class' => 'form-control',
		    				'name' => 'oldPassword',
		    				'placeholder' => 'Password lama &hellip;',
		    				'value' => set_value('oldPassword'),
		    			));
		    			echo form_error('oldPassword');
		      	?>
		    </div>
	  	</div>
	  	<div class="form-group">
	  		<?php
	  				echo tag('label', 'Password baru', array(
	  					'class' => 'col-sm-3 control-label taleft',
	  					'for' => 'newPassword',
	  				));
	  		?>
		    <div class="col-sm-6">
		      	<?php
		      			echo tag('input', false, array(
		    				'type' => 'password',
		    				'class' => 'form-control',
		    				'name' => 'newPassword',
		    				'placeholder' => 'Password baru &hellip;',
		    				'value' => set_value('newPassword'),
		    			));
		    			echo form_error('newPassword');
		      	?>
		    </div>
	  	</div>
	  	<div class="form-group">
	  		<?php
	  				echo tag('label', 'Konfirmasi Password', array(
	  					'class' => 'col-sm-3 control-label taleft',
	  					'for' => 'confirmPassword',
	  				));
	  		?>
		    <div class="col-sm-6">
		      	<?php
		      			echo tag('input', false, array(
		    				'type' => 'password',
		    				'class' => 'form-control',
		    				'name' => 'confirmPassword',
		    				'placeholder' => 'Konfirmasi password &hellip;',
		    				'value' => set_value('confirmPassword'),
		    			));
		    			echo form_error('confirmPassword');
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
	  						'class' => 'col-sm-offset-3 col-sm-2'
	  					)
	  				));
	  		?>
	  	</div>
	  	<!-- <div class="form-group">
	    	<label for="inputEmail3" class="col-sm-3 control-label taleft">Password Lama</label>
		    <div class="col-sm-6">
		      	<input type="password" class="form-control" id="inputEmail3" >
		    </div>
	  	</div> -->
		<!-- <div class="form-group">
			<label for="inputEmail3" class="col-sm-3 control-label taleft">Password Baru</label>
		    <div class="col-sm-6">
		      	<input type="password" class="form-control" id="inputEmail3" placeholder="Password baru &hellip;">
		    </div>
		</div> -->
		<!-- <div class="form-group">
			<label for="inputEmail3" class="col-sm-3 control-label taleft">Konfirmasi Password</label>
		    <div class="col-sm-6">
		      	<input type="password" class="form-control" id="inputEmail3" placeholder="Konfirmasi password &hellip;">
		    </div>
		</div> -->
		<!-- <div class="form-group">
	    	<div class="col-sm-offset-3 col-sm-2">
	      		<button type="submit" class="btn btn-default">Simpan</button>
	    	</div>
	  	</div> -->
	</form>
</div>