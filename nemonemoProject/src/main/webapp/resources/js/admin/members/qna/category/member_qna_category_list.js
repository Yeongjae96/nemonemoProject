/**
 * 
 */

var table = $('#qna-category-list');
this.delayTimer = null; 
$(function () {
	
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
        
    
    /* update 모달 update 이벤트*/
(function updateModal() {
    	$('.qna-category-upd-btn').click(function() {
    		alert("a");
    		$.ajax({
    			url: 'edit.mdo',
    			method: 'GET',
    			data: {qnaCategoryNo: $(this).data('qnano')},
    			dataType:'json'
    		}).done(function(data, result) {
    			$('#qnaUpdateNo').val(data.qnaCategoryNo);
    			$('#qnaCateParentUpd').val(data.qnaCategoryParent);
    			$('#qnaCateNameUpd').val(data.qnaCategoryName);
    			$('#qnaCategoryUseFl').val(data.qnaCategoryUseFl)
    			$('#qnaCategoryUpdate').click(function() {
    					$.ajax({
    						url: 'edit.mdo',
    						method: 'post',
    						data: {
    							qnaCategoryNo: data.qnaCategoryNo,
    							qnaCategoryParent : $('#qnaCateParentUpd').val(),
    							qnaCategoryName: $('#qnaCateNameUpd').val(),
    							qnaCategoryUseFl: data.qnaCategoryUseFl
    						},
    						success: function(data) {
    							alert("QNA 카테고리 수정 성공! ");
    							window.location.reload(true);
    						},
    						error: function(error, type, error3) {
    							alert('QNA 수정에 실패하였습니다 : ', error3)

    						}
    					});
    				
    			});
    			
    		}).fail(function(result, error) {
    			console.log('result: ', result);
    			console.log('error: ', error);
    		});
    	})
    }());

/* 삭제 모달 */
(function deleteModal() {
	
	let selectedCateNo;
	
	$('.qna-category-del-btn').click(function() {
		selectedCateNo = $(this).data('qnano');
		
		$('.modal-title > span').text(`${selectedCateNo}번`);
	});

	$('#qnaCategoryDelete').click(function() {
		$.ajax({
			url: 'delete.mdo',
			method: 'POST',
			data: {
				qnaCategoryNo: selectedCateNo
			},
			dataType: 'json'
		}).done(function(data) {
			window.location.reload(true);
		}).fail(function(error) {
			alert('삭제에 실패하였습니다. (ERROR CODE: ', error, ')');
		});
	});
}());
           
   
    	
    /* 카테고리 기능 */
    $('#qnaCategoryInsert').click(function() {
    	document.qnaCategoryForm.submit();
    });
  
   /* 이미지 */
    $('#backToQnaList').click(function() {
    	window.location.href="../list.mdo";
    });
    
    /* 사용 미사용 누르면 바뀌는 클릭 이벤트*/
    $('#result > tr > td > span').click(function() {
    	$.ajax({
    		url: 'flag.mdo',
    		method:'post',
    		data: {
    			qnaCategoryNo: $(this).data('qnano'),
    			qnaCategoryUseFl: $(this).text() == "사용함" ? "N" : "Y"
    		}
    	}).done(function(data) {
    		alert('사용여부를 변경합니다.');
    		window.location.reload(true);
    	}).fail(function(error) {
    		alert('사용 여부 설정에 실패하였습니다.')
    	});
    });
    
});
    