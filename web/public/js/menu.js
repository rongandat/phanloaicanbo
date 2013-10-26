function initMenu() {
  $('#menu-vertical1 ul').hide();
  $('#menu-vertical1 ul:first').show();
  $('div#menu-vertical1 li a').click(
    function() {
        $(this).next().slideToggle('normal');	
      }
    );
  }
$(document).ready(function() {initMenu();});
