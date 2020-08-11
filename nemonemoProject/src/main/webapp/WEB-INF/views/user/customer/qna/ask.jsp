<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>번개장터 | 1:1상담</title>

<!-- 공통 CSS -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/common/common.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/customer/qna/ask.css"/>">



<!-- 라이브러리 -->
<script
	src="<c:url value="/resources/vendor/jquery/jquery-3.5.1.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/fontawsome/js/all.js"/>"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 해당 페이지 JS파일 -->
<script src="<c:url value="/resources/js/user/common/common.js"/>"></script>


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
					<nav class="total-nav">
						<a class="total-nav-not-selected" href="#">공지사항</a> <a
							class="total-nav-not-selected" href="#">운영정책</a> <a
							class="total-nav-not-selected" href="#">자주묻는 질문</a> <a
							class="total-nav-selected" href="#">1:1문의</a>
					</nav>
					<hr>
					<nav class="qna-nav">
						<a class="qna-nav-selected" href="/nemonemoProject/customer/qna.do">1:1 상담하기
						<div class="nav-selected-underline"></div></a> 
						<a class="qna-nav-not-selected" href="/nemonemoProject/customer/qna/list.do">상담내역</a>
					</nav>
					<form method="post" action="new.do">
						<div class="qna-contents">
							<div class="qna-contents-selbox">
								<div class=" css-2b097c-container">
									<div class="qna-contents-selbox-box">
										<div class="css-1hwfws3">
											<select class="reason" id="qnaCategoryParent">
												<!-- 대분류 -->
												<c:forEach var="qnaCategory" items="${qnaCategoryList}">
													<option value="${qnaCategory.qnaCategoryParent}">${qnaCategory.qnaCategoryParent}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
							</div>
							<div class="qna-contents-selbox">
								<div class=" css-2b097c-container">
									<div class="qna-contents-selbox-box">
										<div class=" css-1hwfws3">
											<select class="reason" id="qnaCategoryName">
												<!-- 대분류 -->
												<c:forEach var="qnaCategory" items="${qnaCategoryList}">
													<option value="${qnaCategory.qnaCategoryNo}">${qnaCategory.qnaCategoryName}</option>
												</c:forEach>
											</select>
										</div>

									</div>
								</div>
							</div>
							<textarea rows="20" class="qna-contents-textarea"
								name="qnaContent"> <c:out value="${qnaContent}" /></textarea>
							<div class="img-outline-box">
								<div class="img-box">
									<!-- 저장공간에 저장 ??? -->
										<img src="https://media.bunjang.co.kr/images/crop/501020993_w328.jpg"
											alt="첨부파일 이미지" class="addImg">									
									<button class="img-delete">삭제</button>
								</div>
								<!--<div class="img-box">
								 	
										<img src="https://media.bunjang.co.kr/images/crop/501020993_w328.jpg"
											alt="첨부파일 이미지" class="addImg">									
									<button class="img-delete">삭제</button>
								</div>
								<div class="img-box">
									
										<img src="https://media.bunjang.co.kr/images/crop/501020993_w328.jpg"
											alt="첨부파일 이미지" class="addImg">									
									<button class="img-delete">삭제</button>
								</div>
								<div class="img-box">
							
										<img src="https://media.bunjang.co.kr/images/crop/501020993_w328.jpg"
											alt="첨부파일 이미지" class="addImg">									
									<button class="img-delete">삭제</button>
								</div>
								<div class="img-box">
								
										<img src="https://media.bunjang.co.kr/images/crop/501020993_w328.jpg"
											alt="첨부파일 이미지" class="addImg">									
									<button class="img-delete">삭제</button>
								</div>				 -->			
							</div>
							<div class="qna-btn-group">
								<input type="file" accept="image/jpg, image/jpeg, image/png"
									multiple="" class="qna-btn-add-file">
								<button type="submit" class="qna-btn-submit">상담신청</button>
								<input type="hidden" value="${qnaCategoryNo}">
							</div>
						</div>
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

<script src="<c:url value="/resources/js/user/customer/ask.js"/>"></script>
</html>