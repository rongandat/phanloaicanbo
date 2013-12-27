<?php
/*
version:	2.7
date:		2008-10-12

author:		Jim Mayes
email:		jim.mayes@gmail.com
web:		style-vs-substance.com

note:		Example New Version 2.7 Feature - Specify Start of Week (FIXED)

copyright:	Use of this script is goverened by the terms of the 
			GPL v2.0 License
			http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
			
			Author reserves the right to grant licenses for commercial use.
			For Commercial Lisensing information visit 
			http://style-vs-substance.com/calendarclassphp/
*/

//--------------------------------------------------- include calendar.class.php
require_once('../calendar.class.php');

//--------------------------------------------------- initialize calendar object
/*
Supply Full Date
*/
$calendar = new Calendar();

//-------------------------------------------------------- start weeks on Monday
$calendar->week_start = 1;

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>calendar.class.php - Example New Version 2.7 Feature - Specify Start of Week (FIXED)</title>
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
calendar.class.php v2.7
copyright © 2008 Jim Mayes
licensed under: GPL v2.0
This class may not be used for commercial purposes without written consent.
Visit style-vs-substance.com for information and updates
-->