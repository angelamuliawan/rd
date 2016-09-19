<?php
		$valuesUserAccount = isset( $valuesUserAccount[0] ) ? $valuesUserAccount[0] : false;
		$username = isset( $valuesUserAccount['UserName'] ) ? $valuesUserAccount['UserName'] : false;
		$description = isset( $valuesUserAccount['Description'] ) ? $valuesUserAccount['Description'] : false;
?>
<div class="container bg-white">
	<div id="wrapper-outer-profile" class="big-wrapper bg-white pd20" style="min-height:500px;">
		<div class="row">
			<div class="wrapper-profile">
				<div class="col-sm-3">
					<?php
							loadSubview('users/photo_profile', array(
								'_allow_upload' => false,
							));
					?>
				</div>
				<div class="col-sm-6" style="padding-left: 0;">
					<?php
							echo tag('h3', $username, array(
								'class' => 'mb10 ml20 desktop-only'
							));
							echo tag('p', $description, array(
								'class' => 'mb10 ml20 desktop-only'
							));

							if( $this->session->userdata('userid') == $user_id_viewer ) {
								echo tag('button', 'Tulis Resep', array(
									'type' => 'submit',
									'class' => 'btn btn-orange mb10 ml10',
									'style' => 'width: auto;',
									'wrapTag' => 'a',
									'wrapAttributes' => array(
										'title' => 'Tulis Resep',
										'href' => $domain.'/recipe/add',
									),
								));
							}
					?>

					<div class="wrapper-right">
						<ul class="timeline">
							<?php
									if( !empty($valuesTimeline) ) {

										foreach( $valuesTimeline as $item ) {
											$activity = $item['Activity'];
											$activity_desc = $item['ActivityDesc'];
											$activity_date = $item['ActivityDate'];
											$intro = $item['RecipeIntro'];
											
											$recipe_id = $item['RecipeID'];
											$recook_id = $item['RecookID'];
											$cookmark_id = $item['CookmarkID'];
											$image = $item['RecipePhoto'];
											$slug = $item['Slug'];

											$flag_cookmark = $item['FlagCookmark'];
											$flag_recook = $item['FlagRecook'];
											$flag_creator = $item['FlagCreator'];

											if( $activity == 'Recook' ) {
												$intro = $item['RecookIntro'];
												$image = $item['RecookPhoto'];
											}

											$blocked_recipe_reason = $item['BlockedRecipeReason'];
											$blocked_recook_reason = $item['BlockedRecookReason'];

											if( ( !empty($blocked_recipe_reason) || !empty($blocked_recook_reason)) && $this->session->userdata('userid') != $user_id_viewer ) {
												// Recipe blocked
											} else {
												loadSubview('users/item_timeline', array(
													'activity' => $activity,
													'activity_desc' => $activity_desc,
													'activity_date' => $activity_date,
													'intro' => $intro,
													'recipe_id' => $recipe_id,
													'recook_id' => $recook_id,
													'cookmark_id' => $cookmark_id,
													'image' => $image,
													'slug' => $slug,
													'flag_cookmark' => $flag_cookmark,
													'flag_recook' => $flag_recook,
													'flag_creator' => $flag_creator,
													'blocked_recipe_reason' => $blocked_recipe_reason,
													'blocked_recook_reason' => $blocked_recook_reason,
												));
											}
										}
									} else {
										echo tag('p', 'Data tidak tersedia', array(
											'style' => 'margin-left:40px;'
										));
									}
							?>
				            
				            <li class="clearfix no-float"></li>
				        </ul>
					</div>
				</div>
				<div class="col-sm-3">
					<?php
							loadSubview('users/related_popular_users');
					?>
				</div>
			</div>
		</div>
	</div>
</div>