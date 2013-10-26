<?php

class Front_Model_News extends Zend_Db_Table_Abstract {

    /**
     * Model Games
     * @author Nguyen Manh Hung
     */
    protected $_name = TABLE_NEWS;
    protected $_id = 'id';

    public function listNews() {
        $select = $this->select(Zend_Db_Table::SELECT_WITH_FROM_PART);
        $select->setIntegrityCheck(false)
                ->joinInner(TABLE_MEMBERS, TABLE_MEMBERS . '.id = ' . $this->_name . '.user_id', array('first_name', 'last_name'));
        $select->where($this->_name . '.active=1');
        $select->order($this->_name . '.id DESC');
        $rows = $this->fetchAll($select);
        $rows = $rows->toArray();
        return $rows;
    }

    public function getDetail($title_id) {
        $select = $this->select(Zend_Db_Table::SELECT_WITH_FROM_PART);
        $select->setIntegrityCheck(false)
                ->joinInner(TABLE_MEMBERS, TABLE_MEMBERS . '.id = ' . $this->_name . '.user_id', array('first_name', 'last_name'));
        $select->where($this->_name . '.active=1');
        $select->where($this->_name . '.title_id=?', $title_id);
        $rows = $this->fetchAll($select);
        $rows = $rows->toArray();
        return $rows;
    }

    public function ortherNews($id, $old_news = 1) {
        $select = $this->select(Zend_Db_Table::SELECT_WITH_FROM_PART);
        $select->setIntegrityCheck(false)
                ->joinInner(TABLE_MEMBERS, TABLE_MEMBERS . '.id = ' . $this->_name . '.user_id', array('first_name', 'last_name'));
        $select->where($this->_name . '.active=1');
        if (!$old_news) {
            $select->where($this->_name . '.id>' . $id);
        } else {
            $select->where($this->_name . '.id<' . $id);
        }
        $select->order($this->_name . '.id DESC');

        $select->limit(5);
        $rows = $this->fetchAll($select);
        $rows = $rows->toArray();
        return $rows;
    }

}
