<?php
		loadSubview('header/search_box', array(
			'_with_text' => true
		));
?>

<div class="container mt20">
	<div class="big-wrapper">
		<div class="row">
			<div class="col-sm-10">
				<div class="wrapper-food-list bg-white">
					<div class="header with-border">
						<h3 class="pull-left mt5">Baru Dibuat</h3>
						<a class="btn btn-orange pull-right" href="#" role="button">Tampilkan Semua</a>
					</div>
					<div class="content with-border">
						<ul>
							<?php
									loadSubview('pages/item_recipe', array(
										'image' => 'nasi-goreng.jpg',
										'title' => 'Nasi Goreng enak',
										'cntComment' => 50,
										'cntRecook' => 124,
									));
									loadSubview('pages/item_recipe', array(
										'image' => 'nasi-goreng.jpg',
										'title' => 'Nasi Goreng enak',
										'cntComment' => 50,
										'cntRecook' => 124,
									));
									loadSubview('pages/item_recipe', array(
										'image' => 'nasi-goreng.jpg',
										'title' => 'Nasi Goreng enak',
										'cntComment' => 50,
										'cntRecook' => 124,
									));
							?>
							<!-- <li class="no-ul-type with-border">
								<div class="box-header">
									<img src="<?=$domain?>/resources/images/food/nasi-goreng.jpg" />
								</div>
								<div class="box-content">
									<h4>Nasi Goreng paling enak sejagat raya</h4>
								</div>
								<div class="box-footer bg-orange">
									<div class="pull-right mr5">
										<img src="<?=$domain?>/resources/icons/retweet_w.png" />
										<span>500</span>
									</div>
									<div class="pull-right mr10">
										<img src="<?=$domain?>/resources/icons/comment_w.png" />
										<span>500</span>
									</div>
								</div>
							</li> -->
						</ul>
					</div>
				</div>

				<div class="wrapper-food-list bg-white mt20">
					<div class="header with-border">
						<h3 class="pull-left mt5">Resep Populer</h3>
						<a class="btn btn-orange pull-right" href="#" role="button">Tampilkan Semua</a>
					</div>
					<div class="content with-border">
						<ul>
							<?php
									loadSubview('pages/item_recipe', array(
										'image' => 'nasi-goreng.jpg',
										'title' => 'Nasi Goreng enak',
										'cntComment' => 50,
										'cntRecook' => 124,
									));
									loadSubview('pages/item_recipe', array(
										'image' => 'nasi-goreng.jpg',
										'title' => 'Nasi Goreng enak',
										'cntComment' => 50,
										'cntRecook' => 124,
									));
									loadSubview('pages/item_recipe', array(
										'image' => 'nasi-goreng.jpg',
										'title' => 'Nasi Goreng enak',
										'cntComment' => 50,
										'cntRecook' => 124,
									));
							?>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-sm-2">
				<div class="wrapper-ads">
					<ul class="no-pd">
						<?php
								echo tag('img', false, array(
									'src' => $domain.'/resources/images/160x120.jpg',
									'wrapTag' => 'li',
									'wrapAttributes' => array(
										'class' => 'no-ul-type mb20',
									),
								));
								echo tag('img', false, array(
									'src' => $domain.'/resources/images/sample-ads.jpg',
									'wrapTag' => 'li',
									'wrapAttributes' => array(
										'class' => 'no-ul-type mb20',
									),
								));
								echo tag('img', false, array(
									'src' => $domain.'/resources/images/sample-ads.jpg',
									'wrapTag' => 'li',
									'wrapAttributes' => array(
										'class' => 'no-ul-type mb20',
									),
								));
						?>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>