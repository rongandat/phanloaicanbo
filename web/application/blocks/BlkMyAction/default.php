<style type="text/css">
    div.profile-toolbox-bl {
        background: none repeat scroll 0 0 transparent;
        background: url("http://demo.gavick.com/joomla15/nov2009//components/com_community/templates/default/css/../images/toolbar/profile-toolbar-bl.gif") no-repeat scroll left bottom #EEEEEE;
        margin: 0 0 10px;
    }
    .gk_round_tl, .gk_round_tr, .gk_round_bl, .gk_round_br {
        background: url("../images/style1/mod_corn_white.png") no-repeat scroll 0 0 transparent;
    }
    .gk_round_tl, .gk_round_tr, .gk_round_bl, .gk_round_br, .bottom_round_tr, .bottom_round_tl {
        height: 4px;
        left: -4px;
        position: absolute;
        top: 0;
        width: 4px;
    }
    .gk_round_tr, .bottom_round_tr {
        background-position: 100% 0 !important;
    }
    .gk_round_tl, .gk_round_tr, .gk_round_bl, .gk_round_br {
        background: url("http://demo.gavick.com/joomla15/nov2009/templates/gk_framework/css/../images/style1/mod_corn_white.png") no-repeat scroll 0 0 transparent;
    }
    .bottom_round_tr, .gk_round_tr {
        left: inherit;
        right: -4px;
    }
    .gk_round_tl, .gk_round_tr, .gk_round_bl, .gk_round_br, .bottom_round_tr, .bottom_round_tl {
        height: 4px;
        left: -4px;
        position: absolute;
        top: 0;
        width: 4px;
    }
    .gk_round_m {
        background: none repeat scroll 0 0 #FFFFFF;
        border-left: 1px solid #E0E0E0;
        border-right: 1px solid #E0E0E0;
    }
    .gk_round_ml {
        padding: 6px 15px 12px;
    }
    div.profile-toolbox-bl ul.small-button {
        height: 32px;
        list-style: none outside none;
        margin: 0;
        padding: 0 0 0 20px;
    }
    div.profile-toolbox-bl ul.small-button li {
        background: none repeat scroll 0 0 transparent;
        display: block;
        float: left;
        line-height: 33px;
        padding: 0;
    }
    div.profile-toolbox-bl ul.small-button li a {
        display: block;
        float: left;
        height: 20px;
        line-height: 16px;
        margin: 8px 15px 0 0;
        padding: 0 0 0 20px;
        text-decoration: none;
    }
    div.profile-toolbox-bl ul.small-button li.btn-add-friend a {
        background: url("http://demo.gavick.com/joomla15/nov2009//components/com_community/templates/default/css/../images/toolbar/profile-toolbar-icons.gif") no-repeat scroll 0 0 transparent;
    }
    div.profile-toolbox-bl ul.small-button li.btn-gallery a {
        background: url("http://demo.gavick.com/joomla15/nov2009//components/com_community/templates/default/css/../images/toolbar/profile-toolbar-icons.gif") no-repeat scroll 0 -21px transparent;
    }
    div.profile-toolbox-bl ul.small-button li.btn-videos a {
        background: url("http://demo.gavick.com/joomla15/nov2009//components/com_community/templates/default/css/../images/toolbar/profile-toolbar-icons.gif") no-repeat scroll 0 -83px transparent;
    }
    div.profile-toolbox-bl ul.small-button li.btn-write-message a {
        background: url("http://demo.gavick.com/joomla15/nov2009//components/com_community/templates/default/css/../images/toolbar/profile-toolbar-icons.gif") no-repeat scroll 0 -104px transparent;
    }
</style>
<div class="moduletable profile-toolbox-bl">
    <div class="gk_round_t">
        <div class="gk_round_tl">
        </div>
        <div class="gk_round_tr">
        </div>
    </div>
    <div class="gk_round_m">
        <div class="gk_round_ml">
            <ul class="small-button">
                <li class="btn-add-friend">
                    <a onclick="joms.friends.connect('82')" href="javascript:void(0)"><span>Add as friend</span></a>
                </li>
                <li class="btn-gallery">
                    <a href="/joomla15/nov2009/index.php?option=com_community&amp;view=photos&amp;task=myphotos&amp;userid=82&amp;Itemid=68">
                        <span>Photos</span>
                    </a>
                </li>
                <li class="btn-videos">
                    <a href="/joomla15/nov2009/index.php?option=com_community&amp;view=videos&amp;task=myvideos&amp;userid=82&amp;Itemid=68">
                        <span>Videos</span>
                    </a>
                </li>
                <li class="btn-write-message">
                    <a href="javascript:void(0);" onclick="joms.messaging.loadComposeWindow('82')">
                        <span>Write Message</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="gk_round_b">
        <div class="gk_round_bl">
        </div>
        <div class="gk_round_br">
        </div>
    </div>
</div>