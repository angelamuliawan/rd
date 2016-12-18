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
						'class' => 'navbar-brand mr15'
					));
      		?>
      	</div>
    	<div id="navbar" class="collapse navbar-collapse">

      		<ul class="nav navbar-nav navbar-right _mr15">
      			<?php
      					if( isLoggedIn() ) {
      						echo tag('a', lang('home'), array(
								'href' => $domain.'/users/home',
								'wrapTag' => 'li',
							));
      					}

      					echo tag('a', lang('search_recipe'), array(
							'href' => $domain.'/recipe/find',
							'wrapTag' => 'li',
						));
						
      					if( isLoggedIn() ) {
      						echo tag('a', lang('create_recipe'), array(
								'href' => $domain.'/recipe/add',
								'wrapTag' => 'li',
							));
      					} else {
      						echo tag('a', lang('create_recipe'), array(
								'href' => $domain.'/users/login?redirect_after=recipe/add',
		        				'data-title' => 'Login',
		        				'class' => 'ajax-modal',
		        				'wrapTag' => 'li',
							));
      					}

      					echo tag('a', lang('article'), array(
							'href' => $domain.'/pages/article',
							'wrapTag' => 'li',
						));
      					
						echo tag('a', lang('contest'), array(
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

		     				echo tag('a', sprintf('%s %s %s', lang('notification'), $spanNotifIcon, $spanNotifCount), array(
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
								'style' => 'height: 50px;',
		     				));
        			?>
	        		<div id="notif-panel" class="dropdown-menu">
	        			<?php
	        					echo tag('div', lang('notification'), array(
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
									echo tag('a', lang('show_all'), array(
										'href' => $domain.'/users/notifications',
										'class' => 'btn btn-orange no-radius',
										'style' => 'display:block; color:#FFFFFF;',
									));
							?>
						</div>
					</div>
				</li>
        		<li id="user-menu-dropdown" class="dropdown">
        			<?php
        					$userphoto = $this->session->userdata('userphoto');
							$path_image = '/resources/images/uploads/users/thumbs/'.$userphoto;
							$custom_image = $domain.$path_image;

							if( !file_exists( $webroot.$path_image ) ) {
								$firstLetter =  !empty( $this->session->userdata('username')[0] ) ? strtoupper($this->session->userdata('username')[0]) : false;
								$userImage = tag('div', $firstLetter, array(
	        						'class' => 'alphabet-placeholder pull-left _mt7 mr5 img-circle',
	        						'style' => 'width: 35px; height: 35px; line-height: 40px;',
	        					));
							} else {
								$userImage = tag('img', false, array(
	        						'class' => 'pull-left _mt7 mr5 img-circle',
	        						'src' => $custom_image,
	        						'style' => 'width: 35px; height: 35px;',
	        						'img-progressive-type' => 'users',
	        					));
							}

        					
        					$caret = tag('b', false, array(
        						'class' => 'caret',
        					));

        					echo tag('a', $userImage . strtok($this->session->userdata('username'), " ") . $caret, array(
        						'href' => '#',
        						'class' => 'dropdown-toggle', 
        						'data-toggle' => 'dropdown',
        					));
        			?>
		          	<ul class="dropdown-menu">
		          		<?php
		          				$url = $domain.'/users/profile/'.$this->session->userdata('userid').'/'.seoURL($this->session->userdata('username'));

		          				echo tag('a', lang('profile'), array(
		          					'href' => $url,
		          					'wrapTag' => 'li',
		          				));
		          				echo tag('a', lang('recipe'), array(
		          					'href' => $url.'?param=InsertRecipe',
		          					'wrapTag' => 'li',
		          				));
		          				echo tag('a', lang('recook'), array(
		          					'href' => $url.'?param=Recook',
		          					'wrapTag' => 'li',
		          				));
		          				echo tag('a', lang('cookmark'), array(
		          					'href' => $url.'?param=Cookmark',
		          					'wrapTag' => 'li',
		          				));
		          				echo divider();
		          				echo tag('a', lang('contest'), array(
		          					'href' => $domain.'/recipe/my_contest',
		          					'wrapTag' => 'li',
		          				));
		          				echo tag('a', lang('account_setting'), array(
		          					'href' => $domain.'/users/',
		          					'wrapTag' => 'li',
		          				));
		          				echo divider();
		          				if( $this->session->userdata('userrole') == 1 ) {
		          					echo tag('a', lang('create-article'), array(
			          					'href' => $domain.'/users/article',
			          					'wrapTag' => 'li',
			          				));
			          				echo divider();
		          				}
		          				echo tag('a', lang('logout'), array(
		          					'href' => $domain.'/users/logout',
		          					'wrapTag' => 'li',
		          				));
		          		?>
		          	</ul>
		        </li>
		        <?php
		        		} else {
		        			$method_name = ucwords($this->router->method);
		        			$ajax_login_class = 'ajax-modal';
		        			$display_text = 'Login';

		        			if( $method_name == 'Login' || $method_name == 'Register' ) {
		        				$ajax_login_class = '';
		        				if( $method_name == 'Login' ) {
		        					$display_text = 'Register';
		        				}
		        			}

		        			echo tag('a', lang(strtolower($display_text)), array(
		        				'href' => $domain.'/users/'.strtolower($display_text),
		        				'data-title' => 'Login',
		        				'class' => $ajax_login_class,
		        				'wrapTag' => 'li'
		        			));
		        		}
		        ?>

		        <li id="lang-menu-dropdown" class="dropdown">
			        	<?php
								$path_image = '/resources/images/flags/'. $site_lang .'.png';
								$custom_image = $domain.$path_image;
								$flagImage = tag('img', false, array(
	        						'src' => $custom_image,
	        						'data-disable-progressive' => true,
	        					));

			        			$caret = tag('b', false, array(
	        						'class' => 'caret',
	        					));

	        					echo tag('a', $flagImage.$caret, array(
	        						'href' => '#',
	        						'class' => 'dropdown-toggle', 
	        						'data-toggle' => 'dropdown',
	        					));
			        	?>
			        	<ul class="dropdown-menu">
			          		<?php
			          				$flagIndonesianImage = tag('img', false, array(
		        						'src' => $domain.'/resources/images/flags/indonesian.png',
		        						'data-disable-progressive' => true,
		        					));

		        					$flagEnglishImage = tag('img', false, array(
		        						'src' => $domain.'/resources/images/flags/english.png',
		        						'data-disable-progressive' => true,
		        					));

			          				echo tag('a', $flagIndonesianImage . 'Indonesian', array(
			          					'href' => $domain.'/langswitch/switch_language/indonesian',
			          					'wrapTag' => 'li',
			          				));
			          				echo tag('a', $flagEnglishImage . 'English', array(
			          					'href' => $domain.'/langswitch/switch_language/english',
			          					'wrapTag' => 'li',
			          				));
			          		?>
			          	</ul>
			    </li>
      		</ul>

      		<?php
      				if( isLoggedIn() ) {
      		?>
      					<!--
			      		<form class="navbar-form">
					        <div class="form-group" style="display:inline;" />
					          	<div class="input-group">
					            	<?php
											// echo tag('input', false, array(
							    // 				'type' => 'text',
							    // 				'class' => 'form-control autocomplete',
							    // 				'name' => 'chef_keyword',
							    // 				'placeholder' => 'Temukan chef &hellip;',
							    // 				'value' => isset( $request['UserName'] ) ? $request['UserName'] : false,
							    // 				'maxlength' => 100,
							    // 				'autocomplete' => 'off',
							    // 				'data-class' => 'acpChef',
											// 	'data-provide' => 'typeahead',
											// 	'data-url' => $domain.'/ajax/list_user',
											// 	'data-path' => 'resources/images/uploads/users/thumbs/',
											// 	'redirect-on-selected-path' => 'users/profile/',
							    // 			));
									?>
									<!--
					            	<span class="input-group-addon">
					            		<span class="glyphicon glyphicon-search"></span>
					            	</span>
					          	</div>
					        </div>
					    </form>
					    -->
			<?php
					}
			?>
    	</div>
  	</div>
</nav>