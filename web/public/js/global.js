// JavaScript Documentfunction OnSubmitForm(url){            var r=confirm("Bạn có chắc muốn thực hiện?");    if (r===true){        document.appForm.action = url;            document.appForm.submit();        return true;            }else{        return false;    }}function OnSubmitFormSearch(url){     var keyword = $('input[name=skw]').val();    document.appForm.action = url+keyword;         document.appForm.submit();        }function removeEnterKeyPress(e){    if(e.keyCode == 13){        return false;    }    return true;}function checkCheckBox(){    var theForm = document.appForm;    if (theForm.elements[i].name=='cid[]')    {        theForm.elements[i].checked = checked;        if(theForm.elements[i].checked = true){            window.alert(this.value);        }    }}function checkedAll() {        if($('input:checkbox[name="check_all"]').is(':checked')){                $( "input:checkbox[name='cid[]']" ).each(function( index ) {                        $(this).prop("checked",true);        });      }else{        $( "input:checkbox[name='cid[]']" ).each(function( index ) {            $(this).prop("checked",false);        });    }}function deleteAnhScan(node_id){    $('#'+node_id).remove();}