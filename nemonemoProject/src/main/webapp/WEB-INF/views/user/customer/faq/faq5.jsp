<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네모내모 | 자주묻는 질문</title>
<!-- 공통 CSS -->
<link rel="stylesheet" href="<c:url value="/resources/css/user/common/common.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/user/customer/faq.css"/>">

<!-- 페이지 CSS  -->
<link rel="stylesheet" href="<c:url value="/resources/css/user/sign/signin.css"/>">


<!-- 라이브러리 -->
<script src="<c:url value="/resources/vendor/jquery/jquery-3.5.1.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/fontawsome/js/all.js"/>"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 해당 페이지 JS파일 -->
<script src="<c:url value="/resources/js/user/common/common.js"/>"></script>
<script>
	$(function() {
		$('.faq-list-btn').click(function() {
			$(this).next().slideToggle();
		});
	});
</script>


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
		<div class="faq-body">
			<div class="faq-body-div">
				<!-- faq navbar -->
				<nav class="faq-nav">
					<a class="faq-nav-not-selected" href="notice.html">공지사항</a>
					<a class="faq-nav-not-selected" href="policy.html">운영정책</a>
					<a class="faq-nav-selected" href="faq1.html">자주묻는 질문</a>
					<a class="faq-nav-not-selected" href="#">1:1문의</a>
				</nav>
				
				<!-- faq main -->
				<main class="faq-main">
					<div class="faq-main-div">
						<nav class="faq-menu">
							<a class="faq-menu-not-selected" href="#">상점&amp;상품</a>
							<a class="faq-menu-not-selected" href="#">거래</a>
							<a class="faq-menu-not-selected" href="#">안전거래</a>
							<a class=" faq-menu-not-selected" href="#">계정문의</a>
							<a class=" faq-menu-selected" href="#">택배</a>
							<a class="faq-menu-not-selected" href="#">운영정책</a>
							<a class=" faq-menu-not-selected" href="#">UP플러스</a>
							<a class=" faq-menu-not-selected" href="#">똑똑한 판매팁</a>
							<a class="faq-menu-not-selected" href="#">안전한 구매팁</a>
							<a class="faq-menu-not-selected" href="#">이용제한</a>
						</nav>

						<ul class="faq-list-ul">
							<li class="faq-list-li">
								<article class="faq-list-art">
									<button class="faq-list-btn">
										<div class="faq-list-title">
											<h1>[거래] 반드시 체크해야할 거래사기 유형</h1>
										</div>
										<span class="faq-list-arrow"></span>
									</button>
									<div class="faq-list-content">
										<br>
											<strong style="box-sizing: border-box;"	data-renderer-mark="true">[최신 사기 수법 안내]</strong>
										<br>
										<br>새상품은 받은날로부터 7일 이내 반품 및 환불이 가능합니다. (판매자가 사업자 일 경우 해당) 상품이
											불량이라면 동일한 상품으로 교환이나 환불을 받아보시고, 변심이시라면 왕복택배비는 구매자께서 부담하셔야 합니다.<br>
										<br>&lt;반품기간 및 반품운송비&gt;<br>
										<br>: 상품상세설명에 반품불가라고 표기하더라도 관련법이 우선하므로 구매자의 반품시 이를 받아주어야 함.<br>
										<br>- 구매자 단순변심 : 상품 수령 후 7일 이내 (구매자 반품비 부담)<br>
										<br>- 표시/광고와 상이 : 상품 수령 후 3개월 이내 또는 사실을 안 날로부터 30일 이내 (판매자 반품비 부담)<br>
									</div>
								</article>
							</li>
		
							<li class="faq-list-li">
								<article class="faq-list-art">
									<button class="faq-list-btn">
										<div class="faq-list-title">
											<h1>[거래] 반드시 체크해야할 거래사기 유형</h1>
										</div>
										<span class="faq-list-arrow"></span>
									</button>
									<div class="faq-list-content">
										<br>
											<strong style="box-sizing: border-box;"	data-renderer-mark="true">[최신 사기 수법 안내]</strong>
										<br>
										<br>새상품은 받은날로부터 7일 이내 반품 및 환불이 가능합니다. (판매자가 사업자 일 경우 해당) 상품이
											불량이라면 동일한 상품으로 교환이나 환불을 받아보시고, 변심이시라면 왕복택배비는 구매자께서 부담하셔야 합니다.<br>
										<br>&lt;반품기간 및 반품운송비&gt;<br>
										<br>: 상품상세설명에 반품불가라고 표기하더라도 관련법이 우선하므로 구매자의 반품시 이를 받아주어야 함.<br>
										<br>- 구매자 단순변심 : 상품 수령 후 7일 이내 (구매자 반품비 부담)<br>
										<br>- 표시/광고와 상이 : 상품 수령 후 3개월 이내 또는 사실을 안 날로부터 30일 이내 (판매자 반품비 부담)<br>
									</div>
								</article>
							</li>
							<li class="faq-list-li">
								<article class="faq-list-art">
									<button class="faq-list-btn">
										<div class="faq-list-title">
											<h1>[거래] 반드시 체크해야할 거래사기 유형</h1>
										</div>
										<span class="faq-list-arrow"></span>
									</button>
									<div class="faq-list-content">
										<br>
											<strong style="box-sizing: border-box;"	data-renderer-mark="true">[최신 사기 수법 안내]</strong>
										<br>
										<br>새상품은 받은날로부터 7일 이내 반품 및 환불이 가능합니다. (판매자가 사업자 일 경우 해당) 상품이
											불량이라면 동일한 상품으로 교환이나 환불을 받아보시고, 변심이시라면 왕복택배비는 구매자께서 부담하셔야 합니다.<br>
										<br>&lt;반품기간 및 반품운송비&gt;<br>
										<br>: 상품상세설명에 반품불가라고 표기하더라도 관련법이 우선하므로 구매자의 반품시 이를 받아주어야 함.<br>
										<br>- 구매자 단순변심 : 상품 수령 후 7일 이내 (구매자 반품비 부담)<br>
										<br>- 표시/광고와 상이 : 상품 수령 후 3개월 이내 또는 사실을 안 날로부터 30일 이내 (판매자 반품비 부담)<br>
									</div>
								</article>
							</li>
							<li class="faq-list-li">
								<article class="faq-list-art">
									<button class="faq-list-btn">
										<div class="faq-list-title">
											<h1>[거래] 반드시 체크해야할 거래사기 유형</h1>
										</div>
										<span class="faq-list-arrow"></span>
									</button>
									<div class="faq-list-content">
										<br>
											<strong style="box-sizing: border-box;"	data-renderer-mark="true">[최신 사기 수법 안내]</strong>
										<br>
										<br>새상품은 받은날로부터 7일 이내 반품 및 환불이 가능합니다. (판매자가 사업자 일 경우 해당) 상품이
											불량이라면 동일한 상품으로 교환이나 환불을 받아보시고, 변심이시라면 왕복택배비는 구매자께서 부담하셔야 합니다.<br>
										<br>&lt;반품기간 및 반품운송비&gt;<br>
										<br>: 상품상세설명에 반품불가라고 표기하더라도 관련법이 우선하므로 구매자의 반품시 이를 받아주어야 함.<br>
										<br>- 구매자 단순변심 : 상품 수령 후 7일 이내 (구매자 반품비 부담)<br>
										<br>- 표시/광고와 상이 : 상품 수령 후 3개월 이내 또는 사실을 안 날로부터 30일 이내 (판매자 반품비 부담)<br>
									</div>
								</article>
							</li>
						</ul>
					</div>
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