<?php
		$domain = $this->config->item('domain');
?>

<!-- MODAL -->
<!-- <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  	<div class="modal-dialog modal-lg">
    	<div class="modal-content">
      		...
      	</div>
  	</div>
</div> -->
<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  	<div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      	<div class="modal-header">
	        	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        	<h3 class="modal-title" id="myModalLabel">Recook</h3>
	      	</div>
	      	<div class="modal-body pd15">
	      		<div class="row">
		      		<div class="col-sm-12">
		      			<div id="modal-recook" class="big-wrapper">
				        	<h4>Nasi Goreng ala Brian Alexandro</h4>
				        	<div class="with-border wrapper-recook-photo">
				        		<div class="wrapper" style="display:block;">
					        		<div>
					        			<span class="glyphicon glyphicon-upload"></span>
					        		</div>
				        		</div>
				        		<div class="text-wrapper">
				        			<p>Drag & Drop</p>
				        			<p>
				        				Letakkan dokumen Anda disini untuk melakukan proses unggah
				        			</p>
				        			<button type="button" class="btn btn-primary mt15">Upload Foto Recook</button>
				        		</div>
				        	</div>

			        		<textarea rows="4" class="form-control mt15" placeholder="Cerita recook kamu. Apakah kamu menambahkan atau mengurangi bahan? Apakah masakan kamu berhasil?"></textarea>
		      			</div>
		      		</div>
	      		</div>
	      	</div>
	      	<div class="modal-footer">
	        	<button type="button" class="btn btn-default" data-dismiss="modal">Batal</button>
	        	<button type="button" class="btn btn-primary">Kirim</button>
	      	</div>
	    </div>
  	</div>
</div>

