<?php
		$article_id = isset($article_id) ? $article_id : false;
?>

<div class="comment-box bg-white ajax-wrapper-form hidden-print">
	<div class="row">
		<div class="col-sm-10">
			<div class="wrapper pd15">
				<?php
						echo tag('h3', 'Komentar');

						if( empty($valuesArticleComment) ) {
							echo tag('h5', 'Komentar tidak ditemukan', array(
								'class' => 'mt5'
							));
						}
						
						if ( isLoggedIn() ) {
				?>
				<form class="mt10 ajax-form" role="form" action="pages/article_comment/<?php echo $article_id; ?>" method="post" accept-charset="utf-8">
				 	<div class="form-group">
				 		<?php
				 				echo tag('textarea', set_value('comment'), array(
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

						if( !empty($valuesArticleComment) ) {
							foreach( $valuesArticleComment as $key => $value ) {
								$user_id = $value['UserID'];
								$username = $value['UserName'];
								$comment_id = $value['ArticleCommentID'];
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
									'urlDelete' => '/pages/delete_article_comment/',
								));
							}
						}
				?>
			</div>
		</div>
	</div>
</div>