<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>네 모든것 내 모든것, 네모내모</title>
<!-- 스타일 -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/talk/talk_user.css"/>">
<link rel="shortcut icon"
	href="<c:url value="/resources/images/common/logo/favicon.png"/>">

<!-- 라이브러리 -->
<script
	src="<c:url value="/resources/vendor/jquery/jquery-3.5.1.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/fontawesome/js/all.js"/>"></script>
<script
	src="<c:url value="/resources/vendor/sockjs/dist/sockjs.min.js"/>"></script>
<script>
	window.contextPath = '<c:url value="/"/>';
</script>
<script src="<c:url value="/resources/js/common/util/date_util.js"/>"></script>
<script src="<c:url value="/resources/js/common/util/dom_util.js"/>"></script>
<!-- 스크립트 -->
<script src="<c:url value="/resources/js/user/talk/talk_user.js"/>"></script>

</head>
<body>
	<div class="talk-user-area">
		<header class="talk-user-header">
			<button class="talk-user-info-btn" id="headerTitle"></button>
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
			<%-- 
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
		--%>
		</div>
		<!-- 메세지 보내기 창 -->
		<div class="talk-user-footer">
			<div class="footer-menu-area"></div>
			<div class="footer-send-area">
				<div class="footer-menu-btn-area">
					<button class="footer-menu-btn"></button>
				</div>
				<div class="footer-menu-text-area">
					<form class="footer-menu-text-form">
						<textarea placeholder="욕설/음란/광고/개인정보 공유를 주의바랍니다" id="msgInput"
							class="footer-menu-text-textarea" rows="1"
							style="max-height: 63px; overflow: hidden auto; overflow-wrap: break-word; height: 40px;"></textarea>
					</form>
				</div>
			</div>
		</div>

		<!-- 상위 메뉴 모달 -->
		<div class="top-menu-modal">
			<div class="modal-bg-area"></div>
			<div class="modal-menu-btn-area">
				<!-- <button class="modal-menu-btn-alarm">알림<b>ON</b></button>
				<button class="modal-menu-btn-report">신고</button>
				<button class="modal-menu-btn-inquery">신고조회</button>
				<button class="modal-menu-btn-block">차단</button> -->
				<button class="modal-menu-btn-exit" data-action="exit">나가기</button>
			</div>
		</div>

		<div class="modal-store-area">
			<div class="modal-store-bg"></div>
			<div class="modal-store-content">
				<div class="modal-store-body">
					<a class="modal-store-link" data-target="reviews">
						<div class="modal-store-title">상점후기</div>
						<div class="modal-store-content-div">
							<div class="modal-store-content-area">
								<b id="reviewCnt">0</b>
								<!-- 별이 들어갈 곳  -->
								<div class="modal-star-area" id="starArea"></div>
							</div>
						</div>
					</a> <a class="modal-store-link" data-target="products">
						<div class="modal-store-title">판매상품</div>
						<div class="modal-store-content-div">
							<b id="productCnt">0</b>
						</div>
					</a>
					<!-- <button type="button" class="sc-fFTYTi dgGyZU">
						<div class="sc-bTiqRo fwNFUy">판매내역</div>
						<div class="sc-bEufUU pgUNz"><b>0</b></div>
					</button> -->
					<!-- <div class="sc-dlyikq eENyIS">
						<div class="sc-bTiqRo fwNFUy">연락시간</div>
						<div class="sc-bEufUU pgUNz">오전 7시 ~ 오후 10시</div>
					</div> -->
					<!-- <button type="button" class="sc-fFTYTi dgGyZU">
						<div class="sc-bTiqRo fwNFUy">유의사항</div>
						<div class="sc-bEufUU pgUNz">
							<div class="sc-gFXMyG ibZyZT">설명잘읽으시고 구매부탁드립니다</div>
						</div>
					</button> -->
				</div>
				<div class="modal-store-button-area">
					<!-- <button class="sc-RmnOB gGKDin">사기 신고조회</button> -->
					<a class="modal-store-button-link">상점 바로가기</a>
				</div>
			</div>
		</div>

		<!-- 삭제하시겠습니까 모달 -->
		<div class="close-modal">
			<div class="close-modal-area">
				<div class="close-modal-content">
					<div class="close-modal-text">대화방을 나가면 대화 내용이 모두 삭제됩니다.<br>대화방을 나가시겠습니까?</div>
					<div class="close-modal-btn-area">
						<button class="close-modal-cancel">아니오</button>
						<button class="close-modal-yes">예</button>
					</div>
				</div>
				<div class="close-modal-bg"></div>
			</div>
		</div>
	</div>

</body>
</html>