<div class="search-box">
	<div class="row">
		<div class="col-sm-12">
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
					<div class="col-sm-12">
						<h4>Pencarian dengan kata kunci "Nasi Goreng"</h4>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="big-wrapper">
	<div class="row">
		<div class="col-sm-3">
			<form>
			 	<div class="form-group">
					<label for="txtKeyword">Kata Kunci</label>
					<input type="text" class="form-control" id="txtKeyword" placeholder="Kata Kunci">
			  	</div>
			  	<div class="form-group">
					<label for="txtRawMaterial">Bahan Baku</label>
					<input type="text" class="form-control" id="txtRawMaterial" placeholder="Bahan Baku">
			  	</div>
				<div class="form-group">
					<label for="ddlFood">Masakan</label>
					<select id="ddlFood" class="form-control">
						<option>Pilih Semua</option>
					</select>
				</div>
				<div class="form-group">
					<label for="ddlFoodType">Semua Tipe</label>
					<select id="ddlFoodType" class="form-control">
						<option>Pilih Semua</option>
					</select>
				</div>
				<div class="form-group">
					<label for="ddlCookingProcess">Proses Masak</label>
					<select id="ddlCookingProcess" class="form-control">
						<option>Pilih Semua</option>
					</select>
				</div>
				<div class="form-group">
					<label for="ddlCostEstimation">Estimasi Biaya</label>
					<select id="ddlCostEstimation" class="form-control">
						<option>Pilih Semua</option>
					</select>
				</div>
				<div class="form-group">
					<label for="ddlPeopleEstimation">Estimasi Orang</label>
					<select id="ddlPeopleEstimation" class="form-control">
						<option>Pilih Semua</option>
					</select>
				</div>
				<div class="form-group">
					<label for="ddlSortBy">Urutkan Berdasarkan</label>
					<select id="ddlSortBy" class="form-control">
						<option>Resep Terbaru</option>
						<option>Resep Populer</option>
						<option>Abjad</option>
					</select>
				</div>
			</form>
		</div>
		<div class="col-sm-9">
			<div class="wrapper-food-list-vertical">
				<div class="content with-border">
					<ul>
						<li class="no-ul-type">
							<div class="row">
								<div class="col-sm-4 left-side">
									<div class="box-header">
										<img src="<?=$domain?>/resources/images/food/nasi-goreng.jpg" />
									</div>
									<div class="box-footer">
										<div class="pull-right mr5">
											<img src="<?=$domain?>/resources/icons/retweet.png" />
											<span>500</span>
										</div>
										<div class="pull-right mr10">
											<img src="<?=$domain?>/resources/icons/comment.png" />
											<span>500</span>
										</div>
									</div>
								</div>
								<div class="col-sm-8 right-side">
									<div class="box-description">
										<h4>Makanan ABCD</h4>
										<p>Masakan Sunda, Indonesian</p>
										<p>Dessert</p>
										<p class="mt10 description">
											Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
											Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
											when an unknown printer took a galley of type and scrambled it to make a type 
											specimen book.
										</p>
										
										<div class="taright mb5">
											<a href="<?=$domain?>/Recipe/detail" class="btn btn-default mt5">Selengkapnya</a>
										</div>

										<div class="action-bottom mt15 tacenter">
											<a href="" data-toggle="modal" data-target=".bs-example-modal-lg">
												<img src="<?=$domain?>/resources/icons/retweet.png" />
												<span>Recook</span>
											</a>
											
											<img src="<?=$domain?>/resources/icons/facebook.png" />
											<span class="mr10">Share</span>

											<img src="<?=$domain?>/resources/icons/cookmark.png" />
											<span class="mr10">Cookmark</span>

											<img src="<?=$domain?>/resources/icons/print.png" />
											<span>Print</span>
										</div>
									</div>
								</div>
							</div>
						</li>
						<li class="no-ul-type">
							<div class="row">
								<div class="col-sm-4 left-side">
									<div class="box-header">
										<img src="<?=$domain?>/resources/images/food/nasi-goreng.jpg" />
									</div>
									<div class="box-footer">
										<div class="pull-right mr5">
											<img src="<?=$domain?>/resources/icons/retweet.png" />
											<span>500</span>
										</div>
										<div class="pull-right mr10">
											<img src="<?=$domain?>/resources/icons/comment.png" />
											<span>500</span>
										</div>
									</div>
								</div>
								<div class="col-sm-8 right-side">
									<div class="box-description">
										<h4>Makanan ABCD</h4>
										<p>Masakan Sunda, Indonesian</p>
										<p>Dessert</p>
										<p class="mt10 description">
											Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
											Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
											when an unknown printer took a galley of type and scrambled it to make a type 
											specimen book.
										</p>
										
										<div class="taright mb5">
											<a href="<?=$domain?>/Recipe/detail" class="btn btn-default mt5">Selengkapnya</a>
										</div>

										<div class="action-bottom mt15 tacenter">
											<a href="" data-toggle="modal" data-target=".bs-example-modal-lg">
												<img src="<?=$domain?>/resources/icons/retweet.png" />
												<span>Recook</span>
											</a>

											<img src="<?=$domain?>/resources/icons/facebook.png" />
											<span class="mr10">Share</span>

											<img src="<?=$domain?>/resources/icons/cookmark.png" />
											<span class="mr10">Cookmark</span>

											<img src="<?=$domain?>/resources/icons/print.png" />
											<span>Print</span>
										</div>
									</div>
								</div>
							</div>
						</li>
						<li class="no-ul-type">
							<div class="row">
								<div class="col-sm-4 left-side">
									<div class="box-header">
										<img src="<?=$domain?>/resources/images/food/nasi-goreng.jpg" />
									</div>
									<div class="box-footer">
										<div class="pull-right mr5">
											<img src="<?=$domain?>/resources/icons/retweet.png" />
											<span>500</span>
										</div>
										<div class="pull-right mr10">
											<img src="<?=$domain?>/resources/icons/comment.png" />
											<span>500</span>
										</div>
									</div>
								</div>
								<div class="col-sm-8 right-side">
									<div class="box-description">
										<h4>Makanan ABCD</h4>
										<p>Masakan Sunda, Indonesian</p>
										<p>Dessert</p>
										<p class="mt10 description">
											Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
											Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
											when an unknown printer took a galley of type and scrambled it to make a type 
											specimen book.
										</p>
										
										<div class="taright mb5">
											<a href="<?=$domain?>/Recipe/detail" class="btn btn-default mt5">Selengkapnya</a>
										</div>

										<div class="action-bottom mt15 tacenter">
											<a href="" data-toggle="modal" data-target=".bs-example-modal-lg">
												<img src="<?=$domain?>/resources/icons/retweet.png" />
												<span>Recook</span>
											</a>

											<img src="<?=$domain?>/resources/icons/facebook.png" />
											<span class="mr10">Share</span>

											<img src="<?=$domain?>/resources/icons/cookmark.png" />
											<span class="mr10">Cookmark</span>

											<img src="<?=$domain?>/resources/icons/print.png" />
											<span>Print</span>
										</div>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
