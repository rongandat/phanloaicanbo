<?php

class Login_Model_Logs extends Zend_Db_Table_Abstract {

    /**
     * Model Logs
     * @author Nguyen Manh Hung
     */
    protected $_name = TABLE_USERS_LOG;
    protected $_id = 'log_id';

    public function insertLog($data) {
        $date = new Zend_Date();
        $data['login_date'] = $date->toString(Zend_Date::TIMESTAMP);
        $this->insert($data);
    }

    public function getLastLogin($user_id) {
        $select = $this->select();
        $select->where('user_id =?', $user_id);
        $select->order('log_id DESC');
        $select->limit(1, 1);
        return $this->fetchAll($select)->toArray();
    }

}

