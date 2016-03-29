<!DOCTYPE html>
<html lang="en" xmlns:fb="http://ogp.me/ns/fb#">
	<head>
		<!-- <meta charset="utf-8" /> -->
		<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge" /> -->
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		<meta name="keywords" content="cookindo, resep masak, resep enak, makanan enak, makanan lezat, masak apa hari ini, masakan enak, masakan murah, masakan lezat" />
		<meta name="description" content="Cookindo adalah direktori resep online dari Indonesia yang memungkinkan user untuk mencari resep sesuai dengan kebutuhan mereka. Untuk mendapatkan resep yang user inginkan, cookindo menyediakan fitur pencarian yang lengkap mulai dari estimasi harga, orang, maupun bahan-bahan masakan yang dimiliki oleh user." />
		<meta name="author" content="Cookindo" />
		<meta name="copyright" content="cookindo.com" />
		<meta name="application-name" content="cookindo" />

		<meta property="og:type" content="article" />
		<?php
				if( !empty($og_meta) ) {
					if( !empty($og_meta['title']) ) {
						echo '<meta property="og:title" content="'.htmlspecialchars($og_meta['title']).'" />';
					}
					if( !empty($og_meta['url']) ) {
						echo '<meta property="og:url" content="'.utf8_encode($og_meta['url']).'" />';
					}
					if( !empty($og_meta['image']) ) {
						echo '<meta property="og:image" content="'.$og_meta['image'].'" />';
					}
					if( !empty($og_meta['desc']) ) {
						echo '<meta property="og:description" content="'.strip_tags($og_meta['desc']).'" />';
					}
				} else {
		?>
		<meta property="og:title" content="Cookindo" />
		<meta property="og:url" content="http://cookindo.com" />
		<meta property="og:image" content="http://cookindo.com/resources/images/logos/logo.jpg" />
		<meta property="og:description" content="Cookindo adalah direktori resep online dari Indonesia yang memungkinkan user untuk mencari resep sesuai dengan kebutuhan mereka. Untuk mendapatkan resep yang user inginkan, cookindo menyediakan fitur pencarian yang lengkap mulai dari estimasi harga, orang, maupun bahan-bahan masakan yang dimiliki oleh user." />
		<?php
				}
		?>

		<link rel="shortcut icon" href="<?php echo $domain.'/resources/images/logos/favicon.ico'; ?>" type="image/x-icon">
		<link rel="icon" href="<?php echo $domain.'/resources/images/logos/favicon.ico'; ?>" type="image/x-icon">

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
					'style' => 'width:25px; height:auto; display:block; margin: 0 12px;',
					'wrapTag' => 'div',
					'wrapAttributes' => array(
						'style' => 'position:absolute; left:47%; top:45%; color:white;',
					),
				));
				echo tag('div', $imageLoading, array(
					'class' => 'overlay'
				));

				
				load_script(array(
					// 'jquery/jquery.min',
					// 'bootstrap/bootstrap.min',
					// 'bootstrap/typeahead',
					// 'bootstrap/bootstrap-multiselect',
					// 'fileupload/jquery.ui.widget',
					// 'fileupload/jquery.fileupload',
					// 'fileupload/jquery.iframe-transport',
					// 'magicsuggest/magicsuggest',
					// 'functions',
					'defer',
				));

				if(isset($additional_js) && !empty($additional_js)) {
	                load_script($additional_js);
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