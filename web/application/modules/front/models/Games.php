<?phpclass Front_Model_Games extends Zend_Db_Table_Abstract {    /**     * Model Basket     * @author Nguyen Manh Hung     */    protected $_name = TABLE_GAMES;    public function updatePlays($id) {        $db = Zend_Db_Table::getDefaultAdapter();        $row = $this->find($id)->current();        if ($row) {            $row->playcount = $row->playcount + 1;            $row->save();            return 1;        } else {            return 0;        }    }    public function filterGame($filters = array(), $sortFeild = null, $sort = 'ASC', $limit = null) {        $select = $this->select();        //add cac filter vao truy van tim kiem        if (count($filters) > 0) {            foreach ($filters as $feild => $filter) {                $select->where($feild . ' =?', $filter);            }        }        //add sort vao truy van        if (null != $sortFeild) {            $select->order(array($sortFeild . ' ' . $sort));        }        //add limit - offset vao truy van		        if (null != $limit) {            $select->limit($limit, 0);        }        return $this->fetchAll($select);    }    public function fetchTopGames($ids, $sortFeild = null, $limit = null, $page = 0) {        $select = $this->select(Zend_Db_Table::SELECT_WITH_FROM_PART)                ->distinct();        $select->setIntegrityCheck(false)                ->joinInner(TABLE_CAT_GAME, TABLE_CAT_GAME . '.game_id = ' . $this->_name . '.id', array())                ->where(TABLE_CAT_GAME . '.cat_id in(' . $ids . ')')                ->where($this->_name . '.active=?', 1);        //add sort vao truy van        if (null != $sortFeild) {            $select->order(array($sortFeild . ' DESC'));        }        //add limit - offset vao truy van		        if (null != $limit) {            $offset = $page * NUM_PER_PAGE;            if ($offset >= $limit) {                $limit = $offset + NUM_PER_PAGE;            }            $select->limit($limit, $offset);        }        return $this->fetchAll($select);    }    public function fetchTopAllGames($sortFeild = null, $limit = null, $page = 0) {        $select = $this->select(Zend_Db_Table::SELECT_WITH_FROM_PART)                ->distinct();        $select->setIntegrityCheck(false)                ->joinInner(TABLE_CAT_GAME, TABLE_CAT_GAME . '.game_id = ' . $this->_name . '.id', array());        //add sort vao truy van        if (null != $sortFeild) {            $select->order(array($sortFeild));        }        //add limit - offset vao truy van		        if (null != $limit) {            $offset = $page * NUM_PER_PAGE;            if ($offset >= $limit) {                $limit = $offset + NUM_PER_PAGE;            }            $select->limit($limit, $offset);        }        return $this->fetchAll($select);    }    public function fetchRandom($limit = 48) {        $select = $this->select()                ->distinct();        $select->where('active = ?', 1);        $select->order('RAND()');        $select->limit($limit);        return $this->fetchAll($select);    }}