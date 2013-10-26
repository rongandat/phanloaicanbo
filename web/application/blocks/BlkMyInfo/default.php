<style type="text/css">
    
    #gk_bottom2 a, div.moduletable_ver2, div.moduletable_ver2 a {
        color: #AAAAAA;
    }
    div.moduletable_ver2 .gk_round_t, div.moduletable_ver2 .gk_round_b, .bottom_round_t {
        background: url("<?php echo SITE_URL; ?>/public/images/mod_corn_dark.png") repeat-x scroll 0 -4px transparent;
    }
    .bottom_round_t, .gk_round_t, .gk_round_b {
        height: 4px;
        margin: 0 4px;
        position: relative;
    }
    div.moduletable_ver2 .gk_round_tl, div.moduletable_ver2 .gk_round_tr, div.moduletable_ver2 .gk_round_bl, div.moduletable_ver2 .gk_round_br, .bottom_round_tl, .bottom_round_tr {
        background: url("<?php echo SITE_URL; ?>/public/images/mod_corn_dark.png") no-repeat scroll 0 0 transparent;
    }
    .gk_round_tl, .gk_round_tr, .gk_round_bl, .gk_round_br, .bottom_round_tr, .bottom_round_tl {
        height: 4px;
        position: absolute;
        top: 0;
        width: 4px;
    }
    .bottom_round_tr, .gk_round_tr {
        left: inherit;
        right: -4px;
    }
    .gk_round_tl, .gk_round_tr, .gk_round_bl, .gk_round_br, .bottom_round_tr, .bottom_round_tl {
        height: 4px;
        position: absolute;
        top: 0;
        width: 4px;
    }
    div.moduletable_ver2 .gk_round_m {
        background: none repeat scroll 0 0 #1A1A1A;
        border-left: 1px solid #1A1A1A;
        border-right: 1px solid #1A1A1A;
    }
    .gk_round_ml {
        padding: 6px 15px 12px;
    }
    
    div.moduletable h3, div.moduletable_menu h3, div.moduletable_text h3, div.moduletable_ver1 h3, div.moduletable_ver2 h3, div.moduletable_ver3 h3 {
        font-family: "Myriad Pro",Arial,sans-serif;
        font-size: 1.58em;
        line-height: 30px;
        margin: 0 0 12px;
        overflow: hidden;
        position: relative;
    }
    .moduletable_ver2 h3 span {
        color: #FFFFFF !important;
    }
    ul.profile-right-info {
        list-style: none outside none;
        margin: 10px 0 0;
        padding: 0;
    }
    ul.profile-right-info li {
        background: none repeat scroll 0 0 transparent;
        line-height: normal;
        padding: 0;
    }
    .infoGroupTitle {
        border-bottom: 1px dotted #DDDDDD;
        color: #378ADF;
        margin-top: 24px !important;
        font-size: 110%;
        font-weight: 700;
        margin: 0 0 10px !important;
    }
    .infoTitle {
        text-shadow: 1px 1px 0 #000000;
        color: #FFFFFF;
        font-size: 90%;
        font-weight: 700;
    }
    .infoDesc {
        font-size: 90%;
    }
</style>
<div class="moduletable_ver2">
    <div class="gk_round_t">
        <div class="gk_round_tl">
        </div>
        <div class="gk_round_tr">
        </div>
    </div>
    <div class="gk_round_m">
        <div class="gk_round_ml">
            <h3><span>About Me</span></h3>
            <ul class="profile-right-info">
                <li class="infoGroupTitle">Basic Information</li>
                <li class="infoTitle">Gender</li>
                <li class="infoDesc"><?php if($user['gender'] == 1){ ?> Male <?php }else{ ?> FeMale <?php }?></li>
                <li class="infoTitle">Member since</li>
                <li class="infoDesc"><?php echo $user['date_created'] ?></li>
            </ul>
            <ul class="profile-right-info">
                <li class="infoGroupTitle">Contact Information</li>
                <li class="infoTitle">Adress</li>
                <li class="infoDesc"><?php echo $user['address'] ?></li>
                <li class="infoTitle">Mobile</li>
                <li class="infoDesc"><?php echo $user['mobi;e'] ?></li>
            </ul>
<!--            <ul class="profile-right-info">
                <li class="infoGroupTitle">Education</li>
            </ul>-->
        </div>
    </div>
    <div class="gk_round_b">
        <div class="gk_round_bl">
        </div>
        <div class="gk_round_br">
        </div>
    </div>
</div>