<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>공지사항</title>
<!-- 공통 CSS -->
<link rel="stylesheet" href="<c:url value="/resources/css/user/common/common.css"/>">

<!-- 페이지 CSS  -->
<link rel="stylesheet" href="<c:url value="/resources/css/user/customer/customer_nav.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/user/customer/notice.css"/>">


<!-- 라이브러리 -->
<script src="<c:url value="/resources/vendor/jquery/jquery-3.5.1.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/fontawesome/js/all.js"/>"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="<c:url value="/resources/js/user/common/common.js"/>"></script>

<!-- 해당 페이지 JS파일 -->
<script src="<c:url value="/resources/js/user/customer/notice.js"/>"></script>



</head>
<body>
	<% 
		/* 공통 Header */
	%>
	<jsp:include page="/WEB-INF/views/user/include/top-menu.jsp"/>
	<% 
		/* 공통 Header */
	%>
	<header class="sticky-top">
		<jsp:include page="/WEB-INF/views/user/include/header.jsp" />
		<jsp:include page="/WEB-INF/views/user/include/side-nav.jsp"/>		
	</header>
	<% 
		/* 각 페이지의 특성! */
	%>
	<section>
		<div class="notice-body">
			<div class="notice-body-div">
				<!-- customer 공통 nav -->
				<jsp:include page="/WEB-INF/views/user/customer/common/customer_nav.jsp"/>
				<main class="notice-main">
					<ul class="notice-list">
					<c:forEach var="notice" items="${noticeList}">
						<li class="notice-list-li">
							<article class="notice-list-art">
								<button class="notice-list-btn">
									<div class="notice-list-title">
										<h1>${notice.noticeTitle}</h1>
										<time class="notice-list-time">
											${notice.noticeYmd}
										</time>
									</div>
									<span class="notice-list-arrow"></span>
								</button>
								<div class="notice-list-content">
										<strong style="box-sizing: border-box;"
											data-renderer-mark="true">${notice.noticeContent}</strong>
								</div>
							</article>
						</li>
						</c:forEach>
						<%-- <c:otherwise>
							<li class="notice-list-li">
								데이터가 존재 하지 않습니다.
							</li>
						</c:otherwise> --%>
						
						<!-- <li class="notice-list-li">
							<article class="notice-list-art">
								<button class="notice-list-btn">
									<div class="notice-list-title">
										<h1>[공지] 번개장터 개인정보처리방침 개정 안내</h1>
										<time class="notice-list-time">2020/07/15</time>
									</div>
									<span class="notice-list-arrow"></span>
								</button>
								<div class="notice-list-content">
										<strong style="box-sizing: border-box;"
											data-renderer-mark="true">[최신 사기 수법 안내]</strong><br>
									새상품은 받은날로부터 7일 이내 반품 및 환불이 가능합니다. (판매자가 사업자 일 경우 해당) 상품이<br>
										불량이라면 동일한 상품으로 교환이나 환불을 받아보시고, 변심이시라면 왕복택배비는 구매자께서 부담하셔야 합니다.<br>
									<br>&lt;반품기간 및 반품운송비&gt;<br>
									<br>: 상품상세설명에 반품불가라고 표기하더라도 관련법이 우선하므로 구매자의 반품시 이를 받아주어야 함.<br>
									<br>- 구매자 단순변심 : 상품 수령 후 7일 이내 (구매자 반품비 부담)<br>
									<br>- 표시/광고와 상이 : 상품 수령 후 3개월 이내 또는 사실을 안 날로부터 30일 이내 (판매자
										반품비 부담)<br>
								</div>
							</article>
						</li>
						<li class="notice-list-li">
							<article class="notice-list-art">
								<button class="notice-list-btn">
									<div class="notice-list-title">
										<h1>[공지] 번개장터 개인정보처리방침 개정 안내</h1>
										<time class="notice-list-time">2020/07/15</time>
									</div>
									<span class="notice-list-arrow"></span>
								</button>
								<div class="notice-list-content">
									<br>
										<strong style="box-sizing: border-box;"
											data-renderer-mark="true">[최신 사기 수법 안내]</strong>
									<br>
									<br>새상품은 받은날로부터 7일 이내 반품 및 환불이 가능합니다. (판매자가 사업자 일 경우 해당) 상품이
										불량이라면 동일한 상품으로 교환이나 환불을 받아보시고, 변심이시라면 왕복택배비는 구매자께서 부담하셔야 합니다.<br>
									<br>&lt;반품기간 및 반품운송비&gt;<br>
									<br>: 상품상세설명에 반품불가라고 표기하더라도 관련법이 우선하므로 구매자의 반품시 이를 받아주어야 함.<br>
									<br>- 구매자 단순변심 : 상품 수령 후 7일 이내 (구매자 반품비 부담)<br>
									<br>- 표시/광고와 상이 : 상품 수령 후 3개월 이내 또는 사실을 안 날로부터 30일 이내 (판매자
										반품비 부담)<br>
								</div>
							</article>
						</li>
						<li class="notice-list-li">
							<article class="notice-list-art">
								<button class="notice-list-btn">
									<div class="notice-list-title">
										<h1>[공지] 번개장터 개인정보처리방침 개정 안내</h1>
										<time class="notice-list-time">2020/07/15</time>
									</div>
									<span class="notice-list-arrow"></span>
								</button>
								<div class="notice-list-content">
									<br>
										<strong style="box-sizing: border-box;"
											data-renderer-mark="true">[최신 사기 수법 안내]</strong>
									<br>
									<br>새상품은 받은날로부터 7일 이내 반품 및 환불이 가능합니다. (판매자가 사업자 일 경우 해당) 상품이
										불량이라면 동일한 상품으로 교환이나 환불을 받아보시고, 변심이시라면 왕복택배비는 구매자께서 부담하셔야 합니다.<br>
									<br>&lt;반품기간 및 반품운송비&gt;<br>
									<br>: 상품상세설명에 반품불가라고 표기하더라도 관련법이 우선하므로 구매자의 반품시 이를 받아주어야 함.<br>
									<br>- 구매자 단순변심 : 상품 수령 후 7일 이내 (구매자 반품비 부담)<br>
									<br>- 표시/광고와 상이 : 상품 수령 후 3개월 이내 또는 사실을 안 날로부터 30일 이내 (판매자
										반품비 부담)<br>
								</div>
							</article>
						</li>
						<li class="notice-list-li">
							<article class="notice-list-art">
								<button class="notice-list-btn">
									<div class="notice-list-title">
										<h1>[공지] 번개장터 개인정보처리방침 개정 안내</h1>
										<time class="notice-list-time">2020/07/15</time>
									</div>
									<span class="notice-list-arrow"></span>
								</button>
								<div class="notice-list-content">
									<br>
										<strong style="box-sizing: border-box;"
											data-renderer-mark="true">[최신 사기 수법 안내]</strong>
									<br>
									<br>새상품은 받은날로부터 7일 이내 반품 및 환불이 가능합니다. (판매자가 사업자 일 경우 해당) 상품이
										불량이라면 동일한 상품으로 교환이나 환불을 받아보시고, 변심이시라면 왕복택배비는 구매자께서 부담하셔야 합니다.<br>
									<br>&lt;반품기간 및 반품운송비&gt;<br>
									<br>: 상품상세설명에 반품불가라고 표기하더라도 관련법이 우선하므로 구매자의 반품시 이를 받아주어야 함.<br>
									<br>- 구매자 단순변심 : 상품 수령 후 7일 이내 (구매자 반품비 부담)<br>
									<br>- 표시/광고와 상이 : 상품 수령 후 3개월 이내 또는 사실을 안 날로부터 30일 이내 (판매자
										반품비 부담)<br>
								</div>
							</article>
						</li> -->
					</ul>
				</main>
			</div>
		</div>
	</section>
	<% 
		/* 공통 푸터 */
	%>
	<jsp:include page="/WEB-INF/views/user/include/footer.jsp"/>
</body>
</html>