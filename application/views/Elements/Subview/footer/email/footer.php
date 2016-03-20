<tr>
	<td align="left" valign="top">
		<table border="0" cellspacing="0" cellpadding="10" width="100%">
			<tbody>
				<tr style="background-color:#32322F">
					<td align="center">
						<table border="0" cellspacing="0" cellpadding="0" width="100%">
							<tbody>
								<tr>
									<td align="left" style="width: 450px;">
										<?php
												echo tag('span', 'Copyright © 2016 Cookindo.', array(
													'style' => 'text-decoration:none; color:#fff; font-size: 12px;',
												));
										?>
									</td>
									<td align="right" style="padding-left:20px;">
										<?php
												echo tag('img', false, array(
													'src' => $domain.'/resources/icons/facebook_w.png',
													'style' => 'width:25px;',
													'wrapTag' => 'a',
													'wrapAttributes' => array(
														'href' => 'https://www.facebook.com/cookindo.id',
														'style' => 'font-weight: 600; font-size: 14px; text-decoration:none; color:#fff;',
														'target' => '_blank',
													)
												));
										?>
									</td>
									<td align="left" style="padding-left:20px;">
										<?php
												echo tag('img', false, array(
													'src' => $domain.'/resources/icons/instagram_w.png',
													'style' => 'width:25px;',
													'wrapTag' => 'a',
													'wrapAttributes' => array(
														'href' => 'https://www.instagram.com/cookindo.official',
														'style' => 'font-weight: 600; font-size: 14px; text-decoration:none; color:#fff;',
														'target' => '_blank',
													)
												));
										?>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</td>
</tr>
<tr>
	<td align="left" valign="top">
		<table border="0" cellspacing="0" cellpadding="10" width="100%">
			<tbody>
				<tr>
					<td align="center">
						<table border="0" cellspacing="0" cellpadding="0" width="100%">
							<tbody>
								<tr>
									<td align="right" valign="top">
										<div style="color: #888888; font-size: 12px;">
											<?php 
													printf('Dikirim pada tanggal: %s', tag('strong', date('d M Y')));
											?>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td align="left" valign="top">
						<div style="margin: 0 0 30px;">
							<table border="0" cellspacing="0" cellpadding="0" width="100%">
								<tbody>
									<tr>
										<td align="center" valign="top">
											<table id="warning" border="0" cellspacing="0" cellpadding="0" width="100%">
												<tbody>
													<tr>
														<td align="center" valign="top">
															<div style="font-size: 12px; line-height: normal; color: #404040; margin: 0 0 30px">
																<?php 
																		echo tag('p', 'Harap hanya membalas pesan ini melalui layanan pesan yang sudah disediakan.', array(
																			'style' => 'margin: 0 0 5px;',
																		));
																		echo tag('p', 'Pesan yang dibalas ke alamat email ini, tidak dapat diteruskan.', array(
																			'style' => 'margin: 0;',
																		));
																?>
															</div>
														</td>
													</tr>
													<tr>
														<td align="center" valign="top">
															<div style="display: block; width: 100px; height: 1px; background-color: #AAAAAA; margin: 0 0 30px;"></div>
														</td>
													</tr>
												</tbody>
											</table>
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