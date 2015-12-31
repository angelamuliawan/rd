<footer class="bs-docs-footer" role="contentinfo"> 
	<div class="container"> 
		<ul class="bs-docs-footer-links"> 
			<?php
					echo tag('a', 'About Us', array(
						'href' => $domain.'pages/about_us',
						'wrapTag' => 'li',
					));
					echo tag('a', 'Contact Us', array(
						'href' => $domain.'pages/about_us',
						'wrapTag' => 'li',
					));
					echo tag('a', 'Terms of Use', array(
						'href' => $domain.'pages/about_us',
						'wrapTag' => 'li',
					));
					echo tag('a', 'Privacy Policy', array(
						'href' => $domain.'pages/about_us',
						'wrapTag' => 'li',
					));
			?> 
		</ul>
		<?php
				echo tag('p', 'Copyright &copy; 2015 Cookindo. Hak Cipta Dilindungi Undang-Undang');
		?>
	</div>
</footer>