<?php

if (sizeof($topNews)) {
    echo '<h1>More In-depth</h1>';
    echo '<ul>';
    foreach ($topNews as $news) {
        echo '<li class="cat-item cat-item-474"> <a href="' . SITE_URL . '/news/info/' . $news['title_id'] . '.html" title="' . $news['title'] . '" rel="dofollow">' . $news['title'] . '</a></li>';
    }
    echo '</ul>';
}

if (sizeof($oldNews)) {
    echo '<h1>Older news</h1>';
    echo '<ul>';
    foreach ($oldNews as $news) {
        echo '<li class="cat-item cat-item-474"> <a href="' . SITE_URL . '/news/info/' . $news['title_id'] . '.html" title="' . $news['title'] . '" rel="dofollow">' . $news['title'] . '</a></li>';
    }
    echo '</ul>';
}
  
