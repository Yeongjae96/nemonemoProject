$(function() {
	rule();
	idcheck();
});

// 유효성검
function checks(){ 
	var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	var getCheck= RegExp(/^[a-zA-Z0-9]{6,16}$/);
	var getName= RegExp(/^[ㄱ-ㅎ|가-힣|a-z|A-Z|\*]+$/);
	var getPhone = RegExp(/^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/);

	// 아이디 공백 검사
	if ($("#adminId").val() == "") {
		alert("이름을 입력해주세요");
		$("#adminId").focus();
		return false;
	}

	// 이메일 공백 확인
	if ($("#adminEmail").val() == "") {
		alert("이메일을 입력해주세요");
		$("#adminEmail").focus();
		return false;
	}
	// 이메일 유효성 검사
	if (!getMail.test($("#adminEmail").val())) {
		alert("이메일형식에 맞게 입력해주세요")
		$("#adminEmail").val("");
		$("#adminEmail").focus();
		return false;
	}

	// 비밀번호 공백 확인
	if ($("#pwd1").val() == "") {
		alert("패스워드 입력바람");
		$("#pwd1").focus();
		return false;
	}
	// 비밀번호 유효성검사
	if (!getCheck.test($("pwd1").val())) {
		alert("형식에 맞게 입력해주세요");
		$("pwd1").val("");
		$("#pwd1").focus();
		return false;
	}
	// 비밀번호 확인란 공백 확인
	if ($("#pwd2").val() == "") {
		alert("패스워드 확인란을 입력해주세요");
		$("#pwd2").focus();
		return false;
	}
	// 비밀번호 서로확인
	if ($("#pwd1").val() != $("#pwd2").val()) {
		alert("비밀번호가 상이합니다");
		$("#pwd1").val("");
		$("#pwd2").val("");
		$("#pwd1").focus();
		return false;
	} 
	return true;
}

// 로그인 폼 검사
function rule(){
	$('#ad_sign_up').validate({
		rules: {
			'adminPwConfirm': {
				equalTo: '[name="adminPw"]'
			}
		},
		highlight: function (input) {
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
}

// 중복체크
function idcheck(){
	$('.ad_signup_submit').click(function(e) { // 회원가입 버튼을 누르면
		e.preventDefault();
		if (checks() === false) return
		$.ajax({
			url : contextPath + "/management/signup/idcheck.mdo",
			type : "post",
			data : {
				adminId : $("#adminId").val()
			}, // 쿼리의 저장 타입은 일반 변수가 아닌 JSON, 저기 url로 보내는 데이터..!
			success : function(data){ // data -> ajax의 결과값이 저장되는 변수
				if(data > 0){
					alert("아이디가 중복되어 사용할 수 없습니다.");
					document.getElementById('adminId').focus();
				}else{
					alert("회원가입을 축하합니다.");
					document.getElementById('ad_sign_up').submit();
					
				}
			}
		}); // ajax 시작
	});
}
