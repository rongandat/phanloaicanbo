// JavaScript Documentfunction OnSubmitForm(url){            var r=confirm("Bạn có chắc muốn thực hiện?");    if (r===true){        document.appForm.action = url;            document.appForm.submit();        return true;            }else{        return false;    }}function OnSubmitFormSearch(url){     var keyword = $('input[name=skw]').val();    document.appForm.action = url+keyword;         document.appForm.submit();        }function removeEnterKeyPress(e){    if(e.keyCode == 13){        return false;    }    return true;}function checkCheckBox(){    var theForm = document.appForm;    if (theForm.elements[i].name=='cid[]')    {        theForm.elements[i].checked = checked;        if(theForm.elements[i].checked = true){            window.alert(this.value);        }    }}function checkedAll() {        if($('input:checkbox[name="check_all"]').is(':checked')){                $( "input:checkbox[name='cid[]']" ).each(function( index ) {                        $(this).prop("checked",true);        });      }else{        $( "input:checkbox[name='cid[]']" ).each(function( index ) {            $(this).prop("checked",false);        });    }}function deleteAnhScan(node_id){    $('#'+node_id).remove();}function number_format (number, decimals, dec_point, thousands_sep) {    // Strip all characters but numerical ones.    number = (number + '').replace(/[^0-9+\-Ee.]/g, '');    var n = !isFinite(+number) ? 0 : +number,    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,    s = '',    toFixedFix = function (n, prec) {        var k = Math.pow(10, prec);        return '' + Math.round(n * k) / k;    };    // Fix for IE parseFloat(0.55).toFixed(0) = 0;    s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');    if (s[0].length > 3) {        s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);    }    if ((s[1] || '').length < prec) {        s[1] = s[1] || '';        s[1] += new Array(prec - s[1].length + 1).join('0');    }    return s.join(dec);}