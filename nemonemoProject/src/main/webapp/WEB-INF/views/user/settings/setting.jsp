<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/user/settings/setting.css"/>">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>네모내모 | 계정 설정</title>
<!-- <style data-styled="" data-styled-version="4.4.1"></style> -->
<!-- <script charset="utf-8" src="/pc-static/js/Settings.df0e54c6.chunk.js"></script> -->
<%-- <script src="<c:url value="/resources/js/user/settings/setting.js"/>"></script> --%>
<link rel="shortcut icon"
	href="<c:url value="/resources/images/common/logo/favicon.png"/>">

<script>
$(function() {
	$('#logoutBtn').click(function() {
		 $('#myModal').show();
	});
})
</script>
</head>
<body>

	<div class="settings-body">
		<div class="settings-contents" onclick="location.href='/nemonemoProject/index.do'">
			<header class="settings-header">

				<button class="settings-back">
					<img
						src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCIgdmlld0JveD0iMCAwIDIwIDIwIj4KICAgIDxwYXRoIGZpbGw9IiMxRTFEMjkiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTE5IDguOTk2SDMuNjZMOS42NTcgMy43NWExIDEgMCAwIDAtMS4zMTYtMS41MDZsLTggN2MtLjAwOC4wMDctLjAxLjAxOC0uMDE5LjAyNWEuOTc1Ljk3NSAwIDAgMC0uMTc3LjI0Yy0uMDE4LjAzLS4wNDUuMDU0LS4wNTkuMDg3YS45NzUuOTc1IDAgMCAwIDAgLjgwMmMuMDE0LjAzMy4wNDEuMDU3LjA2LjA4OC4wNS4wODcuMTAzLjE3LjE3Ni4yMzkuMDA4LjAwNy4wMTEuMDE4LjAyLjAyNWw4IDdhLjk5Ni45OTYgMCAwIDAgMS40MS0uMDk1IDEgMSAwIDAgMC0uMDk1LTEuNDExTDMuNjYgMTAuOTk2SDE5YTEgMSAwIDEgMCAwLTIiLz4KPC9zdmc+Cg=="
						alt="back" width="20" height="20">
				</button>

				계정설정
			</header>
			<div class="settings-button-group">
				<a href="logout.do">로그아웃</a>
				<a href="withdraw.do">탈퇴</a>
			</div>
		</div>
	</div>
<!-- 모달 시작-->
<div id="myModal" class="modal">
	<!-- 모달 내용 -->
	<form method="post" action="sign/logout.do">
		<div class="modal-content">
			<div class="logout_h2">
				<h2>로그아웃</h2>
				<p>로그아웃 시 6개월 이상 경과된 네모톡 대화 내용이 모두 삭제됩니다. 계속하시겠습니까?</p>
			</div>
			<div class=logout_button_group>
				<div>
					<button id="model-cancel" class="cancel_logout">취소</button>
				</div>
				<div>
					<button class="confirm_logout" type="submit">확인</button>
				</div>
			</div>
		</div>
	</form>
</div>
<!--End Modal-->
</body>

</html>