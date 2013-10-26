<div class="tabs mg_bottom">
    <div class="tab-menu">
        <ul>
            <li>
                Comments
            </li>
        </ul>
        <div class="clear"></div>
    </div>
    <!-- .tab-menu (end) -->
    <div class="tab-wrapper">
        <div id="tab1" class="tab" style="display: block; ">
            <div style="width: 100%; float: left; clear: both; margin: 0 0 0 0;">
                <div id="facebook_buttons" style="width: 400px; float: left;">
                    <fb:like font="" href="<?php echo SITE_URL . $view->url(); ?>" send="true" show_faces="false" width="400" class=" fb_edge_widget_with_comment fb_iframe_widget"></fb:like>
                </div>
                <div style="width: 200px; float: right; text-align: right;">
                    <script src="//platform.twitter.com/widgets.js" type="text/javascript"></script>
                    <div style="float: left;">
                        <a href="https://twitter.com/share" 
                           class="twitter-share-button"
                           data-url="http://gameangrybirds.com"
                           data-counturl="<?php echo SITE_URL . $view->url(); ?>"
                           data-text="I like this site"
                           data-related="GameAngryBirds:Play Angry Birds, Play Games">Tweet</a>
                    </div>
                    <div style="float: right;">
                        <!-- Place this tag where you want the +1 button to render -->
                        <g:plusone size="medium"></g:plusone>

                        <!-- Place this render call where appropriate -->
                        <script type="text/javascript">
                            (function() {
                                var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
                                po.src = 'https://apis.google.com/js/plusone.js';
                                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
                            })();
                        </script>
                    </div>
                </div>
            </div>
            <div class="fb-comments" data-href="<?php echo SITE_URL . $view->url(); ?>" data-num-posts="10" data-width="603"></div>

        </div><!-- .tab (end) -->
    </div><!-- .tab-wrapper (end) -->
</div><!-- .tabs (end) -->
