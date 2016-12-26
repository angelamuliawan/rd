<?php
		$activity = isset( $activity ) ? $activity : false;
		$activity_desc = isset( $activity_desc ) ? $activity_desc : false;
		$activity_date = isset( $activity_date ) ? $activity_date : false;
		$intro = isset( $intro ) ? strip_tags($intro) : false;
		
		$recipe_id = isset( $recipe_id ) ? $recipe_id : false;
		$recook_id = isset( $recipe_id ) ? $recook_id : false;
		$cookmark_id = isset( $cookmark_id ) ? $cookmark_id : false;
		$image = isset( $image ) ? $image : false;
		$slug = isset( $slug ) ? $slug : false;

		$blocked_recipe_reason = isset( $blocked_recipe_reason ) ? $blocked_recipe_reason : false;
		$blocked_recook_reason = isset( $blocked_recook_reason ) ? $blocked_recook_reason : false;

		$desc_reason = false;

		if( !empty($blocked_recipe_reason) ) {
			$desc_reason = $blocked_recipe_reason;
		} else if( !empty($blocked_recook_reason) ) {
			$desc_reason = $blocked_recook_reason;
		}

		$badge = false;
		$icon_class = false;

		$url = $domain.'/p/'.$recipe_id.'/'.$slug;
		$activity_link = false;

		if( $activity == 'Recook' || $activity == 'CommentRecook' ) {
			$url = $domain.'/recook/'.$recook_id.'/'.$slug;
		}

		if( $activity == 'InsertRecipe' ) {
			$activity_link = 'Membuat resep ' .tag('a', $activity_desc, array(
				'href' => $url,
				'title' => $activity_desc,
				'class' => 'fbold',
			));
			$icon_class = 'glyphicon glyphicon glyphicon-edit';
			$badge = 'add';
		} else if( $activity == 'Recook' ) {
			$activity_link = 'Melakukan recook ' .tag('a', $activity_desc, array(
				'href' => $url,
				'title' => $activity_desc,
				'class' => 'fbold',
			));
			$icon_class = 'glyphicon glyphicon glyphicon-retweet';
			$badge = 'recook';
		} else if( $activity == 'Cookmark' ) {
			$activity_link = 'Menyimpan resep ' .tag('a', $activity_desc, array(
				'href' => $url,
				'title' => $activity_desc,
				'class' => 'fbold',
			));
			$icon_class = 'glyphicon glyphicon glyphicon-bookmark';
			$badge = 'cookmark';
		} else if( $activity == 'CommentRecipe' ) {
			$activity_link = 'Mengomentari resep ' .tag('a', $activity_desc, array(
				'href' => $url,
				'title' => $activity_desc,
				'class' => 'fbold',
			));
			$icon_class = 'glyphicon glyphicon glyphicon-comment';
			$badge = 'comment';
		} else if( $activity == 'CommentRecook' ) {
			$activity_link = 'Mengomentari recook ' .tag('a', $activity_desc, array(
				'href' => $url,
				'title' => $activity_desc,
				'class' => 'fbold',
			));
			$icon_class = 'glyphicon glyphicon glyphicon-comment';
			$badge = 'comment';
		} else {
			$activity_link = $activity_desc;
			$icon_class = 'glyphicon glyphicon glyphicon-road';
			$url = '#';
		}

		$path_image = '/resources/images/uploads/recipe/primary/thumbs/'.$image;
		if( $activity == 'Recook' ) {
			$path_image = '/resources/images/uploads/recipe/recook/thumbs/'.$image;
		}

		$custom_image = $domain.$path_image;
		if( !file_exists( $webroot.$path_image ) ) {
			$custom_image = $domain.'/resources/images/default.png';
		}
?>

<li class="timeline-inverted wrapper-ajax-link">
    <div class="timeline-badge <?php echo $badge; ?>">
    	<?php
    			echo tag('span', false, array(
    				'class' => $icon_class,
    				'wrapTag' => 'a',
    				'wrapAttributes' => array(
    					'href' => $url,
    					'title' => $activity_desc,
    				),
    			));
    	?>
    </div>
    <div class="timeline-panel">
        <div class="timeline-heading">
        	<?php
        			echo tag('h4', $activity_link, array(
        				'class' => 'pull-left',
        			));

        			if( ( $activity == 'InsertRecipe' || $activity == 'Recook' || $activity == 'Cookmark' ) && $this->session->userdata('userid') == $user_id_viewer ) {
        	?>
			        	<div class="pull-right pd5">
				        	<div class="btn-group">
							    <button style="border-color: #fff;" type="button" class="btn btn-default dropdown-toggle pd5" data-toggle="dropdown">
							      	<span class="glyphicon glyphicon-chevron-down"></span>
							    </button>
							    <ul class="dropdown-menu custom-timeline">
							    	<?php
							    			if( $activity == 'InsertRecipe' ) {
							    				echo tag('a', 'Edit', array(
							    					'title' => 'Edit',
							    					'href' => $domain.'/recipe/edit/'.$recipe_id,
							    					'wrapTag' => 'li',
							    				));
							      			}

							      			$delete_href = $domain.'/recipe/delete/'.$recipe_id;
							      			if( $activity == 'Recook' ) {
							      				$delete_href = $domain.'/recipe/delete_recook/'.$recook_id;
							      			} else if( $activity == 'Cookmark' ) {
							      				$delete_href = $domain.'/recipe/uncookmark_item/'.$recipe_id.'/'.$cookmark_id.'/1';
							      			}
							      			
							      			echo tag('a', 'Hapus', array(
							      				'title' => 'Hapus',
						    					'href' => $delete_href,
												'class' => 'ajax-link',
												'remove' => true,
												'with-confirm' => "Yakin ingin menghapus?",
						    					'wrapTag' => 'li',
						    				));		
							      	?>
							    </ul>
						  	</div>
						</div>
        	<?php
        			}

        			echo tag('div', false, array(
        				'class' => 'clearfix'
        			));
        			echo tag('p', $activity_date);
        	?>
        </div>
        <div class="timeline-body">
        	<?php
        			echo tag('p', $intro);

        			if( $activity != 'CommentRecipe' && $activity != 'CommentRecook' && $activity != 'Join' ) {
	        			echo tag('img', false, array(
	        				'src' => $custom_image,
	        				'wrapTag' => 'a',
		    				'wrapAttributes' => array(
		    					'href' => $url,
		    					'title' => $activity_desc,
		    				),
	        			));
	        		}
        	?>
        </div>
        <?php
        		if( $activity != 'CommentRecipe' && $activity != 'CommentRecook' && $activity != 'Join' ) {
        ?>
        	<div class="timeline-action">
        	<?php
        			loadSubview('common/action_bottom_find');

	        		if( !empty($desc_reason) && $this->session->userdata('userid') == $user_id_viewer ) {
	        			echo tag('span', 'Blocked', array(
	        				'class' => 'label label-danger'
	        			));
	        			echo tag('p', sprintf('Resep ini tidak ditampilkan karena <b>%s</b>', $desc_reason), array(
	        				'class' => 'mt10'
	        			));
	        		}
        	?>
        	</div>
        <?php
        		}
        ?>
    </div>
</li>