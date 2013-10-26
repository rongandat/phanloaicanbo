var activeid;
var delay_hide=500;
var menuobj;
var tempFolder = PAGE_FOLDER;
var folder_fl = false;



function Active(){	
	var i,j,k;
	for (i=0; i<menu_pid.length; i++) {
		if(menu_fid[i]==tempFolder&& menu_pid[i]==0) {
			activeid = i;
			break;
		}
		else if(menu_fid[i]==tempFolder&& menu_pid[i]!=0) {			
			for(j=0; j<menu_pid.length; j++) {
				if(menu_fid[j]==menu_pid[i]) {					
					activeid = j;					
					break;
				}
			}
			break;
		}
	}
}

function writeParentMenu() {	
	var strParent = '';
	var strSep = '<div class="fl" style="width:1px;font-size:1px"><img src="/Images/Menu/sep-pmenu.gif" alt="" /></div>';
	var i;	
	var url = '';
	for(i=0; i< menu_pid.length; i++) {
		//url = (tempFolder >= 9998 && tempFolder != 10000 && tempFolder != 10001) ? 'http://vnexpress.net' + menu_path[i] : menu_path[i];		
		url = menu_path[i];
		if(menu_pid[i] == 0) {
		    if(menu_fid[i]==1) {
					strParent = strParent.concat('<div class="fl"><img src="/Images/Menu/sep-pmenu.gif" alt="" /></div>');
			    strParent = strParent.concat('<div class="pmenu-sep fl">&nbsp;</div>');
		    }
			if(menu_fid[i]==tempFolder) {				
			    strParent = strParent.concat('<div class="fl" onMouseover="activeMenu(').concat(i).concat(');showit(').concat(i).concat(',1);" onMouseout="deactiveMenu(').concat(i).concat(');reWriteMenu();" onClick=goTo("').concat(url).concat('")>');
			    strParent = strParent.concat('<div id="mn').concat(i).concat('_l" class="pmenu-activeleft fl">&nbsp;</div>');
			    strParent = strParent.concat('<div id="mn').concat(i).concat('" class="pmenu-active fl">').concat(menu_name[i]).concat('</div>');
			    strParent = strParent.concat('<div id="mn').concat(i).concat('_r" class="pmenu-activeright fl">&nbsp;</div>');
			    strParent = strParent.concat('</div>');
				strParent = strParent.concat(strSep);
			}			
			else {				
			    strParent = strParent.concat('<div class="fl" onMouseover="activeMenu(').concat(i).concat(');showit(').concat(i).concat(',1);" onMouseout="deactiveMenu(').concat(i).concat(');reWriteMenu();" onClick=goTo("').concat(url).concat('")>');
			    strParent = strParent.concat('<div id="mn').concat(i).concat('_l" class="pmenu-normalleft fl">&nbsp;</div>');
			    strParent = strParent.concat('<div id="mn').concat(i).concat('" class="pmenu-normal fl">').concat(menu_name[i]).concat('</div>');
			    strParent = strParent.concat('<div id="mn').concat(i).concat('_r" class="pmenu-normalright fl">&nbsp;</div>');
			    strParent = strParent.concat('</div>');
			    strParent = strParent.concat(strSep);			
			}			
			writeSubMenu(menu_fid[i], i);
		}
		else {
			break;						
		}
	}
	strParent = strParent.substr(0, strParent.length - strSep.length);	
	gmobj("parent-menu").innerHTML = strParent;
}

