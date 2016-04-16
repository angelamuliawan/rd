<?php
		loadSubview('header/search_box');
?>

<div class="container mt20">
	<div class="big-wrapper">
		<div class="row">
			<div class="col-sm-12">
				<div id="contest" class="wrapper-food-list-vertical">
					<div class="content pd15 tacenter">
						<?php
								echo tag('h2', 'Lomba Masak Kreatif berhadiah Microwave Oven, Stand Mixer, Blender', array(
									'class' => 'mt10 mb20',
								));
								echo tag('img', false, array(
					        		'src' => $domain.'/resources/images/uploads/poster/poster-lomba.jpg',
					        	));			        	
						?>
					</div>
					<div class="content custom-pd">
						<?php
								echo tag('p', 'Hai, Cookindo Lovers! Bersamaan dengan launching website, www.cookindo.com mengadakan lomba menulis resep kreatif berhadiah jutaan rupiah loh… Ikutan yuk! Caranya gampang, yaitu: ');
						?>
						<ol class="pd10">
							<?php
									echo tag('li', 'Buka www.cookindo.com (cookindo), Pilih menu login.');
									echo tag('li', 'Jika belum terdaftar sebagai pengguna cookindo, pilih menu register. Isi data Nama, email kamu yang valid serta password. Jika sudah terisi, tekan register. Anda juga bisa mendaftar dengan account facebook anda dengan menekan tombol sign in with facebook.');
									echo tag('li', 'Jika sudah terdaftar, silahkan login dengan email dan password anda.');
									echo tag('li', 'Setelah berhasil login, pilih menu Tulis Resep.');
									echo tag('li', 'Masukkan resep kreatif yang anda miliki mulai dari judul sampai langkah-langkah membuat resep. Tekan simpan resep jika sudah yakin dengan data yang anda masukkan.');
									echo tag('li', 'Jika resep sudah berhasil disimpan, maka resep tersebut akan muncul di menu Resep Saya.');
									echo tag('li', 'Anda boleh memasukkan lebih dari 1 resep. Semakin banyak menulis resep maka kesempatan untuk menang semakin besar.');
									echo tag('li', 'Pemenang dipilih berdasarkan penilaian dari kami, terutama dari keaslian dan kreasinya.');
									echo tag('li', 'Lomba berlaku dari tanggal 13-Maret-2016 pukul 15.00 sampai dengan 14-April-2016 pukul 23.59.');
							?>
						</ol>
						<?php
								echo tag('p','Syarat resep, yaitu: ');
						?>
						<ol class="pd10">
							<?php
									echo tag('li', 'Resep harus unik dan kreasi sendiri.');
									echo tag('li', 'Foto yang di-upload adalah foto karya sendiri bukan mengambil dari sumber lain.');
							?>
						</ol>
					</div>
					<div class="content custom-pd pd15">
						<?php
								echo tag('h3', 'Hadiah', array(
									'class' => 'mb20',
								));
								echo tag('p', 'Pemenang I 	: 1 buah Microwave Oven Cosmos');
								echo tag('p', 'Pemenang II 	: 1 buah Stand Mixer Miyako');
								echo tag('p', 'Pemenang III : 1 buah Blender 3 in 1 Trisonic');
						?>
					</div>
					<div class="content custom-pd mb20">
						<?php
								echo tag('h3', 'Pengumuman Pemenang', array(
									'class' => 'mb10',
								));
								echo tag('p', 'Sabtu, 30 April 2016', array(
									'class' => 'fbold mb20',
								));

								echo tag('p', 'Untuk informasi lebih lanjut, silahkan email ke angela@cookindo.com atau message ke official facebook kami.');
								echo tag('h3', 'Selamat berlomba!', array(
									'class' => ' mt20 mb20',
								));
						?>
						<div class="social-media">
							<?php
									$iconWebsite = tag('img', false, array(
										'src' => $domain.'/resources/icons/website.png',
										'style' => '',
									));
									$iconInstagram = tag('img', false, array(
										'src' => $domain.'/resources/icons/instagram.png',
									));
									$iconFacebook = tag('img', false, array(
										'src' => $domain.'/resources/icons/facebook.png',
									));
									
									echo tag('a', $iconWebsite.'www.cookindo.com', array(
										'href' => 'http://www.cookindo.com',
										'title' => 'Website',
										'target' => '_blank',
									));
									echo tag('a', $iconInstagram.'@cookindo.official', array(
										'href' => 'https://www.instagram.com/cookindo.official',
										'title' => 'Website',
										'target' => '_blank',
									));
									echo tag('a', $iconFacebook.'cookindo.id', array(
										'href' => 'https://www.facebook.com/cookindo.id',
										'title' => 'Website',
										'target' => '_blank',
									));
							?>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>