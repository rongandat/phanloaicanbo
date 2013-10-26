<?php

class Block_BlkTopMenu extends Zend_View_Helper_Abstract {

    function blkTopMenu($postion = 0) {
        ?>
        <div id="horiz-menu">
            <ul class="menu">
                <li class="level1 <?php echo $postion == 0 ? "active current" : ""; ?>">
                    <a href="<?php echo SITE_URL; ?>" class="level1 topdaddy <?php echo $postion == 0 ? "active" : ""; ?>" title="Angry Birds"><span>Home</span></a>
                </li>

                <li class="level1 <?php echo $postion == 1 ? "active current" : ""; ?>">
                    <a href="<?php echo $baseUrl . '/cat.html'; ?>" class="level1 topdaddy  <?php echo $postion == 1 ? "active" : ""; ?>"><span>Categories</span></a>
                </li>
                <li class="level1 ">
                    <a href="<?php echo SITE_URL; ?>/news" target="_blank" title ="News"><span>News</span></a>
                </li>
                <li class="level1 ">
                    <a href="<?php echo SITE_URL; ?>/video" target="_blank" title ="Video"><span>Video</span></a>
                </li>
                <li class="level1 ">
                    <a href="<?php echo SITE_URL; ?>/cat/Angry-Birds-346-1.html" target="_blank" title ="Angry Birds"><span>Angry Birds</span></a>
                </li>

                <?php
                $auth = Zend_Auth::getInstance();
                if (!$auth->hasIdentity()) {
                    ?>
                    <li class="level1 <?php echo $postion == 2 ? "active current" : ""; ?>">
                        <a href="<?php echo $baseUrl . '/user/signin.html'; ?>" class="level1 topdaddy  <?php echo $postion == 2 ? "active" : ""; ?>"><span>Sign in</span></a>
                    </li>	

                    <li class="level1 <?php echo $postion == 3 ? "active current" : ""; ?>">
                        <a href="<?php echo $baseUrl . '/user/signup.html'; ?>" class="level1 topdaddy  <?php echo $postion == 3 ? "active" : ""; ?>"><span>Register</span></a>
                    </li>

                    <?php
                } else {

                    $identity = $auth->getIdentity();
                    ?>

                    <li class="level1 <?php echo $postion == 2 ? "active current" : ""; ?>">
                        <a href="#" class="level1 topdaddy  <?php echo $postion == 2 ? "active" : ""; ?>"><span><?php echo $identity->username; ?></span></a>
                        <ul style="overflow-x: hidden; overflow-y: hidden; height: 0px; ">
                            <li>
                                <a href="<?php echo SITE_URL . '/u/' . $identity->id . '/' . $identity->username . '.html'; ?>"><span>My information</span></a>
                            </li>
                            <li>
                                <a href="<?php echo SITE_URL . '/user/change-info.html'; ?>"><span>Change info</span></a>
                            </li>
                            <li>
                                <a href="<?php echo SITE_URL . '/user/change-pass.html'; ?>"><span>Change password</span></a>
                            </li>
                            <li>
                                <a href="<?php echo SITE_URL . '/user/logout.html'; ?>"><span>Log out</span></a>
                            </li>
                        </ul>
                    </li>							

                    <?php
                }
                ?>
            </ul> 
        </div>
        <?php
    }
}