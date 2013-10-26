<div id="block">
	<div id="header-brown">
	   	<div class="icon"></div>
	  	<div class="title">TÌM KIẾM</div>
	 	<div class="clr"></div>
	 </div>
</div>
<div class="center">
	<div class="grad" style="background-color: #ffffff;">
		<form name="frmProducts" action="<?php echo $view->url().'/front/index/search/';?>" method="get">
			<table cellspacing="0" cellpadding="0" border="0" style="padding-bottom: 10px; ">
				<tr>			
					<td style="padding: 5px;"><?php echo $view->formText('name', 'Từ khóa');?></td>
				</tr>
				<tr>		
					<td style="padding: 5px;">Danh mục: <?php echo $view->formSelect('parent_id', 0, null, $optionsMenu);?></td>
				</tr>
				<tr>
					<td style="padding: 5px;">Tác giả: <?php echo $view->formSelect('author_id', 0, null, $optionsAuthor);?></td>
				</tr>
				<tr>			
					<td style="padding: 5px;"><?php echo $view->formSubmit('','Tìm kiếm', array('class'=>'formbutton'))?></td>
				</tr>
			</table>
		</form>
	</div>
</div>