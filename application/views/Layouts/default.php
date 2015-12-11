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
		<!-- <link href="<?=$domain?>/resources/css/bootstrap/3.3.5/bootstrap.css" rel="stylesheet"> -->
		<link href="<?=$domain?>/resources/css/bootstrap/docs.css" rel="stylesheet">

		<!-- Custom Admin CSS -->
		<link href="<?=$domain?>/resources/css/custom.css" rel="stylesheet">
	</head>

	<body>

		<!-- MODAL RECOOK -->
		<div class="modal fade" id="modal-login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  	<div class="modal-dialog modal-md" style="width:500px;">
			    <div class="modal-content">
			      	<div class="modal-header">
			        	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			        	<h3 class="modal-title" id="myModalLabel">Login Form</h3>
			      	</div>
			      	<div class="modal-body pd15 pb20">
			      		<div class="row">
				      		<div class="col-sm-12">
				      			<div class="big-wrapper">
						        	
						        	<ul class="nav nav-tabs">
									  	<li style="width:50%;" class="active"><a class="tacenter" href="#tabs-login">Login</a></li>
									  	<li style="width:50%;"><a class="tacenter" href="#tabs-register">Register</a></li>
									</ul>

									<div class="tab-content pd10 pt15">
										<div class="tab-pane active" id="tabs-login">
											<form role="form">
											  	<div class="form-group">
											    	<label for="txtEmail" class="control-label">Email</label>
												    <input type="text" class="form-control" id="txtEmail">
											  	</div>
												<div class="form-group">
											    	<label for="txtPassword" class="control-label">Password</label>
												    <input type="password" class="form-control" id="txtPassword">
											  	</div>
											  	<div class="checkbox">
												    <label>
												      	<input type="checkbox"> Remember me on this device
												    </label>
												</div>
											  	<div class="form-group">
											  		<button type="button" id="btnLogin" class="btn btn-success col-sm-12">Login</button>
											    </div>
											    <div class="form-group">
											    	<a href="#">Forgot your password?</a>
											    </div>
											</form>
										</div>
										<div class="tab-pane" id="tabs-register">
											<form role="form">
												<div class="form-group">
											    	<label for="txtFullname" class="control-label">Nama Lengkap</label>
												    <input type="text" class="form-control" id="txtFullname">
											  	</div>
											  	<div class="form-group">
											    	<label for="txtEmail" class="control-label">Email</label>
												    <input type="text" class="form-control" id="txtEmail">
											  	</div>
												<div class="form-group">
											    	<label for="txtPassword" class="control-label">Password</label>
												    <input type="password" class="form-control" id="txtPassword">
											  	</div>
											  	<div class="form-group mb40">
											  		<button type="button" class="btn btn-success col-sm-12">Register</button>
											    </div>
											</form>
										</div>
									</div>

									<div class="wrapper-social pd10">
										<div class="with-border" style="width:100%; height:50px; background-color:#3C579C;">
											<div style="width:15%; display:inline-block; height:100%; background-color:#283F6D; color: #FFFFFF;padding-left: 25px; line-height: 45px; font-weight: bold; font-size: 24px;">
												<span>F</span>
											</div>
											<div style="width: 85%; float: right; color: #FFFFFF;line-height: 45px; padding-left: 90px;">
												<span>Sign in with Facebook</span>
											</div>
										</div>
										<div class="with-border" style="width:100%; height:50px; background-color:#B12818;">
											<div style="width:15%; display:inline-block; height:100%; background-color:#DD4C39; color: #FFFFFF;padding-left: 15px; line-height: 45px; font-weight: bold; font-size: 24px;">
												<span>G+</span>
											</div>
											<div style="width: 85%; float: right; color: #FFFFFF;line-height: 45px; padding-left: 90px;">
												<span>Sign in with Google+</span>
											</div>
										</div>
									</div>
				      			</div>
				      		</div>
			      		</div>
			      	</div>
			    </div>
		  	</div>
		</div>

		<nav class="navbar navbar-inverse navbar-fixed-top">
		  	<div class="container">
		    	<div class="navbar-header">
		      		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				        <span class="sr-only">Toggle navigation</span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
		      		</button>
		      		<a class="navbar-brand" href="<?=$domain?>">ResepDunia</a>
		    	</div>
		    	<div id="navbar" class="collapse navbar-collapse">
		      		<ul class="nav navbar-nav navbar-right">
		        		<li><a href="<?=$domain?>/Recipe/add">Tulis Resep</a></li>
		        		<li><a href="#">Kontes</a></li>
		        		<li><a href="#">Artikel</a></li>
		        		
		        		<?php 
		        				if( $this->session->userdata('loggedin') != NULL ) { 
		        		?>
		        		<li>
		        			<a href="#">
		        				<span class="glyphicon glyphicon-bell mt3"></span>
		        				<span class="badge pull-right _mt5">42</span>
		        			</a>
		        		</li>
		        		<li class="dropdown">
				          	<a href="#" class="dropdown-toggle" data-toggle="dropdown">
				          		<img class="pull-left _mt7 mr5" src="http://localhost/rd/resources/images/64x64.png" style="width: 35px; height: 35px;">
				          		Angela 
				          		<b class="caret"></b>
				          	</a>
				          	<ul class="dropdown-menu">
					            <li><a href="<?=$domain?>/Recipe/">Resep Saya</a></li>
					            <li><a href="<?=$domain?>/Recipe/recook">Recook</a></li>
					            <li><a href="<?=$domain?>/Recipe/cookmark">Cookmark</a></li>
					            <li class="divider"></li>
					            <li><a href="#">Kontes Saya</a></li>
					            <li><a href="<?=$domain?>/Users/">Pengaturan Akun</a></li>
					            <li class="divider"></li>
					            <li><a href="#">Logout</a></li>
				          	</ul>
				        </li>

				        <?php
				        		} else {
				        ?>
				        <li>
				        	<a href="#" data-toggle="modal" data-target="#modal-login">Login</a>
				        </li>
				        <?php
				        		}
				        ?>
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
		<script src="<?=$domain?>/resources/js/bootstrap/bootstrap.min.js"></script>
		<script src="<?=$domain?>/resources/js/functions.js"></script>

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

			$('ul.nav.nav-tabs a').click(function(e) {
		        e.preventDefault();
		        $( this ).tab( 'show' );
		    });
		</script>
	</body>
</html>