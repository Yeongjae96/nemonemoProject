$(function () {
	$('.notice-nav-not-selected').eq(0).attr('class', 'notice-nav-selected');

        $('.notice-list-btn').click(function () {
            $(this).next().slideToggle();
            $(this).children('span').toggleClass('notice-rotate-180');
        });
        
        
});