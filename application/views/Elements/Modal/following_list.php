<!-- MODAL FOLLOWING USER -->
<div id="myModal" class="modal fade">
	<div class="modal-dialog modal-md" role="document">
	    <div class="modal-content">
	      	<div class="modal-header">
	        	<button type="button" class="close close-modal" data-dismiss="modal" aria-hidden="true">&times;</button>
	        	<h3 id="myModalLabel" class="modal-title">Following</h3>
	      	</div>
	      	<div class="modal-body pd15">
	      		<div class="row">
		      		<div class="col-sm-12">
		      			<div class="wrapper-popular-user">
			      			<ul class="no-pd no-ul-type">
				      			<?php
				      					if( !empty($valuesUserFollowing) ) {
											foreach( $valuesUserFollowing as $key => $value ) {
												$user_id = isset($value['UserID']) ? $value['UserID'] : false;
												$username = isset($value['UserName']) ? $value['UserName'] : false;
												$userphoto = isset($value['UserPhoto']) ? $value['UserPhoto'] : false;
												$status = isset($value['FlagViewerFollow']) ? $value['FlagViewerFollow'] : false;

												$path_image = '/resources/images/uploads/users/thumbs/'.$userphoto;
												$custom_image = $domain.$path_image;

												if( !file_exists( $webroot.$path_image ) ) {
													$firstLetter =  !empty( $username[0] ) ? strtoupper($username[0]) : false;
													$userImage = tag('div', $firstLetter, array(
														'class' => 'alphabet-placeholder',
														'wrapTag' => 'a',
														'wrapAttributes' => array(
															'title' => $username,
															'href' => $domain.'/users/profile/'.$user_id.'/'.seoURL($username),
														),
													));
												} else {
													$userImage = tag('img', false, array(
														'src' => $custom_image,
														'wrapTag' => 'a',
														'wrapAttributes' => array(
															'title' => $username,
															'href' => $domain.'/users/profile/'.$user_id.'/'.seoURL($username),
														),
														'data-disable-progressive' => '1',
													));
												}
								?>
												<li>
													<div class="row">
														<div class="col-sm-3">
															<?php
																	echo $userImage;
															?>
														</div>
														<div class="col-sm-9">
															<?php
																	echo tag('a', $username, array(
																		'class' => 'fbold',
																		'title' => $username,
																		'href' => $domain.'/users/profile/'.$user_id.'/'.seoURL($username),
																	));
															?>
															<div class="mt5">
																<?php
																		loadSubview('common/action_follow', array(
																			'user_id_viewer' => $user_id,
																			'follow_status' => $status,
																		));
																?>
															</div>
														</div>
													</div>
												</li>
								<?php
											}
										} else {
											echo tag('h4', lang('data_not_available'));
										}
			      				?>
			      			</ul>
			      		</div>
		      		</div>
	      		</div>
	      	</div>
	    </div>
	</div>
</div>