function writeSubMenu(p, k) {
	var strSubMenu = '';
	var strSep = '&nbsp;&nbsp;<img src="/Images/Menu/square.gif" alt=""/>&nbsp;&nbsp;';
	var i;
	var j = 0;
	var url = '';
	if(p==1){
		strSubMenu = strSubMenu.concat('<ul style="width:46%;float:left">');
		strSubMenu = strSubMenu.concat('<li style="float:left;text-align:left;padding:0;"><a class="link-site" href="/ContactUs/?id=webmaster@vnexpress.net" ><img src="/Images/LinkSite/mail.gif" alt="Lien he toa soan" /></a></li>');
		strSubMenu = strSubMenu.concat('<li style="float:left;"><img src="/Images/LinkSite/sep.gif" alt="" /></li>');
		strSubMenu = strSubMenu.concat('<li style="float:left;text-align:left;padding:0; cursor:pointer;"><a class="link-site" onclick="javascript:setAsHomePage(this)" ><img src="/Images/LinkSite/home.gif" alt="Dat lam trang chu" /></a></li>');
		strSubMenu = strSubMenu.concat('<li style="float:left;"><img src="/Images/LinkSite/sep.gif" alt="" /></li>');
		strSubMenu = strSubMenu.concat('<li style="float:left;text-align:left;padding:0;"><img src="/Images/hotline_2.gif" alt="Duong day nong" /><font class="link-site"><b>0123.888.0123(HN) - 0129.233.3555(TP.HCM)</b></font></li>');
		strSubMenu = strSubMenu.concat('</ul>');
		strSubMenu = strSubMenu.concat('<ul style="width:54%;float:right">');		
		strSubMenu = strSubMenu.concat('<li><a class="link-site" href="http://ebank.vnexpress.net/" target="_blank"><img src="/Images/LinkSite/ebank.gif" alt="Ebank" /> Ebank</a></li>');
		strSubMenu = strSubMenu.concat('<li style="padding:0px;"><img src="/Images/LinkSite/sep.gif" alt="" /></li>');
		strSubMenu = strSubMenu.concat('<li><a class="link-site" href="http://vieclam.vnexpress.net/" target="_blank"><img src="/Images/LinkSite/careerlink.gif" alt="vieclam" /> Vi&#7879;c l&#224;m</a></li>');		
		strSubMenu = strSubMenu.concat('<li style="padding:0px;"><img src="/Images/LinkSite/sep.gif" alt="" /></li>');
		strSubMenu = strSubMenu.concat('<li><a class="link-site" href="http://gamethu.vnexpress.net/" target="_blank"><img src="/Images/LinkSite/gt.gif" alt="gamethu.net" /> Game th&#7911;</a></li>');
		strSubMenu = strSubMenu.concat('<li style="padding:0px;"><img src="/Images/LinkSite/sep.gif" alt="" /></li>');				
		strSubMenu = strSubMenu.concat('<li><a class="link-site" href="http://sohoa.vnexpress.net/" target="_blank"><img src="/Images/LinkSite/sh.gif" alt="sohoa.net" /> S&#7889; h&#243;a</a></li>');
		strSubMenu = strSubMenu.concat('<li style="padding:0px;"><img src="/Images/LinkSite/sep.gif" alt="" /></li>');
		strSubMenu = strSubMenu.concat('<li><a class="link-site" href="http://ngoisao.net/" target="_blank"><img src="/Images/LinkSite/ns.gif" alt="ngoisao.net" /> Ng&#244;i sao</a></li>');						
		strSubMenu = strSubMenu.concat('</ul>');
	}
	else if (p == 9998){
		strSubMenu = strSubMenu.concat('<ul style="width:100%;float:right">');		
		strSubMenu = strSubMenu.concat('	<li><a class="link-site" href="http://ebank.vnexpress.net/" target="_blank"><img src="/Images/LinkSite/ebank.gif" alt="Ebank" /> Ebank</a></li>');
		strSubMenu = strSubMenu.concat('	<li style="padding:0px;"><img src="/Images/LinkSite/sep.gif" alt="" /></li>');
		strSubMenu = strSubMenu.concat('	<li><a class="link-site" href="http://vieclam.vnexpress.net/" target="_blank"><img src="/Images/LinkSite/careerlink.gif" alt="vieclam" /> Vi&#7879;c l&#224;m</a></li>');		
		strSubMenu = strSubMenu.concat('	<li style="padding:0px;"><img src="/Images/LinkSite/sep.gif" alt="" /></li>');
		strSubMenu = strSubMenu.concat('	<li><a class="link-site" href="http://gamethu.vnexpress.net/" target="_blank"><img src="/Images/LinkSite/gt.gif" alt="gamethu.net" /> Game th&#7911;</a></li>');
		strSubMenu = strSubMenu.concat('	<li style="padding:0px;"><img src="/Images/LinkSite/sep.gif" alt="" /></li>');				
		strSubMenu = strSubMenu.concat('	<li><a class="link-site" href="http://sohoa.vnexpress.net/" target="_blank"><img src="/Images/LinkSite/sh.gif" alt="sohoa.net" /> S&#7889; h&#243;a</a></li>');
		strSubMenu = strSubMenu.concat('	<li style="padding:0px;"><img src="/Images/LinkSite/sep.gif" alt="" /></li>');
		strSubMenu = strSubMenu.concat('	<li><a class="link-site" href="http://ngoisao.net/" target="_blank"><img src="/Images/LinkSite/ns.gif" alt="ngoisao.net" /> Ng&#244;i sao</a></li>');						
		strSubMenu = strSubMenu.concat('</ul>');
	}
	else{
		for(i=0; i < menu_pid.length; i++) {
			//url = (tempFolder >= 9998 && tempFolder != 10000 && tempFolder != 10001) ? 'http://vnexpress.net' + menu_path[i] : menu_path[i];
			url = menu_path[i];
			if(menu_pid[i]==p&&menu_show[i]==0) {				
				if(j==0) {				
				    strSubMenu = strSubMenu.concat('<img src="/Images/Menu/square.gif" border="0"/>&nbsp;&nbsp;');				
					if(menu_fid[i] < 1000 && menu_fid[i] != 600) {
					    strSubMenu = strSubMenu.concat('<a class="link-submenu" href="').concat(url).concat('">').concat(menu_name[i]).concat('</a>');					
					}
					else {						
					    strSubMenu = strSubMenu.concat('<a class="link-submenu" href="').concat(url).concat('" target="_blank">').concat(menu_name[i]).concat('</a>');					
					}
					strSubMenu = strSubMenu.concat(strSep);
				}
				else {
					if(menu_fid[i] < 1000 && menu_fid[i] != 106 && menu_fid[i] != 148 && menu_fid[i] != 620)
					{
					    strSubMenu = strSubMenu.concat('<a class="link-submenu" href="').concat(url).concat('">').concat(menu_name[i]).concat('</a>');					
						strSubMenu = strSubMenu.concat(strSep);
					}
					else if(menu_fid[i] >= 1000 || menu_fid[i] == 620)
					{					
						strSubMenu = strSubMenu.concat('<a class="link-submenu" href="').concat(url).concat('" target="_blank">').concat(menu_name[i]).concat('</a>');
						strSubMenu = strSubMenu.concat(strSep);
					}				
				}
				j += 1;
			}
		}
		strSubMenu = strSubMenu.substr(0, strSubMenu.length - strSep.length);
	}
	if(strSubMenu=='') {submenu[k]='&nbsp;'}
	else {submenu[k] = strSubMenu;}					
}

