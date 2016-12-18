<?php
		$value = isset($valuesRecipeHeader[0]) ? $valuesRecipeHeader[0] : false;
		$recipe_id = isset($recipe_id) ? $recipe_id : false;

		$title = isset($value['RecipeName']) ? $value['RecipeName'] : false;
?>
<!-- MODAL RECOOK -->
<div id="myModal" class="modal fade modal-recook">
  	<div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      	<div class="modal-header">
	        	<button type="button" class="close close-modal" data-dismiss="modal" aria-hidden="true">&times;</button>
	        	<h3 id="myModalLabel" class="modal-title">
	        		<?php
	        				echo lang('recook');
	        		?>
	        	</h3>
	      	</div>
	      	<div class="modal-body pd15">
	      		<div class="row">
		      		<div class="col-sm-12">
		      			<div class="big-wrapper">
		      				<?php
		      						echo tag('h4', sprintf('%s ala %s', $title, $this->session->userdata('username')));
		      				?>
		      				<form id="formRecook" role="form" action="recipe/recook_item/<?php echo $recipe_id; ?>" data-reload="true" class="ajax-form" enctype="multipart/form-data" method="post" accept-charset="utf-8">
					        	<?php
					        			if( isset($alert) ) {
											echo $alert;
										}
					        	?>
					        	<div class="with-border wrapper-recook-photo wrapper-ajax-upload">
					        		<div class="wrapper wrapper-photo" style="display:block; height:100%; height:150px; max-height:150px;">
					        			<?php
					        					if( !empty($request['photo']) ) {
					        						echo tag('img', false, array(
										        		'src' => $domain.'/resources/images/uploads/recipe/recook/'.$request['photo'],
										        		'style' => 'width:auto; height:100%;',
										        	));
					        					} else {
					        						echo tag('span', false, array(
					        							'class' => 'glyphicon glyphicon-upload',
					        							'wrapTag' => 'div',
					        						));
					        					}
					        			?>
					        		</div>
					        		<div class="text-wrapper">
					        			<?php
					        					echo tag('p', 'Drag & Drop');
					        					echo tag('p', lang('drag_to_upload'));
					        			?>
									    <span class="btn btn-primary fileinput-button">
									        <i class="glyphicon glyphicon-plus"></i>
									        <?php
									        		echo tag('span', lang('upload_recook_photo'));
									        ?>
									        <input id="fileupload" type="file" name="files" />
									    </span>
									    <?php
								        		echo form_error('photo'); 
								        ?>
									    <br>
									    <br>
									    <div id="files" class="files"></div>
					        		</div>
					        	</div>
					        	<?php
					        			echo tag('input', false, array(
					        				'id' => 'fuHiddenField',
					        				'name' => 'photo',
					        				'value' => set_value('photo'),
					        				'type' => 'hidden',
					        			));
					        			echo tag('textarea', set_value('RecookDesc'), array(
						    				'rows' => 4,
						    				'class' => 'form-control mt15',
						    				'name' => 'RecookDesc',
						    				'placeholder' => lang('describe_recook_story'),
						    				'maxlength' => 500,
						    			));
										echo form_error('RecookDesc'); 
					        	?>
				        		<div class="form-group mt20 taright">
							  		<button type="button" class="btn btn-default" data-dismiss="modal">
							  			<?php
							  					echo lang('cancel');
							  			?>
							  		</button>
							  		<input type="submit" class="btn btn-primary" value="<?php echo lang('save'); ?>" />
							    </div>
		      				</form>
		      			</div>
		      		</div>
	      		</div>
	      	</div>
	    </div>
  	</div>
</div>