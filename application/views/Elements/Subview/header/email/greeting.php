<?php 
		$name = isset($to_name) ? $to_name : false;

		if( !empty($name) ) {
?>
<tr>
	<td align="left" valign="top">
		<table border="0" cellspacing="0" cellpadding="0" width="100%">
			<tbody>
				<tr>
					<td>
						<table border="0" cellspacing="0" cellpadding="0" width="100%">
							<tbody>
								<tr>
									<td align="left" valign="top">
										<?php 
												$greeting = 'Hai '.$name;
												echo tag('h2', $greeting, array(
													'style' => 'margin: 20px 0 0; font-size: 21px; padding:0px;',
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
<?php
		}
?>