function writeCurrentMenu() {
	var strSubMenu = '';
	var i, j;
	for(i=0; i < menu_pid.length; i++) {
		if(menu_fid[i]==tempFolder && menu_pid[i]==0) {				
			activeMenu(i);
			//gmobj('submenu').innerHTML = submenu[i];
			showit(i,0);
			break;
		}
		else if(menu_fid[i]==tempFolder && menu_pid[i]!=0) {			
			var flag = false;
			for(j=0; j<menu_pid.length; j++) {
				if(menu_fid[j]==menu_pid[i]) {						
					activeMenu(j);
					//gmobj('submenu').innerHTML = submenu[j];
					showit(j,0);
					flag = true;
					break;
				}
			}
			if(flag==true) break;			
		}	
		else {
			deactiveMenu(activeid);
			menuobj.innerHTML = '';
		}
	}	
}

function writeFooterMenu() {
	var sHTML = '';
	var strSep = '&nbsp;&nbsp;|&nbsp;&nbsp;';
	var i;	
	for(i=0; i<menu_pid.length; i++) {
		if(menu_pid[i]==0 && menu_fid[i]!=1) {
		    sHTML=sHTML.concat('<a class="link-footermenu" href="').concat(menu_path[i]).concat('">').concat(menu_name[i]).concat('</a>');
		    sHTML=sHTML.concat(strSep);			 
		}
		else {
			continue;
		}
	}	
	sHTML = sHTML.substr(0, sHTML.length - strSep.length);	
	document.write(sHTML);
}

function activeMenu(i) {	
	if(i>=0 && !isNaN(i)) {
		if(i != activeid && activeid != -1) {
			deactiveMenu(activeid);
			activeid = i;
		}		
		gmobj('mn' + i).className = 'pmenu-active fl';
		gmobj('mn' + i + '_l').className = 'pmenu-activeleft fl';
		gmobj('mn' + i + '_r').className = 'pmenu-activeright fl';		
	}		
}

function deactiveMenu(i) {	
	if(i >= 0 && !isNaN(i)) {		
		gmobj('mn' + i).className = 'pmenu-normal fl';
		gmobj('mn' + i + '_l').className = 'pmenu-normalleft fl';
		gmobj('mn' + i + '_r').className = 'pmenu-normalright fl';				
	}	
}

function activeMenuParent() {
	activeMenu(activeid);
}

function showit(which, type){			
	clear_delayhide()
	thecontent=(which==-1)? "" : submenu[which];
	
	switch (parseInt(which)){				
		case 5: menuobj.className = 'smenu-content fl'; thecontent = writeBlank(50).concat(thecontent); break;
		case 6: menuobj.className = 'smenu-content fl'; thecontent = writeBlank(87).concat(thecontent); break;
		case 7: menuobj.className = 'smenu-content fl'; thecontent = writeBlank(83).concat(thecontent); break;
		case 8: menuobj.className = 'smenu-content fl'; thecontent = writeBlank(110).concat(thecontent); break;
		case 9: menuobj.className = 'smenu-content fl'; thecontent = writeBlank(110).concat(thecontent); break;
		case 10: menuobj.className = 'smenu-content fl'; thecontent = writeBlank(190).concat(thecontent); break;		
		//case 11: menuobj.className = 'smenu-content fl'; thecontent = writeBlank(198).concat(thecontent); break;		
		case 11: case 14:
			if(type==1) {menuobj.className = 'smenu-content2 fl txtr';}
			else {menuobj.className = 'smenu-content fl txtr';}
			break;
		default:						
			menuobj.className = 'smenu-content fl';
			break;
	}	
	if (document.getElementById||document.all)
		menuobj.innerHTML=thecontent
	else if (document.layers){
		menuobj.document.write(thecontent)
		menuobj.document.close()
	}		
}

function resetit(){
	delayhide=setTimeout("writeCurrentMenu()",delay_hide);
}

function clear_delayhide(){
	if (window.delayhide)
		clearTimeout(delayhide)
}

function reWriteMenu() {	
	delayhide=setTimeout("writeCurrentMenu()",delay_hide);	
}

