<?php

class Front_Model_LyLuanChinhTri extends Zend_Db_Table_Abstract {

    /**
     * Model Ly Luan Chinh Tri
     * @author Nguyen Manh Hung
     */
    protected $_name = TABLE_LYLUANCHINHTRI;
    protected $_id = 'llct_id';

    public function fetchData($filters = array(), $sortFeild = null, $limit = null, $page = 1) {
        $select = $this->select();
        //add cac filter vao truy van tim kiem
        if (count($filters) > 0) {
            foreach ($filters as $feild => $keyword) {
                if ($feild === 'keyword') {
                    $select->where('llct_name like?', $keyword . '%')->orWhere('llct_name like?', '%' . $keyword . '%')->orWhere('llct_name like?', '%' . $keyword)->group('llct_id');
                } else {
                    $select->where($feild . ' =?', $keyword);
                }
            }
        }
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

}