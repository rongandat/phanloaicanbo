<?php
/*
version:	2.0
date:		2007-12-22

author:		Jim Mayes
email:		jim.mayes@gmail.com
web:		style-vs-substance.com

note:		Example 4 - Hilighted Dates

copyright:	Use of this script is goverened by the terms of the 
			Creative Commons Attribution-Share Alike 3.0 License
			http://creativecommons.org/licenses/by-sa/3.0/
			
			Author reserves the right to grant licenses for commercial use.
*/

//--------------------------------------------------- include calendar.class.php
require_once('../calendar.class.php');

//--------------------------------------------------- initialize calendar object
/*
Supply Full Date
*/
$calendar = new Calendar('2007-12-22');

//-------------------------------------------------------------- highlight dates
$calendar->highlighted_dates = array(
	'2007-12-03',
	'2007-12-14',
	'2007-12-25'
	);

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>calendar.class.php - Example 4 - Hilighted Dates</title>
<style type="text/css">
<!--
@import url("base_calendar_style.css");
-->
</style>
</head>

<body>
<?php
//-------------------------------------------------------------- output calendar
print($calendar->output_calendar());
?>

<p><a href="index.html">back to examples</a></p>
</body>
</html>
<!--
calendar.class.php v2.0
copyright © 2007 Jim Mayes
licensed under: Creative Commons Attribution-Share Alike 3.0 License (http://creativecommons.org/licenses/by-sa/3.0/)
This class may not be used for commercial purposes without written consent.
Visit style-vs-substance.com for information and updates
-->