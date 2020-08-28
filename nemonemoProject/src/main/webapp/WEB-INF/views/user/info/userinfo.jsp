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
<script src="<c:url value="/resources/vendor/fontawesome/js/all.js"/>"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://www.gstatic.com/firebasejs/6.2.0/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/6.2.0/firebase-auth.js"></script>
<!-- 해당 페이지 JS파일 -->
<%-- <script src="<c:url value="/resources/js/user/info/userinfo.js"/>"></script> --%>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="<c:url value="/resources/js/user/info/userinfo.js"/>"></script>

</head>
<body>
	<div class="signin-all">
		<form method="post" action="updateUser.do" name="updateUser" onsubmit="return checks();">
			<div class="signin-form">
				<div class="signin-title">수정하기</div>
				<div class="signin-box">
					<div class="info-input-outline">
					<input type="hidden" value="${user.userNo}" id="userNo" name="userNo">
						<div class="signin-common-margin">
							<div class="input-box">
								<div class="upuser-in">
									<label>비밀번호</label>
								</div>
								<input type="password" value="" id="userPw" name="userPw" placeholder="비밀번호 8자이상 16자이하 입력해주세요">
							</div>
						</div>

						<div class="signin-common-margin">
							<div class="input-box">
								<div class="upuser-in">
									<label>이름</label>
								</div>
								<input type="text" value="${user.userName} " id="userName" name="userName">
							</div>
						</div>

						<div class="signin-common-margin">
							<div class="input-box">
								<div class="upuser-in">
									<label>휴대번호</label>
								</div>
								<input type="text" value="${user.userPhone}" id="userPhone" name="userPhone">
							</div>
						</div>
						<div class="signin-common-margin">
							<div class="input-box">
								<div class="upuser-in">
									<label>계좌번호</label>
								</div>
								<input type="text" value="${user.userAccount}" id="userAccount" name="userAccount">
							</div>
						</div>

						<div class="info-input-outline">
							<div class="signin-common-margin">
								<div class="input-box">
									<input class="form-control"
										style="width: 40%; display: inline;" placeholder="우편번호"
										name="userZipcode" id="zipcodeInput" type="text" value="${user.userZipcode}"
										readonly="readonly">
									<button type="button" class="btn zipcode-btn"
										onclick="execPostCode();">
										<i class="fa fa-search"></i>우편번호
									</button>
								</div>
							</div>

							<div class="signin-common-margin">
								<div class="input-box">
									<input type="text" placeholder="주소를 검색해주세요"
										name="userAddress1" id="address1Input" value="${user.userAddress1}" readonly="readonly">
								</div>
							</div>

							<div class="signin-common-margin">
								<div class="input-box">
									<input type="text" placeholder="상세주소를 입력해주세요"
										name="userAddress2" id="address2Input" value="${user.userAddress2}">
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
						<button class="updateuser-btn" id="updateuser-btn">수정하기</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>