<!DOCTYPE html>
<html lang="en" xmlns:fb="http://ogp.me/ns/fb#">
	<head>
		<?php
				$site_title = isset($site_title) ? $site_title.' - ' : '';
				echo tag('title', $site_title . lang('site_title') . ' - Cookindo');
		?>
		<!-- <meta charset="utf-8" /> -->
		<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge" /> -->
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta name="robots" content="index,follow" />
		
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		<meta name="keywords" content="<?php echo lang('site_keyword') ?>" />
		<meta name="description" content="<?php echo lang('site_description') ?>" />
		<meta name="author" content="Cookindo" />
		<meta name="copyright" content="cookindo.com" />
		<meta name="application-name" content="cookindo" />

		<meta property="og:type" content="article" />
		<?php
				if( !empty($og_meta) ) {
					if( !empty($og_meta['title']) ) {
						echo '<meta property="og:title" content="'.htmlspecialchars($og_meta['title'], ENT_QUOTES).'" />';
					}
					if( !empty($og_meta['url']) ) {
						echo '<meta property="og:url" content="'.utf8_encode($og_meta['url']).'" />';
					}
					if( !empty($og_meta['image']) ) {
						echo '<meta property="og:image" content="'.$og_meta['image'].'" />';
					}
					if( !empty($og_meta['desc']) ) {
						echo '<meta property="og:description" content="'.htmlspecialchars(strip_tags($og_meta['desc']), ENT_QUOTES).'" />';
					}
				} else {
		?>
					<meta property="og:title" content="Cookindo" />
					<meta property="og:url" content="http://cookindo.com" />
					<meta property="og:image" content="http://cookindo.com/resources/images/logos/logo.jpg" />
					<meta property="og:description" content="<?php echo lang('site_description') ?>" />
		<?php
				}
		?>

		<link rel="canonical" href="http://www.cookindo.com/" />
		<link rel="shortcut icon" href="<?php echo $domain.'/resources/images/logos/favicon.ico'; ?>" type="image/x-icon">
		<link rel="icon" href="<?php echo $domain.'/resources/images/logos/favicon.ico'; ?>" type="image/x-icon">

		<input type="hidden" id="sid" value="<?php echo $this->session->userdata('session_id'); ?>" />
		<input type="hidden" id="site_lang" value="<?php echo $site_lang; ?>" />

		<style>
			@charset "UTF-8";
			.fileinput-button {
				position: relative;
				overflow: hidden;
				display: inline-block;
			}
			.fileinput-button input {
				position: absolute;
				top: 0;
				right: 0;
				margin: 0;
				opacity: 0;
				-ms-filter: 'alpha(opacity=0)';
				font-size: 200px;
				direction: ltr;
				cursor: pointer;
			}
			@media screen\9 {
				.fileinput-button input {
					filter: alpha(opacity=0);
					font-size: 100%;
					height: 100%;
				}
			}
		</style>

		<?php
				echo tag('title', 'Cookindo');

				load_css(array(
					'bootstrap/bootstrap',
					'bootstrap/docs',
					'bootstrap/bootstrap-multiselect',
					'magicsuggest/magicsuggest',
					'custom',
					// 'defer',
				));

				if(isset($additional_css) && !empty($additional_css)){
	                load_css($additional_css);
	            }
		?>
	</head>
	<body>
		<?php
				loadSubview('header/menu');
				loadSubview('flash_message');

				if( isset($sdk) ) {
					loadSubview('sdk/script/facebook');
				}

		  		if( isset($content_view)  ) {
		  			echo $content_view;
		  		}
		  		
		  		loadSubview('footer/footer');

				echo tag('div', false, array(
					'id' => 'myModal',
					'class' => 'modal fade',
				));
				$imageLoading = tag('img', 'Loading...', array(
					'src' => $domain.'/resources/images/reload.gif',
					'class' => 'loading-icon',
					'wrapTag' => 'div',
					'wrapAttributes' => array(
						'style' => 'position:absolute; left:47%; top:45%; color:white;',
					),
				));
				echo tag('div', $imageLoading, array(
					'class' => 'overlay'
				));

				
				load_script(array(
					'jquery/jquery.min',
					'bootstrap/bootstrap.min',
					'bootstrap/typeahead',
					'bootstrap/bootstrap-multiselect',
					'fileupload/jquery.ui.widget',
					'fileupload/jquery.fileupload',
					'fileupload/jquery.iframe-transport',
					'magicsuggest/magicsuggest',
					'unveil/jquery.unveil',
					'functions',
					// 'defer',
				));

				if(isset($additional_js) && !empty($additional_js)) {
	                load_script($additional_js);
	            }
	            if(isset($additional_jsx) && !empty($additional_jsx)) {
	                load_jsx($additional_jsx);
	            }
		?>

		<script type="text/javascript">
			// function downloadJSAtOnload() {
			// 	var element = document.createElement("script");
			// 	element.src = 'http://'+document.domain+'/cookindo/resources/js/defer.js';
			// 	document.body.appendChild(element);
			// }
			// if (window.addEventListener)
			// 	window.addEventListener("load", downloadJSAtOnload, false);
			// else if (window.attachEvent)
			// 	window.attachEvent("onload", downloadJSAtOnload);
			// else 
			// 	window.onload = downloadJSAtOnload;
		</script>
	</body>
</html>