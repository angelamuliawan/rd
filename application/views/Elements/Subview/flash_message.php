<?php
		$flash = $this->session->flashdata('flash_message');
		if( !empty( $flash['message'] ) && !empty($flash['status']) ) {
			$message = $flash['message'];
			$status = $flash['status'];

			$message_tag = tag('p', $message);
			$alert_type = ( $status == 'error' ) ? 'alert-danger' : 'alert-success';
			
			$closeButton = tag('a', '&times', array(
				'href' => '#',
				'class' => 'close',
				'data-dismiss' => 'alert',
				'title' => 'Tutup',
			));
?>
<div class="container bg-white">
	<div class="bg-white" style="padding:20px 20px 0;"> 
		<div class="row"> 
			<div class="col-sm-12">
				<?php
						echo tag('div', $closeButton.$message_tag, array(
							'class' => 'alert '.$alert_type
						));
				?>
			</div>
		</div>
	</div>
</div>
<?php
		}
?>