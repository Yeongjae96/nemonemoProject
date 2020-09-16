function getContextPath() {
   return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
}

$(document).ready(function(){
    $("#contactBtn").on("click", function(){ 
    	const userno = $(this)[0].dataset.userno;
    	window.open(
        		getContextPath()+"/talk/user/"+userno+".do", 
        		"_blank", 
        		"width=500,height=617"
        )
    });
});