function writeTabMenu(i,f) {
	var child = false;
	var j;
	var strTabMenu = '';
	var cname = '';
	var cpath = '';	
	for(j=0; j < menu_pid.length; j++) {
		if(menu_pid[j] == i) {
			child = true;
			break;
		}
	}	
	for(j=0; j < menu_pid.length; j++) {
		if(menu_fid[j] == i) {
			cname = menu_name[j];
			cpath = menu_path[j];
			break;
		}
	}
	if(f==0) {	    
	    if(child) {
		    if(i!=105) {
		        strTabMenu = strTabMenu.concat('<div class="folder-title">');
		        strTabMenu = strTabMenu.concat('    <div class="fl"><img src="/Images/Background/folder-activeleft.gif" alt="" /></div>');
		        strTabMenu = strTabMenu.concat('    <div class="folder-active fl"><a href="').concat(cpath).concat('" class="link-folder">').concat(cname).concat('</a></div>');
		        strTabMenu = strTabMenu.concat('    <div class="fl"><img src="/Images/Background/folder-activeright.gif" alt="" /></div>');
		        strTabMenu = strTabMenu.concat('    <div class="subfolder fl"><a href="#" class="link-subfolder">').concat(writeTabSubMenu(i)).concat('</a></div>');
		        strTabMenu = strTabMenu.concat('    <div class="fr"><img src="/Images/Background/folder-titleright.gif" alt="" /></div>');
		        strTabMenu = strTabMenu.concat('</div>');			        		    
		    }
		    else{
		        strTabMenu = strTabMenu.concat('<div class="folder-title2">');
		        strTabMenu = strTabMenu.concat('    <div class="fl"><img src="/Images/Background/folder-activeleft2.gif" alt="" /></div>');
		        strTabMenu = strTabMenu.concat('    <div class="folder-active2 fl"><a href="').concat(cpath).concat('" class="link-folder">').concat(cname).concat('</a></div>');
		        strTabMenu = strTabMenu.concat('    <div class="fl"><img src="/Images/Background/folder-activeright2.gif" alt="" /></div>');		        
		        strTabMenu = strTabMenu.concat('    <div class="fr"><img src="/Images/Background/folder-topright.gif" alt="" /></div>');
		        strTabMenu = strTabMenu.concat('</div>');
		    }		
	    }
	    else {
		    if(i!=117)
		    {
		        strTabMenu = strTabMenu.concat('<div class="folder-title2">');
		        strTabMenu = strTabMenu.concat('    <div class="fl"><img src="/Images/Background/folder-activeleft2.gif" alt="" /></div>');
		        strTabMenu = strTabMenu.concat('    <div class="folder-active2 fl"><a href="').concat(cpath).concat('" class="link-folder">').concat(cname).concat('</a></div>');
		        strTabMenu = strTabMenu.concat('    <div class="fl"><img src="/Images/Background/folder-activeright2.gif" alt="" /></div>');		        
		        strTabMenu = strTabMenu.concat('    <div class="fr"><img src="/Images/Background/folder-topright.gif" alt="" /></div>');
		        strTabMenu = strTabMenu.concat('</div>');
		    }		    
	    }
	}		
	return strTabMenu;
}

function writeTabSubMenu(i) {
	var j;
	var strTabSubMenu = '';
	var strSep = '&nbsp;|&nbsp;';
	for(j=0; j < menu_pid.length; j++) {
		if(menu_pid[j] == i) {			
			if(menu_fid[j] < 10000 && menu_fid[j] != 106 && menu_fid[j] != 148) {
				if(i==9){						
					if(strTabSubMenu==''){
						strTabSubMenu = strTabSubMenu.concat('<a class="link-subfolder" href="').concat(menu_path[6]).concat('" >').concat(menu_name[6]).concat('</a>');
						strTabSubMenu = strTabSubMenu.concat(strSep);
					}
					strTabSubMenu = strTabSubMenu.concat('<a class="link-subfolder" href="').concat(menu_path[j]).concat('" >').concat(menu_name[j]).concat('</a>');
					strTabSubMenu = strTabSubMenu.concat(strSep);
				}
				else {
					strTabSubMenu = strTabSubMenu.concat('<a class="link-subfolder" href="').concat(menu_path[j]).concat('" >').concat(menu_name[j]).concat('</a>');
					strTabSubMenu = strTabSubMenu.concat(strSep);
				}
			}
			else if(menu_fid[j] >= 10000) {
				strTabSubMenu = strTabSubMenu.concat('<a class="link-subfolder" href="').concat(menu_path[j]).concat('"  target="_blank">').concat(menu_name[j]).concat('</a>');
				strTabSubMenu = strTabSubMenu.concat(strSep);				
			}					
		}
	}
	strTabSubMenu = strTabSubMenu.substr(0, strTabSubMenu.length - strSep.length);
	return strTabSubMenu;
}

function writeListItemTitle(i) {	
	var j;
	var strListItemTitle = '';
	for(j=0; j < menu_pid.length; j++) {
		if(menu_fid[j] == i) {
			strListItemTitle = strListItemTitle.concat('<a class="link-folder" href="').concat(menu_path[j]).concat('" >').concat(menu_name[j]).concat('</a>');									
			break;
		}
	}
	document.write(strListItemTitle);
}

