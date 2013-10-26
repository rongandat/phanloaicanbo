<?php
class Block_BlkHeadlines extends Zend_View_Helper_Abstract{
	function blkHeadlines(){
		$view = $this->view;
		$arrParam = $view->arrParam;
                $newsModel = new Front_Model_News();
                $listNews = $newsModel->fetchAll('active=1 and slide=1');
                $listNews = $listNews->toArray();
                if(count($listNews)){
		require_once (BLOCK_PATH . '/BlkHeadlines/default.php');
                }
	}
}
?>