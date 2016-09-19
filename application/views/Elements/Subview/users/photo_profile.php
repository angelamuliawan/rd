<?php
		$valuesUserAccount = isset( $valuesUserAccount[0] ) ? $valuesUserAccount[0] : false;
		$user_id = isset( $valuesUserAccount['UserID'] ) ? $valuesUserAccount['UserID'] : false;
		$username = isset( $valuesUserAccount['UserName'] ) ? $valuesUserAccount['UserName'] : false;
		$email = isset( $valuesUserAccount['UserEmail'] ) ? $valuesUserAccount['UserEmail'] : false;
		$photo = isset( $valuesUserAccount['UserPhoto'] ) ? $valuesUserAccount['UserPhoto'] : false;
		$city = isset( $valuesUserAccount['CityName'] ) ? $valuesUserAccount['CityName'] : false;
		$country = isset( $valuesUserAccount['CountryName'] ) ? $valuesUserAccount['CountryName'] : false;
		$description = isset( $valuesUserAccount['Description'] ) ? $valuesUserAccount['Description'] : false;
		$birthday = isset( $valuesUserAccount['CustomBirthday'] ) ? $valuesUserAccount['CustomBirthday'] : false;
		$curLevel = isset( $valuesUserAccount['LevelName'] ) ? $valuesUserAccount['LevelName'] : false;
		$curLevelNick = isset( $valuesUserAccount['LevelNickName'] ) ? $valuesUserAccount['LevelNickName'] : false;
		$_allow_upload = isset( $_allow_upload ) ? $_allow_upload : true;

		$cntMyRecipe = isset( $valuesMyRecipe[0]['CountRecipe'] ) ? $valuesMyRecipe[0]['CountRecipe'] : 0;
		$cntRecook = isset( $valuesRecook[0]['CountRecook'] ) ? $valuesRecook[0]['CountRecook'] : 0;
		$cntCookmark = isset( $valuesCookmark[0]['CountCookmark'] ) ? $valuesCookmark[0]['CountCookmark'] : 0;

		$customLevel = false;
		if( !empty($curLevel) && !empty($curLevelNick) ) {
			$customLevel = sprintf('%s (%s)', $curLevel, $curLevelNick);
		}

		$custom_image = false;
		if( isset( $request['photo'] ) && file_exists( $webroot.'/resources/images/uploads/users/'.$request['photo']) ) {
			$custom_image = $domain.'/resources/images/uploads/users/'.$request['photo'];
		} else {
			$custom_image = $domain.'/resources/images/uploads/users/'.$photo;
			if( !file_exists($webroot.'/resources/images/uploads/users/'.$photo) ) {
				$custom_image = $domain.'/resources/images/default.png';
			}
		}

		$url = $domain.'/users/profile/'.$user_id.'/'.seoURL($username);

		$show_acc_setting = false;
		if( $this->session->userdata('userid') != NULL ) {
			$show_acc_setting = true;
		}

		if( isset( $user_id_viewer ) && $this->session->userdata('userid') != $user_id_viewer ) {
			$show_acc_setting = false;
		}

		$method_name = $this->router->method;
