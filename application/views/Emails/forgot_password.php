<?php 
		$reset_code = isset($reset_code) ? $reset_code : false;
		$url = $domain.'/users/verify/'.$reset_code;
		
		echo tag('p', 'Anda telah melakukan permintaan untuk mereset password Anda. Untuk melanjutkan proses reset, silahkan kunjungi link di bawah ini.', array(
			'style' => 'color: #303030; font-size: 14px; line-height: 20px;',
		));

		echo tag('a', 'Reset Password', array(
			'href' => $url,
			'style' => 'margin:15px auto;padding:10px; font-size: 14px; background-color: #E66909; text-decoration:none; color:#fff; border-radius: 3px;',
			'target' => '_blank',
		));

		echo tag('p', 'Jika Anda tidak dapat mengklik link diatas, Anda juga dapat mereset password Anda dengan mengunjungi URL di bawah ini :', array(
			'style' => 'color: #303030; font-size: 14px; line-height: 20px;',
		));

		echo tag('a', $url, array(
			'href' => $url,
			'style' => 'margin:15px auto; font-size: 14px; text-decoration:none; border-radius: 3px;',
			'target' => '_blank',
		));

		echo tag('p', 'Jika Anda tidak merasa melakukan permintaan reset password, mohon periksa kembali akun Anda, dan mengganti password Anda apabila dirasa perlu, untuk keamanan akun Anda dan mencegah hal-hal yang tidak diinginkan.', array(
			'style' => 'color: #303030; font-size: 14px; line-height: 20px;'
		));
?>