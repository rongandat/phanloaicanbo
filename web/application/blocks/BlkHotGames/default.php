<script type="text/javascript">

	jQuery(document).ready(function(){	

		jQuery("#slider").easySlider({

				auto: true,

				continuous: true,

				pause: 5000, 

				speed: 4000				

			});

		});	

	</script>

	

<style type="text/css">

    /* image replacement */

        .graphic, #prevBtn, #nextBtn{

            margin:0;

            padding:0;

            display:block;

            overflow:hidden;

            text-indent:-8000px;

            }

    /* // image replacement */

			



	#container{	

		margin:0 auto;

		position:relative;

		text-align:left;

		width:605px;

		background:#fff;		

		margin-bottom:2em;

		}	

	#header{

		height:144px;

		background:#5DC9E1;

		color:#fff;

		}				

	#contentSlide{

		position:relative;

		}			



/* Easy Slider */



	#slider{}	

	#slider ul, #slider li{

		margin:0;

		padding:0;

		list-style:none;

		}

	#slider li{ 

		/* 

			define width and height of list item (slide)

			entire slider area will adjust according to the parameters provided here

		*/ 

		width:605px;

		height:150px;

		overflow:hidden; 

		}	

	#prevBtn, #nextBtn{ 

		display:block;

		width:30px;

		height:77px;

		position:absolute;

		left:0px;

		top: 55px;

		}	

	#nextBtn{ 

		left:590px;

		}														

	#prevBtn a, #nextBtn a{  

		display:block;

		width:15px;

		height:30px;

		background:url(<?php echo SITE_URL;?>/public/js/easyslider1.5/images/btn_prev.png) no-repeat 0 0;	

		}	

	#nextBtn a{ 

		background:url(<?php echo SITE_URL;?>/public/js/easyslider1.5/images/btn_next.png) no-repeat 0 0;	

		}												

	#divNodeSlide{

		float: left; width: 150px; margin-right: 1px;

	}

	.nodeImage{

		float: left; width: 100%;

	}

	.nodeName{

		float: left; width: 100%; text-align: center;

	}

/* // Easy Slider */



</style>

		<div class="moduletable _badge b-popular">

			<div class="gk_round_t">

				<div class="gk_round_tl"></div>

				<div class="gk_round_tr"></div>

			</div>

		

			<div class="gk_round_m">

				<div class="gk_round_ml">

					<div id="contentSlide">

						<div id="slider">

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

									

									echo '<div id="divNodeSlide">'.

										'<div class="nodeImage">'.

											'<a href="'.$url.'" rel="dofollow" title="'.$val['name'].'">'.

												'<img src="'.$src.'" alt="'.$val['name'].'" width="150px;" height="130px;"/>'.

											'</a>'.

										'</div>'.

									

										'<div class="nodeName">'.

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

				</div>

			</div>

	

			<div class="gk_round_b">

				<div class="gk_round_bl"></div>

				<div class="gk_round_br"></div>

			</div>

		</div>