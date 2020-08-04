/**
 * 
 */
$('#notice_in').find('.modal-body tbody').append('<tr>').append('<td>new row<td>');


var table = $('#notice-table');

$(function () {
    $('#notice-table tbody').on('click','.event-del-btn', function(){
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
    
    $('.notice-upd-btn').click(function() {
    	const noticeNo = $(this)[0].dataset.noticeno;
    	window.location.href="edit.mdo?noticeNo="+noticeNo;
    });
    
    
    
    $('#NoticeInsert').click(function() {
    	insertNotice();
    });
    
    // jquery -> javascript, javascript -> jquery
//    	console.log($(this));
//    	console.log(this);
//    	console.log(this === $(this));
//    	console.log(this === $(this)[0]);
    
    /* 삭제 버튼 기능 */
    /* 삭제 버튼을 누르면 해당 익명 함수를 실행해라 */
    $('.notice-del-btn').click(function() {
    	// 누른 버튼의 dataset(data-*)에 속성값인 noticeno를 noticeNo 변수에 담아라.
    	const noticeNo = $(this)[0].dataset.noticeno;
    	console.log(noticeNo);
    	
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
    		name: 'noticeNo',
    		value: noticeNo,
    	});
    	
    	/* form안에 만든 input값을 넣어주겠다. */
    	$form.append($input);
    	$('body').append($form);
    	$form[0].submit();
    	$form.remove();
    });
    
});

/* form data submit */
function insertNotice() {
	noticeForm.submit();
}
    
