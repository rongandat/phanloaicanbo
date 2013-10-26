<?php
class Front_Model_Ulikes extends Zend_Db_Table_Abstract
{
	/**
	 * Model Basket
	 * @author Nguyen Manh Hung
	 */
	
	protected $_name = TABLE_LIKE;
	
	public function insertLike($user_id, $game_id, $uvalue) {
		$db = Zend_Db_Table::getDefaultAdapter();
		$row = $this->createRow();
		$date = new Zend_Date(); 
		if(isset($_SERVER['HTTP_X_FORWARDED_FOR']))
        	$ipcilent=$_SERVER['HTTP_X_FORWARDED_FOR'];
    	else $ipcilent=$_SERVER['REMOTE_ADDR'];
    
		$row->user_id = $user_id;
		$row->game_id = $game_id;
		$row->uvalue = $uvalue;
		$row->last_modified = $date->toString(Zend_Date::TIMESTAMP); 
		$row->ip_modified = $ipcilent;
		$row->save();
		$id =$row->id;
		return $id;
	}
	
	public function updateLike($id, $uvalue) {
		$db = Zend_Db_Table::getDefaultAdapter();
		$row = $this->find($id)->current();
		if($row){
			$date = new Zend_Date(); 
			if(isset($_SERVER['HTTP_X_FORWARDED_FOR']))
	        	$ipcilent=$_SERVER['HTTP_X_FORWARDED_FOR'];
	    	else $ipcilent=$_SERVER['REMOTE_ADDR'];
			$row->uvalue = $uvalue;
			$row->last_modified = $date->toString(Zend_Date::TIMESTAMP); 
			$row->ip_modified = $ipcilent;
			$row->save();
			return 1;
		}else{
			return 0;
		}
	}
	
	public function filterLike($filters = array(), $sortFeild = null, $sort = 'ASC', $limit = null){
		$select = $this->select();
		//add cac filter vao truy van tim kiem
		if(count($filters)>0)
		{
			foreach ($filters as $feild => $filter){
				$select->where($feild .' =?', $filter);
			}
		}
		//add sort vao truy van
		if(null != $sortFeild)
		{
			$select->order(array($sortFeild.' '.$sort));
		}
		
		//add limit - offset vao truy van		
		if(null != $limit)
		{			
			$select->limit($limit, 0);
		}
		return $this->fetchAll($select);
	}
}