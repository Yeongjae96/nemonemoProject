function getContextPath() {
   return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
}

$(document).ready(function(){
    $("#contactBtn").on("click", function(){ 
    	const userno = $(this)[0].dataset.userno;
    	window.open(
        		contextPath+"talk/user/"+userno+".do", 
        		userno, 
        		"width=500,height=667"
        )
    });
});