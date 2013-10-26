<?php

class Block_BlkOrtherNews extends Zend_View_Helper_Abstract {

    function blkOrtherNews() {
        $view = $this->view;
        $arrParam = $view->arrParam;
        $news = $arrParam['news_info'];
        $newsModel = new Front_Model_News();
        $topNews = $newsModel->ortherNews($news['id'], 0);
        $oldNews = $newsModel->ortherNews($news['id'], 1);
        if (count($topNews) || count($oldNews))
            require_once (BLOCK_PATH . '/BlkOrtherNews/' . TEMPLATE_USED . '/default.php');
    }

}

?>