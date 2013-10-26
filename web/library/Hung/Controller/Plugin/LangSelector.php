<?php

/**
 * Description of LangSelector
 *
 * @author jon
 */
class Hung_Controller_Plugin_LangSelector extends Zend_Controller_Plugin_Abstract
{
	public function preDispatch(Zend_Controller_Request_Abstract $request)
	{            
            $locale = new Zend_Locale();
            Zend_Registry::set('Zend_Locale', $locale);

            // default language when requested language is not available
            $defaultlanguage = 'vi';
            // somewhere in your application
            $adapter = new Zend_Translate(
                    array(
                            'adapter' => 'ini', 
                            'content' => APPLICATION_PATH . '/languages', 
                            'scan' => Zend_Translate::LOCALE_DIRECTORY,
                            'locale' => $locale->getLanguage()
                    ));

            //if (! $adapter->isAvailable($locale->getLanguage())) {
                    // not available languages are rerouted to another language
                    $adapter->setLocale($defaultlanguage);
                    Zend_Registry::set('Zend_Translate', $adapter);
            //}
	}
}