<?php
		$valuesRecipeRecook = isset( $valuesRecipeRecook[0] ) ? $valuesRecipeRecook[0] : false;
		$recook_id = $valuesRecipeRecook['RecookID'];
		$recook_user_id = $valuesRecipeRecook['UserID'];
		$recook_username = $valuesRecipeRecook['UserName'];
		$recook_photo = $valuesRecipeRecook['RecookPhoto'];
		$recook_desc = $valuesRecipeRecook['RecookDesc'];
		$recipe = $valuesRecipeRecook['RecipeName'];

		$path_image = '/resources/images/uploads/recipe/recook/'.$recook_photo;
		$custom_image = $domain.$path_image;
		if( !file_exists( $webroot.$path_image ) ) {
			$custom_image = $domain.'/resources/images/default.png';
		}
?>

<!-- MODAL VIEW RECOOK -->
<div id="myModal" class="modal fade modal-view-recook">
  	<div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      	<div class="modal-header">
	        	<button type="button" class="close close-modal" data-dismiss="modal" aria-hidden="true">&times;</button>
	        	<?php
	        			echo tag('h3', sprintf('Recook from %s', $recipe), array(
	        				'id' => 'myModalLabel',
	        				'class' => 'modal-title',
	        			));
	        			echo tag('span', 'by ');
	        			echo tag('a', $recook_username, array(
	        				'href' => $domain.'/users/profile/'.$recook_user_id,
	        			));
	        	?>
	      	</div>
	      	<div class="modal-body pd15">
	      		<div class="row">
		      		<div class="col-sm-12">
		      			<div class="big-wrapper">
		      				<div class="row">
		      					<div class="col-sm-6 col-xs-12">
		      						<?php
		      								echo tag('img', false, array(
		      									'src' => $custom_image,
		      									'style' => 'width:100%; height:auto;',
		      									'wrapTag' => 'div',
		      									'wrapAttributes' => array(
		      										'class' => 'wrapper-left',
		      										'style' => 'width:100%; height:auto;',
		      									),
		      								));
		      								echo tag('p', $recook_desc, array(
		      									'class' => 'mt10',
		      								));
		      						?>
		      					</div>
		      					<div class="col-sm-6 col-xs-12" >
		      						<form id="formViewRecook" role="form" action="recipe/view_recook_item/<?php echo $recook_id; ?>" class="ajax-form" enctype="multipart/form-data" method="post" accept-charset="utf-8">
			      						<?php
			      								if( !empty($valuesRecookComment) ) {
			      						?>
						      						<div class="wrapper-right" style="width:100%; height:auto; max-height:330px; overflow-y:auto;">
						      							<?php
						      									foreach( $valuesRecookComment as $value ) {
						      										$user_id = $value['UserID'];
						      										$recook_comment_id = $value['RecookCommentID'];
						      										$comment_username = $value['RecookUserName'];
						      										$comment = $value['RecookCommentDesc'];
						      										$comment_time = $value['RecookCommentTime'];
						      										$user_photo = $value['UserPhoto'];

																	$path_image = '/resources/images/uploads/users/'.$user_photo;
																	$custom_image = $domain.$path_image;
																	if( !file_exists( $webroot.$path_image ) ) {
																		$custom_image = $domain.'/resources/images/64x64.png';
																	}

																	loadSubview('recipe/item_recook_comment', array(
																		'user_id' => $user_id,
																		'recook_comment_id' => $recook_comment_id,
																		'comment_username' => $comment_username,
																		'comment' => $comment,
																		'comment_time' => $comment_time,
																		'photo' => $custom_image,
																	));
						      									}
						      							?>
						      						</div>
			      						<?php
			      								} else {
			      									echo tag('h4', 'Komentar tidak ditemukan');
			      								}

			      								if( isLoggedIn() ) {
			      									echo tag('textarea', set_value('recook_comment'), array(
			      										'name' => 'recook_comment',
			      										'rows' => 3,
			      										'class' => 'form-control mt15 submit-on-enter',
			      										'placeholder' => 'Tuliskan komentar Anda disini &hellip;',
			      									));
			      									echo form_error('recook_comment');
			      								}
			      						?>
		      						</form>
		      					</div>
		      				</div>	
			        	</div>
		      		</div>
	      		</div>
	      	</div>
	      	<!-- <div class="modal-footer">
	      		<div class="row">
	      			<div class="col-sm-12">
			      		<div class="carousel slide" id="bottom-carousel">
						  	<div class="carousel-inner">
							    <div class="item active">
							      	<div class="col-xs-2">
							      		<a href="" data-toggle="modal" data-target="#modal-view-recook">
							      			<img src="<?=$domain?>/resources/images/food/nasi-goreng.jpg" class="img-responsive">
							      		</a>
							      	</div>
							    </div>
							    <div class="item">
							      	<div class="col-xs-2">
							      		<a href="" data-toggle="modal" data-target="#modal-view-recook">
							      			<img src="<?=$domain?>/resources/images/food/sate.jpg" class="img-responsive">
							      		</a>
							      	</div>
							    </div>
							    <div class="item">
							      	<div class="col-xs-2">
							      		<a href="" data-toggle="modal" data-target="#modal-view-recook">
							      			<img src="<?=$domain?>/resources/images/food/bakso.jpg" class="img-responsive">
							      		</a>
							      	</div>
							    </div>
							    <div class="item">
							      	<div class="col-xs-2">
							      		<a href="" data-toggle="modal" data-target="#modal-view-recook">
							      			<img src="<?=$domain?>/resources/images/food/sate.jpg" class="img-responsive">
							      		</a>
							      	</div>
							    </div>
							    <div class="item">
							      	<div class="col-xs-2">
							      		<a href="" data-toggle="modal" data-target="#modal-view-recook">
							      			<img src="<?=$domain?>/resources/images/food/bakso.jpg" class="img-responsive">
							      		</a>
							      	</div>
							    </div>
							    <div class="item">
							      	<div class="col-xs-2">
							      		<a href="" data-toggle="modal" data-target="#modal-view-recook">	
							      			<img src="<?=$domain?>/resources/images/food/nasi-goreng.jpg" class="img-responsive">
							      		</a>
							      	</div>
							    </div>
						  	</div>
						  	<a class="left carousel-control" href="#bottom-carousel" data-slide="prev"><i class="glyphicon glyphicon-chevron-left"></i></a>
						  	<a class="right carousel-control" href="#bottom-carousel" data-slide="next"><i class="glyphicon glyphicon-chevron-right"></i></a>
						</div>
					</div>
				</div>
	      	</div> -->
	    </div>
  	</div>
</div>