<?php 
		$comment = isset($comment) ? $comment : false;
		$recipe_name = isset($recipe_name) ? $recipe_name : false;
		$slug = isset($slug) ? $slug : false;
		$user_id = isset($user_id) ? $user_id : false;
		$username = isset($username) ? $username : false;
		$recook_id = isset($recook_id) ? $recook_id : false;

		$url_user = $domain.'/users/profile/'.$user_id.'/'.seoURL($username);
		$url_recook = $domain.'/recook/'.$recook_id.'/'.$slug;
		
		$link_recook = tag('a', $recipe_name, array(
			'href' => $url_recook,
			'target' => '_blank'
		));

		$link_user = tag('a', $username, array(
			'href' => $url_user,
			'target' => '_blank'
		));

		echo tag('p', 'Hasil recook '.$link_recook.' dikomentari oleh '.$link_user, array(
			'style' => 'color: #303030; font-size: 14px; line-height: 20px;',
		));

		echo tag('h3', '"'.$comment.'"', array(
			'style' => 'color: #303030;',
		));

		echo tag('a', 'Lihat Komentar', array(
			'href' => $url_recook,
			'style' => 'margin:15px auto;padding:10px; font-size: 14px; background-color: #E66909; text-decoration:none; color:#fff; border-radius: 3px;',
			'target' => '_blank',
		));
?>