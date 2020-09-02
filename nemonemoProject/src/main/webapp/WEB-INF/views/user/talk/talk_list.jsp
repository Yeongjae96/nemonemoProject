<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>네 모든것 내 모든것, 네모내모</title>
   <!-- 스타일 -->
   <link rel="stylesheet" href="<c:url value="/resources/css/user/talk/talk_list.css"/>">
   
   <!-- 라이브러리 -->
   <script src="<c:url value="/resources/vendor/jquery/jquery-3.5.1.min.js"/>"></script>
   <script src="<c:url value="/resources/vendor/fontawesome/js/all.js"/>"></script>
   <!-- 스크립트 -->
   <script src="<c:url value="/resources/js/user/talk/talk_list.js"/>"></script>
   
</head>
<body>
   <div class="talk-list-area">
   		<header class="talk-list-header">
   			<div class="list-header-title">네모톡</div>
   			<div class="idontknow"></div>
   		</header>
   		<ul class="talk-list-content">
   			<li class="talk-item">
   				<div class="talk-item-area">
   					<a class="talk-item-image-link">
   						<img src="<c:url value="/resources/images/user/talk/base.svg"/>" alt="프로필 이미지">
   					</a>
   					<a class="talk-item-preview-link">
   						<div class="talk-item-preview-div">
   							<div class="talk-item-preview-title">대한민국농산물</div>
   							<div class="talk-item-preview-content">계약하시나요?</div>
   						</div>
   					</a>
   					<div class="talk-item-date">2020. 9. 2 수요일</div>
   					<div class="talk-item-menu-area">
   						<div class="talk-item-menu-btn">
   							<i class="fas fa-ellipsis-v"></i>
   						</div>
   					</div>
   				</div>
   			</li>
   		</ul>
   </div>
   
</body>
</html>