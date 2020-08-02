/**
 * 
 */


/* 모달 팝업 */
function open_pop(e) {
    $('.smallModal').show();
};
// 모달 팝업 클로즈
function close_pop(flag) {
    $('#myModal').hide();
};

$('#어드민 회원가입 했을 때').find('.modal-body tbody').append('<tr>').append('<td>new row<td>');

var table = $('#admin-list');

$(function () {
    $('#admin-list tbody').on('click','.admin-del-btn', function(){
        var selected = this;
        $('#smallModal').modal("toggle");
        if($('#admin-del-confirm').click(function(){
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
    
    $('.admin-upd-btn').click(function() {
		const adminNo = $(this)[0].dataset.adminno;
		window.location.href="profile.mdo?adminno="+adminNo;
		alert('관리자 업데이트 하러 !!');
	});
    
    /* 어드민 삭제  */
	$('.admin-del-btn').click(function() {
		const adminNo = $(this)[0].dataset.adminno;
		console.log(adminNo);
		
		$form = $('<form></form>').attr({
			action: "delete.mdo",
			method: "POST"
		});
		// attr(속성 부여) -> ('','') -> 단일속성, {} -> 다중속성 
		// input의 name은 파라미터의 키값, value는 값
		$input = $('<input/>').attr({
			type: 'hidden',
			name: 'adminNo',
			value: adminNo,
		});
		
		/* form안에 만든 input값을 넣어줌 */
		$form.append($input);
		$('body').append($form);
		$form[0].submit();
		$form.remove();
	});
    
//
//    $('#CouponInsert').click(function() {
//    	insertCoupon();
//    });
//    
//    
});


/* form data submit */
function insertCoupon() {
	couponForm.submit();
}
