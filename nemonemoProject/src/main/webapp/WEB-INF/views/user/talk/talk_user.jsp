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
   <link rel="stylesheet" href="<c:url value="/resources/css/user/talk/talk_user.css"/>">
   
   <!-- 라이브러리 -->
   <script src="<c:url value="/resources/vendor/jquery/jquery-3.5.1.min.js"/>"></script>
   <script src="<c:url value="/resources/vendor/fontawesome/js/all.js"/>"></script>
   <script src="<c:url value="/resources/vendor/sockjs/dist/sockjs.min.js"/>"></script>
	<script>window.contextPath = '<c:url value="/"/>';</script>
   <!-- 스크립트 -->
   <script src="<c:url value="/resources/js/user/talk/talk_user.js"/>"></script>
   
</head>
<body>
   <div class="talk-user-area">
		<header class="talk-user-header">
			<button class="talk-user-info-btn">
				발예린
				<i class="fas fa-chevron-up"></i>
			</button>
			<div class="talk-user-menu-area">
				<button class="talk-user-menu-more">
					<i class="fas fa-ellipsis-v"></i>
				</button>
			</div>
		</header>
		<!--메신저 내용 -->
		<div class="talk-user-msg-list">
		<!--  아이템 1개  상용메시지 템플릿-->
			<div class="talk-user-msg-item">
				<div class="talk-user-msg-date">
					2020. 9. 2 수요일
				</div>
				<div class="talk-user-msg-content">
					<div class="msg-content-area">
						<div class="msg-content-padding">
							<div class="msg-content-logo"></div>
							<div class="msg-content-head">직거래를 요청합니다.</div>
							<div class="msg-content-body">만나서 거래해요<br><br><p>상품명: 에어팟 2세대 케이스</p><p>거래방식: 직거래</p><p>총 거래액: 500원</p></div>
							<div class="msg-content-footer">
								<a class="msg-content-footer-link">거래상세보기</a>
							</div>
						</div>
					</div>
					<div class="talk-user-msg-time-area">
						<div class="talk-user-msg-time-text">오전 2:48</div>
					</div>
				</div>
			</div>
		<!-- 일반 대화 메시지 아이템 1개 -->
			<div class="talk-user-normal-msg">
				<div class="talk-user-msg-date">2020. 9. 3 목요일</div>
				<div class="normal-msg-area">
					<div class="normal-msg-flex">
						<div class="normal-msg-content">안녕하세요</div>
					</div>
					<div class="normal-msg-time-area">
						<div class="normal-msg-status">
							안읽음
						</div>
						<div class="normal-msg-time-text">
							오전 2:59
						</div>
					</div>
				</div>
			</div>
			
		<!-- 답변 일반 메시지 -->
			<div class="talk-user-response-msg">
				<div class="response-msg-area">
					<div class="response-msg-img-area">
   						<img src="<c:url value="/resources/images/user/talk/base.svg"/>" alt="프로필 이미지">
					</div>
					<div class="response-msg-area">
						<div class="response-msg-text">네, 안녕하세요 테스트 데이터 마구잡이로 넣어보겠습니다. 안녕하세요!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</div>
					</div>
					<div class="response-msg-time-area">
						<div class="response-msg-time-text">
							오전 2:59
						</div>
					</div>
				</div>
			</div>
		</div>
   </div>
   
</body>
</html>