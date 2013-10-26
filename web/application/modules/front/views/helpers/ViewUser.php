<?php
class Zend_View_Helper_ViewUser extends Zend_Controller_Action_Helper_Abstract{	
	
	/**
	 * @var Zend_View_Interface 
	 */
	public $view;
	
	public function viewUser($id){
		$modelUser = new User_Model_Accounts();
		$user = $modelUser->fetchRow('id='.$id);
		$user = $user->toArray();		
		return $user['username'];
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