function writeFolderTitle(i) {		
	var j, k, m;
	var strTitle = '';

	strTitle = '<div class="breadcrumb">';
	for(j=0; j<menu_pid.length; j++) {
		if(menu_fid[j]==i && menu_pid[j]==0) {
			strTitle = strTitle.concat('<div class="parentfolder-title fl">');
			strTitle = strTitle.concat('<a href="/">TIN TỨC</a> <label>></label> <a href="').concat(menu_path[j]).concat('">').concat(menu_uname[j]).concat('</a>');	
			strTitle = strTitle.concat('</div>');			
			break;
		}
		else if(menu_fid[j]==i && menu_pid[j]!=0) {			
			for(k=0; k<menu_pid.length; k++) {
				if(menu_fid[k] == menu_pid[j]) {
					if(menu_pid[k]==0) {
						strTitle = strTitle.concat('<div class="parentfolder-title fl">');
						strTitle = strTitle.concat('<a href="/">TIN TỨC</a> <label>></label> <a href="').concat(menu_path[k]).concat('">').concat(menu_uname[k]).concat('</a>');
						strTitle = strTitle.concat('</div>');					
					}
					else {
						for(m=0; m<menu_pid.length; m++) {
							if(menu_fid[m]==menu_pid[k]) {
								strTitle = strTitle.concat('<div class="parentfolder-title fl">');
								strTitle = strTitle.concat('<a href="').concat(menu_path[m]).concat('">').concat(menu_uname[m]).concat('</a>');
								strTitle = strTitle.concat('</div>');
								break;
							}
						}
						strTitle = strTitle.concat('<div class="subfolder-title fl">');
						strTitle = strTitle.concat('>&nbsp;<a href="').concat(menu_path[k]).concat('">').concat(menu_uname[k]).concat('</a>');
						strTitle = strTitle.concat('</div>');
					}
					break;
				}				
			}			
			strTitle = strTitle.concat('<div class="subfolder-title fl">');
			strTitle = strTitle.concat('>&nbsp;<a href="').concat(menu_path[j]).concat('">').concat(menu_uname[j]).concat('</a>');
			strTitle = strTitle.concat('</div>');
			break;
		}
	}
	strTitle = strTitle.concat('</div>');
	document.write(strTitle);	
}

function writeBlank(i) {
	var strHTML = '';
	for(var j=1; j<=i; j++){
		strHTML = strHTML.concat('&nbsp;');
	}
	return strHTML;
}

function goTo(i){
	document.location.href = i;
}

/**********************************************************************************************************/
// Hien thi menu trang Rao vat
var activeidRV;
var menu_nameRV = new Array(
	"Nh&#224; &#273;&#7845;t",
	"B&#225;n",
	"Mua",
	"Cho thu&#234;",
	"C&#7847;n thu&#234;",
	
	"&#212; t&#244; xe m&#225;y",
	"B&#225;n",
	"Mua",
	"Cho thu&#234;",
	"S&#7917;a ch&#7919;a b&#7843;o d&#432;&#7905;ng",

	"Th&#7901;i trang - L&#224;m &#273;&#7865;p",
	"Qu&#7847;n &#225;o Gi&#7847;y d&#233;p",
	"M&#7929; ph&#7849;m - Trang s&#7913;c",
	"Th&#7849;m m&#7929; - Ch&#259;m s&#243;c s&#7855;c &#273;&#7865;p",
	"H&#224;ng thanh l&#253; gi&#7843;m gi&#225;",
	
	"M&#225;y t&#237;nh",
	"Mua",
	"B&#225;n",
	"Ph&#7909; ki&#7879;n",
	"D&#7883;ch v&#7909;",
	
	"&#272;i&#7879;n t&#7917; - &#272;i&#7879;n l&#7841;nh",
	"Mua",
	"B&#225;n", 
	"D&#7883;ch v&#7909;",
	
	"&#272;i&#7879;n tho&#7841;i",
	"B&#225;n",
	"Mua",
	"Mua b&#225;n sim",
	
	"D&#7883;ch v&#7909; t&#7841;i nh&#224;",
	"D&#7883;ch v&#7909; s&#7917;a ch&#7919;a gia d&#7909;ng",
	"D&#7883;ch v&#7909; v&#7879; sinh nh&#224; c&#7917;a",
	"D&#7883;ch v&#7909; kh&#225;c",

	"Tuy&#7875;n d&#7909;ng",
	"Vi&#7879;c t&#236;m ng&#432;&#7901;i",
	"Ng&#432;&#7901;i t&#236;m vi&#7879;c",
	"Tuy&#7875;n sinh",
	
	"Thi&#7871;t b&#7883; v&#259;n ph&#242;ng",
	"B&#225;n",
	"Mua",
	"D&#7883;ch v&#7909; v&#259;n ph&#242;ng"
);

var menu_pidRV = new Array(
	0,	// Nha dat
	-1,
	-1,
	-1,
	-1,
	
	0,	// O to xe may
	-2,
	-2,
	-2,
	-2,
	
	0,	// Thoi trang lam dep
	-3,
	-3,
	-3,
	-3,
	
	0,	// May tinh
	-4,
	-4,
	-4,
	-4,
	
	0,	// Dien tu dien lanh
	-5,
	-5,
	-5,
	
	0,	// Dien thoai di dong
	-6,
	-6,
	-6,
	
	0,	// Dich vu tai nha
	-7,
	-7,
	-7,
	
	0,	// Tuyen sinh tuyen dung
	-8,
	-8,
	-8,
	
	0,	// Thiet bi van phong
	-9,
	-9,
	-9
);

