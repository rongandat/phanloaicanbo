<div style="width: 100%; height: 100px; margin-top: 10px;">
	<div id='comment_avatar' style="width: 80px; height: 80px; float: left; background-color: gray;">
	<img src="<?php echo $avatar;?>" width="80px" height="80px"></img>
	</div>
	<div id='comment_content' style="width: 540px; height: 50px; float: left; margin-left: 15px;">
		<div id="comment_content_sub" style="width: 540px; height: 50px; float: right; margin-right: 5px;">
			<textarea id="txt_comment" style="width: 100%; height: 50px; " onkeydown="countLeft(<?php echo MAX_COMMENT_LENGTH;?>);" onkeyup="countLeft(<?php echo MAX_COMMENT_LENGTH;?>);" <?php echo $disable;?>><?php echo $message;?></textarea>
		</div>		
		<div id="post_status" style="width: 540px; height: 20px; float: right; margin-top: 10px;">
			<div id="char_count" style="width: 50%; float: left;"><?php echo MAX_COMMENT_LENGTH;?> characters remaining</div>
			<div id="post_button" style="width: 50%; float: right; text-align: right;"><button id="btnCancel" type="button" onclick="cancelClick(<?php echo MAX_COMMENT_LENGTH;?>);" <?php echo $disable;?>>Cancel</button><button id="btnPost" type="button" onclick="postClick(<?php echo $id.','.MAX_COMMENT_LENGTH;?>);" <?php echo $disable;?>>Post</button></div>
		</div>
	</div>
</div>

