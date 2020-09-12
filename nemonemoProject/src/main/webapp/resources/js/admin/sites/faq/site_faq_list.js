/**
 * 
 */
var table = $('#faq-list');

$(function () {
	
	$('#faqInsertBtn').click(function() {window.location.href="new.mdo"});
	$('#faqCategoryBtn').click(function() {
		localStorage.removeItem('DataTables_faq-category-list_/sites/faq/category/list.mdo');
		window.location.href = 'category/list.mdo'
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
    
    $('.faq-upd-btn').click(function() {
    	const faqNo = $(this)[0].dataset.faqno;
    	window.location.href="edit.mdo?faqNo="+faqNo;
    });
    

    /* 삭제 하기 버튼 누를 시 모달 창 띄우기  */
    $('.faq-del-btn').click(function() {
    	const $thisTds = $(this).closest('tr').children('td');
    	console.log($thisTds.eq(0).text());
    	
    	document.getElementById('faq_delete').dataset.faqno=$(this).data('faqno');
    	$('#faqDeleteModal span').text(`${$thisTds.eq(0).text()}번 (${$thisTds.eq(2).text()})`);
    });
    
    
    /* 모달창 삭제 하기 버튼 누를 시 삭제 */
    $('#faqDelete').click(function() {
    	$.ajax({
    		url: 'delete.mdo',
    		method: 'post',
    		data: {faqNo: $('#faq_delete').data('faqno')}
    	}).done(function(data) {
    		if(data == 1) {
    			alert('성공적으로 삭제하였습니다.');
    			window.location.reload(true);
    		}
    		else 
    			alert('삭제에 실패하였습니다.');
    	}).fail(function(err) {
    		alert('삭제에 실패하였습니다.');
    	});
    });
    
    
    
    $('.faq--title').on('hover', function() {
    	$('#faq_article').show();
    }, function() {
    	$('#faq_article').hide();
    });
    
    $('#result > tr > td:nth-child(3) > span').click(function() {
    	window.location.href="edit.mdo?faqNo="+$(this).closest('tr').data('faqno');
    });
    
    
    $('#result > tr > td:nth-child(5) > span').click(function() {
    	$.ajax({
    		url: 'flag.mdo',
    		method:'post',
    		data: {
    			faqNo: $(this).closest('tr').data('faqno'),
    			faqUseFlag: $(this).text() == "사용" ? "N" : "Y"
    		}
    	}).done(function(data) {
    		alert('사용여부를 변경합니다.');
    		window.location.reload(true);
    	}).fail(function(error) {
    		alert('사용 여부 설정에 실패하였습니다.')
    	});
    });
    
});



    
