<?php
class Front_Model_Favourite extends Zend_Db_Table_Abstract
{
	/**
	 * Model Favourite
	 * @author Nguyen Manh Hung
	 */
	
	protected $_name = TABLE_FAVOURITE; 
	
	
	/**
         *
         * @param type $member_id
         * @param type $game_id
         * @return type 
         */
	public function createFavourite($user_id, $game_id)
	{	
            try {
                $date = new Zend_Date(); 
                $dateCreated = $date->toString(Zend_Date::TIMESTAMP);
		$row = $this->createRow();
		$row->user_id = $user_id;
		$row->game_id = $game_id;
		$row->last_modified = $dateCreated;
		$row->save();
		return 1;
            } catch (Exception $exc) {
                return 0;
            }
	}
        
        public function uFavourite($user_id){
            $select = $this->select(Zend_Db_Table::SELECT_WITH_FROM_PART);
            $select->setIntegrityCheck(false)
            ->joinInner(TABLE_GAMES, TABLE_GAMES.'.id = '.$this->_name.'.game_id',array('*')); 
            $select->where($this->_name.'.user_id='.$user_id);
            $rows = $this->fetchAll($select);
            $rows = $rows->toArray();
            return $rows;
        }
        
        public function filterFavourite($filters = array(), $sortFeild = null, $sort = 'ASC', $limit = null){
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