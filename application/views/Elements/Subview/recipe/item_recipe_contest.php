<?php
		$recipe_id = isset($recipe_id)?$recipe_id:false;		
		$title = isset($title)?$title:false;
		$image = isset($image)?$image:false;
		$slug = isset($slug)?$slug:false;
		$username = isset($username)?$username:false;
		$user_id = isset($user_id)?$user_id:false;

		$path_image = '/resources/images/uploads/recipe/primary/thumbs/'.$image;
		$custom_image = $domain.$path_image;
		if( !file_exists( $webroot.$path_image ) ) {
			$custom_image = $domain.'/resources/images/placeholder/recipe.jpg';
		}

		$url = $domain.'/p/'.$recipe_id.'/'.$slug;
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
					echo tag('a', $username, array(
						'title' => $username,
						'href' => $domain.'/users/profile/'.$user_id.'/'.seoURL($username),
						'class' => 'pull-right mr5 username',
						'target' => '_blank',
					));
					echo tag('div', sprintf('%s ', lang('by')), array(
						'class' => 'pull-right mr5',
						'title' => 'Jumlah Komentar',
					));
			?>
		</div>
	</a>
</li>