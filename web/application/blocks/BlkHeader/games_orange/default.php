<div class="container">



    <div class="logo">



        <h1><a href="<?php echo SITE_URL; ?>" title="<?php echo SITE_TITLE; ?>">

            <img width="220" height="100" src="<?php echo SITE_URL.'/'.LOGO_SITE; ?>" alt="<?php echo SITE_TITLE; ?>" title="<?php echo SITE_TITLE; ?>" class="">

            </a>

        </h1>



    </div>







    <div id="login">


    </div>







    <div id="widget-header">



        <div id="nav_menu-2" class="widget-header">



            <h3>Main Menu</h3>



            <div class="menu-main-menu-container">



                <!-- Noi dung quang cao aaax60-->

                

                <?php 

                if($arrParam["module"]=="front" && $arrParam["controller"]=="index" && $arrParam["action"]=="index"){

                    //echo $this->view->blkAdv('cpm', '468x60');

                }else{

                    //echo $this->view->blkAdv('cpm', '468x60');

                }

                ?>



            </div>



        </div>            



    </div>



    <!--#widget-header-->



    <nav class="primary">



        <ul id="topnav" class="sf-menu sf-js-enabled">



            <li id="menu-item-106" class="menu-item menu-item-type-taxonomy menu-item-object-portfolio_category menu-item-106"><a href="<?php echo SITE_URL;?>">Home</a></li>



            <li id="menu-item-100" class="menu-item menu-item-type-taxonomy menu-item-object-portfolio_category menu-item-100"><a href="<?php echo SITE_URL.'/cat.html';?>">Categories</a></li>



        </ul>            



    </nav>



    <!--.primary-->



    <form method="get" id="searchform" action="<?php echo SITE_URL.'/front/games/search/';?>">



        <input type="text" name="kw" maxlength="60" alt="Search"/>



        <input type="submit" value="Search"/>



    </form>



</div>