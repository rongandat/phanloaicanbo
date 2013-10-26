<?php
class Block_BlkCountUser extends Zend_View_Helper_Abstract{
	function blkCountUser(){
            $cache = Zend_Registry::get('cache');       
            if(!$user_info = $cache->load('cache_count_user')) {
                $modelUser = new User_Model_Accounts();
                $data['count_member'] = $count_member = $modelUser->count_row();
                $data['count_male'] = $count_male = $modelUser->count_row(array('gender'=>1));
                $cache->save($data, 'cache_count_user');
            }  else {
                $count_member = $user_info['count_member'];
                $count_male = $user_info['count_male'];
            } 
            $female = $count_member - $count_male;		
            require_once (BLOCK_PATH . '/BlkCountUser/default.php');
	}
}
?>