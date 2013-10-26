<?php
$news_text = '';
$images_text = '';
$tabs_text = '';
foreach ($listGame as $key => $val){
    $image_path = '';
    $nameid = strtolower(str_replace('_','-',$val['nameid']));
    $news_text .= '<div class="gk_ni_6_news_text">
            <h2>
                <a href="'.SITE_URL."/games/info/".$nameid.".html".'"  rel="dofollow" style="color:#FFFFFF;" onmouseover="this.style.color = &#39;#EEEEEE&#39;;" onmouseout="this.style.color = &#39;#FFFFFF&#39;" class="gk_news_image_6_title" title="'.$val['name'].'">'.$val['name'].'</a>
            </h2>
            <p style="color:#AAAAAA;">'.substr($val['desc'], 0, 100).'...</p>
    </div>
    <div class="gk_ni_6_news_link" rel="dofollow">'.SITE_URL."/games/info/".$nameid.".html".'</div>';
    
    if ($val['sys_image']) {
        $image_path = UPLOADED_URL.'/'.$val['source_image'];
    }else{
        $image_path = $val['source_image'];
    }        
    $images_text .= '<div class="gk_ni_6_slide" id="gk_ni_6_slide" title="'.$val['name'].'">'.$image_path.'</div>';
    
    $tabs_text .= '<div class="gk_ni_6_tab">
                        <img src="'.$image_path.'" alt="'.$val['name'].'">
                        <h4>'.$val['name'].'</h4>
                        <p>'.substr($val['desc'], 0, 100).'...</p>
                        <div class="gk_ni_6_hover"><div></div></div>
                </div>';
}
?>

<div id="wrapper_header" class="clearfix">
		<div class="wrapper_centered">
			<div id="header1">
				<div class="moduletable_slider">					
					<div class="gk_ni_6_wrapper" id="gk_news_image_6-news_image_6_1">
						<div class="gk_ni_6_wrapper_left">
							<div class="gk_ni_6_wrapper2">
								<div class="gk_ni_6_json">
									<div class="gk_news_image_6_text_datas">
										<?php echo $news_text;?>
									</div>
								</div>
								<?php echo $images_text;?>
							</div>
							<div class="gk_ni_6_readmore_wrapper">	
								<div class="gk_ni_6_readmore_button">
									<span><a href="#">Play now</a></span>
								</div>
							</div>
						</div>

						<div class="gk_ni_6_wrapper_right">
							<div class="gk_ni_6_tabsbar_wrap">	
								<div class="gk_ni_6_tabsbar">
									<?php echo $tabs_text;?>
								</div>
							</div>
							
							<div class="gk_ni_6_tabsbar_slider" style="width:300px;">
								<div class="gk_ni_6_tabsbar_up"></div>		
								<div class="gk_ni_6_tabsbar_down"></div>
							</div>
						</div>				
						<div class="gk_ni_6_preloader"></div>
					</div>		
				</div>
			</div>
			<div id="header2">
				<div class="moduletable_slider">
					<script type="text/javascript"><!--
										google_ad_client = "pub-2402881846703504";
										/* 300x250, created 7/6/11 */
										google_ad_slot = "9050850581";
										google_ad_width = 300;
										google_ad_height = 250;
										//-->
										</script>
										<script type="text/javascript"
										src="http://pagead2.googlesyndication.com/pagead/show_ads.js">	
										</script>
				</div>
			</div>
		</div>
	</div>