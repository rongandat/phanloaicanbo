<div class="slider_content">

    <div class="container">

        <ul id="slider1">

            <?php

            $i = 0;

            foreach ($listGame as $key => $val) {

                $i++;

                if ($i % 4 == 1) {

                    echo '<li>';

                }

                $nameid = strtolower(str_replace('_', '-', $val['nameid']));

                $image_path = '';

                if ($val['sys_image']) {

                    $image_path = UPLOADED_URL . '/' . $val['source_image'];

                } else {

                    $image_path = $val['source_image'];

                }

                ?>

                

                <div class="content_slider clearfix">

                    <a href="<?php echo SITE_URL."/games/info/".$nameid.".html"; ?>" rel="dofollow" title="Energy Invaders">

                        <img src="<?php echo $image_path;?>" alt="<?php echo $val['name'];?>" title="<?php echo $val['name'];?>" width="140" height="130" class="attachment-testi-thumbnail wp-post-image">

                    </a>

                    <strong>

                        <a href="<?php echo SITE_URL."/games/info/".$nameid.".html"; ?>" class="post-title" rel="bookmark" title="<?php echo $val['name'];?>"><?php echo $val['name'];?></a>

                    </strong>

                    <div class="post_content"><?php echo substr($val['desc'], 0, 40).'...';?></div>

                </div>            

            

                <?php

                if ($i % 4 == 0) {

                    echo '</li>';

                }

            }

            ?>            

        </ul> 

    </div>  

    <div class="slider_adv">

        <?php echo $view->blkAdv('cpm', '300x250'); ?>

    </div>

</div>