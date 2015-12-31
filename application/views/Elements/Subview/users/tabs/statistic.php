<?php
		$valuesUserAccount = isset( $valuesUserAccount[0] ) ? $valuesUserAccount[0] : false;
		
		$curLevel = isset( $valuesUserAccount['LevelName'] ) ? $valuesUserAccount['LevelName'] : false;
		$nextLevel = isset( $valuesUserAccount['NextLevelName'] ) ? $valuesUserAccount['NextLevelName'] : false;
		
		$totalRecipe = isset( $valuesUserAccount['NumberOfRecipe'] ) ? $valuesUserAccount['NumberOfRecipe'] : 0;
		$actualRecipe = isset( $valuesUserAccount['ActualRecipe'] ) ? $valuesUserAccount['ActualRecipe'] : 0;

		$totalRecook = isset( $valuesUserAccount['NumberOfRecook'] ) ? $valuesUserAccount['NumberOfRecook'] : 0;
		$actualRecook = isset( $valuesUserAccount['ActualRecook'] ) ? $valuesUserAccount['ActualRecook'] : 0;

		$totalContest = isset( $valuesUserAccount['NumberOfWinContest'] ) ? $valuesUserAccount['NumberOfWinContest'] : 0;
		$actualContest = isset( $valuesUserAccount['ActualContest'] ) ? $valuesUserAccount['ActualContest'] : 0;
		
		$customLevel = !empty( $curLevel ) ? $curLevel : 'No level yet';
		$customNextLevel = !empty( $nextLevel ) ? $nextLevel : 'Next level not available';
		$customRecipe = sprintf('%s dari %s Resep', $totalRecipe, $actualRecipe);
		$customRecook = sprintf('%s dari %s Recook', $totalRecook, $actualRecook);
		$customContest = sprintf('%s dari %s Kontes', $totalContest, $actualContest);
?>

<form class="form-horizontal mt20" role="form">
  	<div class="form-group">
  		<?php
  				echo tag('label', 'Posisi Sekarang', array(
  					'class' => 'col-sm-4',
  				));
    			echo tag('p', $customLevel, array(
    				'wrapTag' => 'div',
    				'wrapAttributes' => array(
    					'class' => 'col-sm-4'
    				)
    			));
    	?>
  	</div>
	<div class="form-group">
		<?php
  				echo tag('label', 'Posisi yang dituju berikutnya', array(
  					'class' => 'col-sm-4',
  				));
  				echo tag('p', $customNextLevel, array(
    				'wrapTag' => 'div',
    				'wrapAttributes' => array(
    					'class' => 'col-sm-4'
    				)
    			));
  		?>
	</div>
	<div class="form-group">
		<?php
  				echo tag('label', 'Total Resep', array(
  					'class' => 'col-sm-4',
  				));
  				echo tag('p', $customRecipe, array(
    				'wrapTag' => 'div',
    				'wrapAttributes' => array(
    					'class' => 'col-sm-4'
    				)
    			));
  		?>
	</div>
	<div class="form-group">
		<?php
  				echo tag('label', 'Total Recook', array(
  					'class' => 'col-sm-4',
  				));
  				echo tag('p', $customRecook, array(
    				'wrapTag' => 'div',
    				'wrapAttributes' => array(
    					'class' => 'col-sm-4'
    				)
    			));
  		?>
	</div>
	<div class="form-group">
		<?php
  				echo tag('label', 'Total Kontes', array(
  					'class' => 'col-sm-4',
  				));
  				echo tag('p', $customContest, array(
    				'wrapTag' => 'div',
    				'wrapAttributes' => array(
    					'class' => 'col-sm-4'
    				)
    			));
  		?>
	</div>
</form>