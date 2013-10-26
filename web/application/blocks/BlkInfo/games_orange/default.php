<div class="tabs mg_bottom">
    <div class="tab-menu">
        <ul>
            <li>
                Description
            </li>
        </ul>
        <div class="clear"></div>
    </div>
    <!-- .tab-menu (end) -->
    <div class="tab-wrapper">
        <div id="tab1" class="tab" style="display: block; ">
            <?php echo $game['desc'] ?>
        </div><!-- .tab (end) -->
    </div><!-- .tab-wrapper (end) -->
</div><!-- .tabs (end) -->

<div class="tabs mg_bottom">
    <div class="tab-menu">
        <ul>
            <li>
                Instructions
            </li>
        </ul>
        <div class="clear"></div>
    </div>
    <!-- .tab-menu (end) -->
    <div class="tab-wrapper">
        <div id="tab1" class="tab" style="display: block; ">
            <?php echo $game['instructions'] ?>
        </div><!-- .tab (end) -->
    </div><!-- .tab-wrapper (end) -->
</div><!-- .tabs (end) -->

<div class="tabs mg_bottom">
    <div class="tab-menu">
        <ul>
            <li>
                Share
            </li>
        </ul>
        <div class="clear"></div>
    </div>
    <!-- .tab-menu (end) -->
    <div class="tab-wrapper">
        <div style="margin-left: 0px;line-height: normal;">
            <div style="width: 100%; float: left; margin-bottom: 5px;">
                <div style="width: 35%; float: left; text-align: left;">
                    <!-- AddThis Button BEGIN -->
                    <div class="addthis_toolbox addthis_default_style ">
                        <a class="addthis_button_preferred_1"></a>
                        <a class="addthis_button_preferred_2"></a>
                        <a class="addthis_button_preferred_3"></a>
                        <a class="addthis_button_preferred_4"></a>
                        <a class="addthis_button_compact"></a>
                        <a class="addthis_counter addthis_bubble_style"></a>
                    </div>
                    <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=xa-4e5d81a73e66dc2e"></script>
                    <!-- AddThis Button END -->
                </div>	
                <div style="width: 60%; float: right; text-align: right;">Add this game to your blog, MySpace or website!</div>

            </div>
            <div style="width: 100%; float: left;">
                <textarea class="share-embed-code" style="margin: 0px 1px 0px 0px; width: 100%; height: 60px; resize: none;" readonly="readonly"><iframe width="500" height="405" src="<?php echo SITE_URL . '/games/frame/' . $nameid . '-' . $game['id'] . '.html'; ?>" frameborder="0" allowfullscreen></iframe><br><center><a href='<?php echo SITE_URL; ?>' title="<?php echo SITE_TITLE; ?>" rel="dofollow" target="_blank"><?php echo SITE_TITLE; ?></a></center></textarea>
            </div>
        </div>
        <div style="clear: both;"></div>
    </div><!-- .tab-wrapper (end) -->
</div><!-- .tabs (end) -->
