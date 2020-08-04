/**
 * 
 */


$('#terms-add-btn').click(function() {
	window.location.href="new.mdo";
	
});

$('#serviceUse_in').find('.modal-body tbody').append('<tr>').append('<td>new row<td>');

$('#terms-upd-btn').click(function() {
	alert('수정버튼');
	const termsNo = $(this)[0].dataset.termsNo;
	window.location.href="edit.mdo?termsNo="+termsNo;
});


$('#terms-del-btn').click(function() {
	alert('삭제버튼');
	const termsNo = $(this)[0].dataset.termsNo;
	console.log(termsNo);
	
	// 제이쿼리를 이용해서 동적 dom 생성( document.createElement('form') )
	// attr(속성 부여) -> ('','') -> 단일속성, {} -> 다중속성 
	$form = $('<form></form>').attr({
		action: "delete.mdo",
		method: "POST"
	});
	// attr(속성 부여) -> ('','') -> 단일속성, {} -> 다중속성 
	// input의 name은 파라미터의 키값, value는 값
	$input = $('<input/>').attr({
		type: 'hidden',
		name: 'termsNo',
		value: termsNo,
	});
	
	/* form안에 만든 input값을 넣어주겠다. */
	$form.append($input);
	$('body').append($form);
	$form[0].submit();
	$form.remove();
});


var table = $('#serviceUse-table');

$(function () {
    $('#serviceUse-table tbody').on('click', function(){
        var selected = this;
        $('#smallModal').modal("toggle");
        if($('#del-confirm').click(function(){
            $(selected).closest('tr').remove();
        }));
    });
    
    
    
    
    table.dataTable({
        language: {
            "decimal": "",
            "emptyTable": "표에서 사용할 수있는 데이터가 없습니다.",
            "info": "총 _TOTAL_개",
            "infoEmpty": "0 개 항목 중 0 ~ 0 개 표시",
            "infoFiltered": "(_MAX_ 총 항목에서 필터링 됨)",
            "infoPostFix": "",
            "thousands": ",",
            "lengthMenu": "_MENU_",
            "search": "검색:",
            "zeroRecords": "일치하는 레코드가 없습니다.",
            "paginate": {
                "first": "처음",
                "last": "마지막",
                "next": "다음",
                "previous": "이전"
            },
            "aria": {
                "sortAscending": ": 오름차순으로 정렬",
                "sortDescending": ": 내림차순으로 정렬",
            }
        }

    });
    
    
    
//    $('#termsInsert').click(function() {
//    	alert('에디터 내용이 넘어가야되는데');
//    	oEditors.getById["termsContent"].exec("UPDATE_CONTENTS_FIELD", []);	
//    	termsForm.submit();
//    });
    elPlaceHolder = 'termsContent';
    
    $('#termsInsert').click(function() {
    	oEditors.getById[elPlaceHolder].exec("UPDATE_CONTENTS_FIELD", []);	
    	termsForm.submit();
    });
});



    
