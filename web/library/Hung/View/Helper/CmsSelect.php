<?php
class Hung_View_Helper_CmsSelect extends Zend_View_Helper_Abstract{
	
	public function cmsSelect($name,$value = null, $options, $attribs = array() ){
		$strAttribs = '';
		if(count($attribs)>0){
			foreach ($attribs as $keyAttribs => $valueAttribs){
				$strAttribs .= $keyAttribs . '="' . $valueAttribs . '" ';
			}
		}
				
		$xhtml = '<select multiple="multiple" name="' . $name . '" id="' . $name . '" ' . $strAttribs . ' >';
		
		foreach ($options as $key=> $info){
			$strSelect = '';
			foreach ($value as $v){
				if($info['id'] == $v){
					$strSelect = 'selected="selected"';
				}
			}
			
			if($info['level'] == 1){
				$xhtml .= '<option value="' . $info['id'] . '" ' . $strSelect . '>+' . $info['name'] . '</option>';
			}else{
				$string = '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
				$newString = '';
				for($i=1;$i<$info['level']; $i++){
					$newString .= $string;
				}
				$info['name'] = $newString . '-' . $info['name'];
				$xhtml .= '<option value="' . $info['id'] . '" ' . $strSelect . '>' . $info['name'] . '</option>';
			}
		}
		
		$xhtml .= '</select>';

		return $xhtml;
	}
}