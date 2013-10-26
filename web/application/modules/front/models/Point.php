<?php
class Front_Model_Point extends Zend_Db_Table_Abstract
{
	/**
	 * Model Point
	 * @author Nguyen Manh Hung
	 */
	
	protected $_name = TABLE_POINT;
	
	public function insertRow(array $data){
            try {
                $this->insert($data);
                return 1;
            } catch (Exception $exc) {
                return 0;
            }
        }
        
        public function updateRow(array $data, $id) {
            try {
                $this->update($data, 'id = ' . $id);
                return 1;
            } catch (Exception $exc) {
                return 0;
            }
        }
}