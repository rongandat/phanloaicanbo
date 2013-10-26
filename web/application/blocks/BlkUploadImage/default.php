<link rel="stylesheet" href="/public/uploads/uploadify/uploadify.css" type="text/css" />

<script type="text/javascript" src="/public/uploads/js/jquery.uploadify.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	$("#fileUpload").fileUpload({
		'uploader': '/public/uploads/uploadify/uploader.swf',
		'cancelImg': '/public/uploads/uploadify/cancel.png',
		'script': '/public/uploads/uploadify/upload_name.php',
		'folder': 'images',
		'fileDesc': 'Image Files',
		'fileExt': '*.jpg;*.jpeg;*.gif;*.png',
		'multi': false,
		'auto': false,
		'displayData': 'speed',
		onComplete: function (evt, queueID, fileObj, response, data) {
			$('#source_image').val(response);
			$('#message_image').html('Ảnh đã upload thành công. Bạn có thể đóng popup này lại');
		}
	});
});

</script>
<div id="div_uploads">
	<fieldset style="border: 1px solid #CDCDCD; padding: 8px; padding-bottom:0px; margin: 8px 0">
		<div id="fileUpload">You have a problem with your javascript</div>
		<div style="border: 0px; padding: 8px; padding-bottom:0px; margin: 8px 0">
			<a href="javascript:$('#fileUpload').fileUploadStart()">Start Upload</a> |  <a href="javascript:$('#fileUpload').fileUploadClearQueue()">Clear Queue</a>
		</div>
	</fieldset>
</div>