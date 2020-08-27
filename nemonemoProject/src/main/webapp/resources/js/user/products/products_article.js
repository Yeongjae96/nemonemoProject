$(function() {
	initPdMenu();
	initCategoryBox();
	initBtn();
    
    

});

function initCategoryBox() {
	$('.detail-menu-cbox__area').mouseenter(showCbox);
	$('.detail-menu-cbox__area').mouseleave(hideCbox);
	
	function showCbox() {
		$(this).find('.detail-menu-cbox__list').show();
	}
	
	function hideCbox() {
		$(this).find('.detail-menu-cbox__list').hide();
	}
}


function initBtn() {
	 $('#bottomCallBtn').click(function() {
	        $('#callModal').css('display', 'flex');
	    });
	    $('#bottomBuyBtn').click(function() {
	        $('#buyModal').css('display', 'flex');
	    });
	    $('#callBtn').click(function() {
	        $('#callModal').css('display', 'flex');
	    });

	    $('#buyBtn').click(function(){
	        $('#buyModal').css('display', 'flex');
	    });

	    $('#zzimBtn').click(function() {
	        $zzimDiv = $('.detail-info__btn-zzim').toggleClass('detail--active');
	    });
	    
	    $('#reportBtn').click(function() {
	    	$('#productReportModal').css('display', 'flex');
	    });
}