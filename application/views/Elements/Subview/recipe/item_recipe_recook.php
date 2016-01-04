<?php
		$recipe_id = isset($recipe_id)?$recipe_id:false;
		$recook_id = isset($recook_id)?$recook_id:false;
		$slug = isset($slug)?$slug:false;
		$image = isset($image)?$image:false;
		$title = isset($title)?$title:false;
		$recook_desc = isset($recook_desc)?$recook_desc:false;
		$date = isset($date)?$date:false;

		$cnt_comment = isset($cnt_comment)?$cnt_comment:false;
		$iconComment = tag('img', false, array(
			'src' => $domain.'/resources/icons/comment.png',
		));
		$totalComment = tag('span', $cnt_comment);

		$path_image = '/resources/images/uploads/recipe/recook/thumbs/'.$image;
		$custom_image = $domain.$path_image;
		if( !file_exists( $webroot.$path_image ) ) {
			$custom_image = $domain.'/resources/images/default.png';
		}

		$custom_title = tag('a', $title, array(
			'href' => $domain.'/resep-masak/'.$recipe_id.'/'.$slug,
		));
?>
<li class="no-ul-type">
	<div class="row">
		<div class="col-sm-4 left-side">
			<a href="<?php echo $domain.'/recipe/view_recook_item/'.$recook_id ?>" class="ajax-modal">
				<?php
						echo tag('img', false, array(
							'src' => $custom_image,
							'wrapTag' => 'div',
							'wrapAttributes' => array(
								'class' => 'box-header',
							),
						));

				?>
			</a>
			<div class="box-footer">
				<?php
						echo tag('div', $iconComment.$totalComment, array(
							'class' => 'pull-right mr10',
							'title' => 'Jumlah Komentar',
						));
				?>
			</div>
		</div>
		<div class="col-sm-8 right-side">
			<div class="box-description">
				<?php
						echo tag('h4', 'Recook from '.$custom_title);
						echo tag('p', $recook_desc, array(
							'class' => 'mt10 description'
						));
						echo tag('p', $date, array(
							'class' => 'pull-right mt10'
						));
				?>
			</div>
		</div>
	</div>
</li>