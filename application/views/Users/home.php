<?php
		$userphoto = $this->session->userdata('userphoto');
		$path_image = '/resources/images/uploads/users/thumbs/'.$userphoto;
		$custom_image = $domain.$path_image;

		$userImage = false;
		$user_id = $this->session->userdata('userid');
		$username = $this->session->userdata('username');

		if( !file_exists( $webroot.$path_image ) ) {
			$firstLetter =  !empty( $this->session->userdata('username')[0] ) ? strtoupper($this->session->userdata('username')[0]) : false;
			$userImage = tag('div', $firstLetter, array(
				'class' => 'alphabet-placeholder pull-left _mt7 mr5 img-circle',
				'style' => 'width: 35px; height: 35px; line-height: 40px;',
			));
		} else {
			$userImage = tag('img', false, array(
				'class' => 'pull-left _mt7 mr5 img-circle',
				'src' => $custom_image,
				'style' => 'width: 35px; height: 35px;',
				'img-progressive-type' => 'users',
			));
		}
?>

<div class="container bg-white">
	<div id="wrapper-outer-profile" class="big-wrapper bg-white pd20" style="min-height:600px;">
		<div class="row">
			<div class="wrapper-profile">
				<div class="col-sm-3 desktop-only">

					<div class="wrapper-left-side-home mt5">
						<ul class="no-ul-type no-pd">
							<a href="<?php echo $domain.'/users/profile/'.$user_id.'/'.seoURL($username); ?>">
								<li class="with-border-bottom">
									<div class="pull-left left-side">
										<?php
												echo tag('img', false, array(
													'class' => 'img-circle',
													'src' => $custom_image,
													'style' => 'width: 35px; height: 35px;',
													'img-progressive-type' => 'users',
												));
										?>
									</div>
									<div class="pull-left right-side mt5">
										<span class="username text-orange">
											<?php
													echo $this->session->userdata('username');
											?>
										</span>
									</div>
									<div class="clearfix"></div>
								</li>
							</a>
						</ul>
					</div>

				</div>
				<div class="col-sm-6" style="padding-left: 0;">
					<div id="home-container" class="wrapper-right mt10">
				        <?php
				        		loadSubview('common/background_masker/timeline');
				        ?>
					</div>
				</div>
				<div class="col-sm-3">
					<?php
							loadSubview('users/related_popular_users');
					?>
				</div>
			</div>
		</div>
	</div>
</div>