?>
<div class="wrapper">
	<form id="formProfilePhoto" role="form" action="users/update_photo" data-reload="true" class="ajax-form" enctype="multipart/form-data" method="post" accept-charset="utf-8">
		<?php
				if( isset($alert) ) {
					echo $alert;
				}
		?>
		<div class="wrapper-left wrapper-ajax-upload" style="width:100%; /*height:400px;*/ height:auto;">
			<div class="top-side tacenter">
				<div class="wrapper-photo">
					<?php
							echo tag('img', false, array(
				        		'src' => $custom_image,
				        		'img-progressive-type' => 'users',
				        	));
					?>
				</div>
				<?php
						if( !empty($_allow_upload) ) {
				?>
							<span class="btn btn-primary mt20 fileinput-button" style="margin:auto;">
						        <span>Ubah Foto Profil</span>
						        <input id="fileupload" data-show=".fu-show-after-upload" action-type="users" type="file" name="files" />
						    </span>
			    <?php		
		        			echo form_error('photo'); 
		        ?>
			    <br>
			    <br>
			    <?php
			    		}
			    ?>
				<input type="submit" class="btn btn-orange fu-show-after-upload" style="display:none;" value="Simpan" />
				<?php
						echo tag('h3', $username, array(
							'class' => 'mt20 mobile-only'
						));
						echo tag('p', $description, array(
							'class' => 'mt10 mobile-only'
						));

						if( !empty($_allow_upload) ) {
							echo tag('input', false, array(
			    				'id' => 'fuHiddenField',
			    				'name' => 'photo',
			    				'value' => set_value('photo'),
			    				'type' => 'hidden',
			    			));
			    		}
				?>
			</div>
			<div class="simple-bio">
				<br>
				<?php
						$country_city = false;
						$country = isset( $valuesUserAccount['CountryName'] ) ? $valuesUserAccount['CountryName'] : false;
						$city = isset( $valuesUserAccount['CityName'] ) ? $valuesUserAccount['CityName'] : false;

						if( !empty($city) ) {
							$country_city = $city;
						}
						if( !empty($country) ) {
							$country_city .= ', '.$country;
						}

						if( !empty($country_city) ) {
				?>
						<p class="pd10 no-mg">
							<span class="glyphicon glyphicon-map-marker"></span> &nbsp;
				<?php
								echo $country_city;
				?>
						</p>
				<?php
						}

						if( !empty($birthday) ) {
				?>
						<p class="pd10 no-mg">
							<span class="glyphicon glyphicon-calendar"></span> &nbsp;
				<?php
								echo $birthday;
				?>
						</p>
				<?php
						}
				?>

				<ul class="no-ul-type left-side-bio" style="padding:0;">
					<?php
							if( !empty($show_acc_setting) ) {
					?>					
								<a href="<?php echo $domain.'/users'; ?>">
									<li>
										<span class="glyphicon glyphicon-cog"></span>
										<span>Pengaturan Akun</span>
										<span class="glyphicon glyphicon-chevron-right"></span>
									</li>
								</a>
					<?php
							}
					?>
					<a class="<?php echo ( $method_name != 'index') ? 'ajax-link' : ''; ?>" target-wrapper="timeline" href="<?php echo $url; ?>">
						<li>
							<span class="glyphicon glyphicon-road"></span>
							<span>Timeline</span>
							<span class="glyphicon glyphicon-chevron-right"></span>
						</li>
					</a>
					<a class="<?php echo ( $method_name != 'index') ? 'ajax-link' : ''; ?>" target-wrapper="timeline" href="<?php echo $url.'?param=InsertRecipe'; ?>">
						<li>
							<span class="glyphicon glyphicon-book"></span>
							<?php
									echo tag('span', sprintf('Resep Saya (%s)', $cntMyRecipe));
							?>
							<span class="glyphicon glyphicon-chevron-right"></span>
						</li>
					</a>
					<a class="<?php echo ( $method_name != 'index') ? 'ajax-link' : ''; ?>" target-wrapper="timeline" href="<?php echo $url.'?param=Recook'; ?>">
						<li>
							<span class="glyphicon glyphicon-retweet"></span>
							<?php
									echo tag('span', sprintf('Recook (%s)', $cntRecook));
							?>
							<span class="glyphicon glyphicon-chevron-right"></span>
						</li>
					</a>
					<a class="<?php echo ( $method_name != 'index') ? 'ajax-link' : ''; ?>" target-wrapper="timeline" href="<?php echo $url.'?param=Cookmark'; ?>">
						<li>
							<span class="glyphicon glyphicon-bookmark"></span>
							<?php
									echo tag('span', sprintf('Cookmark (%s)', $cntCookmark));
							?>
							<span class="glyphicon glyphicon-chevron-right"></span>
						</li>
					</a>
				</ul>
			</div>
		</div>
	</form>
</div>