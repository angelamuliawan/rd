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
				$custom_image = $domain.'/resources/images/placeholder/users.jpg';
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
				        		'alt' => $username,
				        		'title' => $username,
				        		'img-progressive-type' => 'users',
				        	));
					?>
				</div>
				<?php
						$method_name = ucwords($this->router->method);

	        			if( $method_name == 'Profile' ) {
	        	?>
	        				<div class="mt20">
	        	<?php
		        				loadSubview('common/action_follow', array(
									'user_id_viewer' => $user_id_viewer,
									'follow_status' => $valuesUserFollowStatus,
									'show_this_is_you' => false,
								));
				?>
							</div>
				<?php
						}

						if( !empty($_allow_upload) ) {
				?>
							<span class="btn btn-primary mt20 fileinput-button" style="margin:auto;">
						        <?php
										echo tag('span', lang('change_profile_picture'));
								?>
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

						if( $description ) {
							echo tag('p', $description, array(
								'class' => 'mt10 mobile-only'
							));
						} else if ( $user_id == $this->session->userdata('userid') ) {
							echo tag('a', lang('write_self_description'), array(
								'href' => $domain.'/users',
								'class' => 'mt10 mobile-only'
							));
						}

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
				<?php
						$country = isset( $valuesUserAccount['CountryName'] ) ? $valuesUserAccount['CountryName'] : false;
						$city = isset( $valuesUserAccount['CityName'] ) ? $valuesUserAccount['CityName'] : false;
						$country_city = customConcat($city, $country);

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
										<?php
												echo tag('span', lang('account_setting'));
										?>
										<span class="glyphicon glyphicon-chevron-right"></span>
									</li>
								</a>
					<?php
							}
					?>
					<a class="btn-timeline-navigation" href="<?php echo $url; ?>">
						<li>
							<span class="glyphicon glyphicon-road"></span>
							<?php
									echo tag('span', lang('timeline'));
							?>
							<span class="glyphicon glyphicon-chevron-right"></span>
						</li>
					</a>
					<a class="btn-timeline-navigation" data-param="InsertRecipe" href="<?php echo $url.'?param=InsertRecipe'; ?>">
						<li>
							<span class="glyphicon glyphicon-book"></span>
							<?php
									echo tag('span', sprintf('%s (%s)', lang('recipe'), $cntMyRecipe));
							?>
							<span class="glyphicon glyphicon-chevron-right"></span>
						</li>
					</a>
					<a class="btn-timeline-navigation" data-param="Recook" href="<?php echo $url.'?param=Recook'; ?>">
						<li>
							<span class="glyphicon glyphicon-retweet"></span>
							<?php
									echo tag('span', sprintf('%s (%s)', lang('recook'), $cntRecook));
							?>
							<span class="glyphicon glyphicon-chevron-right"></span>
						</li>
					</a>
					<a class="btn-timeline-navigation" data-param="Cookmark" href="<?php echo $url.'?param=Cookmark'; ?>">
						<li>
							<span class="glyphicon glyphicon-bookmark"></span>
							<?php
									echo tag('span', sprintf('%s (%s)', lang('cookmark'), $cntCookmark));
							?>
							<span class="glyphicon glyphicon-chevron-right"></span>
						</li>
					</a>
				</ul>
			</div>
		</div>
	</form>
</div>