var menu_link = new Array(
	"/User/Rao-vat/Source/List.asp?c=13",		// Nha dat
	"/User/Rao-vat/Source/List.asp?c=13",		// Ban nha
	"/User/Rao-vat/Source/List.asp?c=15",		// Mua nha
	"/User/Rao-vat/Source/List.asp?c=12",		// Cho thue nha
	"/User/Rao-vat/Source/List.asp?c=14",		// Can thue nha
	
	"/User/Rao-vat/Source/List.asp?c=5",		// Oto xe may
	"/User/Rao-vat/Source/List.asp?c=5",		// Ban xe
	"/User/Rao-vat/Source/List.asp?c=6",		// Mua xe
	"/User/Rao-vat/Source/List.asp?c=18",		// Cho thue xe
	"/User/Rao-vat/Source/List.asp?c=22", 	// Sua chua bao duong xe
	
	"/User/Rao-vat/Source/List.asp?c=23",		// Thoi trang, lam dep
	"/User/Rao-vat/Source/List.asp?c=23",		// Quan ao, giay dep
	"/User/Rao-vat/Source/List.asp?c=24",		// My pham - Trang suc
	"/User/Rao-vat/Source/List.asp?c=25",		// Tham my - Cham soc sac dep
	"/User/Rao-vat/Source/List.asp?c=26",		// Hang thanh ly giam gia
	
	"/User/Rao-vat/Source/List.asp?c=28", 	// May tinh
	"/User/Rao-vat/Source/List.asp?c=27",		// Mua
	"/User/Rao-vat/Source/List.asp?c=28",		// Ban
	"/User/Rao-vat/Source/List.asp?c=29",		// Phu kien
	"/User/Rao-vat/Source/List.asp?c=30",		// Dich vu
	
	"/User/Rao-vat/Source/List.asp?c=32",		// Dien tu dien lanh
	"/User/Rao-vat/Source/List.asp?c=31",		// Mua
	"/User/Rao-vat/Source/List.asp?c=32",		// Ban
	"/User/Rao-vat/Source/List.asp?c=33",		// Dich vu
	
	"/User/Rao-vat/Source/List.asp?c=8",		// Dien thoai di dong
	"/User/Rao-vat/Source/List.asp?c=8",		// Ban dien thoai di dong
	"/User/Rao-vat/Source/List.asp?c=9",		// Mua dien thoai di dong	
	"/User/Rao-vat/Source/List.asp?c=34",  	// Mua ban sim
	
	"/User/Rao-vat/Source/List.asp?c=1",		// Dich vu tai nha
	"/User/Rao-vat/Source/List.asp?c=1",		// Dich vu sua chua gia dung
	"/User/Rao-vat/Source/List.asp?c=35",		// Dich vu ve sinh nha cua
	"/User/Rao-vat/Source/List.asp?c=36",		// Dich vu khac
	
	"/User/Rao-vat/Source/List.asp?c=17",		// Tuyen sinh, Tuyen dung
	"/User/Rao-vat/Source/List.asp?c=17",		// Viec tim nguoi
	"/User/Rao-vat/Source/List.asp?c=16",		// Nguoi tim viec
	"/User/Rao-vat/Source/List.asp?c=21",		// Tuyen sinh
	
	"/User/Rao-vat/Source/List.asp?c=3",		// Thiet bi van phong
	"/User/Rao-vat/Source/List.asp?c=3",		// Ban thiet bi van phong
	"/User/Rao-vat/Source/List.asp?c=4",		// Mua thiet bi van phong
	"/User/Rao-vat/Source/List.asp?c=2"			// Dich vu van phong
);

var menu_fidRV = new Array(
	-1,	// Nha dat
	13,
	15,
	12,
	14,
	
	-2,	// O to xe may
	5,
	6,
	18,
	22,
	
	-3,	// Thoi trang lam dep
	23,
	24,
	25,
	26,
	
	-4,	// May tinh
	27,
	28,
	29,
	30,
	
	-5,	// Dien tu dien lanh
	31,
	32,
	33,
	
	-6,	// Dien thoai di dong
	8,
	9,
	34,
	
	-7,	// Dich vu tai nha
	1,
	35,
	36,
	
	-8,	// Tuyen sinh tuyen dung
	17,
	16,
	21,
	
	-9,	// Thiet bi van phong
	4,
	3,
	2
);

var i,j,k, delay_hide=500;
var submenuRV = new Array(menu_pidRV.length);
var tempFolderRV = -1;

for (i=0; i<menu_pidRV.length; i++) {
	if(menu_fidRV[i]==tempFolderRV && menu_pidRV[i]==0) {
		activeidRV = i;
		break;
	}
	else if(menu_fidRV[i]==tempFolderRV && menu_pidRV[i]!=0) {			
		for(j=0; j<menu_fidRV.length; j++) {
			if(menu_fidRV[j]==menu_pidRV[i]) {					
				activeidRV = j;					
				break;
			}
		}
		break;
	}
}

