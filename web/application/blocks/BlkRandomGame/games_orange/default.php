<div class="tabs">    <div class="tab-menu">        <ul>            <li>                <a href="#tab1" class="active" style="">Random Games</a>            </li>        </ul>        <div class="clear"></div>    </div>    <!-- .tab-menu (end) -->    <div class="tab-wrapper">        <div id="tab1" class="tab" style="display: block; ">            <ul class="recent-posts latest">                <?php                foreach ($listRandomGame as $key => $game) {                    $nameid = strtolower(str_replace('_', '-', $game['nameid']));                    ?>	                    <li class="entry"> 						<div class="thumb-wrap">	                        <a href="<?php echo SITE_URL . '/games/info/' . $nameid . '.html' ?>" rel="dofollow" title="<?php echo $game['name']; ?>">	                            	                                <?php	                                if ($game['sys_image']) {		                                    echo '<img src="' . UPLOADED_URL . '/' . $game['source_image'] . '" alt="' . $game['name'] . '" title="' . $game['name'] . '" width="134" height="115" class="thumb wp-post-image"/>';	                                } else {		                                    echo '<img src="' . $game['source_image'] . '" alt="' . $game['name'] . '" title="' . $game['name'] . '" width="134" height="115" class="thumb wp-post-image"/>';	                                }	                                ?>	                        </a>						</div>                        <?php                        $name = '';                        $old_name = $game['name'];                        $name = substr($old_name, 0, 17);                        if (strlen($old_name) > 17)                            $name.=' ...';                        ?>                        <h5>                            <a href="<?php echo SITE_URL . '/games/info/' . $nameid . '.html' ?>" rel="bookmark" title="<?php echo $game['name']; ?>"><?php echo $name; ?></a>                        </h5>		                                    <div class="clear"></div>                    </li>                    <?php                }                ?>                             </ul>        </div><!-- .tab (end) -->    </div><!-- .tab-wrapper (end) --></div><!-- .tabs (end) -->