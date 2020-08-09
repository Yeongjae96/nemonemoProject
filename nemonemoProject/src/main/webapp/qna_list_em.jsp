<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>번개장터 | 1:1상담</title>
<!-- 공통 CSS -->
<link rel="stylesheet" href="<c:url value="/resources/css/user/common/common.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/user/qna/qna_list_em.css"/>">

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
		<div class="qna-list-em-body">
	        <main class="qna-list-em-main">
	        	<!-- 공지사항등 큰 nav bar -->
	        	<nav class="total-nav">
					<a class="total-nav-not-selected" href="#">공지사항</a>
					<a class="total-nav-not-selected" href="#">운영정책</a>
					<a class="total-nav-not-selected" href="#">자주묻는 질문</a>
					<a class="total-nav-selected" href="#">1:1문의</a>
				</nav>
	            <hr>
	            <!-- qna관련 nav bar -->
	            <nav class="qna-list-em-nav">
		            <a class="qna-list-em-nav-not-selected" href="qna_.html">1:1 상담하기</a>
		            <a class="qna-list-em-nav-selected" href="qna_list.html">상담내역</a>
	            </nav>
	        </main>
	    </div>
	</section>
	<% 
		/* 공통 푸터 */
	%>
	<jsp:include page="/WEB-INF/views/user/include/footer.jsp"/>
</body>
</html>