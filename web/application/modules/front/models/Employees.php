<?php

class Front_Model_Employees extends Zend_Db_Table_Abstract {

    /**
     * Model Employees
     * @author Nguyen Manh Hung
     */
    protected $_name = TABLE_EMPLOYEES;
    protected $_id = 'em_id';

    public function fetchData($filters = array(), $sortFeild = null, $limit = null, $page = 1) {
        $select = $this->select();
        //add cac filter vao truy van tim kiem
        if (count($filters) > 0) {
            foreach ($filters as $feild => $keyword) {
                $select->where($feild . ' =?', $keyword);
            }
        }
        $select->where('em_nghi_huu =?', 0);
        //add sort vao truy van
        if (null != $sortFeild) {
            $select->order($sortFeild);
        }
        //add limit - offset vao truy van		
        if (null != $limit) {
            $offset = $page * NUM_PER_PAGE;
            if ($offset <= $limit) {
                $offset = $limit + NUM_PER_PAGE;
            }
            $select->limit($limit, $offset);
        }
        return $this->fetchAll($select);
    }

    public function getUsersByGroupsAndPhong($groups, $room) {
        $select = $this->select(Zend_Db_Table::SELECT_WITH_FROM_PART);
        $select->setIntegrityCheck(false)
                ->joinInner(TABLE_USERS, TABLE_USERS . '.em_id = ' . $this->_name . '.em_id', array('*'))
                ->joinInner(TABLE_GROUPS, TABLE_USERS . '.group_id = ' . TABLE_GROUPS . '.group_id', array('*'));
        $select->where(TABLE_GROUPS . '.group_id in (?)', $groups);
        $select->where($this->_name . '.em_phong_ban =?', $room);
        $select->where($this->_name . '.em_nghi_huu =?', 0);
        $select->where($this->_name . '.em_status =?', 1);
        return $this->fetchAll($select);
    }

    public function getUsersByGroups($groups) {
        $select = $this->select(Zend_Db_Table::SELECT_WITH_FROM_PART);
        $select->setIntegrityCheck(false)
                ->joinInner(TABLE_USERS, TABLE_USERS . '.em_id = ' . $this->_name . '.em_id', array('*'))
                ->joinInner(TABLE_GROUPS, TABLE_USERS . '.group_id = ' . TABLE_GROUPS . '.group_id', array('*'));
        $select->where(TABLE_GROUPS . '.group_id in (?)', $groups);
        $select->where($this->_name . '.em_nghi_huu =?', 0);
        $select->where($this->_name . '.em_status =?', 1);
        return $this->fetchAll($select);
    }

    public function getNangLuong($ngach = 0, $thang = 0, $nam = 0, $phong_ban = array()) {
        $ngay_gioi_han = "$nam-$thang-31 23:59:59";

        $where = '';
        if (sizeof($phong_ban)) {
            $list_phong_ban = implode(',', $phong_ban);
            $where = ' and e.em_phong_ban in (' . $list_phong_ban . ')';
        }

        $select = "select * from (select * from (SELECT eh_em_id, eh_han_dieu_chinh FROM " . TABLE_EMPLOYEESHESO . "
        order by eh_han_dieu_chinh DESC) as tmp
        group by tmp.eh_em_id) as tmp2 inner join " . $this->_name . " e on e.em_id=tmp2.eh_em_id
        inner join " . TABLE_NGACHCONGCHUC . " ncc on e.em_ngach_cong_chuc=ncc.ncc_id
        where tmp2.eh_han_dieu_chinh<='$ngay_gioi_han' and ncc.ncc_id=$ngach $where";
        
        $db = Zend_Db_Table::getDefaultAdapter();
        $stmt = $db->query($select);
        $rows = $stmt->fetchAll();
        return $rows;
    }

    public function getNangPhuCap($thang = 0, $nam = 0, $phong_ban = array()) {
        $ngay_gioi_han = "$nam-$thang-31 23:59:59";
        $where = '';
        if (sizeof($phong_ban)) {
            $list_phong_ban = implode(',', $phong_ban);
            $where = ' and e.em_phong_ban in (' . $list_phong_ban . ')';
        }

        $select = "select * from (select * from (SELECT epc_em_id, eh_pc_tnvk_time, eh_pc_tnvk_phan_tram FROM " . TABLE_EMPLOYEESPHUCAP . "
        order by eh_pc_tnvk_time DESC) as tmp
        group by tmp.epc_em_id) as tmp2 inner join " . $this->_name . " e on e.em_id=tmp2.epc_em_id        
        where tmp2.eh_pc_tnvk_time<='$ngay_gioi_han' and eh_pc_tnvk_phan_tram>0 $where";          
        
        $db = Zend_Db_Table::getDefaultAdapter();
        $stmt = $db->query($select);
        $rows = $stmt->fetchAll();
        return $rows;
    }

    public function getLuanChuyen($thang = 0, $nam = 0, $phong_ban = array()) {
        $ngay_gioi_han = "$nam-$thang-31 23:59:59";
        $select = $this->select();
        if ($phong_ban)
            $select->where('em_phong_ban in (?)', $phong_ban);
        $select->where('em_time_cong_tac <=?', $ngay_gioi_han);
        $select->where('em_nghi_huu =?', 0);
        $select->where('em_status =?', 1);
        return $this->fetchAll($select);
    }

    public function getNghiHuu($phong_ban = array()) {
        $df_value = new Zend_Config_Ini(APPLICATION_PATH . '/configs/default_value.ini');
        $nam_sinh_nghi_huu_nam = date('Y', time()) - $df_value->DF_VALUES->TABLE_TUOI_NGHI_HUU_NAM;
        $nam_sinh_nghi_huu_nu = date('Y', time()) - $df_value->DF_VALUES->TABLE_TUOI_NGHI_HUU_NU;
        $ngay_sinh_nghi_huu_nam = "$nam_sinh_nghi_huu_nam-" . date('m', time()) . "-01 00:00:00";
        $ngay_sinh_nghi_huu_nu = "$nam_sinh_nghi_huu_nu-" . date('m', time()) . "-01 00:00:00";
        $conditions = "(em_ngay_sinh<='$ngay_sinh_nghi_huu_nam' and em_gioi_tinh=1) or (em_ngay_sinh<='$ngay_sinh_nghi_huu_nu' and em_gioi_tinh=0)";
        $select = $this->select();
        if ($phong_ban)
            $select->where('em_phong_ban in (?)', $phong_ban);
        $select->where($conditions);
        $select->where('em_nghi_huu =?', 0);
        $select->where('em_status =?', 1);
        return $this->fetchAll($select);
    }

    public function getChamCong($thang = 0, $nam = 0, $phong_ban = array()) {
        $select = $this->select(Zend_Db_Table::SELECT_WITH_FROM_PART);
        $select->setIntegrityCheck(false)
                ->joinLeft(TABLE_CHAMCONG, TABLE_CHAMCONG . '.c_em_id = ' . $this->_name . '.em_id', array('*'));
        if ($phong_ban)
            $select->where($this->_name . '.em_phong_ban in (?)', $phong_ban);
        $select->where(TABLE_CHAMCONG . '.c_thang =?', $thang);
        $select->where(TABLE_CHAMCONG . '.c_nam =?', $nam);
        $select->where($this->_name . '.em_nghi_huu =?', 0);
        $select->where($this->_name . '.em_status =?', 1);
        return $this->fetchAll($select);
    }

}
