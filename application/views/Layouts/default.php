<?php
		$domain = $this->config->item('domain');
?>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		<meta name="description" content="">
		<meta name="author" content="">
		<!-- <link rel="icon" href="../../favicon.ico"> -->

		<title>Resep Dunia</title>

		<!-- Bootstrap core CSS -->
		<link href="<?=$domain?>/resources/css/bootstrap/bootstrap.css" rel="stylesheet">
		<link href="<?=$domain?>/resources/css/bootstrap/docs.css" rel="stylesheet">

		<!-- Custom Admin CSS -->
		<link href="<?=$domain?>/resources/css/custom.css" rel="stylesheet">
	</head>

	<body>
		<nav class="navbar navbar-inverse navbar-fixed-top">
		  	<div class="container">
		    	<div class="navbar-header">
		      		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				        <span class="sr-only">Toggle navigation</span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
		      		</button>
		      		<a class="navbar-brand" href="http://localhost/rd/">ResepDunia</a>
		    	</div>
		    	<div id="navbar" class="collapse navbar-collapse">
		      		<ul class="nav navbar-nav navbar-right">
		        		<li><a href="#">Tulis Resep</a></li>
		        		<li><a href="#about">Kontes</a></li>
		        		<li><a href="#contact">Artikel</a></li>
		      		</ul>
		    	</div>
		  	</div>
		</nav>

		<div class="container">
		  	<?php
		  		if( isset($content_view) ) {
		  			echo $content_view;
		  		}
		  	?>
		</div>

		<footer class="bs-docs-footer" role="contentinfo"> 
			<div class="container"> 
				<ul class="bs-docs-footer-links"> 
					<li><a href="#">About Us</a></li> 
					<li><a href="#">Contact Us</a></li> 
					<li><a href="#">Terms of Use</a></li> 
					<li><a href="#">Privacy Policy</a></li> 
				</ul>
				<p>
					Copyright &copy; 2015 Angela & Brian.
				</p> 
			</div>
		</footer>

		<script src="<?=$domain?>/resources/js/jquery/jquery.min.js"></script>
		<!-- <script src="../../dist/js/bootstrap.min.js"></script> -->
	</body>
</html>
