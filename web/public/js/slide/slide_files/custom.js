/**
 * Created by JetBrains WebStorm.
 * User: TUTA
 * Date: 10/6/11
 * Time: 1:48 PM
 * To change this template use File | Settings | File Templates.
 */

function initjs() {
    slideTopNews();
}

function slideTopNews() {
    var $slidenews = jQuery(".topnewsh .tnl ul");
    //var num_row = 3;
    //var crr_page = 0; //trang hien tai
    //var tt_page = Math.ceil(($(".topnewsh .tnl ul li").length)/num_row); //tong so trang
    var crr_news = 0; //tin hien tai
    var tt_news = jQuery(".topnewsh .tnl ul li").length; //tong so tin
    //var $tempelm;
    var ismove = false;
    var itvNews;

    //thiet lap tin duoc hien
    jQuery(".topnewsh .tnl ul li a").css("zIndex", 0);
    jQuery(".topnewsh .tnl ul li:eq(" + crr_news + ") a").css("zIndex", 1);

    //di chuyen tin cuoi cung len tren dau
    if(tt_news > 3) {
        $slidenews.children("li:last-child").clone(true).prependTo($slidenews);
        $slidenews.children("li:last-child").remove();
        //alert(eval($slidenews.children("li").outerHeight(true)));
        $slidenews.css("top", eval($slidenews.css("top").replace("px", "")) - eval($slidenews.children("li").outerHeight(true)));
        crr_news = 1;

        jQuery(".topnewsh .tnr ul li:last-child").clone(true).prependTo(jQuery(".topnewsh .tnr ul"));
        jQuery(".topnewsh .tnr ul li:last-child").remove();
    }
    jQuery(".topnewsh .nextn").bind("click", function() {
        nextNews();
    });

    jQuery(".topnewsh .prevn").bind("click", function() {
        if(!ismove) {
            crr_news--;
            showNews(crr_news);

            ismove = true;
            $slidenews.animate({
                "top": eval($slidenews.css("top").replace("px", "")) + eval($slidenews.children("li").outerHeight(true))
            }, 300, function() {
                $slidenews.children("li:last-child").clone(true).prependTo($slidenews);
                $slidenews.children("li:last-child").remove();
                crr_news = $slidenews.children("li.current").index();
                $slidenews.css("top", eval($slidenews.css("top").replace("px", "")) - eval($slidenews.children("li").outerHeight(true)));

                jQuery(".topnewsh .tnr ul li:last-child").clone(true).prependTo($(".topnewsh .tnr ul"));
                jQuery(".topnewsh .tnr ul li:last-child").remove();

                ismove = false;
            });
        }
        clearInterval(itvNews);
        itvNews = setInterval(nextNews, 10000);
    });

    nextNews = function() {
        if (!ismove) {
            crr_news++;
            showNews(crr_news);

            ismove = true;
            $slidenews.animate({
                "top": eval($slidenews.css("top").replace("px", "")) - eval($slidenews.children("li").outerHeight(true))
            }, 300, function() {
                $slidenews.children("li:eq(0)").clone(true).appendTo($slidenews);
                $slidenews.children("li:eq(0)").remove();
                crr_news = $slidenews.children("li.current").index();
                $slidenews.css("top", eval($slidenews.css("top").replace("px", "")) + eval($slidenews.children("li").outerHeight(true)));

                jQuery(".topnewsh .tnr ul li:eq(0)").clone(true).appendTo($(".topnewsh .tnr ul"));
                jQuery(".topnewsh .tnr ul li:eq(0)").remove();

                ismove = false;
            });
        }
        clearInterval(itvNews);
        itvNews = setInterval(nextNews, 10000);
    };

    itvNews = setInterval(nextNews, 10000);

    /*jQuery(".topnewsh .tnl ul li").bind("mouseenter", function() {
        crr_news = jQuery(this).index();
        showNews(crr_news);
        clearInterval(itvNews);
    });

    jQuery(".topnewsh .tnl ul").bind("mouseleave", function() {
        itvNews = setInterval(nextNews, 10000);
    });*/

    return false;
}

function showNews(index) {
	jQuery(".topnewsh .tnr ul li").hide();
	jQuery(".topnewsh .tnr ul li:eq(" + index + ")").fadeIn(0, function() {
		jQuery(".topnewsh .tnl ul li a").css("zIndex", 0);
		jQuery(".topnewsh .tnl ul li:eq(" + index + ") a").css("zIndex", 1);
		jQuery(".topnewsh .tnl ul li").removeClass("current");
		jQuery(".topnewsh .tnl ul li:eq(" + index + ")").addClass("current");
    });
}