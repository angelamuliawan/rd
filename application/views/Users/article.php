<div class="container bg-white">
	<div class="big-wrapper bg-white pd20">
		<?php
				if( isset($alert) ) {
					echo $alert;
				}
				
				echo tag('h2', lang('create_article'));
		?>
		<div class="wrapper-create-article">
			<form class="form-horizontal mt20" enctype="multipart/form-data" role="form" method="post" accept-charset="utf-8">
			  	<div class="form-group">
			  		<?php
			  				echo tag('label', lang('title'), array(
			  					'for' => 'title',
			  					'class' => 'col-sm-2 control-label',
			  				));
			  		?>
				    <div class="col-sm-9">
				    	<?php
				    			echo tag('input', set_value('title'), array(
				    				'type' => 'text',
				    				'class' => 'form-control',
				    				'name' => 'title',
				    				'value' => ( isset($request['title']) ? $request['title']: set_value('title') ),
				    			));
				    			echo form_error('title');
				    	?>
				    </div>
			  	</div>
				<div class="form-group">
					<?php
			  				echo tag('label', lang('content'), array(
			  					'for' => 'content',
			  					'class' => 'col-sm-2 control-label',
			  				));
			  		?>
					<div class="col-sm-9">
						<?php
								echo tag('textarea', ( isset($request['content']) ? $request['content']: set_value('content') ) , array(
				    				'rows' => 4,
				    				'class' => 'form-control',
				    				'name' => 'content',
				    				'class' => 'fr-custom-textarea',
				    			));
								echo form_error('content'); 
						?>
					</div>
				</div>
				<div class="form-group">
					<?php
			  				echo tag('label', lang('main_picture'), array(
			  					'for' => 'photo',
			  					'class' => 'col-sm-2 control-label',
			  				));
			  		?>
					<div class="col-sm-7">
						<?php
								if( isset($request['photo_preview']) ) {
									$custom_image = $domain.'/resources/images/uploads/article/primary/'.$request['photo_preview'];
									if( @getimagesize($custom_image) ) {
										echo tag('img', false, array(
											'src' => $custom_image,
											'style' => 'width: 100%; max-width: 200px;',
										));
										echo tag('input', false, array(
											'type' => 'hidden',
											'name' => 'photo_preview',
											'value' => $request['photo_preview'],
										));
									}
								}
								echo tag('input', false, array(
									'type' => 'file',
									'name' => 'photo',
								));
								echo form_error('photo'); 
						?>
					</div>
				</div>
			  	<div class="form-group">
			  		<?php
			  				echo tag('button', lang('save'), array(
			  					'class' => 'btn btn-orange',
			  					'type' => 'submit',
			  					'wrapTag' => 'div',
			  					'wrapAttributes' => array(
			  						'class' => 'col-sm-offset-2 col-sm-2'
			  					)
			  				));
			  		?>
			  	</div>
			</form>
		</div>
	</div>
</div>