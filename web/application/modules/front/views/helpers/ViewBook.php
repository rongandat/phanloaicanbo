<?php
class Zend_View_Helper_ViewBook extends Zend_Controller_Action_Helper_Abstract{	
	
	/**
	 * @var Zend_View_Interface 
	 */
	public $view;
	
	public function viewBook($id){
		$modelProduct = new Front_Model_Products();
		$book = $modelProduct->fetchRow('id='.$id);
		$book = $book->toArray();		
		return $book['name'];
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