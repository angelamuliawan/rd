<?php
		$valuesUserAccount = isset( $valuesUserAccount[0] ) ? $valuesUserAccount[0] : false;
		$username = isset( $valuesUserAccount['UserName'] ) ? $valuesUserAccount['UserName'] : false;
		$email = isset( $valuesUserAccount['UserEmail'] ) ? $valuesUserAccount['UserEmail'] : false;
		$photo = isset( $valuesUserAccount['UserPhoto'] ) ? $valuesUserAccount['UserPhoto'] : false;
		$city = isset( $valuesUserAccount['CityName'] ) ? $valuesUserAccount['CityName'] : false;
		$country = isset( $valuesUserAccount['CountryName'] ) ? $valuesUserAccount['CountryName'] : false;
		$description = isset( $valuesUserAccount['Description'] ) ? $valuesUserAccount['Description'] : false;
		$curLevel = isset( $valuesUserAccount['LevelName'] ) ? $valuesUserAccount['LevelName'] : false;
		$curLevelNick = isset( $valuesUserAccount['LevelNickName'] ) ? $valuesUserAccount['LevelNickName'] : false;
		$_allow_upload = isset( $_allow_upload ) ? $_allow_upload : true;

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
						// echo tag('p', $email, array(
						// 	'class' => 'mt5',
						// 	'style' => 'word-wrap: break-word;'
						// ));
						// echo tag('p', $customLevel, array(
						// 	'href' => '#'
						// ));

						// if( empty($_allow_upload) ) {
						// 	$country = isset( $valuesUserAccount['CountryName'] ) ? $valuesUserAccount['CountryName'] : false;
						// 	$city = isset( $valuesUserAccount['CityName'] ) ? $valuesUserAccount['CityName'] : false;

						// 	if( !empty($city) ) {
						// 		echo $city;
						// 	}
						// 	if( !empty($country) ) {
						// 		echo ', '.$country;
						// 	}
						// }

						echo tag('input', false, array(
		    				'id' => 'fuHiddenField',
		    				'name' => 'photo',
		    				'value' => set_value('photo'),
		    				'type' => 'hidden',
		    			));
				?>
			</div>
			<div class="simple-bio">
				<br>
				<p class="pd10">
					<span class="glyphicon glyphicon-map-marker"></span> &nbsp;
					<?php
							$country = isset( $valuesUserAccount['CountryName'] ) ? $valuesUserAccount['CountryName'] : false;
							$city = isset( $valuesUserAccount['CityName'] ) ? $valuesUserAccount['CityName'] : false;

							if( !empty($city) ) {
								echo $city;
							}
							if( !empty($country) ) {
								echo ', '.$country;
							}
					?>
				</p>
				<!-- <p>
					<span class="glyphicon glyphicon-envelope"></span> &nbsp;
					<?php
							echo $email;
					?>
				</p> -->
				<style>
					.simple-bio ul {
						margin: 10px 0 40px;
					}
					.simple-bio ul li {
						padding: 10px;
						border-top: 1px solid #efefef;
						border-bottom: 1px solid #efefef;
					}
					.simple-bio ul li:hover {
						background-color: #E66909;
						color: #ffffff;
						cursor: pointer;
						transition: .25s ease-out all;
						-moz-transition: .25s ease-out all;
						-webkit-transition: .25s ease-out all;
						-o-transition: .25s ease-out all;
					}
					.simple-bio ul li span:nth-child(2) {
						margin-left: 6px;
					}
					.simple-bio ul li span:nth-child(3) {
						float: right;
					}
				</style>
				<ul class="no-ul-type left-side-bio" style="padding:0;">
					<li>
						<span class="glyphicon glyphicon-road"></span>
						<span class="fbold">Timeline</span>
						<span class="glyphicon glyphicon-chevron-right"></span>
					</li>
					<li>
						<span class="glyphicon glyphicon-book"></span>
						<span class="fbold">Resep Saya (30)</span>
						<span class="glyphicon glyphicon-chevron-right"></span>
					</li>
					<li>
						<span class="glyphicon glyphicon-retweet"></span>
						<span class="fbold">Recook (4)</span>
						<span class="glyphicon glyphicon-chevron-right"></span>
					</li>
					<li>
						<span class="glyphicon glyphicon-bookmark"></span>
						<span class="fbold">Cookmark (45)</span>
						<span class="glyphicon glyphicon-chevron-right"></span>
					</li>
				</ul>
			</div>
		</div>
	</form>
</div>