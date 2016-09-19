<?php
		$cuisine_id = isset($cuisine_id)?$cuisine_id:false;
		$cuisine_name = isset($cuisine_name)?$cuisine_name:false;
		$image = isset($image)?$image:false;
		$cnt = isset($cnt)?$cnt:false;
		$style = isset($style)?$style:false;

		$path_image = '/resources/images/uploads/cuisine/primary/'.$image;
		$custom_image = $domain.$path_image;
		if( !file_exists( $webroot.$path_image ) ) {
			$custom_image = $domain.'/resources/images/default.png';
		}

		$url = $domain.'/recipe/find?CuisineID='.$cuisine_id.'&CuisineID'.urlencode('[]').'='.$cuisine_id;
?>
<li style="<?php echo $style; ?>" class="no-ul-type with-border">
	<a href="<?php echo $url; ?>">
	    <div class="box-header cuisine">
			<?php
					echo tag('span', $cuisine_name, array(
						'class' => 'wrapper-inner'
					));
					echo tag('div', false, array(
						'class' => 'item-cuisine',
						'data-src' => $custom_image,
						'is-progressive' => true,
					));
					// echo tag('img', false, array(
					// 	'src' => $custom_image,
					// ));
			?>
			<!-- <div class="box-footer cuisine">
				<?php
						echo tag('div', $cnt . ' Cuisines', array(
							'class' => 'pull-right mr5',
							'title' => 'Jumlah Komentar',
						));
				?>
			</div> -->
		</div>
	</a>
</li>