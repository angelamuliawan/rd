<?php
		$valuesUserAccount = isset( $valuesUserAccount[0] ) ? $valuesUserAccount[0] : false;

		$username = isset( $valuesUserAccount['UserName'] ) ? $valuesUserAccount['UserName'] : false;
		$email = isset( $valuesUserAccount['UserEmail'] ) ? $valuesUserAccount['UserEmail'] : false;
		$country = isset( $valuesUserAccount['CountryName'] ) ? $valuesUserAccount['CountryName'] : false;
		$city = isset( $valuesUserAccount['CityName'] ) ? $valuesUserAccount['CityName'] : false;
		$description = isset( $valuesUserAccount['Description'] ) ? $valuesUserAccount['Description'] : false;
?>
<div class="wrapper">
	<form id="formAccount" data-reload="true" class="form-horizontal mt20 ajax-form" role="form" action="users/updateAccount" method="post" accept-charset="utf-8">
	  	<?php
	  			if( isset($alert) ) {
					echo $alert;
				}
	  	?>
	  	<div class="form-group">
	  		<?php
	  				echo tag('label', 'Nama Lengkap', array(
	  					'class' => 'col-sm-2 control-label taleft',
	  					'for' => 'username',
	  				));
	  		?>
		    <div class="col-sm-6">
		      	<?php
		      			echo tag('input', false, array(
		    				'type' => 'text',
		    				'class' => 'form-control',
		    				'name' => 'username',
		    				'value' => isset( $request['username'] ) ? set_value('username') : $username,
		    				'maxlength' => 100,
		    			));
		    			echo form_error('username');
		      	?>
		    </div>
	  	</div>
		<div class="form-group">
			<?php
					echo tag('label', 'Negara', array(
	  					'class' => 'col-sm-2 control-label taleft',
	  					'for' => 'country',
	  				));
			?>
			<div class="col-sm-6">
				<?php
						echo tag('input', false, array(
		    				'type' => 'text',
		    				'class' => 'form-control',
		    				'name' => 'country',
		    				'value' => isset( $request['country'] ) ? set_value('country') : $country,
		    				'maxlength' => 100,
		    			));
		    			echo form_error('country');
				?>
		    </div>
		</div>
		<div class="form-group">
			<?php
					echo tag('label', 'Kota', array(
	  					'class' => 'col-sm-2 control-label taleft',
	  					'for' => 'city',
	  				));
			?>
			<div class="col-sm-6">
				<?php
						echo tag('input', false, array(
		    				'type' => 'text',
		    				'class' => 'form-control',
		    				'name' => 'city',
		    				'value' => isset( $request['city'] ) ? set_value('city') : $city,
		    				'maxlength' => 100,
		    			));
		    			echo form_error('city');
				?>
		    </div>
		</div>
		<div class="form-group">
			<?php
					echo tag('label', 'Deskripsi Diri', array(
	  					'class' => 'col-sm-2 control-label taleft',
	  					'for' => 'city',
	  				));
			?>
			<div class="col-sm-6">
				<?php
						echo tag('input', false, array(
		    				'type' => 'text',
		    				'class' => 'form-control',
		    				'name' => 'description',
		    				'value' => isset( $request['description'] ) ? set_value('description') : $description,
		    				'maxlength' => 100,
		    			));
		    			echo form_error('description');
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