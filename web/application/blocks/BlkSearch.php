<?php
class Block_BlkSearch extends Zend_View_Helper_Abstract{
	function blkSearch(){
		$view  = $this->view;
		$menuModel = new Admin_Model_Menu();
		$listMenu = $menuModel->fetchMenu(array('parent_id'=>0));
		$listMenu = $listMenu->toArray();		
		$optionsMenu = array('0'=>'Tất cả');		
		foreach ($listMenu as $key => $value){
			$optionsMenu[$value['id']] = $value['name'];
			$listSub = $menuModel->fetchMenu(array('parent_id'=>$value['id']));
			$listSub = $listSub->toArray();
			foreach ($listSub as $keySub => $valueSub){
				$optionsMenu[$valueSub['id']] = '=='.$valueSub['name'];
			}
		}
		
		$modelAuthor = new Admin_Model_Author();
		$listAuthor = $modelAuthor->fetchAuthor();
		$listAuthor = $listAuthor->toArray();
		$optionsAuthor = array('0'=>'Tất cả');
		foreach ($listAuthor as $key => $value){
			$optionsAuthor[$value['id']] = $value['name'];
		}
		require_once (BLOCK_PATH . '/BlkSearch/default.php');
	}
}