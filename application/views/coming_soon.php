<?php
		loadSubview('header/search_box');
?>

<div class="container mt20">
	<div class="big-wrapper">
		<div class="row">
			<div class="col-sm-10">
				<div id="cookmark" class="wrapper-food-list-vertical">
					<div class="content with-border pd15 tacenter mb20">
						<?php
								echo tag('h2', lang('coming_soon'));
								echo tag('p', lang('under_development_feature'), array(
									'class' => 'mt10'
								));
						?>
					</div>
				</div>
			</div>
			<div class="col-sm-2">
				<?php
						loadSubview('common/ads');
				?>
			</div>
		</div>
	</div>
</div>