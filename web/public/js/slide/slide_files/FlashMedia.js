function showVideo(VideoId) {
	var sLink = '';	
	var sList = '';
	var iMaxItem = 4;	
	sLink = '/ListFile/Video/tv' + PAGE_SITE + '.xml';
	AjaxRequest.get(
		{
		'url':sLink
		,'onSuccess':function(req){		
			
			//sList = sList.concat('<ul>');			
			var iCount=0;			
			if(VideoId == 0) {				
				for (var i=0;i<req.responseXML.getElementsByTagName('I').length;i++) {					
					if(req.responseXML.getElementsByTagName('I')[i].getElementsByTagName('I').length > 0) {						
						with(req.responseXML.getElementsByTagName('I').item(i)) {
							if(iCount < iMaxItem) {
								if(i==0) {
									showVideoObject(getNodeValue(getElementsByTagName('I')),getNodeValue(getElementsByTagName('T')),getNodeValue(getElementsByTagName('P')),getNodeValue(getElementsByTagName('IP')));
								}
								else {
									sList = sList.concat('<li><i></i><a href="javascript:showVideo(');
									sList = sList.concat(getNodeValue(getElementsByTagName('I')));
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
									showVideoObject(getNodeValue(getElementsByTagName('I')),getNodeValue(getElementsByTagName('T')),getNodeValue(getElementsByTagName('P')),getNodeValue(getElementsByTagName('IP')));
								}
								else {
									sList = sList.concat('<li><i></i><a href="javascript:showVideo(');
									sList = sList.concat(getNodeValue(getElementsByTagName('I')));
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
			gmobj('MediaList').innerHTML = sList;				
		}
		,'onError':function(req){
			gmobj("divVideo").innerHTML=req.statusText;
			}
		}
	)
}

function showVideoObject(VideoId, title, path, imagepath) {
	var rndNum; var sURL; var sIMGURL;
	gmobj('video-title').innerHTML 	= title;
	//sIMGURL = "st.media.vnexpress.net";
	sIMGURL = "180.148.142.143";
	
	if (VideoId >= 41525) {		
		rndNum = Math.floor(Math.random() * 2);
		if (rndNum == 0) {				
			sURL = "media-hn.vnexpress.net";					
		}else {				
			sURL = "media-sg.vnexpress.net";
		}
	} else if (VideoId > 22339 && VideoId < 41525) {
		sURL = "media.ngoisao.net";
	} else {		
		sURL = "media-o.vnexpress.net";				
	}
	
	var so = new SWFObject('/Library/Common/AdsPlayer/player.swf','MediaPlayer','280','240','8');
	so.addParam('allowscriptaccess','always');
	so.addParam('allowfullscreen','true');
	so.addParam('wmode','transparent');
	so.addVariable('width','278');
	so.addVariable('height','238');
	so.addVariable('extjs', 'Poly_ShowAdsVideoSmall');
	so.addVariable('skin', '/Library/Common/AdsPlayer/classic/classic.xml');			
	so.addVariable('file','http://'+ sURL +'/MediaStore/Video/' + path);
	if(imagepath=='' || imagepath=='NULL'){
		so.addVariable('image','/Images/video-vne.jpg');
	}
	else{				
		so.addVariable('image','http://'+ sIMGURL +'/MediaStore/' + imagepath);
	}
		
    so.write('mediaspace');
}