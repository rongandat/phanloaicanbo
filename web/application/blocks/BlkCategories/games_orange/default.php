<div class="tabs">
    <div class="tab-menu">
        <ul>
            <li>
                <a href="#tab1" class="active" style="">List Categories</a>
            </li>
        </ul>
        <div class="clear"></div>
    </div>
    <!-- .tab-menu (end) -->
    <div class="tab-wrapper">
        <div id="tab1" class="tab" style="display: block; ">
            <div class="box-1">
                <div id="archives-2" class="widget-header">
                    <ul>
                        <?php
                        foreach ($listMenu as $value) {
                            $nameid = str_replace(' ', '-', $value['name']);
                            echo '<li class="cat"><a href="' . $baseUrl . '/cat/' . $nameid . '-' . $value['id'] . '-1.html" title="' . $value['name'] . '" rel="dofollow">' . $value['name'] . '</a></li>';
                        }
                        ?>                                
                    </ul>
                </div>                            
            </div>
        </div><!-- .tab (end) -->
    </div><!-- .tab-wrapper (end) -->
</div><!-- .tabs (end) -->

