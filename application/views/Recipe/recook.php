<?php
		$domain = $this->config->item('domain');
?>
<div class="search-box">
	<div class="row">
		<div class="col-sm-10">
			<div class="mt10 mb20">
				<div class="row">
					<div class="col-sm-10">
						<input class="form-control" type="text" />
					</div>
		
					<div class="col-sm-2">
						<button type="button" class="btn btn-default btn-block">Cari</button>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-12">
			<div class="mt10 mb20">
				<div class="row">
					<div class="col-sm-8">
						<h2>Daftar Recook</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="big-wrapper">
	<div class="row">
		<div class="col-sm-10">
			<div id="recook" class="wrapper-food-list-vertical">
				<div class="content with-border">
					<ul>
						<li class="no-ul-type">
							<div class="row">
								<div class="col-sm-4 left-side">
									<div class="box-header">
										<img src="<?=$domain?>/resources/images/food/nasi-goreng.jpg" />
									</div>
									<div class="box-footer">
										<div class="pull-right mr10">
											<img src="<?=$domain?>/resources/icons/comment.png" />
											<span>500</span>
										</div>
									</div>
								</div>
								<div class="col-sm-8 right-side">
									<div class="box-description">
										<h4>Recook from <a href="#">Makanan ABCD</a></h4>
										<p class="mt10 description">
											Recook saya untuk makanan ABCD berhasil loh guys yihaaaa. Gatau harus ngucapin apa
											pokoknya yang penting teks nya panjang deh.
										</p>
										<p class="pull-right mt10">
											Senin, 7 Desember 2015 at 13:00										
										</p>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-sm-2">
			<div class="wrapper-ads">
				<ul class="no-pd">
					<li class="no-ul-type mb20">
						<img src="<?=$domain?>/resources/images/160x120.jpg" />
					</li>
					<li class="no-ul-type mb20">
						<img src="<?=$domain?>/resources/images/sample-ads.jpg" />
					</li>
					<li class="no-ul-type mb20">
						<img src="<?=$domain?>/resources/images/sample-ads.jpg" />
					</li>
					<li class="no-ul-type mb20">
						<img src="<?=$domain?>/resources/images/sample-ads.jpg" />
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
