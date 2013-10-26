<div class="moduletable profile-toolbox-bl">
    <div class="gk_round_t">
        <div class="gk_round_tl">
        </div>
        <div class="gk_round_tr">
        </div>
    </div>
    <div class="gk_round_m">

        <div style="position: relative; padding: 10px;">
            <div id="activity-stream-container">
                <div style="font-weight: bold;" class="ctitle">You have <input type="hidden" id="hd_value_requests" name="hd_value_requests" value="<?php echo count($listRequest);?>"/><b id="show_count_request"><?php echo count($listRequest);?></b> friend requests.</div>
                <div id="frindes">
                <?php
                foreach ($listRequest as $value) {
                ?>
                    <div class="newsfeed-item" id="friend_request_<?php echo $value['id'];?>">
                        <table style="width: 98%; overflow: hidden;">
                            <tbody>
                                <tr>
                                    <td style="width:20px;text-align: left; vertical-align: top;">
                                        <a href="#"><img width="36" border="0" alt="" src="<?php echo $value['avatarurl'];?>" class="avatar"></a>
                                    </td>
                                    <td style="width:16px;vertical-align: top; padding-top: 10px;">
                                        <img alt="" class="icon" src="<?php echo SITE_URL;?>/public/images/status/3.png">
                                    </td>
                                    <td style="width:70%; text-align: left; vertical-align: top; padding-top: 10px;">
                                        <a class="actor-link" href="<?php echo SITE_URL.'/u/'.$value['id'].'/'.$value['username'].'.html';?>"><?php echo $value['first_name'].' '.$value['last_name'];?> </a> send invitation to you						
                                        <div class="newsfeed-content-hidden" id="feed_80"></div>
                                    </td>

                                    <td style="text-align: right;vertical-align:top;white-space:nowrap;"><a onclick="updatef(<?php echo $value['id'];?>); return false;" href="#"><div role="button" id="button-like" class="d-q-p j-e j-e-Y hqnAId" tabindex="0">Agree</div></a><a onclick="deletef(<?php echo $value['id'];?>); return false;" href="#"><div role="button" id="button-like" class="d-q-p j-e j-e-Y hqnAId" tabindex="0">Disagree</div></a></td>

                                </tr>
                            </tbody>
                        </table>
                    </div>
                <?php
                }
                ?>
                </div>
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