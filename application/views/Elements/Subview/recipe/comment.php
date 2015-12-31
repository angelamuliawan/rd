<?php
		$recipe_id = isset($recipe_id) ? $recipe_id : false;
?>

<div class="comment-box bg-white ajax-wrapper-form">
	<div class="row">
		<div class="col-sm-10">
			<div class="wrapper pd15">
				<?php
						echo tag('h3', 'Komentar');
						
				?>
				<form class="mt10 ajax-form" role="form" action="recipe/recipe_comment/<?php echo $recipe_id; ?>" method="post" accept-charset="utf-8">
				 	<div class="form-group">
				 		<?php
				 				echo tag('textarea', set_value('comment'), array(
				    				'rows' => 3,
				    				'class' => 'form-control',
				    				'name' => 'comment',
				    				'placeholder' => "Tuliskan komentar Anda &hellip;",
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
						if( !empty($valuesRecipeComment) ) {
							foreach( $valuesRecipeComment as $key => $value ) {
								$username = $value['UserName'];
								$comment = $value['Comment'];
								$comment_date = $value['CommentDate'];
								$user_photo = $value['UserPhoto'];

								$custom_image = $domain.'/resources/images/uploads/users/'.$user_photo;
								if( !@getimagesize($custom_image) ) {
									$custom_image = $domain.'/resources/images/64x64.png';
								}

								loadSubview('common/item_comment', array(
									'image' => $custom_image,
									'username' => $username,
									'comment' => $comment,
									'comment_date' => $comment_date,
								));
							}
						}
				?>
			</div>
		</div>
	</div>
</div>