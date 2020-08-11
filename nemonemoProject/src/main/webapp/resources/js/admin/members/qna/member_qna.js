

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



$(function () {
    $('#qna-table tbody').on('click', '.to_reply', function(){
    	alert("눌렸다!");

        location.href="/nemonemoProject/members/qna/reply.mdo";
    });
});





