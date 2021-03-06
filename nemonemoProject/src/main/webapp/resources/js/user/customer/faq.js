$(function() {
	
	initPdMenu();
	
	$('.faq-list-btn').click(function() {
		$(this).next().slideToggle(200);
		$(this).find('h1').toggleClass('bold');
		$(this).children('span').toggleClass('faq-rotate-180');
	});
		
	$('.customer-nav-not-selected').eq(2).attr('class', 'customer-nav-selected');
	
	
	const lastUrl = location.href.substr(location.href.lastIndexOf("/") + 1);
	const url = lastUrl.split('.')[0];

	$('.faq-menu-not-selected').each(function(i,e) {
		const $e = $(e);
		if($e.data('categoryno') == url) {
			$e.attr('class', 'faq-menu-selected');
			return;
		}
	});
});

