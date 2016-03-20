<?php 
		$subject = isset($subject) ? $subject : false;
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<meta name="viewport" content="width:device-width">
		<meta property="og:title" content="<?php echo $subject;?>">

		<title><?php echo $subject;?></title>
		<style type="text/css">
			#outlook a {
				padding: 0;
			}
			body {
				width: 100% !important;
				min-width: 100%;
				font-size: 16px;
				font-family: Helvetica, sans-serif;
				color: #242124;
				line-height: 24px;
				-webkit-text-size-adjust: 100%;
					-ms-text-size-adjust: 100%;
						text-size-adjust: 100%;
			}
			body {
				margin: 0;
				padding: 0;
				background: #FFFFFF;
			}
			img {
				border: none;
				height: auto;
				line-height: 100%;
				outline: none;
				vertical-align: top;
			}
			a img {
				border: none;
			}
			table, tr, td {
				vertical-align: top;
			}
			table {
				border-spacing: 0;
				border-collapse: separate;
			}
			td {
				border-collapse: separate;
				word-break: break-word;
				-webkit-hyphens: auto;
					-ms-hyphens: auto;
						hyphens: auto;
			}
			center {
				width:100%;
				min-width:600px;
				margin:auto;
				text-align:center;
			}
		</style>
	</head>
	<body>
		<center>
			<table class="body" border="0" cellspacing="0" cellpadding="0" width="100%">
				<tbody>
					<tr>
						<td align="center" valign="top">
							<table border="0" cellspacing="0" cellpadding="0" width="600">
								<tbody>
									<?php 
											loadSubview('header/email/header');
									?>
									<tr>
										<td align="left" valign="top">
											<table class="content" border="0" cellspacing="0" cellpadding="10" width="100%">
												<tbody>
													<tr>
														<td align="left" valign="top">
															<div style="margin: 0 0 15px;">
																<table border="0" cellspacing="0" cellpadding="0" width="100%" style="border-top: 1px dotted #e5e5e5;">
																	<tbody>
																		<?php 
																				loadSubview('header/email/greeting');
																		?>
																		<tr>
																			<td align="left" valign="top">
																				<?php
																						echo isset($content_view) ? $content_view : 'content not exists';
																				?>
																			</td>
																		</tr>
																	</tbody>
																</table>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<?php 
											loadSubview('footer/email/footer');
									?>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</center>
	</body>
</html>
<?php 
	if( isset($params['debug']) && $params['debug'] == 'view' ){
		die();
	}
?>