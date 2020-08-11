<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% response.setStatus(200); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>404 Error - 해당 경로를 찾을 수 없습니다.</title>

<!-- 해당 페이지  404 페이지  -->
<link href="<c:url value="/resources/css/common/error/404.css"/>" rel="stylesheet"/>

<!-- 해당 페이지 스크립트 -->
<script> var contextPath = "${pageContext.request.contextPath}";</script>
<script src="<c:url value="/resources/js/common/error/404.js"/>"></script>

</head>
<body>
	<div class="center-container">
	<div class="main-container">
		<img src="<c:url value="/resources/images/common/error/404.png"/>" class="title--image" alt="404 이미지"/>
		<div class="error-content">
			<p>찾을 수 없는 페이지 입니다.</p>
			<p>요청하신 페이지가 사라졌거나, 잘못된 경로를 이용하셨어요 : )</p>
		</div>
		<div class="btn-div">
			<button class="prev__btn" id="prevBtn">
				이전 페이지로 이동
			</button>
			<button class="home__btn" id="homeBtn">
				홈으로 이동
			</button>
		</div>
	</div>
	</div>
</body>
</html>