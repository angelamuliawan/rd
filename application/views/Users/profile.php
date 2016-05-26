<?php
		$valuesUserAccount = isset( $valuesUserAccount[0] ) ? $valuesUserAccount[0] : false;
		$username = isset( $valuesUserAccount['UserName'] ) ? $valuesUserAccount['UserName'] : false;
		$description = isset( $valuesUserAccount['Description'] ) ? $valuesUserAccount['Description'] : false;

		$cntMyRecipe = count($valuesMyRecipe);
		$cntRecook = count($valuesRecook);
		$cntCookmark = count($valuesCookmark);
?>
<div class="container">
	<div class="big-wrapper bg-white pd20" style="min-height:500px;">
		<div class="row">
			<div class="wrapper-profile">
				<div class="col-sm-3">
					<?php
							loadSubview('users/photo_profile', array(
								'_allow_upload' => false,
							));
					?>
				</div>
				<div class="col-sm-6" style="padding-left: 0;">
					<?php
							echo tag('h3', $username, array(
								'class' => 'mb10 ml20 desktop-only'
							));
							echo tag('p', $description, array(
								'class' => 'mb20 ml20 desktop-only'
							));
					?>
					<div class="wrapper-right">
						<ul class="timeline">

				            <li class="timeline-inverted">
				                <div class="timeline-badge add">
				                    <a><span class="glyphicon glyphicon glyphicon-edit"></span></a>
				                </div>
				                <div class="timeline-panel">
				                    <div class="timeline-heading">
				                        <h4>Created a recipes Fancy Pan</h4>
				                        <p>Just now</p>
				                    </div>
				                    <div class="timeline-body">
				                        <p>Makanan ini sering kita temui di acara-acara di hotel atau di tempat-tempat umum. Namun ternyata kita bisa membuatnya di rumah dengan mudah.</p>
				                        <img src="http://localhost/cookindo/resources/images/uploads/recipe/primary/20160131_09_39_42_79.jpg" style="width:100%; height:auto" />
				                    </div>
				                    <div class="timeline-action">
				                        <div class="action-bottom wrapper-ajax-link">
											<a title="Recook" class="ajax-modal" href="http://localhost/cookindo/users/login">
												<img src="http://localhost/cookindo/resources/icons/retweet.png">
												<span class="ml5">Recook</span>
											</a>			
											<a title="Recook" class="ajax-modal" href="http://localhost/cookindo/users/login">
												<img src="http://localhost/cookindo/resources/icons/comment.png">
												<span class="ml5">Comment</span>
											</a>	
											<a title="Cookmark" class="ajax-modal" href="http://localhost/cookindo/users/login">
												<img src="http://localhost/cookindo/resources/icons/cookmark.png">
												<span class="ml5 mr10">Cookmark</span>
											</a>
										</div>
				                    </div>
				                    <div class="timeline-footer">
				                    	<div class="media wrapper-ajax-link"> 
				                            <div class="pull-left">
				                                <a href="#">
				                                    <img src="http://localhost/cookindo/resources/images/64x64.png" class="media-object" style="width: 48px; height: 48px;">
				                                </a>    
				                            </div>
				                            <div class="media-body" style="width:auto; padding-right:20px;">
				                                <a class="fbold" href="http://localhost/cookindo/users/profile/1">
				                                    ResepDuniaAdmin1 (Cr)
				                                </a>
				                                <textarea name="recook_comment" rows="2" class="form-control mt5 submit-on-enter" placeholder="Tuliskan komentar Anda disini …"></textarea>
				                            </div>
				                        </div>

				                        <div class="media wrapper-ajax-link"> 
				                            <div class="pull-left">
				                                <a href="#">
				                                    <img src="http://localhost/cookindo/resources/images/64x64.png" class="media-object" style="width: 48px; height: 48px;">
				                                </a>    
				                            </div>
				                            <div class="media-body" style="width:auto; padding-right:20px;">
				                                <a class="fbold" href="http://localhost/cookindo/users/profile/1">
				                                    ResepDuniaAdmin1 (Cr)
				                                </a>
				                                <p class="tajustify comment">Makanan ini sering kita temui di acara-acara di hotel atau di tempat-tempat umum. Namun ternyata kita bisa membuatnya di rumah dengan mudah.</p>
				                                <a class="ajax-link pull-left" with-confirm="Yakin ingin menghapus?" href="http://localhost/cookindo/recipe/delete_recook_comment/1">
				                                    <span>Delete</span>
				                                </a>
				                                &ensp; &middot; 
				                                <span style="color: #bbb;">18 May 2016 10:07 PM </span>
				                            </div>
				                        </div>

				                        <div class="media wrapper-ajax-link"> 
				                            <div class="pull-left">
				                                <a href="#">
				                                    <img src="http://localhost/cookindo/resources/images/64x64.png" class="media-object" style="width: 48px; height: 48px;">
				                                </a>    
				                            </div>
				                            <div class="media-body" style="width:auto; padding-right:20px;">
				                                <a class="fbold" href="http://localhost/cookindo/users/profile/1">
				                                    ResepDuniaAdmin1 (Cr)
				                                </a>
				                                <p class="tajustify comment">Makanan ini sering kita temui di acara-acara di hotel atau di tempat-tempat umum. Namun ternyata kita bisa membuatnya di rumah dengan mudah.</p>
				                               	<span style="color: #bbb;">18 May 2016 10:07 PM </span>
				                            </div>
				                        </div>
				                    </div>
				                </div>
				            </li>
				            
				            <li class="timeline-inverted">
				                <div class="timeline-badge recook">
				                    <a><span class="glyphicon glyphicon glyphicon-retweet"></span></a>
				                </div>
				                <div class="timeline-panel">
				                    <div class="timeline-heading">
				                        <h4>Recook recipes Ayam Merah from Angela Muliawan.</h4>
				                        <p>1 hrs</p>
				                    </div>
				                    <div class="timeline-body">
				                        <p>Setelah melihat resep ayam merahnya, kayaknya enak banget. jadi pengen coba recook deh.</p>
				                        <img src="http://localhost/cookindo/resources/images/uploads/recipe/primary/20160131_09_39_42_79.jpg" style="width:100%; height:auto" />
				                    </div>
				                    <div class="timeline-action">
				                        <div class="action-bottom wrapper-ajax-link">
											<a title="Recook" class="ajax-modal" href="http://localhost/cookindo/users/login">
												<img src="http://localhost/cookindo/resources/icons/retweet.png">
												<span class="ml5">Recook</span>
											</a>			
											<a href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Flocalhost%2Fcookindo%2Fresep-masak%2F18%2Flapis-singkong&amp;t=lapis-singkong" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;" target="_blank" title="Share on Facebook">
												<img src="http://localhost/cookindo/resources/icons/facebook.png">
												<span class="ml5 mr10">Share</span>	
											</a>
											<a title="Cookmark" class="ajax-modal" href="http://localhost/cookindo/users/login">
												<img src="http://localhost/cookindo/resources/icons/cookmark.png">
												<span class="ml5 mr10">Cookmark</span>
											</a>
										</div>
				                    </div>
				                </div>
				            </li>

				            <li class="timeline-inverted">
				                <div class="timeline-badge cookmark">
				                    <a><span class="glyphicon glyphicon glyphicon-bookmark"></span></a>
				                </div>
				                <div class="timeline-panel">
				                    <div class="timeline-heading">
				                        <h4>Cookmark recipes Ayam Merah from Brian Alexandro</h4>
				                    </div>
				                    <div class="timeline-footer">
				                        <p class="text-right">Feb-23-2014</p>
				                    </div>
				                </div>
				            </li>

				            <li class="timeline-inverted">
				                <div class="timeline-badge">
				                    <a><span class="glyphicon glyphicon glyphicon-road"></span></a>
				                </div>
				                <div class="timeline-panel">
				                    <div class="timeline-heading">
				                        <h4>Started Using Cookindo</h4>
				                    </div>
				                    <div class="timeline-body">
				                        <p>Selamat datang di cookindo :)</p>
				                    </div>
				                    <div class="timeline-footer">
				                        <p class="text-right">Feb-21-2014</p>
				                    </div>
				                </div>
				            </li>
				            
				            <li class="clearfix no-float"></li>
				        </ul>
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