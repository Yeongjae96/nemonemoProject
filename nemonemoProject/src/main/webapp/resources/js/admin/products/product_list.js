

const table = $('#prod-list');


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

$('#result > tr > td > span').click(function() {
	$.ajax({
		url: 'flagJson.mdo',
		method:'post',
		data: {
			productNo: $(this).data('prodno'),
			productDispSt: $(this).text() == "게시중" ? "P" : "S"
		}
	}).done(function(data) {
		alert('게시 여부를 변경합니다.');
		window.location.reload(true);
	}).fail(function(error) {
		alert('게시 여부 설정에 실패하였습니다.')
	});
});

/* 카테고리 관리로 이동 */
const addCate = document.getElementById('product_cate');

addCate.addEventListener('click', function(){
	const status = window.localStorage.getItem('DataTables_product-category-list_/products/category/list.mdo');
	if(status) window.localStorage.removeItem('DataTables_product-category-list_/products/category/list.mdo');
	window.location.href = "category/list.mdo";
});



