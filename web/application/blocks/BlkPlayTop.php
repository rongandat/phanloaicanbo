<?php
class Block_BlkPlayTop extends Zend_View_Helper_Abstract{
	function blkPlayTop(){
		$view  = $this->view;
		$arrParam = $view->arrParam;
		$cid = $arrParam['cid'];
		$id = $arrParam['id'];
		
		$serverModel = new Admin_Model_Server();
		$listServer = $serverModel->fetchServer();
		$listServer = $listServer->toArray();
		
		$menuModel = new Admin_Model_Menu();
		$listMenu = $menuModel->fetchMenu(array('parent'=>$cid));
		$listMenu = $listMenu->toArray();	
		if ($cid) {
			$optionsMenu = $cid;
		}else{
			$optionsMenu = 0;
		}
		$flag = true;
		$i=0;
		foreach ($listMenu as $key => $value){	
			$i++;			
			$optionsMenu .= ','.$value['id'];
			$listSub = $menuModel->fetchMenu(array('parent'=>$value['id']));
			$listSub = $listSub->toArray();
			foreach ($listSub as $keySub => $valueSub){	
				$optionsMenu .= ','.$valueSub['id'];
			}			
		}
		$gameModel = new Front_Model_Games();
		$listTopGame = $gameModel->fetchTopGames($optionsMenu,'playcount',12);
		$listTopGame = $listTopGame->toArray();
		$game = $arrParam['game_info'];
		$path = '';
		foreach ($listServer as $value) {
			if($game['sys_game']==$value['id']){
				$path = $value['url_server'];
				break;
			}
		}
		?>
		
			<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="680" height="500">
				<param name="movie" value="<?php echo $path.$game['source_fileurl']; ?>">
				<param name="quality" value="high">
				<param name="menu" value="true">
				<embed width="680" height="500" src="<?php echo $path.$game['source_fileurl']; ?>" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash">
			</object>
							
	<?php 
	}
}?>