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
      		?>
    	</div>
    	<div id="navbar" class="collapse navbar-collapse">
      		<ul class="nav navbar-nav navbar-right">
      			<?php
      					if( isLoggedIn() ) {
      						echo tag('a', 'Tulis Resep', array(
								'href' => $domain.'/recipe/add',
								'wrapTag' => 'li',
							));
							echo tag('a', 'Artikel', array(
								'href' => '#',
								'wrapTag' => 'li',
							));
      					} else {
      						echo tag('a', 'Tulis Resep', array(
								'href' => $domain.'/users/login',
		        				'data-title' => 'Login',
		        				'class' => 'ajax-modal',
		        				'wrapTag' => 'li',
							));
							echo tag('a', 'Artikel', array(
								'href' => $domain.'/users/login',
								'data-title' => 'Login',
		        				'class' => 'ajax-modal',
								'wrapTag' => 'li',
							));
      					}
      					
						echo tag('a', 'Kontes', array(
							'href' => '#',
							'wrapTag' => 'li',
						));
						

		     			if( isLoggedIn() ) { 
		     				$spanNotifIcon = tag('span', false, array(
		     					'class' => 'glyphicon glyphicon-bell mt3'
		     				));
		     				$spanNotifCount = tag('span', 42, array(
		     					'class' => 'badge pull-right _mt5'
		     				));

		     				echo tag('a', $spanNotifIcon.$spanNotifCount, array(
		     					'wrapTag' => 'li'
		     				));
        		?>
        		<li class="dropdown">
        			<?php
        					$userImage = tag('img', 'Angela', array(
        						'class' => 'pull-left _mt7 mr5',
        						'src' => $domain.'/resources/images/64x64.png',
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
		          					'href' => '#',
		          					'wrapTag' => 'li',
		          				));
		          				echo tag('a', 'Pengaturan Akun', array(
		          					'href' => $domain.'/users/',
		          					'wrapTag' => 'li',
		          				));
		          				echo divider();
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