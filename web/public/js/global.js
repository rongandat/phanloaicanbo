// JavaScript Document

function OnSubmitForm(url)
{    
    
    var r=confirm("Bạn có muốn thực hiện?");
    if (r===true){
        document.appForm.action = url;    
        //document.appForm.submit();
        return true;        
    }else{
        return false;
    }
}

function OnSubmitFormSearch(url)
{ 
    var keyword = $('input[name=skw]').val();
    document.appForm.action = url+keyword;     
    document.appForm.submit();
        
}

function removeEnterKeyPress(e){
    if(e.keyCode == 13){
        return false;
    }
    return true;
}


function checkCheckBox(){
    var theForm = document.appForm;
    if (theForm.elements[i].name=='cid[]')
    {
        theForm.elements[i].checked = checked;
        if(theForm.elements[i].checked = true){
            window.alert(this.value);
        }
    }
}


function checkedAll() {
    
    if($('input:checkbox[name="check_all"]').is(':checked')){        
        $( "input:checkbox[name='cid[]']" ).each(function( index ) {            
            $(this).prop("checked",true);
        });  
    }else{
        $( "input:checkbox[name='cid[]']" ).each(function( index ) {
            $(this).prop("checked",false);
        });
    }
}

function deleteAnhScan(node_id){
    deleteNode(node_id);
}

function deleteNode(node_id){
    $('#'+node_id).remove();
}

function number_format (number, decimals, dec_point, thousands_sep) {
    // Strip all characters but numerical ones.
    number = (number + '').replace(/[^0-9+\-Ee.]/g, '');
    var n = !isFinite(+number) ? 0 : +number,
    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
    s = '',
    toFixedFix = function (n, prec) {
        var k = Math.pow(10, prec);
        return '' + Math.round(n * k) / k;
    };
    // Fix for IE parseFloat(0.55).toFixed(0) = 0;
    s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
    if (s[0].length > 3) {
        s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
    }
    if ((s[1] || '').length < prec) {
        s[1] = s[1] || '';
        s[1] += new Array(prec - s[1].length + 1).join('0');
    }
    return s.join(dec);
}

function addLichSuDaoTao(){
    var random_id = Math.round(+new Date()/1000);
    var new_content = '<tr id="'+random_id+'">'+                               
                                '<td>'+
                                    '<button type="button" class="btn btn-danger" onclick="deleteNode(\''+random_id+'\')">X�a</button>'+
                                '</td>'+
                                '<td>'+
                                    '<input type="text" name="em_lich_su_dao_tao['+random_id+'][ten_truong]" value="" class="input-medium"> '+
                                '</td>'+
                                '<td>'+
                                    '<input type="text" name="em_lich_su_dao_tao['+random_id+'][chuyen_nghanh]" value="" class="input-small">'+
                                '</td>'+
                                '<td>'+
                                    '<input type="text" name="em_lich_su_dao_tao['+random_id+'][ngay_thang]" value="" class="input-small">'+
                                '</td>'+
                                '<td>'+
                                    '<input type="text" name="em_lich_su_dao_tao['+random_id+'][hinh_thuc]" value="" class="input-mini">'+
                                '</td>'+
                                '<td>'+
                                    '<input type="text" name="em_lich_su_dao_tao['+random_id+'][van_bang]" value="" class="input-mini">'+
                                '</td>'+
                            '</tr>';
    $('#ct_lich_su_dao_tao').append(new_content);
}


function addQuaTrinhCongtac(){
    var random_id = Math.round(+new Date()/1000);
    var new_content = '<tr id="'+random_id+'">'+                               
                                '<td>'+
                                    '<button type="button" class="btn btn-danger" onclick="deleteNode(\''+random_id+'\')">X�a</button>'+
                                '</td>'+
                                '<td>'+
                                    '<input type="text" name="em_qua_trinh_cong_tac['+random_id+'][ngay_thang]" value="" class="input-medium"> '+
                                '</td>'+
                                '<td>'+
                                    '<input type="text" name="em_qua_trinh_cong_tac['+random_id+'][chi_tiet]" value="" class="input-xlarge">'+
                                '</td>'+
                            '</tr>';
    $('#ct_qua_trinh_cong_tac').append(new_content);
}

function addGiaDinhBanThan(){
    var random_id = Math.round(+new Date()/1000);
    var new_content = '<tr id="'+random_id+'">'+                               
                                '<td>'+
                                    '<button type="button" class="btn btn-danger" onclick="deleteNode(\''+random_id+'\')">X�a</button>'+
                                '</td>'+
                                '<td>'+
                                    '<input type="text" name="em_gia_dinh_ban_than['+random_id+'][moi_quan_he]" value="" class="input-small"> '+
                                '</td>'+
                                '<td>'+
                                    '<input type="text" name="em_gia_dinh_ban_than['+random_id+'][ho_ten]" value="" class="input-medium"> '+
                                '</td>'+
                                '<td>'+
                                    '<input type="text" name="em_gia_dinh_ban_than['+random_id+'][nam_sinh]" value="" class="input-medium"> '+
                                '</td>'+
                                '<td>'+
                                    '<input type="text" name="em_gia_dinh_ban_than['+random_id+'][chi_tiet]" value="" class="input-large"> '+
                                '</td>'+
                            '</tr>';
    $('#ct_gia_dinh_ban_than').append(new_content);
}

function addGiaDinhVo(){
    var random_id = Math.round(+new Date()/1000);
    var new_content = '<tr id="'+random_id+'">'+                               
                                '<td>'+
                                    '<button type="button" class="btn btn-danger" onclick="deleteNode(\''+random_id+'\')">X�a</button>'+
                                '</td>'+
                                '<td>'+
                                    '<input type="text" name="em_gia_dinh_vo['+random_id+'][moi_quan_he]" value="" class="input-small"> '+
                                '</td>'+
                                '<td>'+
                                    '<input type="text" name="em_gia_dinh_vo['+random_id+'][ho_ten]" value="" class="input-medium"> '+
                                '</td>'+
                                '<td>'+
                                    '<input type="text" name="em_gia_dinh_vo['+random_id+'][nam_sinh]" value="" class="input-medium"> '+
                                '</td>'+
                                '<td>'+
                                    '<input type="text" name="em_gia_dinh_vo['+random_id+'][chi_tiet]" value="" class="input-large"> '+
                                '</td>'+
                            '</tr>';
    $('#ct_gia_dinh_vo').append(new_content);
}

function addQuaTrinhLuong(){
    var random_id = Math.round(+new Date()/1000);
    var new_content = '<tr id="'+random_id+'">'+                               
                                '<td>'+
                                    '<button type="button" class="btn btn-danger" onclick="deleteNode(\''+random_id+'\')">X�a</button>'+
                                '</td>'+
                                '<td>'+
                                    '<input type="text" name="em_qua_trinh_luong['+random_id+'][ngay_thang]" value="" class="input-large"> '+
                                '</td>'+
                                '<td>'+
                                    '<input type="text" name="em_qua_trinh_luong['+random_id+'][ma_ngach]" value="" class="input-large"> '+
                                '</td>'+
                                '<td>'+
                                    '<input type="text" name="em_qua_trinh_luong['+random_id+'][he_so]" value="" class="input-medium"> '+
                                '</td>'+
                            '</tr>';
    $('#ct_qua_trinh_luong').append(new_content);
}