function writeParentMenuRV() {	
	var tmp = 0;
	var strParent = '';
	var i = 0;	
	var url = '';
	
	for (i = 0; i < menu_pidRV.length; i++) {
		url = menu_link[i];
		if (menu_pidRV[i] == 0) {
			if(menu_fidRV[i]==tempFolderRV) {
				if (i == menu_pidRV.length - 1)
					strParent = strParent.concat('<div class="menuParent_act menuLast" onMouseover="ActiveMenuRV(').concat(i).concat(');showitRV(').concat(i).concat(',1);" onMouseout="deActiveMenuRV(').concat(i).concat(');reWriteMenuRV();" id="mnu_mid_rv').concat(i).concat('">');				
				else
					strParent = strParent.concat('<div class="menuParent_act" onMouseover="ActiveMenuRV(').concat(i).concat(');showitRV(').concat(i).concat(',1);" onMouseout="deActiveMenuRV(').concat(i).concat(');reWriteMenuRV();" id="mnu_mid_rv').concat(i).concat('">');				
			}
			else if (i == menu_pidRV.length - 1){
				strParent = strParent.concat('<div class="menuParent_nor menuLast" onMouseover="ActiveMenuRV(').concat(i).concat(');showitRV(').concat(i).concat(',1);" onMouseout="deActiveMenuRV(').concat(i).concat(');reWriteMenuRV();" id="mnu_mid_rv').concat(i).concat('">');								
			}			
			else {
				strParent = strParent.concat('<div class="menuParent_nor" onMouseover="ActiveMenuRV(').concat(i).concat(');showitRV(').concat(i).concat(',1);" onMouseout="deActiveMenuRV(').concat(i).concat(');reWriteMenuRV();" id="mnu_mid_rv').concat(i).concat('">');				
			}
			strParent = strParent.concat('	<a class="aParent" href="').concat(url).concat('">').concat(menu_nameRV[i]).concat('</a>');							
			strParent = strParent.concat('</div>');
			
			writeSubMenuRV(menu_fidRV[i], i);
		}
	}		
	gmobj("parentMenuRV").innerHTML = strParent;								
}

function clear_delayhideRV(){
	if (window.delayhideRV)
		clearTimeout(delayhideRV)
}

function resetitRV(){
	delayhideRV=setTimeout("writeCurrentMenuRV()",delay_hide);
}

function activeMenuParentRV() {
	ActiveMenuRV(activeidRV);
}

function ActiveMenuRV(i) {	
	if(i>=0 && !isNaN(i)) {
		if(i != activeidRV && activeidRV != -1) {
			deActiveMenuRV(activeidRV);
			activeidRV = i;
		}					
		gmobj("mnu_mid_rv" + i).className = 'menuParent_act';										
	}		
}

function writeCurrentMenuRV() {
	var strSubMenu = '';
	var i, j;
	for(i=0; i < menu_pidRV.length; i++) {
		if(menu_fidRV[i]==tempFolderRV && menu_pidRV[i]==0) {				
			ActiveMenuRV(i);						
			showitRV(i,0);
			break;
		}
		else if(menu_fidRV[i]==tempFolderRV && menu_pidRV[i]!=0) {			
			var flag = false;
			for(j=0; j<menu_pidRV.length; j++) {
				if(menu_fidRV[j]==menu_pidRV[i]) {						
					ActiveMenuRV(j);								
					showitRV(j,0);
					flag = true;
					break;
				}
			}
			if(flag==true) break;			
		}	
		else {
			deActiveMenuRV(activeidRV);
			gmobj("childMenuRV").innerHTML = '';
		}
	}	
}

function ActiveRV(){				
	var i,j,k;
	for (i=0; i<menu_pidRV.length; i++) {
		if(menu_fidRV[i]==tempFolderRV && menu_pidRV[i]==0) {
			activeidRV = i;						
			break;
		}
		else if(menu_fidRV[i]==tempFolderRV && menu_pidRV[i]!=0) {			
			for(j=0; j<menu_pidRV.length; j++) {
				if(menu_fidRV[j]==menu_pidRV[i]) {					
					activeidRV = j;					
					break;
				}
			}
			break;
		}
	}
}

function writeSubMenuRV(p, k) {
	var strSubMenu = '';
	var strSep = '|';
	var i;
	var j = 0;
	var url = '';
	for(i=0; i < menu_pidRV.length; i++) {
		url = menu_link[i];
		if(menu_pidRV[i]==p) {			
			strSubMenu = strSubMenu.concat('<a class="menuchilRV" href="').concat(url).concat('">').concat(menu_nameRV[i]).concat('</a>');													
			j += 1;
		}
	}
	strSubMenu = strSubMenu.substr(0, strSubMenu.length - strSep.length);
	if(strSubMenu=='') {submenuRV[k]='&nbsp;'}
	else {submenuRV[k] = strSubMenu;}
}

function showitRV(which, type){			
	clear_delayhideRV();				
	thecontent = (which == -1) ? "" : submenuRV[which];				
	var menuobjRV=gmobj("childMenuRV");
	switch (parseInt(which)){
		case 15: thecontent = '<span style="float: left;padding-left:140px; width: 990px;">'.concat(thecontent).concat('</span>'); break;
		case 19: thecontent = '<span style="float: left;padding-left:380px; width: 990px;">'.concat(thecontent).concat('</span>'); break;
		case 23: thecontent = '<span style="float: left;padding-left:450px; width: 990px;">'.concat(thecontent).concat('</span>'); break;
		case 27: thecontent = '<span style="float: left;padding-left:580px; width: 990px;#padding-left:560px;">'.concat(thecontent).concat('</span>'); break;
	}	
	if (document.getElementById||document.all) {
		menuobjRV.innerHTML=thecontent;
	}
	else if (document.layers){
		menuobjRV.document.write(thecontent);
	}	
}

function deActiveMenuRV(i) {	
	if(i >= 0 && !isNaN(i)) {												
		gmobj("mnu_mid_rv" + i).className = 'menuParent_nor';					
	}	
}

function reWriteMenuRV(){	
	delayhideRV=setTimeout("writeCurrentMenuRV()",delay_hide);	
}

