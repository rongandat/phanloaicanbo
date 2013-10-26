var url_domain = 'http://www.friv4games.org/';
function getNewGame(urlGame){
    //$.noConflict();
    jQuery.post(urlGame+'/front/games/new', function(data) {
        jQuery('#display_new_game').attr('class','display_games');
        jQuery('#display_new_game').html(data);
        getTopGame(urlGame);
    });
	
/*jQuery.post(urlGame+'/front/games/top', function(data) {
		jQuery('#display_top_game').attr('class','display_games');
		jQuery('#display_top_game').html(data);
	});
	
	jQuery.post(urlGame+'/front/games/random', function(data) {
		jQuery('#display_random_game').attr('class','display_games');
		jQuery('#display_random_game').html(data);
	});*/
}

function getTopGame(urlGame) {
    jQuery.post(urlGame+'/front/games/top', function(data) {
        jQuery('#display_top_game').attr('class','display_games');
        jQuery('#display_top_game').html(data);
        getRandomgame(urlGame);
    });
}

function getRandomgame(urlGame, numOfRandom) {
    jQuery.post(urlGame+'/front/games/random', {
        num_post: numOfRandom
    }, function(data) {
        jQuery('#display_random_game').attr('class','display_games');
        jQuery('#display_random_game').html(data);
    });
}

function postLike(id_game, like){	
    jQuery.post(url_domain+'front/games/postlike',{
        gameID: id_game, 
        likeValue: like
    }, function(data) {
        if(data!=''){
            alert(data);
            showLike(id_game);
        }
    });
}

function postFavourite(id_game){	
    jQuery.post(url_domain+'front/games/favourite',{
        gameID: id_game
    }, function(data) {
        if(data!=''){
            alert(data);
        }
    });
}

function deleteFavourite(id_game){	
    jQuery.post(url_domain+'front/games/deletefavourite',{
        gameID: id_game
    }, function(data) {
        if(data.type){
            jQuery('li#'+id_game).html('');
            jQuery('li#'+id_game).remove();
        }
        alert(data.message);
    }, "json");
}

function showLike(id_game){
    jQuery.post(url_domain+'front/games/like',{
        gameID: id_game
    }, function(data) {
        jQuery('div#div-show-like-dislike').html(data);
    });
}


function countLeft(max) {
    // if the length of the string in the input field is greater than the max value, trim it 
    var value_comment = jQuery("textarea#txt_comment").val();
    var left_length = max - value_comment.length;
    jQuery('div#char_count').html(left_length+' characters remaining');
    if(left_length>0 && value_comment.length>0){
        jQuery("button#btnPost").removeAttr("disabled");
    }else{
        jQuery("button#btnPost").attr("disabled", "disabled");
    }	
}

function cancelClick(max){
    jQuery("textarea#txt_comment").val('');
    jQuery('div#char_count').html(max+' characters remaining');	
    jQuery("button#btnPost").attr("disabled", "disabled");
}

function postClick(id_game, max){
    var value_comment = jQuery("textarea#txt_comment").val();
    if(value_comment.length>0){
        var left_length = max - value_comment.length;
        if(left_length>=0){
            var content_comment = value_comment;
            jQuery("button#btnCancel").attr("disabled", "disabled");
            jQuery("button#btnPost").attr("disabled", "disabled");
            jQuery.post(url_domain+'front/comments/post',{
                gameID: id_game, 
                comments: content_comment
            }, function(data) {
                if(data!=""){
                    alert(data);
                }else{				
                    cancelClick(max);
                    showPage(1,id_game);
                }
                jQuery("button#btnCancel").removeAttr("disabled");
                jQuery("button#btnPost").removeAttr("disabled");
            });
        }else{
            alert("Opp, Comment is too long!");
        }
    }else{
        alert('Opp, comment can not empty.');
    }		
}

function postClickNews(id_game, max){
    var value_comment = jQuery("textarea#txt_comment").val();
    if(value_comment.length>0){
        var left_length = max - value_comment.length;
        if(left_length>=0){
            var content_comment = value_comment;
            jQuery("button#btnCancel").attr("disabled", "disabled");
            jQuery("button#btnPost").attr("disabled", "disabled");
            jQuery.post(url_domain+'front/comments/postnews',{
                gameID: id_game, 
                comments: content_comment
            }, function(data) {
                if(data!=""){
                    alert(data);
                }else{				
                    cancelClick(max);
                    showPageNews(1,id_game);
                }
                jQuery("button#btnCancel").removeAttr("disabled");
                jQuery("button#btnPost").removeAttr("disabled");
            });
        }else{
            alert("Opp, Comment is too long!");
        }
    }else{
        alert('Opp, comment can not empty.');
    }		
}

function showPage(page, game_id){
    jQuery.post(url_domain+'front/comments/showpage',{
        gameID: game_id, 
        show_page: page
    }, function(data) {
        jQuery('div#showcomment').html(data);
    });
}

function showPageNews(page, game_id){
    jQuery.post(url_domain+'front/comments/showpagenews',{
        gameID: game_id, 
        show_page: page
    }, function(data) {
        jQuery('div#showcomment').html(data);
    });
}

function updatef(f_id){
    jQuery.post(url_domain+'user/index/add-friend',{
        friend_id: f_id
    }, function(data) {
        if(data.status){
            jQuery('div#friend_request_'+f_id).remove();
            var requests = jQuery('#hd_value_requests').val();
            var count_friend = jQuery('#hd_count_friends').val();
            count_friend = parseInt(count_friend)+parseInt(1);
            jQuery('#hd_value_requests').val(requests-1);
            jQuery('b#show_count_request').html(requests-1);        
            jQuery('#count_friends').val(count_friend);
            jQuery('b#show_count_friends').html(count_friend);
            if(data.status==3){
                var content_feed = data.content.replace(/\&lt\;/gi, '<');
                content_feed = content_feed.replace(/\&gt\;/gi, '>');
                jQuery('#feed').prepend(content_feed);
                jQuery('#message').hide('slow')
            }
        }        
    }, 'json');
}

function deletef(f_id){
    jQuery.post(url_domain+'user/index/delete-friend',{
        friend_id: f_id
    }, function(data) {
        jQuery('div#friend_request_'+f_id).remove();
        var requests = jQuery('#hd_value_requests').val();
        jQuery('#hd_value_requests').val(requests-1);
        jQuery('b#show_count_request').html(requests-1);
    });
}