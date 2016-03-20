<footer class="bs-docs-footer hidden-print" role="contentinfo"> 
	<div class="container"> 
		<ul class="bs-docs-footer-links"> 
			<?php
					echo tag('a', 'About Us', array(
						'href' => $domain.'/pages/about_us',
						'wrapTag' => 'li',
					));

					echo tag('span', '&middot;', array(
						'style' => 'margin: auto 5px; color:#FFFFFF;'
					));

					echo tag('a', 'Contact Us', array(
						'href' => $domain.'/pages/contact_us',
						'wrapTag' => 'li',
					));

					echo tag('span', '&middot;', array(
						'style' => 'margin: auto 5px; color:#FFFFFF;'
					));

					echo tag('a', 'Terms of Use', array(
						'href' => $domain.'/pages/terms_of_use',
						'wrapTag' => 'li',
					));

					echo tag('span', '&middot;', array(
						'style' => 'margin: auto 5px; color:#FFFFFF;'
					));

					echo tag('a', 'Privacy Policy', array(
						'href' => $domain.'/pages/privacy_policy',
						'wrapTag' => 'li',
					));
			?> 
		</ul>
		<?php
				echo tag('p', 'Copyright &copy; 2016 Cookindo. Hak Cipta Dilindungi Undang-Undang');
		?>
	</div>
</footer>