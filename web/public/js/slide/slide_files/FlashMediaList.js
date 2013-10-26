function showVideo1(VideoId,status,sFolder) {	
	var sLink = '';	
	var sList = '';
	var iMaxItem = 4;	
	sLink = '/ListFile/Video/seagames.xml';	
	AjaxRequest.get(
		{
		'url':sLink
		,'onSuccess':function(req){		
			//sList = sList.concat('<ul class="listVideo">');			
			var iCount=0;			
			if(VideoId == 0) {			
				for (var i=0;i<req.responseXML.getElementsByTagName('I').length;i++) {					
					if(req.responseXML.getElementsByTagName('I')[i].getElementsByTagName('I').length > 0) {						
						with(req.responseXML.getElementsByTagName('I').item(i)) {
							if(iCount < iMaxItem) {							
								if(i==0) {
									showVideoObject1(getNodeValue(getElementsByTagName('I')),getNodeValue(getElementsByTagName('T')),getNodeValue(getElementsByTagName('P')),getNodeValue(getElementsByTagName('IP')),status);									
								}								
								else {										
									sList = sList.concat('<li><i></i><a href="javascript:showVideo1(');
									sList = sList.concat(getNodeValue(getElementsByTagName('I')));
									sList = sList.concat(',true,');
									sList = sList.concat(sFolder);
									sList = sList.concat(');">');
									sList = sList.concat(getNodeValue(getElementsByTagName('T')));
									sList = sList.concat('</a></li>');
								}								
								iCount++;
							}
							else {
								break;
							}
						}
					}
				}
			}
			else {
				for (var i=0;i<req.responseXML.getElementsByTagName('I').length;i++) {
					if(req.responseXML.getElementsByTagName('I')[i].getElementsByTagName('I').length > 0) {	
						with(req.responseXML.getElementsByTagName('I').item(i)) {
							if(iCount < iMaxItem) {
								if(parseInt(getNodeValue(getElementsByTagName('I'))) == VideoId) {
									showVideoObject1(getNodeValue(getElementsByTagName('I')),getNodeValue(getElementsByTagName('T')),getNodeValue(getElementsByTagName('P')),getNodeValue(getElementsByTagName('IP')),status);
								}
								else {
									sList = sList.concat('<li><i></i><a href="javascript:showVideo1(');
									sList = sList.concat(getNodeValue(getElementsByTagName('I')));
									sList = sList.concat(',true,');
									sList = sList.concat(sFolder);
									sList = sList.concat(');">');
									sList = sList.concat(getNodeValue(getElementsByTagName('T')));
									sList = sList.concat('</a></li>');
								}
								iCount++;
							}	
							else {
								break;
							}
						}
					}
				}
			}
			//sList = sList.concat('</ul>');		
			
			gmobj('ListMedia').innerHTML = sList;	
		}
		,'onError':function(req){
		//alert(req);
			//gmobj("divVideo123").innerHTML=req.statusText;
			}
		}
	)
}

function showVideoObject1(VideoId, title, path, imagepath,status) {	

	gmobj('v-title').innerHTML 	= title;
	CreateShowVideo(VideoId,status);
}
function CreateShowVideo(VideoId,param) {
if(param == "false"){

	var flashvars = {
		xmlPath: "/Service/FlashVideo/PlayListVideoSeagame.asp?id="+VideoId,
		colorAux: "0x0099ff",
		colorBorder: "0x333333",
		colorMain: "0xffffff",
		local: "embed",
		mAuto: "false",
		repeat: "false"
	};
	}
	else{
	var flashvars = {
		xmlPath: "/Service/FlashVideo/PlayListVideoSeagame.asp?id="+VideoId,
		colorAux: "0x0099ff",
		colorBorder: "0x333333",
		colorMain: "0xffffff",
		local: "embed",
		mAuto: "true",
		repeat: "false"
	};
	}
	var params = {
	  menu: "false",
	  allowfullscreen: "true",
	  allowscriptaccess: "always",
	  wmode: "transparent"
	};
	var attributes = {
	  id: "musicplayer",
	  name: "player"
	};
	if(param=="false")
	{
	//alert(VideoId);
	 VideoId = 'MediaVideo';	
	}
	else{
		jQuery('#poly_video > object').remove();
		jQuery('#poly_video').append('<div class="fl" id="' + VideoId + '">');		
	}
	swfobject.embedSWF("/video/player_embed.swf", VideoId, "280", "210", "9.0.0","expressInstall.swf", flashvars, params, attributes);
}
