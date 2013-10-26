<?php
class Zend_View_Helper_ViewSpecial extends Zend_Controller_Action_Helper_Abstract{	
	
	/**
	 * @var Zend_View_Interface 
	 */
	public $view;
	
	public function viewSpecial($id){
		$modelProduct = new Admin_Model_Special();
		$dateNow = Zend_Date::now();	
		$searchSpecial = $modelProduct->fetchSpecial(array('products_id'=>$id,'start_date'=>$dateNow->toString("MM-dd-yyyy"),'end_date'=>$dateNow->toString("MM-dd-yyyy")));
		$searchSpecial = $searchSpecial->toArray();
		if(count($searchSpecial)){
			return $searchSpecial[0]['price_special'];
		}				
		return '';
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