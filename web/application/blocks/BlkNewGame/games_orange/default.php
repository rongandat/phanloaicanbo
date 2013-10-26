<div class="container">

    <div class="inner">

        <div class="wrapper">

            <div id="my_poststypewidget-2">

                <div class="title">Newest Games</div>

                <ul class="post_list games">

                    <?php
                    $i = 0;
                    foreach ($new_game as $key => $game) {
                        $i++;
                        if ($i == 13) {
                            break;
                        }
                        $nameid = strtolower(str_replace('_', '-', $game['nameid']));
                        ?>	

                        <li class="cat_post_item-1 clearfix <?php echo $i % 7 == 0 ? 'first-child' : ''; ?>"> 

                            <a href="<?php echo SITE_URL . '/games/info/' . $nameid . '.html' ?>" rel="dofollow" title="<?php echo $game['name']; ?>">

                                <?php
                                if ($game['sys_image']) {

                                    echo '<img src="' . UPLOADED_URL . '/' . $game['source_image'] . '" alt="' . $game['name'] . '" title="' . $game['name'] . '" width="140" height="130" class="attachment-testi-thumbnail wp-post-image"/>';
                                } else {

                                    echo '<img src="' . $game['source_image'] . '" alt="' . $game['name'] . '" title="' . $game['name'] . '" width="140" height="130" class="attachment-testi-thumbnail wp-post-image"/>';
                                }
                                ?>

                            </a>

                            <?php
                            $name = '';

                            $old_name = $game['name'];

                            $name = substr($old_name, 0, 15);

                            if (strlen($old_name) > 15)
                                $name.=' ...';
                            ?>

                            <strong>

                                <a href="<?php echo SITE_URL . '/games/info/' . $nameid . '.html' ?>" class="post-title" rel="bookmark" title="<?php echo $game['name']; ?>"><?php echo $name; ?></a>

                            </strong>

                            <div class="post_content"><?php echo substr($game['desc'], 0, 70) . '...'; ?>

                            </div>                            

                        </li>

                        <?php
                    }
                    ?> 

                </ul>

            </div> 

        </div>

    </div>

</div>

<div class="adv_body adv_728_center">
    <?php //echo $this->view->blkAdv('cpm', '728x90'); ?>
</div>

<div class="container">

    <div class="inner">

        <div class="wrapper">

            <div id="my_poststypewidget-2">

                <div class="title">New Games</div>

                <ul class="post_list games_news">

                    <?php
                    $i = 0;
                    foreach ($new_game as $key => $game) {
                        $i++;
                        if ($i > 12) {
                            $nameid = strtolower(str_replace('_', '-', $game['nameid']));
                            ?>	

                            <li class="cat_post_item-1 clearfix <?php echo (($i % 6) - 1) == 0 ? 'first-child' : ''; ?>"> 

                                <a href="<?php echo SITE_URL . '/games/info/' . $nameid . '.html' ?>" rel="dofollow" title="<?php echo $game['name']; ?>">

                                    <?php
                                    if ($game['sys_image']) {

                                        echo '<img src="' . UPLOADED_URL . '/' . $game['source_image'] . '" alt="' . $game['name'] . '" title="' . $game['name'] . '" width="140" height="130" class="attachment-testi-thumbnail wp-post-image"/>';
                                    } else {

                                        echo '<img src="' . $game['source_image'] . '" alt="' . $game['name'] . '" title="' . $game['name'] . '" width="140" height="130" class="attachment-testi-thumbnail wp-post-image"/>';
                                    }
                                    ?>

                                </a>
                                <?php
                                $name = '';

                                $old_name = $game['name'];

                                $name = substr($old_name, 0, 15);

                                if (strlen($old_name) > 15)
                                    $name.=' ...';
                                ?>

                                <strong>
                                    <a href="<?php echo SITE_URL . '/games/info/' . $nameid . '.html' ?>" class="post-title" rel="bookmark" title="<?php echo $game['name']; ?>"><?php echo $name; ?></a>

                                </strong>                 

                            </li>
                            <?php
                        }
                    }
                    ?> 

                </ul>

            </div> 

        </div>

    </div>

</div>