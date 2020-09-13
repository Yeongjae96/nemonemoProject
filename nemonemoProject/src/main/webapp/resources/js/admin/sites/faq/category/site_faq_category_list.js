/**
 * 
 */
this.delayTimer = null; 
$(function () {
	
	$('#faq-category-list').dataTable({
		stateSave: true,
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
    
    
    /* 카테고리 추가 시 체크하는 기능 */
    $('#faqCategoryContent').keyup(function() {
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
    $('#result').click(function(e) {
    	const target = e.target.closest('span');
    	if(!target) return false;
    	console.log('실행');
    	$.ajax({
    		url: 'flag.mdo',
    		method:'post',
    		data: {
    			faqCategoryNo: $(target).data('faqno'),
    			faqCategoryUseFl: $(target).text() == "사용" ? "N" : "Y"
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
		console.log(this);
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
    



/* 중복성 검사 로직 */
function getCheckResult(e) {
	var deferred = $.Deferred();
	$.ajax({
		url: 'checkName.mdo',
		data: {faqCategoryName: decodeURIComponent($('#faqCategoryContent').val())},
		method: 'get'
	}).done(function(data) {
		$checkInput = $('#faqCategoryInsert');
		console.log(data, $('#faqCategoryContent').val());
		if(data == true) {
			$('#checkInput').text('이미 사용하고 있는 카테고리 이름입니다.');
			$('#checkInput').show();
			deferred.reject(data);
			$checkInput.prop('disabled', true);
			return false;
		} else {
			$('#checkInput').hide();
			$checkInput.prop('disabled', false);    		
			deferred.resolve(data);
		}
	}).fail(function(error) {
		console.log(error);
		deferred.resolve(error);
		alert('카테고리를 추가하는데 오류가 발생하였습니다.');
	});
	delayTimer = null; 
	return deferred.promise();
}
