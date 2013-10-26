<?php

class Block_BlkBottom extends Zend_View_Helper_Abstract {
    function blkBottom() {
        require_once (BLOCK_PATH . '/BlkBottom/' . TEMPLATE_USED . '/default.php');       
    }

}