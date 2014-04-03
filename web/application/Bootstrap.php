<?php

class Bootstrap extends Zend_Application_Bootstrap_Bootstrap {

    /**
     * Khai bao cac table
     * @author Nguyen Manh Hung
     */
    protected function _initDefineTable() {
        $config = new Zend_Config_Ini(APPLICATION_PATH . '/configs/table.ini');
        foreach ($config->TABLE_DATABASE as $k => $value) {
            defined($k)
                    || define($k, TABLE_PREFIX . trim($value));
        }
    }

    public function _initLoadHelper() {

        Zend_Controller_Action_HelperBroker::addPath(
                APPLICATION_PATH . '/modules/front/views/helpers');

        Zend_Controller_Action_HelperBroker::addPath(
                APPLICATION_PATH . '/modules/hethong/views/helpers');

        Zend_Controller_Action_HelperBroker::addPath(
                APPLICATION_PATH . '/modules/canhan/views/helpers');

        Zend_Controller_Action_HelperBroker::addPath(
                APPLICATION_PATH . '/modules/tochuccanbo/views/helpers');

        Zend_Controller_Action_HelperBroker::addPath(
                APPLICATION_PATH . '/modules/front/controllers/helpers');

        Zend_Controller_Action_HelperBroker::addPath(
                APPLICATION_PATH . '/modules/danhsach/controllers/helpers');
        
        Zend_Controller_Action_HelperBroker::addPath(
                APPLICATION_PATH . '/helpers', '');
    }

    protected function _initLoadRouter() {
        $config = new Zend_Config_Ini(CONFIG_PATH . '/routers.ini', 'setup-router');
        $objRouter = new Zend_Controller_Router_Rewrite();
        //new Zend_Controller_Router_Route_Regex()
        $router = $objRouter->addConfig($config, 'routers');
        $front = Zend_Controller_Front::getInstance();
        $front->setRouter($router);
    }

}

