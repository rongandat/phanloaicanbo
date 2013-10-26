<script type="text/javascript">
        jQuery(document).ready(
            function(){
                    jQuery('#news').innerfade({
                            animationtype: 'slide',
                            speed: 750,
                            timeout: 5000,
                            containerheight: '1em'
                    });
        });
</script>

<div id="gkTopHighlighter">
    <div class="gkHighlighterGK4" id="gkHighlighterGK4-0">
        <div class="gkHighlighterInterface">
            <span class="text">News</span>
        </div>
        <div class="gkHighlighterWrapper">
            <ul id="news">
                <?php 
                $i = 1;
                foreach ($listNews as $value) {
                    echo  '<li>
                        <a href="'.SITE_URL.'/news/info/'.$value['title_id'].'.html" title="'.$value['title'].'">'.$i.'. '.$value['title'].'</a>
                </li>';
                    $i++;
                }
                ?>		
            </ul>
            <noscript>
			<div id="att">
				<p>Sorry, you need to activate JavaScript in your browser.</p>
			</div>
		</noscript>
        </div>
    </div>
</div>