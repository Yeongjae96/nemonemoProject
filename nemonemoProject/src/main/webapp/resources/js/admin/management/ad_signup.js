//로그인 폼 검사
$(function () {
	$('#ad_sign_up').validate({
		rules: {
			'adminPwConfirm': {
				equalTo: '[name="adminPw"]'
			}
		},
		highlight: function (input) {
			console.log(input);
			$(input).parents('.form-line').addClass('error');
		},
		unhighlight: function (input) {
			$(input).parents('.form-line').removeClass('error');
		},
		errorPlacement: function (error, element) {
			$(element).parents('.input-group').append(error);
			$(element).parents('.form-group').append(error);
		}
	});
});


/* 아이디 체크  */


$(function(){
	$('.ad_signup_submit').click(function(e) { // 회원가입 버튼을 누르면
		e.preventDefault();
		alert("회원가입 버튼 눌렀다!");
		var query = {adminId : $("#adminId").val()}; // adminId 값을 query에 저장
		console.log(query);
		$.ajax({
			url : contextPath + "/management/signup/idcheck.mdo",
			type : "post",
			data : query, // 쿼리의 저장 타입은 일반 변수가 아닌 JSON, 저기 url로 보내는 데이터..!
			success : function(data){ // data -> ajax의 결과값이 저장되는 변수
				if(data > 0){
					alert("아이디가 중복되어 사용할 수 없습니다.");
					document.getElementById("adminId").focus();
					
				}else{
					alert("회원가입을 축하합니다.");
					document.getElementById('ad_sign_up').submit();
					
				}
			}
		}); // ajax 끝
	});
});


//버튼 알림창
//$(function(){
//$('#ad_signup_submit').click(function() {
//if(!($('#ad_sign_up').hasClass.error)){
//alert("관리자 등록 완료");
//}
//});
//});