<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네모내모 | 1:1상담</title>

<!-- 공통 CSS -->
<link rel="stylesheet" href="<c:url value="/resources/css/user/common/common.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/user/customer/qna/ask.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/user/customer/customer_nav.css"/>">
<link rel="shortcut icon" href="<c:url value="/resources/images/common/logo/favicon.png"/>"> 


<!-- 라이브러리 -->
<script src="<c:url value="/resources/vendor/jquery/jquery-3.5.1.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/fontawesome/js/all.js"/>"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="<c:url value="/resources/vendor/jquery/jquery.form.min.js"/>"></script>
<script src="<c:url value="/resources/js/user/common/common.js"/>"></script>

<!-- 해당 페이지 JS파일 -->
<script> window.contextPath = "<c:url value="/"/>";</script>
<script src="<c:url value="/resources/js/user/customer/qna/ask.js"/>"></script>


</head>
<body>
	<%
		/* 공통 Header */
	%>
	<jsp:include page="/WEB-INF/views/user/include/top-menu.jsp" />
	<%
		/* 공통 Header */
	%>
	<header class="sticky-top">
		<jsp:include page="/WEB-INF/views/user/include/header.jsp" />
		<jsp:include page="/WEB-INF/views/user/include/side-nav.jsp" />
	</header>
	<%
		/* 각 페이지의 특성! */
	%>
	<section>
		<div class="qna-body">
			<div class="qna-body2">			
				<main class="qna-main"> 
				<!-- customer 공통 nav -->
				<jsp:include page="/WEB-INF/views/user/customer/common/customer_nav.jsp"/>
					<hr>
					<nav class="qna-nav">
						<a class="qna-nav-selected" href="<c:url value="/customer/qna.do"/>">1:1 상담하기
						<div class="nav-selected-underline"></div></a> 
						<a class="qna-nav-not-selected" href="<c:url value="/customer/qna/list.do"/>">상담내역</a>
					</nav>
					<form method="post" enctype="multipart/form-data" id="newQuestionForm">
						<div class="qna-contents">							
							<div class="qna-contents-selbox">
								<div class="selbox-container">
									<div class="qna-contents-selbox-box">
										<div class="selbox_size">
											<select name = "qnaCategoryNo" class="reason" id="qnaCategoryName">
												<c:forEach var="qnaCategory" items="${qnaCategoryList}">
													<option value="${qnaCategory.qnaCategoryNo}">
																	${qnaCategory.qnaCategoryName}</option>													
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
							</div>
							<textarea rows="20" class="qna-contents-textarea"
								name="qnaUserContent"> <c:out value="${qnaUserContent}" /></textarea>
							<div class="img-outline-box">	
							<!-- 사진첨부 -->								 
							</div>
							<div class="qna-btn-group">
								<input type="file" multiple="multiple" id ="inputFile" class="qna-add-file"> 
								<button class="qna-btn-submit" id="qnaSubmit">상담신청</button>							
							</div>
						</div>
						<input type="hidden" value="${user.userNo}" name="qnaRegId" />
					</form>
				</main>
			</div>
		</div>
	</section>
	<%
		/* 공통 푸터 */
	%>
	<jsp:include page="/WEB-INF/views/user/include/footer.jsp" />
</body>


</html>