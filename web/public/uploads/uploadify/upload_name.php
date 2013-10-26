<?php
// JQuery File Upload Plugin v1.6.2 by RonnieSan - (C)2009 Ronnie Garcia
// Sample by Travis Nickels

if (!empty($_FILES)) {
	$tempFile = $_FILES['Filedata']['tmp_name'];
	$folder = $_GET['folder'];
	$folder = explode('/',$folder);
	$folder = $folder[count($folder)-1];
	$targetPath = $_SERVER['DOCUMENT_ROOT'] .'/public/uploads/gameangrybirds_files/'. $folder . '/';
	$newFileName = mt_rand().'_'.(($_GET['location'] != '')?mt_rand().'_':'').$_FILES['Filedata']['name'];
	$targetFile =  str_replace('//','/',$targetPath) . $newFileName;
	//$targetFile =  '/home/vinh1207/public_html/gameangrybirds.com/public/uploads/nhkmedia_files/'.$_GET['folder'] . $newFileName;
	$urlFile = $folder.'/'.$newFileName;
	//$targetPath = '/home/vinh1207/public_html/nhkmedia.com/nhkmedia/public/uploads/nhkmedia_files/'.$_GET['folder'];
	// Uncomment the following line if you want to make the directory if it doesn't exist
	//mkdir(str_replace('//','/',$targetPath), 0755, true);
	move_uploaded_file($tempFile,$targetFile);
}

if ($newFileName)
	echo $urlFile;
else // Required to trigger onComplete function on Mac OSX
	echo '1';

?>