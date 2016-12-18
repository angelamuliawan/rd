<footer class="bs-docs-footer hidden-print" role="contentinfo"> 
	<div class="container"> 
		<div class="row">
			<div class="col-sm-8 col-xs-12">
				<ul class="bs-docs-footer-links footer-left-side"> 
					<?php
							echo tag('a', lang('about_us'), array(
								'href' => $domain.'/pages/about_us',
								'wrapTag' => 'li',
							));

							echo tag('span', '&middot;', array(
								'style' => 'margin: auto 5px; color:#FFFFFF;'
							));

							echo tag('a', lang('contact_us'), array(
								'href' => $domain.'/pages/contact_us',
								'wrapTag' => 'li',
							));

							echo tag('span', '&middot;', array(
								'style' => 'margin: auto 5px; color:#FFFFFF;'
							));

							echo tag('a', lang('terms_of_use'), array(
								'href' => $domain.'/pages/terms_of_use',
								'wrapTag' => 'li',
							));

							echo tag('span', '&middot;', array(
								'style' => 'margin: auto 5px; color:#FFFFFF;'
							));

							echo tag('a', lang('privacy_policy'), array(
								'href' => $domain.'/pages/privacy_policy',
								'wrapTag' => 'li',
							));
					?> 
				</ul>
			</div>
			<div class="col-sm-4 col-xs-12">
				<ul class="bs-docs-footer-links footer-right-side footer-social-button">
					<li>
						<a href="https://web.facebook.com/cookindo.id" target="_blank" class="icon-facebook">
							<img src="<?php echo $domain; ?>/resources/icons/facebook_w.png" data-disable-progressive="1" />
						</a>
					</li>
					<li>
						<a href="http://instagram.com/cookindo.official/" target="_blank" class="icon-instagram">
							<img src="<?php echo $domain; ?>/resources/icons/instagram_w.png" data-disable-progressive="1" />
						</a>
					</li>

					<?php
							// echo tag('a', 'f', array(
							// 	'href' => $domain.'/pages/about_us',
							// 	'wrapTag' => 'li',
							// 	'class' => 'icoFacebook',
							// ));

							// echo tag('img', false, array(
							// 	'src' => $domain.'/resources/icons/facebook_w.png',
							// 	'wrapTag' => 'a',
							// 	'wrapAttributes' => array(
							// 		'href' => $domain.'/pages/about_us',
							// 		'wrapTag' => 'li',
							// 		'class' => 'icoFacebook',
							// 	),
							// ));

							// echo tag('span', '&middot;', array(
							// 	'style' => 'margin: auto 5px; color:#FFFFFF;'
							// ));

							// echo tag('a', 'Instagram', array(
							// 	'href' => $domain.'/pages/contact_us',
							// 	'wrapTag' => 'li',
							// ));
					?> 
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12 col-xs-12">
				<div class="footer-left-side">
					<?php
							echo tag('p', lang('copyright'));
					?>
				</div>
			</div>
		</div>
	</div>
</footer>