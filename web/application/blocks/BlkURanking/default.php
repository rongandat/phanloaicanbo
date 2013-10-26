<div id="points-male" class="points">
    <div id="pointsinfo">
        <p class="pointhdr"><strong><?php echo $points->points;?></strong></p>
        <p class="pointdesc">Points</p>
        <ul>
            <li><strong><?php echo $points->plays;?></strong> plays</li>
            <li><strong><?php echo $points->comments;?></strong> comments</li>
            <li><strong><?php echo $points->merit;?></strong> like, dislike games</li>
            <li><strong><?php echo $points->likes;?></strong> merits</li>
        </ul>
    </div>
    <div id="levellisting">
        <?php
        $level1 = 0;
        $level2 = 0;
        $level3 = 0;
        $level4 = 0;
        $level5 = 0;
        $level6 = 0;
        $level7 = 0;
        if($points->points<=10){
            $level1 = 45;
        }elseif($points->points<=25){
            $level1 = 90;
        }elseif($points->points<=100){
            $level1 = 135;
        }elseif($points->points<=255){
            $level1 = 135;
            $level2 = 45;
        }elseif($points->points<=400){
            $level1 = 135;
            $level2 = 90;
        }elseif($points->points<=625){
            $level1 = 135;
            $level2 = 135;
        }elseif($points->points<=1200){
            $level1 = 135;
            $level2 = 135;
            $level3 = 45;
        }elseif($points->points<=1750){
            $level1 = 135;
            $level2 = 135;
            $level3 = 90;
        }elseif($points->points<=2250){
            $level1 = 135;
            $level2 = 135;
            $level3 = 135;
        }elseif($points->points<=3000){
            $level1 = 135;
            $level2 = 135;
            $level3 = 135;
            $level4 = 45;
        }elseif($points->points<=3500){
            $level1 = 135;
            $level2 = 135;
            $level3 = 135;
            $level4 = 90;
        }elseif($points->points<=4000){
            $level1 = 135;
            $level2 = 135;
            $level3 = 135;
            $level4 = 135;
        }elseif($points->points<=4500){
            $level1 = 135;
            $level2 = 135;
            $level3 = 135;
            $level4 = 135;
            $level5 = 45;
        }elseif($points->points<=5200){
            $level1 = 135;
            $level2 = 135;
            $level3 = 135;
            $level4 = 135;
            $level5 = 90;
        }elseif($points->points<=6000){
            $level1 = 135;
            $level2 = 135;
            $level3 = 135;
            $level4 = 135;
            $level5 = 135;
        }elseif($points->points<=7250){
            $level1 = 135;
            $level2 = 135;
            $level3 = 135;
            $level4 = 135;
            $level5 = 135;
            $level6 = 45;
        }elseif($points->points<=8500){
            $level1 = 135;
            $level2 = 135;
            $level3 = 135;
            $level4 = 135;
            $level5 = 135;
            $level6 = 90;
        }elseif($points->points<=10000){
            $level1 = 135;
            $level2 = 135;
            $level3 = 135;
            $level4 = 135;
            $level5 = 135;
            $level6 = 135;
        }elseif($points->points<=13500){
            $level1 = 135;
            $level2 = 135;
            $level3 = 135;
            $level4 = 135;
            $level5 = 135;
            $level6 = 135;
            $level7 = 45;
        }elseif($points->points<=17500){
            $level1 = 135;
            $level2 = 135;
            $level3 = 135;
            $level4 = 135;
            $level5 = 135;
            $level6 = 135;
            $level7 = 45;
        }elseif($points->points<=20000){
            $level1 = 135;
            $level2 = 135;
            $level3 = 135;
            $level4 = 135;
            $level5 = 135;
            $level6 = 135;
            $level7 = 45;
        }
        ?>
        <div id="level1-male" class="levels" style="height:<?php echo $level1;?>px"></div>
        <div id="level2-male" class="levels" style="height:<?php echo $level2;?>px"></div>
        <div id="level3-male" class="levels" style="height:<?php echo $level3;?>px"></div>
        <div id="level4-male" class="levels" style="height:<?php echo $level4;?>px"></div>
        <div id="level5-male" class="levels" style="height:<?php echo $level5;?>px"></div>
        <div id="level6-male" class="levels" style="height:<?php echo $level6;?>px"></div>
        <div id="level7-male" class="levels" style="height:<?php echo $level7;?>px"></div>                    
    </div>
</div>