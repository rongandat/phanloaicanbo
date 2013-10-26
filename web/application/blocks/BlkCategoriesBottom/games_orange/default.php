<div class="container">
    <div class="footer-widget-area">
        <div class="container_12 clearfix">
            <div class="grid_12">
                <div class="grid_12 omega">
                    <div class="box-1">
                        <div id="archives-2" class="widget-header">
                            <ul>
                                <?php
                                foreach ($listMenu as $value) {
                                    $nameid = str_replace(' ', '-', $value['name']);
                                    echo '<li class="even"><a href="' . SITE_URL . '/cat/' . $nameid . '-' . $value['id'] . '-1.html" title="' . $value['name'] . '" rel="dofollow">' . $value['name'] . '</a></li>';
                                }
                                ?>                                
                            </ul>
                        </div>                            
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div style="min-height: 10px;">        
    </div>
</div>

