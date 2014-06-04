<?php

/*
  Uploadify
  Copyright (c) 2012 Reactive Apps, Ronnie Garcia
  Released under the MIT License <http://www.opensource.org/licenses/mit-license.php>
 */

// Define a destination
$targetFolder = ''; // Relative to the root

$verifyToken = md5('unique_salt' . $_POST['timestamp']);

if (!empty($_FILES) && $_POST['token'] == $verifyToken) {
    $tempFile = $_FILES['Filedata']['tmp_name'];
    $targetPath = realpath(dirname(__FILE__)) . $targetFolder;
    $fileName = mt_rand() . '_' . $_FILES['Filedata']['name'];
    $targetFile = rtrim($targetPath, '/') . '/' . $fileName;
    // Validate the file type
    $fileTypes = array('jpg', 'jpeg', 'gif', 'png', 'tiff', 'tif'); // File extensions
    $fileParts = pathinfo($_FILES['Filedata']['name']);
    if (in_array($fileParts['extension'], $fileTypes)) {
        move_uploaded_file($tempFile, $targetFile);
        echo json_encode(array('success' => 1, 'file_name' => $fileName, 'true_name' => $_FILES['Filedata']['name'], 'file_parts' => $fileParts['extension']));
    } else {
        echo json_encode(array('success' => 0));
    }
}
?>