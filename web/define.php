<?php
// Define path to application directory
defined('APPLICATION_PATH')
    || define('APPLICATION_PATH', realpath(dirname(__FILE__) . '/application'));
	
// Define application environment
defined('APPLICATION_ENV')
    || define('APPLICATION_ENV', (getenv('APPLICATION_ENV') ? getenv('APPLICATION_ENV') : 'production'));

// Define table prefix
defined('TABLE_PREFIX')
    || define('TABLE_PREFIX', '');

// Define site url
defined('SITE_URL')
    || define('SITE_URL', 'http://192.168.5.101/phanloaicanbo/web');

// Define site template
defined('TEMPLATE_USED')
    || define('TEMPLATE_USED', 'plcb');

//Khai bao so rows tren moi trang
defined('NUM_PER_PAGE')
                || define('NUM_PER_PAGE', 20);

//define upload path
defined('UPLOAD_PATH')
    || define('UPLOAD_PATH', realpath(dirname(__FILE__) . '/public/uploads'));

//define upload path
defined('IMPORT_PATH')
    || define('IMPORT_PATH', realpath(dirname(__FILE__) . '/import'));

defined('UPLOADED_URL')
    || define('UPLOADED_URL', SITE_URL.'/public/uploads/');


//------------KHAI BAO DUONG DAN THUC DEN CAC THU MUC --------------
//Duong dan den thu muc /public
define('BLOCK_PATH',APPLICATION_PATH . '/blocks');
define('CONFIG_PATH',APPLICATION_PATH . '/configs');