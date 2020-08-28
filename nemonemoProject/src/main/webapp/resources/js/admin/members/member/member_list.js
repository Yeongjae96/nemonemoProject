
const table = $('#mem-list');

/* 해당 회원 상세정보로 이동 */
$(function () {
	$('.mem-upd-btn').click(function() {
		const userNo = $(this).data("userno");
		window.location.href="info.mdo?userNo="+userNo;
	});
   
});


/* 회원 수정 페이지로 */
$(function () {
    table.dataTable({
        responsive: true,
        language: {
            "decimal": "",
            "emptyTable": "표에서 사용할 수있는 데이터가 없습니다.",
            "info": "총 _TOTAL_명",
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
});



