

/* 한국어 처리 */
$(function () {
    const table = $('#qna-table').DataTable({
        responsive: true,
        "language": {
            "decimal":        "",
            "emptyTable":     "표에서 사용할 수있는 데이터가 없습니다.",
            "info":           "총 _TOTAL_명  _START_에서 _END_까지 표시",
            "infoEmpty":      "0 개 항목 중 0 ~ 0 개 표시",
            "infoFiltered":   "(_MAX_ 총 항목에서 필터링 됨)",
            "infoPostFix":    "",
            "thousands":      ",",
            "lengthMenu":     "페이지 수 : _MENU_개",
            "search":         "검색: ",
            "zeroRecords":    "일치하는 레코드가 없습니다.",
            "paginate": {
                "first":      "처음",
                "last":       "마지막",
                "next":       "다음",
                "previous":   "이전"
            },
            "aria": {
                "sortAscending":  ": 오름차순으로 정렬",
                "sortDescending": ": 내림차순으로 정렬"
            },
        },
    });

});

/* 카테고리 추가 시 체크하는 기능 */
$('#qnaCategoryContent').keyup(function() {
	$(this).prop('autocomplete', false);
	if($.trim($(this).val()).length == 0) {
		$checkInput.prop('disabled', true); 
		$('#checkInput').text('값을 입력해주십시오');
		$('#checkInput').show();
		return;
	}
	if(delayTimer) window.clearTimeout(delayTimer);
	delayTimer = window.setTimeout(getCheckResult, 200);
});
	
/* 추가 기능 */
$('#faqCategoryInsert').click(function() {
	document.faqCategoryForm.submit();
});

/* 뒤로돌아가기 버튼 */
$('#faqBtn').click(function() {
	window.location.href="../list.mdo";
});

/* 사용 미사용 누르면 바뀌는 클릭 이벤트*/
$('#result > tr > td > span').click(function() {
	$.ajax({
		url: 'flag.mdo',
		method:'post',
		data: {
			faqCategoryNo: $(this).data('faqno'),
			faqCategoryUseFl: $(this).text() == "사용" ? "N" : "Y"
		}
	}).done(function(data) {
		alert('사용여부를 변경합니다.');
		window.location.reload(true);
	}).fail(function(error) {
		alert('사용 여부 설정에 실패하였습니다.')
	});
});



$(function () {
    $('#mem-care-list tbody').on('click', '.to_reply', function(){

        location.href="member_care_reply.html";
    });
});



