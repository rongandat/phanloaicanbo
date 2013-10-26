<link rel="stylesheet" href="/public/uploads/uploadify/uploadify.css" type="text/css" />

<script type="text/javascript" src="/public/uploads/js/jquery.uploadify.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	$("#fileUpload2").fileUpload({
		'uploader': '/public/uploads/uploadify/uploader.swf',
		'cancelImg': '/public/uploads/uploadify/cancel.png',
		'script': '/public/uploads/uploadify/upload_name.php',
		'folder': 'games',
		'fileDesc': 'Flash Files',
		'fileExt': '*.swf',
		'multi': false,
		'auto': false,
		'displayData': 'speed',
		onComplete: function (evt, queueID, fileObj, response, data) {
			$('#source_fileurl').val(response);
			$('#message_game').html('Game đã upload thành công. Bạn có thể đóng popup này lại');
		}
	});
});

</script>
<div id="div_uploads">
	<fieldset style="border: 1px solid #CDCDCD; padding: 8px; padding-bottom:0px; margin: 8px 0">
		<div id="fileUpload2">You have a problem with your javascript</div>
		<div style="border: 0px; padding: 8px; padding-bottom:0px; margin: 8px 0">
			<a href="javascript:$('#fileUpload2').fileUploadStart()">Start Upload</a> |  <a href="javascript:$('#fileUpload2').fileUploadClearQueue()">Clear Queue</a>
		</div>
	</fieldset>
</div>