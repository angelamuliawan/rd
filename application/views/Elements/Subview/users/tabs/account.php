<?php
		$valuesUserAccount = isset( $valuesUserAccount[0] ) ? $valuesUserAccount[0] : false;

		$username = isset( $valuesUserAccount['UserName'] ) ? $valuesUserAccount['UserName'] : false;
		$email = isset( $valuesUserAccount['UserEmail'] ) ? $valuesUserAccount['UserEmail'] : false;
		$country = isset( $valuesUserAccount['CountryName'] ) ? $valuesUserAccount['CountryName'] : false;
		$city = isset( $valuesUserAccount['CityName'] ) ? $valuesUserAccount['CityName'] : false;
		$description = isset( $valuesUserAccount['Description'] ) ? $valuesUserAccount['Description'] : false;
		$birthday = isset( $valuesUserAccount['Birthday'] ) ? $valuesUserAccount['Birthday'] : false;
		$gender = isset( $valuesUserAccount['Gender'] ) ? $valuesUserAccount['Gender'] : false;

		$arr_birthday = false;
		if( !empty($birthday) && $birthday != '0000-00-00' ) {
			$arr_birthday = explode('-', $birthday);
		} else {
			$birthday = false;
		}
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
	  				echo tag('label', lang('fullname'), array(
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
					echo tag('label', lang('describe_yourself'), array(
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
		    				'maxlength' => 150,
		    			));
		    			echo form_error('description');
				?>
		    </div>
		</div>
		<div class="form-group">
			<?php
					echo tag('label', lang('birthday'), array(
	  					'class' => 'col-sm-2 control-label taleft',
	  					'for' => 'birthday',
	  				));
			?>
			<div class="col-sm-6">
				<?php
						echo tag('input', false, array(
		    				'type' => 'text',
		    				'class' => 'form-control',
		    				'name' => 'birthday',
		    				'id' => 'birthday',
		    				'data-d' => ( !empty($arr_birthday) ? $arr_birthday[2] : '' ),
		    				'data-m' => ( !empty($arr_birthday) ? ($arr_birthday[1]-1) : '' ),
		    				'data-y' => ( !empty($arr_birthday) ? $arr_birthday[0] : '' ),
		    				'readonly' => 'readonly',
		    				'value' => isset( $request['birthday'] ) ? set_value('birthday') : $birthday,
		    			));
		    			echo form_error('birthday');
				?>
		    </div>
		</div>
		<div class="form-group">
			<?php
					echo tag('label', lang('gender'), array(
	  					'class' => 'col-sm-2 control-label taleft',
	  					'for' => 'gender',
	  				));
			?>
			<div class="col-sm-6">
				<label for="female">
					<input type="radio" id="female" name="gender" value="1" <?php echo ($gender == 1) ? 'checked' : ''; ?> >
					<?php
							echo lang('female');
					?>
				</label>
				&ensp;
				<label for="male">
					<input type="radio" id="male" name="gender" value="2" <?php echo ($gender == 2) ? 'checked' : ''; ?> >
					<?php
							echo lang('male');
					?>
				</label>
		    </div>
		</div>
		<div class="form-group">
			<?php
					echo tag('label', lang('country'), array(
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
					echo tag('label', lang('city'), array(
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