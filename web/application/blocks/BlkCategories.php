<?php

class Block_BlkCategories extends Zend_View_Helper_Abstract {

    function blkCategories() {
        $view = $this->view;
        $arrParam = $view->arrParam;
        $cid = $arrParam['cid'];
        $baseUrl = $view->baseUrl();
        $cache = Zend_Registry::get('cache');
        if (!$listMenu = $cache->load('cache_cat_home_' . $cid)) {
            $menuModel = new Admin_Model_Menu();
            $listMenu = $menuModel->fetchMenu(array('active' => 1, 'parent' => $cid), 'order');
            $listMenu = $listMenu->toArray();
            $cache->save($listMenu, 'cache_cat_home_' . $cid);
        }
        //print_r($listMenu);
        require_once (BLOCK_PATH . '/BlkCategories/' . TEMPLATE_USED . '/default.php');
    }

}