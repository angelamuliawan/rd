<nav class="navbar navbar-inverse navbar-fixed-top">
  	<div class="container">
    	<div class="navbar-header">
      		<?php
      				$span = tag('span', 'Toggle Navigation', array(
      					'class' => 'sr-only'
      				));
      				for($i = 0; $i < 3; $i++){
      					$span .= tag('span', false, array(
      						'class' => 'icon-bar'
      					));
      				}

      				echo tag('button', $span, array(
      					'type' => 'button',
      					'class' => 'navbar-toggle collapsed',
      					'data-toggle' => 'collapse',
      					'data-target' => '#navbar',
      					'aria-expanded' => 'false',
      					'aria-controls' => 'navbar'
      				));
      				echo tag('a', 'Cookindo', array(
						'href' => $domain,
						'class' => 'navbar-brand'
					));
					
					echo tag('img', false, array(
						'src' => $domain.'/resources/images/logos/logo.jpg',
						'class' => 'hide',
					));
      		?>
    	</div>
    	<div id="navbar" class="collapse navbar-collapse">
      		<ul class="nav navbar-nav navbar-right">
      			<?php
      					echo tag('a', 'Cari Resep', array(
							'href' => $domain.'/recipe/find',
							'wrapTag' => 'li',
						));
						
      					if( isLoggedIn() ) {
      						echo tag('a', 'Tulis Resep', array(
								'href' => $domain.'/recipe/add',
								'wrapTag' => 'li',
							));
      					} else {
      						echo tag('a', 'Tulis Resep', array(
								'href' => $domain.'/users/login',
		        				'data-title' => 'Login',
		        				'class' => 'ajax-modal',
		        				'wrapTag' => 'li',
							));
      					}

      					echo tag('a', 'Artikel', array(
							'href' => $domain.'/pages/article',
							'wrapTag' => 'li',
						));
      					
						echo tag('a', 'Kontes', array(
							'href' => $domain.'/recipe/contest',
							'wrapTag' => 'li',
						));

		     			if( isLoggedIn() ) { 

		     				$cnt_notif = 0;
		     				foreach( $notifications as $value ) {
								$isRead = $value['isRead'];
								if( $isRead == 0 ) {
									$cnt_notif++;
								}
							}

		     				$spanNotifIcon = tag('span', false, array(
		     					'class' => 'glyphicon glyphicon-bell mt3'
		     				));
		     				$spanNotifCount = '';
		     				if( !empty($cnt_notif) ) {
		     					$spanNotifCount = tag('span', $cnt_notif, array(
			     					'class' => 'badge vatop _mt5'
			     				));
		     				}

		     				echo tag('a', sprintf('Notifikasi %s %s', $spanNotifIcon, $spanNotifCount), array(
								'class' => 'mobile-only',
								'href' => $domain.'/users/notifications',
								'wrapTag' => 'li',
							));
        		?>
        		<li class="desktop-only">
        			<?php
        					echo tag('a', $spanNotifIcon.$spanNotifCount, array(
		     					'class' => 'dropdown-toggle',
								'data-toggle' => 'dropdown',
								'aria-hashpopup' => 'true',
								'aria-expanded' => 'false',
		     				));
        			?>
	        		<div id="notif-panel" class="dropdown-menu">
	        			<?php
	        					echo tag('div', 'Notifikasi', array(
	        						'class' => 'header'
	        					));
	        			?>
						<ul class="no-ul-type" style="max-height:300px; overflow-y:auto;">
							<?php
									if( isset($notifications) && !empty($notifications) ) {
										foreach( $notifications as $value ) {
											$notif_id = $value['NotificationID'];
											$notif = $value['NotificationName'];
											$notif_date = $value['NotificationDate'];
											$isRead = $value['isRead'];

											loadSubview('users/notification', array(
												'notif_id' => $notif_id,
												'notif' => $notif,
												'notif_date' => $notif_date,
												'isRead' => $isRead,
											));
										}
									} else {
										echo tag('h5', 'Notifikasi tidak tersedia', array(
											'wrapTag' => 'li',
										));
									}
							?>
						</ul>
						<div class="last">
							<?php
									echo tag('a', 'Tampilkan semua', array(
										'href' => $domain.'/users/notifications',
										'class' => 'btn btn-orange no-radius',
										'style' => 'display:block; color:#FFFFFF;',
									));
							?>
						</div>
					</div>
				</li>
        		<li class="dropdown">
        			<?php
        					$userphoto = $this->session->userdata('userphoto');
							$path_image = '/resources/images/uploads/users/'.$userphoto;
							$custom_image = $domain.$path_image;
							if( !file_exists( $webroot.$path_image ) ) {
								$custom_image = $domain.'/resources/images/64x64.png';
							}

        					$userImage = tag('img', $this->session->userdata('username'), array(
        						'class' => 'pull-left _mt7 mr5',
        						'src' => $custom_image,
        						'style' => 'width: 35px; height: 35px;',
        					));
        					$caret = tag('b', false, array(
        						'class' => 'caret',
        					));

        					echo tag('a', $userImage.$caret, array(
        						'href' => '#',
        						'class' => 'dropdown-toggle', 
        						'data-toggle' => 'dropdown',
        					));
        			?>
		          	<ul class="dropdown-menu">
		          		<?php
		          				echo tag('a', 'Resep Saya', array(
		          					'href' => $domain.'/recipe/',
		          					'wrapTag' => 'li',
		          				));
		          				echo tag('a', 'Recook', array(
		          					'href' => $domain.'/recipe/recook',
		          					'wrapTag' => 'li',
		          				));
		          				echo tag('a', 'Cookmark', array(
		          					'href' => $domain.'/recipe/cookmark',
		          					'wrapTag' => 'li',
		          				));
		          				echo divider();
		          				echo tag('a', 'Kontes Saya', array(
		          					'href' => $domain.'/recipe/my_contest',
		          					'wrapTag' => 'li',
		          				));
		          				echo tag('a', 'Pengaturan Akun', array(
		          					'href' => $domain.'/users/',
		          					'wrapTag' => 'li',
		          				));
		          				echo divider();
		          				if( $this->session->userdata('userrole') == 1 ) {
		          					echo tag('a', 'Buat Artikel', array(
			          					'href' => $domain.'/users/article',
			          					'wrapTag' => 'li',
			          				));
			          				echo divider();
		          				}
		          				echo tag('a', 'Logout', array(
		          					'href' => $domain.'/users/logout',
		          					'wrapTag' => 'li',
		          				));
		          		?>
		          	</ul>
		        </li>
		        <?php
		        		} else {
		        			echo tag('a', 'Login', array(
		        				'href' => $domain.'/users/login',
		        				'data-title' => 'Login',
		        				'class' => 'ajax-modal',
		        				'wrapTag' => 'li'
		        			));
		        		}
		        ?>
      		</ul>
    	</div>
  	</div>
</nav>