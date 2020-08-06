/**
 * 
 */


var table = $('#faq-category-list');

$(function () {
    $('#faq-category-list tbody').on('click','.event-del-btn', function(){
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
    
    
    
    $('#faqCategoryInsert').click(function() {
    	document.faqCategoryForm.submit();
    });
   
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
    
});

/* 삭제 모달 */
(function deleteModal() {
	
	let categoryNo;
	
	$('.faq-category-del-btn').click(function() {
		categoryNo = $(this).data('faqno');
		const categoryName = $(this).closest('tr').children().eq(1).text();
		
		$('.modal-title > span').text(`${categoryNo}번  (${categoryName})`);
	});

	$('#faqCategoryDelete').click(function() {
		$.ajax({
			url: 'delete.mdo',
			method: 'POST',
			data: {
				faqCategoryNo: categoryNo
			},
			dataType: 'json'
		}).done(function(data) {
			window.location.reload(true);
		}).fail(function(error) {
			alert('삭제에 실패하였습니다. (ERROR CODE: ', error, ')');
		});
	});
}());


/* update 모달 update 이벤트*/
(function updateModal() {
	$('.faq-category-upd-btn').click(function() {
		$.ajax({
			url: 'edit.mdo',
			method: 'GET',
			data: {faqCategoryNo: $(this).data('faqno')},
			dataType:'json'
		}).done(function(data, result) {
			$('#faqUpdateModalNo').val(data.faqCategoryNo);
			$('#faqCategoryUpdateInput').val(data.faqCategoryName);
			if(data.faqCategoryUseFl == 'Y') {
				$('input:radio[name="useFlag"]').filter('input[value="Y"]').prop('checked',true);
			} else {
				$('input:radio[name="useFlag"]').filter('input[value="N"]').prop('checked',true);
			}
			
			const prevFaqName = $('#faqCategoryUpdateInput').val();
			
			$('#faqCategoryUpdate').click(function() {
				if(prevFaqName != $('#faqCategoryUpdateInput').val() || $('input:radio[name="useFlag"]:checked').val() != data.faqCategoryUseFl) {
					$.ajax({
						url: 'edit.mdo',
						method: 'post',
						data: {
							faqCategoryNo: data.faqCategoryNo,
							faqCategoryName: $('#faqCategoryUpdateInput').val(),
							faqCategoryUseFl: $('input:radio[name="useFlag"]:checked').val()
						},
						success: function(data) {
							window.location.reload(true);
						},
						error: function(error, type, error3) {
							alert('수정에 실패하였습니다 : ', error3)

						}
					});
				} else {
					alert('변동된 사항이 없습니다.');
				}
				
			});
			
		}).fail(function(result, error) {
			console.log('result: ', result);
			console.log('error: ', error);
		});
	})
}()); 
    
