<?php
class Block_BlkTags extends Zend_View_Helper_Abstract {

    function blkTags() {        
        require_once (BLOCK_PATH . '/BlkTags/' . TEMPLATE_USED . '/default.php');
    }

}