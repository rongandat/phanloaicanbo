<?php
class Block_BlkMenu extends Zend_View_Helper_Abstract{	
	function blkMenu($numCat = 50, $home = false)
	{                 
            $view  = $this->view;
            $arrParam = $view->arrParam;
            $cid = $arrParam['cid'];
            $cache = Zend_Registry::get('cache');       
            if(!$listMenu = $cache->load('cache_cat_home')) {
                $fillter = array();
                if ($home) {
                        $fillter['home'] = 1;
                } 
                $menuModel = new Admin_Model_Menu();
                $listMenu = $menuModel->itemInSelectbox($fillter);
                $cache->save($listMenu, 'cache_cat_home');
            }
            require_once (BLOCK_PATH . '/BlkMenu/default.php');
	}
}