// JavaScript Documentfunction OnSubmitForm(url){         var r=confirm("Bạn có chắc muốn thực hiện?");    if (r===true){        document.appForm.action = url;            document.appForm.submit();        return true;            }else{        return false;    }}function checkCheckBox(){    var theForm = document.appForm;    if (theForm.elements[i].name=='cid[]')    {        theForm.elements[i].checked = checked;        if(theForm.elements[i].checked = true){            window.alert(this.value);        }    }}function checkedAll() {        if($('input:checkbox[name="check_all"]').is(':checked')){        console.log('vao roi ne');        $( "input:checkbox[name='cid[]']" ).each(function( index ) {            console.log(this);            $(this).prop("checked",true);        });      }else{        $( "input:checkbox[name='cid[]']" ).each(function( index ) {            $(this).prop("checked",false);        });    }}