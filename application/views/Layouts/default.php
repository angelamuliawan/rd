<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		<meta name="description" content="">
		<meta name="author" content="">
		
		<?php
				echo tag('title', 'Resep Dunia');

				load_css(array(
					'bootstrap/bootstrap',
					'bootstrap/docs',
					'bootstrap/bootstrap-multiselect',
					'fileupload/jquery.fileupload',
					'magicsuggest/magicsuggest',
					'custom',
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
				load_script(array(
					'jquery/jquery.min',
					'bootstrap/bootstrap.min',
					'bootstrap/typeahead',
					'bootstrap/bootstrap-multiselect',
					'fileupload/jquery.ui.widget',
					'fileupload/jquery.fileupload',
					'fileupload/jquery.iframe-transport',
					'magicsuggest/magicsuggest',
					'functions',
				));

				if(isset($additional_js) && !empty($additional_js)) {
	                load_script($additional_js);
	            }

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
		?>
	</body>
</html>