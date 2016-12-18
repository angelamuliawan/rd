<?php
		$recipe_id = isset($recipe_id) ? $recipe_id : false;
		$_class = isset($_class)?$_class:'';
		$_with_padding = isset($_with_padding)?$_with_padding:'pd15';
		$_show_title = isset($_show_title)?$_show_title:true;
		$_show_empty = isset($_show_empty)?$_show_empty:true;
		$_url = isset($_url)?$_url:'recipe/recipe_comment/';

		$_type = isset($_type)?$_type:'recipe';
		$action_url = $_url.$recipe_id;
?>

<div class="comment-box bg-white ajax-wrapper-form hidden-print">
	<div class="row">
		<div class="col-sm-10">
			<div class="wrapper <?php echo $_with_padding; ?> <?php echo $_class; ?>">
				<?php
						if( !empty($_show_title) )  {
							echo tag('h3', 'Komentar');
						}

						if( empty($valuesRecipeComment) ) {
							if( $_show_empty ) {
								echo tag('h5', 'Komentar tidak ditemukan', array(
									'class' => 'mt5'
								));
							}
						}
						
						if ( isLoggedIn() ) {
				?>
				<form class="mt10 ajax-form" role="form" action="<?php echo $action_url; ?>" method="post" accept-charset="utf-8">
				 	<div class="form-group">
				 		<?php
				 				echo tag('textarea', (isset( $comment ) ? $comment : set_value('comment')), array(
				    				'rows' => 3,
				    				'class' => 'form-control',
				    				'name' => 'comment',
				    				'placeholder' => "Tuliskan komentar Anda &hellip;",
				    				'maxlength' => 200,
				    			));
								echo form_error('comment');
				 		?>
				  	</div>
				  	<?php
				  			echo tag('button', 'Kirim Komentar', array(
			  					'class' => 'btn btn-orange',
			  					'type' => 'submit',
			  				));
				  	?>
				</form>

				<?php
						}
				?>

				<div class="wrapper-comment">
					<?php
							if( !empty($valuesRecipeComment) ) {
								if( $_type == 'recipe' ) {
									foreach( $valuesRecipeComment as $key => $value ) {
										$user_id = $value['UserID'];
										$username = $value['UserName'];
										$comment_id = $value['FoodCommentID'];
										$comment = $value['Comment'];
										$comment_date = $value['CommentDate'];
										$user_photo = $value['UserPhoto'];

										$path_image = '/resources/images/uploads/users/'.$user_photo;
										$custom_image = $domain.$path_image;
										if( !file_exists( $webroot.$path_image ) ) {
											$custom_image = $domain.'/resources/images/64x64.png';
										}

										loadSubview('common/item_comment', array(
											'image' => $custom_image,
											'user_id' => $user_id,
											'username' => $username,
											'comment_id' => $comment_id,
											'comment' => $comment,
											'comment_date' => $comment_date,
										));
									}
								} else if ( $_type == 'recook' ) {
									foreach( $valuesRecipeComment as $key => $value ) {
										$user_id = $value['UserID'];
										$username = $value['RecookUserName'];
										$comment_id = $value['RecookCommentID'];
										$comment = $value['RecookCommentDesc'];
										$comment_date = $value['RecookCommentTime'];
										$user_photo = $value['UserPhoto'];

										$path_image = '/resources/images/uploads/users/'.$user_photo;
										$custom_image = $domain.$path_image;
										if( !file_exists( $webroot.$path_image ) ) {
											$custom_image = $domain.'/resources/images/64x64.png';
										}

										loadSubview('common/item_comment', array(
											'image' => $custom_image,
											'user_id' => $user_id,
											'username' => $username,
											'comment_id' => $comment_id,
											'comment' => $comment,
											'comment_date' => $comment_date,
											'urlDelete' => '/recipe/delete_recook_comment/',
										));
									}
								}
							}

							if( !isLoggedIn() ) {
								echo tag('a', 'Login untuk mengomentari', array(
									'title' => 'Login',
									'data-title' => 'Login',
									'href' => $domain.'/users/login',
				  					'class' => 'btn btn-orange mt10 ajax-modal',
				  				));
							}
					?>
				</div>
			</div>
		</div>
	</div>
</div>