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
<link rel="stylesheet" href="<c:url value="/resources/css/user/customer/customer_nav.css"/>">

<!-- 페이지 CSS  -->
<link rel="stylesheet" href="<c:url value="/resources/css/user/customer/faq.css"/>">
<link rel="shortcut icon"
	href="<c:url value="/resources/images/common/logo/favicon.png"/>">

<!-- 라이브러리 -->
<script src="<c:url value="/resources/vendor/jquery/jquery-3.5.1.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/fontawesome/js/all.js"/>"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script> window.contextPath = "<c:url value="/"/>";</script>
<script src="<c:url value="/resources/js/user/common/common.js"/>"></script>

<!-- 해당 페이지 JS파일 -->
<script src="<c:url value="/resources/js/user/customer/faq.js"/>"></script>

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
				<!-- customer 공통 nav -->
				<jsp:include page="/WEB-INF/views/user/customer/common/customer_nav.jsp"/>
				<!-- faq main -->	
				<main class="faq-main">
					<div class="faq-main-div">
						<nav class="faq-menu">
						<c:forEach var="faqCategory" items="${faqCategoryList}">
							<a class="faq-menu-not-selected" data-categoryno="${faqCategory.faqCategoryNo}" href="${faqCategory.faqCategoryNo}.do">${faqCategory.faqCategoryName}</a>
						</c:forEach>
						</nav>

						<ul class="faq-list-ul">
						<c:forEach var="faq" items="${selectFaqList}">
							<li class="faq-list-li">
								<article class="faq-list-art">
									<button class="faq-list-btn">
										<div class="faq-list-title">
											<h1>${faq.faqTitle}</h1>
										</div>
										<span class="faq-list-arrow"></span>
									</button>
									<div class="faq-list-content">
										${faq.faqContent}
									</div>
								</article>
							</li>
						</c:forEach>
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