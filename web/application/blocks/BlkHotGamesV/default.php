<script type="text/javascript">

	jQuery(document).ready(function(){	

		jQuery("#sliderv").easySlider({

				auto: true,

				continuous: true,

				pause: 5000, 

				speed: 4000,

				vertical: true			

			});

		});	

	</script>

	

<style type="text/css">	

	#contentSlidev{

		position:relative;

		}			



/* Easy Slider */



	#sliderv{}	

	#sliderv ul, #sliderv li{

		margin:0;

		padding:0;

		list-style:none;

		}

	#sliderv li{ 

		/* 

			define width and height of list item (slide)

			entire slider area will adjust according to the parameters provided here

		*/ 

		width:124px;

		height:600px;

		overflow:hidden; 

		}	

									

	#divNodeSlidev{

		float: left; width: 120px; margin-right: 1px;

	}

	.nodeImagev{

		float: left; width: 100%;

	}

	.nodeNamev{

		float: left; width: 100%; text-align: center;

		height: 22px;

	}

	#contentSlidev #nextBtn{ 

		display: none;

	}

	#contentSlidev #prevBtn{ 

		display: none;

	}

/* // Easy Slider */



</style>

		

					<div id="contentSlidev">

						<div id="sliderv">

							<ul>

								<li>

								<?php    	

								$i=0;	

								foreach ($listGame as $val){

									$i++;

									$nameid = strtolower(str_replace('_','-',$val['nameid']));
									
									$name = '';
									$old_name = $val['name'];
									$name = substr($old_name, 0, 12);
									if(strlen($old_name)>12)
										$name.=' ...';

									$src = "";

									if ($val['sys_image']) {

										$src = UPLOADED_URL.'/'.$val['source_image'];

									}else{

										$src = $val['source_image'];

									}

									

									$url = SITE_URL.'/games/info/'.$nameid.'.html';

									

									echo '<div id="divNodeSlidev">'.

										'<div class="nodeImagev">'.

											'<a href="'.$url.'" rel="dofollow" title="'.$val['name'].'">'.

												'<img src="'.$src.'" alt="'.$val['name'].'" width="120px;" height="120px;"/>'.

											'</a>'.

										'</div>'.

									

										'<div class="nodeNamev">'.

											'<a href="'.$url.'" rel="dofollow" title="'.$val['name'].'">'.

											$name.

											'</a>'.

										'</div>'.									

									'</div>';

									if($i%4==0){

										echo '</li><li>';

									}

								    ?>	

								       

								<?php 

								}

								?>

								</li>

							</ul>

						</div>

					</div>