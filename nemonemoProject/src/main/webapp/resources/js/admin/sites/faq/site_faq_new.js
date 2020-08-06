$(function() {
	getFaqCategory();
	sizeCheck('inputTitle', 'size', 30);
	$('#backBtn').click(function() {history.go(-1)});
	
});

/* FAQ 카테고리 불러오기 */
function getFaqCategory() {
	var deferred = $.Deferred();
	/* AJAX 요청 */
	$.ajax({
		url: 'category/listJson.mdo', // 요청 URL
		method: 'GET', // 요청 방식
		dataType: 'json', // ㅇ
	}).done(function(data) {
		const $frag = $(document.createDocumentFragment());
		$.each(data, function(i, e) {
			$option = $('<option></option').attr('value', e.faqCategoryNo).text(e.faqCategoryName);
			$frag.append($option);
		});
		$('.faq-category--list').append($frag);
		deferred.resolve(data);
	})
	.fail(function(err) {
		alert('목록 불러오기에 실패하였습니다.');
		deferred.reject(err);
	});
	return deferred.promise();
};

/* 제목 size check */
function sizeCheck(textId, sizeId, size) {
	
	const $textId = $(`#${textId}`);
	const $sizeId = $(`#${sizeId}`);
	
	$textId.on('keyup', function() {
		const length = $textId.val().length;
		if(length > 30) {
			alert('30자를 초과할 수 없습니다.');
			$textId.val($textId.val().substring(0,30));
			return false;
		}
		
		$sizeId.text(length);
	});
}



