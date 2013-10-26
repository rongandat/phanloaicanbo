<?php
class Zend_View_Helper_ViewCatID extends Zend_Controller_Action_Helper_Abstract{	
	
	/**
	 * @var Zend_View_Interface 
	 */
	public $view;
	
	public function viewCatID($id){
            $cache = Zend_Registry::get('cache'); 
            if(!$cat = $cache->load('cache_cat_info_'.$id)) {
                $catModel = new Admin_Model_Menu();
		$cat = $catModel->fetchRow('id='.$id);
                $cat = $cat->toArray();
                $cache->save($cat, 'cache_cat_info_'.$id);
            }        
            return $cat;	
	}
	
	/**
	 * Sets the view field 
	 * @param $view Zend_View_Interface
	 */
	public function setView(Zend_View_Interface $view)
	{
		$this->view = $view;
	}
}