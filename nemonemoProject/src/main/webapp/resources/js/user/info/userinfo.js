

function execPostCode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
			var extraRoadAddr = ''; // 도로명 조합형 주소 변수

			// 법정동명이 있을 경우 추가한다. (법정리는 제외)
			// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
				extraRoadAddr += data.bname;
			}
			// 건물명이 있고, 공동주택일 경우 추가한다.
			if (data.buildingName !== '' && data.apartment === 'Y') {
				extraRoadAddr += (extraRoadAddr !== '' ? ', '
						+ data.buildingName : data.buildingName);
			}
			// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			if (extraRoadAddr !== '') {
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}
			// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
			if (fullRoadAddr !== '') {
				fullRoadAddr += extraRoadAddr;
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			console.log(data.zonecode);
			console.log(fullRoadAddr);

			$("[name=userZipcode]").val(data.zonecode);
			$("[name=userAddress1]").val(fullRoadAddr);

			/* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
			document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
			document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
		}
	}).open();
}

function updateCheck() {
	if (confirm("정말 수정하시겠습니까??") == true) { // 확인
		document.updateUser.submit();
		alert("다시 로그인 해주세요");
	} else { // 취소
		return;
	}
}


function checks(){ 
	var getCheck= RegExp(/^[a-zA-Z0-9]{8,16}$/);
	var getPhone = RegExp(/^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/);

	// 비밀번호 공백 확인
	if($("#userPw").val() == ""){ 
		alert("비밀번호를 입력해주세요"); 
		$("#userPw").focus(); 
		return false; 
		} 
	// 비밀번호 유효성검사
	if(!getCheck.test($("#userPw").val())){ 
		alert("형식에 맞게 입력해주세요"); 
		$("#userPw").val(""); 
		$("#userPw").focus(); 
		return false; 
		} 
	// 이름 공백 검사
	if($("#nameInput").val() == ""){
		alert("이름을 입력해주세요"); 
		$("#nameInput").focus(); 
		return false; 
		} 
	
	// 핸드폰 공백 검사
	if($("#userPhone").val() == ""){
		alert("핸드폰 번호을 입력해주세요"); 
		$("#userPhone").focus(); 
		return false; 
		} 
	// 휴대폰 유효성 검사
	if(!getPhone.test($("#userPhone").val())){ 
		alert("핸드폰 번호 형식에 맞게 입력해주세요");
		$("#userPhone").val(""); 
		$("#userPhone").focus(); 
		return false;
	}
	
	// Zip코드 공백검사
	if($("#userZipcode").val() == ""){
		alert("집코드를 검색해주세요"); 
		$("#userZipcode").focus(); 
		return false; 
		} 
	
	// 주소1 공백 검사
	if($("#userAddress1").val() == ""){
		alert("주소를 검색해주세요"); 
		$("#userAddress1").focus(); 
		return false; 
		} 
	
	// 주소2 공백 검사
	if($("#userAddress2").val() == ""){
		alert("상세주소를을 입력해주세요"); 
		$("#userAddress2").focus(); 
		return false; 
		}
	
	updateCheck();
	
}

