$(function() {
	
	initPdMenu();
	
    $('#countComBox').click(function() {
        if($('#countList').css('display') == 'none') {
            $('#countList').css('display', 'flex');
        } else {
            $('#countList').css('display', 'none');
        }
        $('#countArrow svg').toggleClass('fa-rotate-180');
    });
    
    $('#statusComBox').click(function() {
        if($('#statusList').css('display') == 'none') {
            $('#statusList').css('display', 'flex');
        } else {
            $('#statusList').css('display', 'none');
        }
        $('#statusArrow svg').toggleClass('fa-rotate-180');
    });
});