<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>네모내모 | 공지사항</title>
<!-- 공통 CSS -->
<link rel="stylesheet" href="<c:url value="/resources/css/user/common/common.css"/>">

<!-- 페이지 CSS  -->
<link rel="stylesheet" href="<c:url value="/resources/css/user/customer/customer_nav.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/user/customer/notice.css"/>">
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