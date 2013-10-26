<?php
class Hung_Controller_Plugin_Layout extends Zend_Controller_Plugin_Abstract
{
	public function dispatchLoopStartup(Zend_Controller_Request_Abstract $request)
	{
		$module = $request->getParam('module', 'front');
		if($module=='admin'){
			$layoutPath = APPLICATION_PATH  . '/templates/admin';
       		$option = array ('layout' => 'index', 
                      		'layoutPath' => $layoutPath );
       		Zend_Layout::startMvc ( $option );
		}
	}
}