function writeParentMenuRVNew(){
	var tmp = 0;
	var strParent = '';
	var i = 0;	
	var url = '';
	
	strParent = strParent.concat('<ul class="menuRV_up">');
	
	for (i = 0; i < menu_pidRV.length; i++) {
		url = menu_link[i];
		if (menu_pidRV[i] == 0) {
			strParent = strParent.concat('<li class="menuParent_nor" id="mnu_mid_rv').concat(i).concat('">');
			strParent = strParent.concat('	<a onfocus="this.blur();" class="aParent" href="').concat(url).concat('">').concat(menu_nameRV[i]).concat('</a>');							
			strParent = strParent.concat(writeSubMenuRVNew(menu_fidRV[i], i));
			strParent = strParent.concat('	<div class="upRowGif"></div>');
			strParent = strParent.concat('</li>');
		}
	}		
	strParent = strParent.concat('</ul>');
	strParent = strParent.concat('<iframe allowtransperancy="true" id="iframeshim" src="about:blank" frameBorder="0" scrolling="no" style="left:-1000; top:-1000; position:absolute; display:none;z-index:90; progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0)"></iframe>');
	gmobj("parentMenuRV").innerHTML = strParent;
	
	// Re write
	jQuery('ul.menuRV_up > li:last-child').addClass('menuLast');
	
	// Active current menu
	var pattern =/c=(\d+)/gi;	
	var curlnk = window.location.search.match(pattern) != null ? window.location.search.match(pattern).toString() : '';
	if (curlnk != ''){
		jQuery('li.menuParent_act').removeClass('menuParent_act').addClass('menuParent_nor');
		jQuery('ul.menuRV_up').find('a').each(function(){
			var reflnk = jQuery(this).attr('href').match(pattern) != null ? jQuery(this).attr('href').match(pattern).toString() : '';
			if (reflnk == curlnk)
				if (jQuery(this).attr('class') == 'aParent')
					jQuery(this).parent().addClass('menuParent_act');
				else
					jQuery(this).parent().parent().parent().removeClass('menuParent_nor').addClass('menuParent_act');
		});
	}
}

function writeSubMenuRVNew(p, k){
	 var strSubMenu = '';
	 var i;
	 var j = 0;
	 var url = '';
	 strSubMenu = strSubMenu.concat('<ul class="ulSubMenu">');
	 for(i=0; i < menu_pidRV.length; i++) {
		 url = menu_link[i];
		 if(menu_pidRV[i]==p) {			
			 strSubMenu = strSubMenu.concat('<li><a href="').concat(url).concat('">').concat(menu_nameRV[i]).concat('</a></li>');
			 j += 1;
		 }
	 }
	
	 strSubMenu = strSubMenu.concat('</ul>');
	 if(strSubMenu=='') {submenuRV[k]='&nbsp;'}
	 else {submenuRV[k] = strSubMenu;}
	
	 return strSubMenu;
}

function reactiveMenuRV(){
	// Active current menu
	var pattern =/c=(\d+)/gi;	
	var curlnk = window.location.search.match(pattern) != null ? window.location.search.match(pattern).toString() : '';
	if (curlnk != ''){
		jQuery('li.menuParent_act').removeClass('menuParent_act').addClass('menuParent_nor');
		jQuery('ul.menuRV_up').find('a').each(function(){
			var reflnk = jQuery(this).attr('href').match(pattern) != null ? jQuery(this).attr('href').match(pattern).toString() : '';
			if (reflnk == curlnk)
				if (jQuery(this).attr('class') == 'aParent')
					jQuery(this).parent().addClass('menuParent_act');
				else
					jQuery(this).parent().parent().parent().removeClass('menuParent_nor').addClass('menuParent_act');
		});
	}
}

function WriteFolderTitleSG(vFolder){
	var strhtml = '';
	strhtml ='<div class=\"fl yah\">';
	for(i=0;i<=FolderSeagame.Folder.length;i++)
	{
	
		if(FolderSeagame.Folder[i].menu_folder==vFolder)
		{
			
			strhtml = strhtml.concat('<p class=\"fl\">');
				if(FolderSeagame.Folder[i].menu_folder != 300){
					strhtml =  strhtml.concat('<span><a href="http://seagames.vnexpress.net/">SEA Games 26</a></span><i></i>');
				}
				if(FolderSeagame.Folder[i].menu_pid != FolderSeagame.Folder[i].menu_uname)
				{
					//strhtml = strhtml.concat('<span>'+ FolderSeagame.Folder[i].menu_pid +'</span><i></i>');
					strhtml = strhtml.concat('<a class=\"crr\" title="').concat(FolderSeagame.Folder[i].menu_pid).concat('" href='+FolderSeagame.Folder[i].menu_sub+'>');
					strhtml = strhtml.concat(FolderSeagame.Folder[i].menu_pid);
					strhtml = strhtml.concat('</a><i></i>');
				}
				strhtml = strhtml.concat('<a class=\"crr\" title="').concat(FolderSeagame.Folder[i].menu_uname).concat('" href='+FolderSeagame.Folder[i].menu_path+'>');
				strhtml = strhtml.concat(FolderSeagame.Folder[i].menu_uname);
				strhtml = strhtml.concat('</a>');
			break;
		}	
	}
	strhtml = strhtml.concat('</p>');
	strhtml = strhtml.concat('   <div class=\"fl borb\"></div>');
	strhtml = strhtml.concat('</div>');
	document.write(strhtml);	
}