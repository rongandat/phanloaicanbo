<div class="moduletable_ver3">
    <div class="gk_round_t">
        <div class="gk_round_tl">
        </div>
        <div class="gk_round_tr">
        </div>
    </div>
    <div class="gk_round_m">
        <div class="gk_round_ml">
            <h3><span>Friends</span></h3>
            <input type="hidden" id="hd_count_friends" value="<?php echo $countFriend ?>"/>
            <div class="small"><b id="show_count_friends"><?php echo $countFriend ?></b> friends</div>
            <ul class="avatar-list">
                <?php foreach ($friends as $friend) { ?>
                    <li class="avatar-list-item">
                        <a href="<?php echo $baseUrl . '/u/' . $friend['friend_id'] . '/' . $friend['username'] . '.html'; ?>"><img width="64" height="64" class="avatar_friends hasTip" src="<?php echo $friend['avatarurl'] ?>" alt="<?php echo $friend['first_name']. ' '.$friend['last_name'] ?>"></a>
                    </li>
                <?php } ?>
            </ul>
            <div style="clear: both;"></div>
            <div style="text-align:right;">
                <a href="<?php echo SITE_URL.'/u/'.$arrParam['user_id'].'-friends.html'?>">
                    Show all                               
                </a>
            </div>
        </div>
    </div>
    <div class="gk_round_b">
        <div class="gk_round_bl">
        </div>
        <div class="gk_round_br">
        </div>
    </div>
</div>