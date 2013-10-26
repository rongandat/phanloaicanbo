<?php

class Hung_Controller_Plugin_Auth extends Zend_Controller_Plugin_Abstract {

    /**
     * Check permission user
     * @author Nguyễn Mạnh Hùng
     * @email manhhung86it@gmail.com
     * @version 1.0
     * @param Zend_Controller_Request_Abstract $request
     * @return void
     */
    public function dispatchLoopStartup(Zend_Controller_Request_Abstract $request) {
        $module = $request->getParam('module', 'front');
        $auth = Zend_Auth::getInstance();
        $controller = $request->getControllerName();
        $action = $request->getActionName();
        $redirector = new Zend_Controller_Action_Helper_Redirector();
        //check quyen truy cap vao admin
        if ($module != 'login' && !$auth->hasIdentity()) {
            $redirector->gotoUrlAndExit(SITE_URL . '/auth/login');
        }
    }

}

