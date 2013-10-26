<div class="tabs mg_bottom">
    <div class="tab-menu">
        <ul>
            <li>
                Tags
            </li>
        </ul>
        <div class="clear"></div>
    </div>
    <!-- .tab-menu (end) -->
    <div class="tab-wrapper">
        <div id="tab1" class="tab" style="display: block; ">
            <ul class="recent-posts latest">
                <?php
                foreach ($tag_ex as $value) {
                    $value = trim($value);
                    $keyword = str_replace(' ', '+', $value);
                    echo '<a href="' . SITE_URL . '/search/kw-' . $keyword . '-1.html" target="_blank">' . $value . '</a>, ';
                }
                ?>
            </ul>
        </div><!-- .tab (end) -->
    </div><!-- .tab-wrapper (end) -->
</div><!-- .tabs (end) -->