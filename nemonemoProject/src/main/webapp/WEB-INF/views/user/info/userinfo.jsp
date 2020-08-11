<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저페이지</title>
<!-- 공통 CSS -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/common/common.css"/>">

<!-- 페이지 CSS  -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/info/userinfo.css"/>">


<!-- 라이브러리 -->
<script
	src="<c:url value="/resources/vendor/jquery/jquery-3.5.1.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/fontawsome/js/all.js"/>"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://www.gstatic.com/firebasejs/6.2.0/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/6.2.0/firebase-auth.js"></script>
<!-- 해당 페이지 JS파일 -->
<script src="<c:url value="/resources/js/user/info/userinfo.js"/>"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
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

				$("[name=zipcodeInput]").val(data.zonecode);
				$("[name=address1Input]").val(fullRoadAddr);

				/* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
				document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
			}
		}).open();
	}
</script>


</head>
<body>
	<div class="signin-all">
		<div id="newa"></div>
		<div class="signin-form">
			<div class="signin-title">수정하기</div>
			<div class="signin-box">
				<div class="info-input-outline">

					<div class="signin-common-margin">
						<div class="input-box">
							<div class="upuser-in">
								<label>이메일</label>
							</div>
							<input type="text" value="" id="userEmai" required>
						</div>
					</div>

					<div class="signin-common-margin">
						<div class="input-box">
							<div class="upuser-in">
								<label>비밀번호</label>
							</div>
							<input type="text" value="" id="userPw">
						</div>
					</div>

					<div class="signin-common-margin">
						<div class="input-box">
							<div class="upuser-in">
								<label>이름</label>
							</div>
							<input type="text" value="" id="userName">
						</div>
					</div>

					<div class="signin-common-margin">
						<div class="input-box">
							<div class="upuser-in">
								<label>휴대번호</label>
							</div>
							<input type="text" value="" id="userPhone">
						</div>
					</div>

					<div class="info-input-outline">
						<div class="signin-common-margin">
							<div class="input-box">
								<input class="form-control" style="width: 40%; display: inline;"
									placeholder="우편번호" name="zipcodeInput" id="zipcodeInput"
									type="text" readonly="readonly">
								<button type="button" class="btn zipcode-btn"
									onclick="execPostCode();">
									<i class="fa fa-search"></i>우편번호
								</button>
							</div>
						</div>

						<div class="signin-common-margin">
							<div class="input-box">
								<input type="text" placeholder="주소를 검색해주세요" name="address1Input"
									id="address1Input" readonly="readonly">
							</div>
						</div>

						<div class="signin-common-margin">
							<div class="input-box">
								<input type="text" placeholder="상세주소를 입력해주세요"
									name="address2Input" id="address2Input">
							</div>
						</div>
					</div>


					<div class="terms-check-outline">
						<div class="all-check-outline">
							<div class="check-margin">
								<div class="terms-check-box">
									<div id="ch-all" class="terms-check"></div>
									<div class="checkbox-info">전체동의하기</div>
								</div>
							</div>
						</div>
						<div class="check-padding">
							<div class="check-margin">
								<div class="terms-check-box">
									<div id="ch-third" class="terms-check"></div>
									<div class="checkbox-info">
										<span class="suggest">(선택)</span>위치기반서비스 동의
									</div>
									<button id="show3" class="show-btn show-bt3">
										<img
											src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAALRJREFUOBFjYBgFgzMEqqtb5Cl1GcwMxoaGdoVfv3+d+s/EGNreXHeQHINrapod/v3/t4qRgdmU+cCBvR9sHJxOMf77vxpEHzm0/yEphlbWNtkz/P+/GuSgtpbai8wgzSBDyDEUZBjIIci+AxtIjqHYDAOZAzeQFENxGYZhIDGG4jMMq4H4DCVkGEgvI4jABZANAKlBjwBs+vAaCNIAS2MgNnJsgvhkA5ChINeSbcCoRpJCAADCUaKHyL/YQQAAAABJRU5ErkJggg=="
											width="20" height="20" alt="회원가입 아이콘">
									</button>
								</div>
								<div class="hide-term hide3">
									<div class="terms-second-scroll">
										<iframe title="번개장터 위치기반서비스 이용약관"
											src="https://terms.bunjang.co.kr/terms/location.html"></iframe>
									</div>
								</div>
							</div>
							<div class="check-margin">
								<div class="terms-check-box">
									<div id="ch-fourth" class="terms-check"></div>
									<div class="checkbox-info">
										<span class="suggest">(선택)</span>이메일,SMS 광고 수신 동의
									</div>
								</div>
							</div>
						</div>
					</div>
					<button class="updateuser-btn">수정하기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>