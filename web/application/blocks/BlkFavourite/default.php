<div class="moduletable_ver3">
	<div class="gk_round_t">
		<div class="gk_round_tl"></div>
		<div class="gk_round_tr"></div>
	</div>

	<div class="gk_round_m">
		<div class="gk_round_ml">
                    <h3><span><span class="first-word">Favourite</span> Games</span>
                    </h3>
			<div class="moduletable_content clearfix">
                            <div>
                                <ul id="display_new_game_fv">
                                    <?php  		
                                    foreach ($listGame as $key => $game){
                                            $nameid = strtolower(str_replace('_','-',$game['nameid']));
                                        ?>	
                                            <li id="<?php echo $game['id'];?>">
                                                                    
                                                                            <?php 
                                                                            if ($game['sys_image']) {
                                                                                    echo '<img src="'.UPLOADED_URL.'/'.$game['source_image'].'" alt="'.$game['name'].'" class="home_img_game">';
                                                                            }else{
                                                                                    echo '<img src="'.$game['source_image'].'" alt="'.$game['name'].'" class="home_img_game">';
                                                                            }
                                                                            ?>
                                                    <ul>
                                                        <li class="view">
                                                            <a href="<?php echo SITE_URL.'/games/info/'.$nameid.'.html'?>" rel="dofollow" title="<?php echo $game['name'];?>">Play</a>
                                                        </li>
                                                        <li class="delete">
                                                            <?php
                                                            if($flagDelete){
                                                                echo '<a href="javascript:void(0);" onclick="deleteFavourite('.$game['id'].')">Delete</a>';
                                                            }else{
                                                                echo '<a href="javascript:void(0);" onclick="postFavourite('.$game['id'].')">Favourite</a>';
                                                            }
                                                            ?>
                                                            
                                                        </li>
                                                        
                                                    </ul>
                                                                     
                                                        <?php 
                                                        $name = '';
                                                        $old_name = $game['name'];
                                                        for ($index = 0; $index < strlen($old_name); $index++) {
                                                                $name.=$old_name[$index];
                                                                if ($index>12) {
                                                                        $name.=' ...';
                                                                        break;
                                                                }
                                                        }
                                                        ?>
                                                        <center><p style="margin-top:77px;"><?php echo $name;?></p></center>
                                                    </li>
                                    <?php 
                                    }
                                    ?>
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


