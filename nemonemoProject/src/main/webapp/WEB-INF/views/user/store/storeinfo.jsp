<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네모내모 | 상점 정보수정</title>
<!-- 공통 CSS -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/common/common.css"/>">

<!-- 페이지 CSS  -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/store/storeinfo.css?v=<%=System.currentTimeMillis() %>"/>">
<link rel="shortcut icon" href="<c:url value="/resources/images/common/logo/favicon.png"/>">

<!-- 라이브러리 -->
<script
	src="<c:url value="/resources/vendor/jquery/jquery-3.5.1.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/fontawesome/js/all.js"/>"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 해당 페이지 JS파일 -->
<script src="<c:url value="/resources/js/user/store/storeinfo.js?v=<%=System.currentTimeMillis() %>"/>"></script>

</head>
<body>
	<div class="storeedit-all">
		<form method="post" action="updateStore.do" enctype="multipart/form-data" name="updateStore"
			onsubmit="return checks();">
			<div class="storeedit-form">
				<div class="storeedit-title">상점 정보 수정하기</div>
				<div class="storeedit-box">
					<div class="info-input-outline">
						<!-- <div class="storeedit-common-margin">
							<div class="input-box">
								<div class="upstore-info">
									<label>상점 이미지</label>
								</div>
								<input type="file" multiple="multiple" id="inputFile" name="" style="margin-top:26px">
							</div>
						</div> -->
						<div class="storeedit-common-margin">
							<div class="input-box">
								<div class="upstore-info">
									<label>상점명</label>
								</div>
								<input type="text" value="${storeVO.storeName }" id="storeName"
									name="storeName" placeholder="상점명을 입력해주세요" maxlength="30">
							</div>
						</div>
						<div class="storeedit-common-margin">
							<div class="input-box" style="height:400px;">
								<div class="upstore-info" >
									<label>상점 소개</label>
								</div>
								<textarea id="storeIntro" name="storeIntro" maxlength="100"
									placeholder="상점 소개를 입력해주세요" style="width:400px; height:300px;" >${storeVO.storeIntro }</textarea>
							</div>
						</div>
						<input type="hidden" value="${storeVO.storeNo}" id="storeNo" name="storeNo">
						<button class="updatestore-btn" id="updatestore-btn">수정하기</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>