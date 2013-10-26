<?php

class Block_BlkPlay extends Zend_View_Helper_Abstract {

    function blkPlay() {
        $view = $this->view;
        $arrParam = $view->arrParam;
        $cid = $arrParam['cid'];
        $id = $arrParam['id'];

        $cache = Zend_Registry::get('cache');
        if (!$listServer = $cache->load('cache_list_server')) {
            $serverModel = new Admin_Model_Server();
            $listServer = $serverModel->fetchServer();
            $listServer = $listServer->toArray();
            $cache->save($listServer, 'cache_list_server');
        }


        $game = $arrParam['game_info'];
        $path_parts = pathinfo($game['source_fileurl']);
        $check_file = 0;
        if (strtolower($path_parts['extension']) == 'swf') {
            $check_file = 1;
        } else if (strtolower($path_parts['extension']) == 'dcr') {
            $check_file = 2;
        } else {
            $check_file = 1;
        }
        $path = '';
        foreach ($listServer as $value) {
            if ($game['sys_game'] == $value['id']) {
                $path = $value['url_server'];
                break;
            }
        }
        $full_path = $path . $game["source_fileurl"];
        $get_info_path = parse_url($full_path);
        $host = $get_info_path['host'];
        $host = strtolower($host);
        $old_server = array('media.y3.com', 'media4.a123.com', 'miniclip.com', 'www.media.y3.com', 'www.media4.a123.com', 'www.miniclip.com', 'playbuz.com', 'www.playbuz.com');
        if (!$view->checkFile && $game['type_game'] == 0 && !in_array($host, $old_server)) {
            $full_path = $game["source_url"];
            $model_game = new Admin_Model_Games();
            $model_game->updateFlag($id, 1);
            if ($full_path == '') {
                $redirector = new Zend_Controller_Action_Helper_Redirector();
                $redirector->gotoUrlAndExit(SITE_URL . '/message.html');
            }
        }
        $game_code = '';
        switch ($game['type_game']) {
            case 1:
                $game_code = '<iframe width="100%" height="100%" src="http://www.youtube.com/embed/' . $game["source_fileurl"] . '?autohide=1&rel=0&showinfo=0" frameborder="0" allowfullscreen></iframe>';
                break;

            case 2:
                $game_code = '<iframe width="100%" height="100%" src="' . $game["source_fileurl"] . '" scrolling="no" frameborder="0" allowfullscreen></iframe>';
                break;

            default:
                switch ($check_file) {
                    case 1:
                        $game_code = '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="100%" height="100%">
													<param name="movie" value="' . $full_path . '">
													<param name="quality" value="high">
													<param name="menu" value="true">
													<param name="allowNetworking" value="internal">
													<embed width="100%" height="100%" src="' . $full_path . '" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" allowscriptaccess="never" allownetworking="internal" type="application/x-shockwave-flash">
												</object>';
                        break;

                    case 2:
                        $game_code = '<object classid="clsid:166B1BCA-3F9C-11CF-8075-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/director/sw.cab#version=7,0,2,0" width="100%" height="100%">
		  
												  <param name="swRemote" value="swSaveEnabled=\'true\' swVolume=\'true\' swRestart=\'true\' swPausePlay=\'true\' swFastForward=\'true\' swContextMenu=\'true\'">
												  <param name="swStretchStyle" value="meet">
												  <param name="bgColor" value="#000000">
												  <param name="src" value="' . $full_path . '">
												  
												  <embed src="' . $full_path . '" width="100%" height="100%" bgcolor="#000000" swremote="swSaveEnabled=\'true\' swVolume=\'true\' swRestart=\'true\' swPausePlay=\'true\' swFastForward=\'true\' swContextMenu=\'true\'" swstretchstyle="meet" type="application/x-director" pluginspage="http://www.macromedia.com/shockwave/download/">
												</object>';
                        break;
                    default:
                        $game_code = '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="100%" height="100%">
													<param name="movie" value="' . $full_path . '">
													<param name="quality" value="high">
													<param name="menu" value="true">
													<param name="allowNetworking" value="internal">
													<embed width="100%" height="100%" src="' . $full_path . '" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" allowscriptaccess="never" allownetworking="internal" type="application/x-shockwave-flash">
												</object>';
                        break;
                }
                break;
        }
        require_once (BLOCK_PATH . '/BlkPlay/' . TEMPLATE_USED . '/default.php');
    }

}
?>