$(function() {
	getFaqCategory();
	sizeCheck('inputTitle', 'size', 30);
	
});

/* FAQ 카테고리 불러오기 */
function getFaqCategory() {
	$.ajax({
		url: 'category/listJson.mdo',
		method: 'GET',
		dataType: 'json',
	}).done(function(data) {
		$.each(data, function(i, e) {
			$option = $('<option></option').text(e.faqCategoryName);
			$('.faq-category--list').append($option);
		});
	}).fail(function(data) {
		alert('목록 불러오기에 실패하였습니다.');
	});
	
};


function sizeCheck(textId, sizeId, size) {
	(`#${textId}`).on('keyup', function() {
		(`#${sizeId} span`).text($(this).val());
	});
}