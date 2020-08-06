$(function() {
	getFaqCategory();
	sizeCheck('inputTitle', 'size', 30);
	
});

/* FAQ 카테고리 불러오기 */
function getFaqCategory() {
	/* AJAX 요청 */
	$.ajax({
		url: 'category/listJson.mdo', // 요청 URL
		method: 'GET', // 요청 방식
		dataType: 'json', // ㅇ
	}).done(function(data) {
		$.each(data, function(i, e) {
			$option = $('<option></option').attr('value', e.faqCategoryNo).text(e.faqCategoryName);
			$('.faq-category--list').append($option);
		});
	}).fail(function(data) {
		alert('목록 불러오기에 실패하였습니다.');
	});
	
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

/* 텍스트 에디터로 인해 만들다 말음 
function newBtnClickSetEvent(btnId) {
	const $btnId = $(`#${btnId}`);
	$btnId.click(function() {
		const param = {
			faqCategoryNo: $('.faq-category--list option:selected').val(),
			faqTitle: $('#inputTitle'),
			faqContent
		};
		$.ajax({
			url: 'new.do',
			method: 'post',
			data: 
		});
	});
}*/

