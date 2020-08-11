$(function() {
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
    	alert("눌렸음");
    	$('#productReportModal').css('display', 'flex');
    });
    
   
    
    

});
