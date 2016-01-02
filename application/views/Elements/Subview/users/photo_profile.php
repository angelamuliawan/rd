<?php
		$valuesUserAccount = isset( $valuesUserAccount[0] ) ? $valuesUserAccount[0] : false;
		$username = isset( $valuesUserAccount['UserName'] ) ? $valuesUserAccount['UserName'] : false;
		$email = isset( $valuesUserAccount['UserEmail'] ) ? $valuesUserAccount['UserEmail'] : false;
		$photo = isset( $valuesUserAccount['UserPhoto'] ) ? $valuesUserAccount['UserPhoto'] : false;
		$curLevel = isset( $valuesUserAccount['LevelName'] ) ? $valuesUserAccount['LevelName'] : false;
		$curLevelNick = isset( $valuesUserAccount['LevelNickName'] ) ? $valuesUserAccount['LevelNickName'] : false;

		$customLevel = 'No level yet';
		if( !empty($curLevel) && !empty($curLevelNick) ) {
			$customLevel = sprintf('%s (%s)', $curLevel, $curLevelNick);
		}

		$custom_image = false;
		if( isset( $request['photo'] ) && @getimagesize( $domain.'/resources/images/uploads/users/'.$request['photo'] ) ) {
			$custom_image = $domain.'/resources/images/uploads/users/'.$request['photo'];
		} else {
			$custom_image = $domain.'/resources/images/uploads/users/'.$photo;
			if( !@getimagesize($custom_image) ) {
				$custom_image = $domain.'/resources/images/default.png';
			}
		}
?>
<div class="wrapper">
	<form id="formProfilePhoto" role="form" action="users/update_photo" data-reload="true" class="ajax-form" enctype="multipart/form-data" method="post" accept-charset="utf-8">
		<?php
				if( isset($alert) ) {
					echo $alert;
				}
		?>
		<div class="wrapper-left wrapper-ajax-upload with-border tacenter" style="width:100%; height:400px;">
			<div class="wrapper-photo">
				<?php
						echo tag('img', false, array(
			        		'src' => $custom_image,
			        		'style' => 'width:100%; height:auto; max-height:230px; display:inline-block;',
			        	));
				?>
			</div>
			<span class="btn btn-primary mt10 fileinput-button" style="margin:auto;">
		        <span>Ubah Foto Profil</span>
		        <input id="fileupload" data-show=".fu-show-after-upload" action-type="users" type="file" name="files" />
		    </span>
		    <?php
	        		echo form_error('photo'); 
	        ?>
		    <br>
		    <br>
			<input type="submit" class="btn btn-orange fu-show-after-upload" style="display:none;" value="Simpan" />
			<?php
					echo tag('h4', $username, array(
						'class' => 'mt10'
					));
					echo tag('p', $email, array(
						'class' => 'mt5',
						'style' => 'word-wrap: break-word;'
					));
					echo tag('a', $customLevel, array(
						'href' => '#'
					));

					echo tag('input', false, array(
	    				'id' => 'fuHiddenField',
	    				'name' => 'photo',
	    				'value' => set_value('photo'),
	    				'type' => 'hidden',
	    			));
			?>
		</div>
	</form>
</div>