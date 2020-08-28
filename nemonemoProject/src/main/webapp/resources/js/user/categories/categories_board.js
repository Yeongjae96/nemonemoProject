$(function() {
	initPdMenu();
	initCategoryBox();
	
});


function initCategoryBox() {
	$('.category-menu-cbox__area').mouseenter(showCbox);
	$('.category-menu-cbox__area').mouseleave(hideCbox);
	
	
	function showCbox() {
		$(this).find('.category-menu-cbox__list').show();
	}
	
	function hideCbox() {
		$(this).find('.category-menu-cbox__list').hide();
	}
	
	
}