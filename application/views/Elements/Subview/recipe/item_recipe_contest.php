<?php
		$recipe_id = isset($recipe_id)?$recipe_id:false;		
		$title = isset($title)?$title:false;
		$image = isset($image)?$image:false;
		$slug = isset($slug)?$slug:false;
		$username = isset($username)?$username:false;
		$user_id = isset($user_id)?$user_id:false;

		$path_image = '/resources/images/uploads/recipe/primary/'.$image;
		$custom_image = $domain.$path_image;
		if( !file_exists( $webroot.$path_image ) ) {
			$custom_image = $domain.'/resources/images/default.png';
		}

		$url = $domain.'/resep-masak/'.$recipe_id.'/'.$slug;
?>
<li class="no-ul-type with-border">
	<a href="<?php echo $url; ?>" target="_blank">
		<?php
				echo tag('img', false, array(
					'src' => $custom_image,
					'wrapTag' => 'div',
					'wrapAttributes' => array(
						'class' => 'box-header',
					),
				));
				echo tag('h4', $title, array(
					'wrapTag' => 'div',
					'wrapAttributes' => array(
						'class' => 'box-content',
					),
				));
		?>
		<div class="box-footer bg-orange">
			<?php
					// echo tag('div', $iconComment.$totalComment, array(
					// 	'class' => 'pull-right mr5',
					// 	'title' => 'Jumlah Komentar',
					// ));
					// echo tag('div', $iconRecook.$totalRecook, array(
					// 	'class' => 'pull-right mr10',
					// 	'title' => 'Jumlah Recook',
					// ));
					// echo tag('div', $iconView.$totalView, array(
					// 	'class' => 'pull-right mr10',
					// 	'title' => 'Jumlah View',
					// ));
					echo tag('a', $username, array(
						'title' => $username,
						'href' => $domain.'/users/profile/'.$user_id.'/'.seoURL($username),
						'class' => 'pull-right mr5 username',
						'target' => '_blank',
					));
					echo tag('div', 'oleh ', array(
						'class' => 'pull-right mr5',
						'title' => 'Jumlah Komentar',
					));
			?>
		</div>
	</a>
	<!-- <a href="<?php echo $url; ?>">
	    <div class="box-header">
			<?php
					echo tag('span', $title, array(
						'class' => 'wrapper-inner'
					));
					echo tag('img', false, array(
						'src' => $custom_image,
					));
			?>
			<div class="box-footer">
				<?php
						echo tag('div', $iconComment.$totalComment, array(
							'class' => 'pull-right mr5',
							'title' => 'Jumlah Komentar',
						));
						echo tag('div', $iconRecook.$totalRecook, array(
							'class' => 'pull-right mr10',
							'title' => 'Jumlah Recook',
						));
				?>
			</div>
		</div>
	</a> -->
</li>