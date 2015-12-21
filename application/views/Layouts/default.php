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
					'custom',
				));
		?>
	</head>
	<body>
		<?php
				loadSubview('header/menu');

		  		if( isset($content_view)  ) {
		  			echo $content_view;
		  		}
		  		
		  		loadSubview('footer/footer');
				load_script(array(
					'jquery/jquery.min',
					'bootstrap/bootstrap.min',
					'bootstrap/typeahead',
					'bootstrap/bootstrap-multiselect',
					'functions',
				));

				echo tag('div', false, array(
					'id' => 'myModal',
					'class' => 'modal fade',
				));
				$imageLoading = tag('img', 'Loading...', array(
					'src' => $domain.'/resources/images/reload.gif',
					'style' => 'width:30%; height:auto; display:block;',
					'wrapTag' => 'div',
					'wrapAttributes' => array(
						'style' => 'position:absolute; left:48%; top:45%; color:white;',
					),
				));
				echo tag('div', $imageLoading, array(
					'class' => 'overlay'
				));
		?>

		<script type="text/javascript">
			// $('#myCarousel').carousel({
			//   	interval: 4000
			// })

			// $('.carousel .item').each(function(){
			// 	var next = $(this).next();
			// 	if (!next.length) {
			// 		next = $(this).siblings(':first');
			// 	}
			// 	next.children(':first-child').clone().appendTo($(this));
			// 	// for (var i = 0; i < 2; i++ ) {
			// 	// 	next = next.next();
			// 	// 	if (!next.length) {
			// 	// 		next = $(this).siblings(':first');
			// 	// 	}
			// 	// 	next.children(':first-child').clone().appendTo($(this));
			// 	// }
			// });

			$('#recook-carousel').carousel({
			  	interval: 4000
			})

			$('#recook-carousel .item').each(function(){
				var next = $(this).next();
				if (!next.length) {
					next = $(this).siblings(':first');
				}
				next.children(':first-child').clone().appendTo($(this));
				// for (var i = 0; i < 2; i++ ) {
				// 	next = next.next();
				// 	if (!next.length) {
				// 		next = $(this).siblings(':first');
				// 	}
				// 	next.children(':first-child').clone().appendTo($(this));
				// }
			});

			$('#bottom-carousel').carousel({
			  	interval: 100000
			});

			$('#bottom-carousel .item').each(function(){
				var next = $(this).next();
				if (!next.length) {
					next = $(this).siblings(':first');
				}
				// next.children(':first-child').clone().appendTo($(this));
				for (var i = 0; i < 5; i++ ) {
					next = next.next();
					if (!next.length) {
						next = $(this).siblings(':first');
					}
					next.children(':first-child').clone().appendTo($(this));
				}
			});
		</script>
	</body>
</html>