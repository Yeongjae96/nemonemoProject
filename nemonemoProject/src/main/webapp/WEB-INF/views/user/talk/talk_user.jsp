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
   <link rel="shortcut icon" href="<c:url value="/resources/images/common/logo/favicon.png"/>">

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
			<button class="talk-user-info-btn" id="headerTitle">
				<!-- 발예린
				<i class="fas fa-chevron-up"></i> -->
			</button>
			<div class="talk-user-menu-area">
				<button class="talk-user-menu-more">
					<i class="fas fa-ellipsis-v"></i>
				</button>
			</div>
		</header>
		<!-- 연락하기 눌렀을 떄의 상품 정보  -->
		<%-- <div class="talk-user-pd-area">
			<a class="talk-user-pd-link">
				<!-- 이미지 -->
				<img src="<c:url value="/image/product/18.img"/>">
				<div class="talk-user-pd-info">
					<div class="talk-user-pd-price">
						250,000
						<small>원</small>
					</div>
					<div class="talk-user-pd-title">
						노트북
					</div>
				</div>
			</a>
			<button class="talk-user-pd-btn">
				네모페이
			</button>
		</div> --%>
		
		
		<!--메신저 내용 -->
		<div class="talk-user-msg-list">
			<%-- <article class="talk-user-template-area">
				<img src="<c:url value="/resources/images/common/logo/favicon.png"/>">
				<h2>네모톡, 간편하게 시작해요!</h2>
				<p>판매자에게 메시지 바로 보내기</p>
			</article>
			<ul class="talk-user-template-list">
				<li class="talk-user-template-item">
					이 상품에 관심있어요!
					<img src="<c:url value="/resources/images/user/talk/up-arrow.svg"/>">
				</li>
				<li class="talk-user-template-item">
					안녕하세요. 네모페이 되나요?
					<img src="<c:url value="/resources/images/user/talk/up-arrow.svg"/>">
				</li>
				<li class="talk-user-template-item">
					안녕하세요. 직거래 되나요?
					<img src="<c:url value="/resources/images/user/talk/up-arrow.svg"/>">
				</li>
			</ul>
		
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
			--%>
		</div>
		 
		<!-- 메세지 보내기 창 -->
		<div class="talk-user-footer">
			<div class="footer-menu-area">
			</div>
			<div class="footer-send-area">
				<div class="footer-menu-btn-area">
					<button class="footer-menu-btn"></button>
				</div>
				<div class="footer-menu-text-area">
					<form class="footer-menu-text-form">
						<textarea placeholder="욕설/음란/광고/개인정보 공유를 주의바랍니다" id="msgInput" class="footer-menu-text-textarea" rows="1" style="max-height: 63px; overflow: hidden auto; overflow-wrap: break-word; height: 40px;"></textarea>
					</form>
				</div>
			</div>
		</div>
		
		<!-- 상위 메뉴 모달 -->
		<div class="top-menu-modal">
			<div class="modal-bg-area"></div>
			<div class="modal-menu-btn-area">
				<button class="modal-menu-btn-alarm">알림<b>ON</b></button>
				<button class="modal-menu-btn-report">신고</button>
				<button class="modal-menu-btn-inquery">신고조회</button>
				<button class="modal-menu-btn-block">차단</button>
				<button class="modal-menu-btn-exit">나가기</button>
			</div>
		</div>
   </div>
   
</body>
</html>