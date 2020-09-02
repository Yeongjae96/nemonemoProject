<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네모네모</title>
<!-- 공통 CSS -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/common/common.css"/>">

<!-- 페이지 CSS  -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/store/comments/comments.css?v=<%=System.currentTimeMillis()%>"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/store/common/store_header.css?v=<%=System.currentTimeMillis()%>"/>">


<!-- 라이브러리 -->
<script src="<c:url value="/resources/vendor/jquery/jquery-3.5.1.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/fontawesome/js/all.js"/>"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="<c:url value="/resources/js/user/common/common.js"/>"></script>

<!-- 해당 페이지 JS파일 -->
<script
	src="<c:url value="/resources/js/user/store/comments/comments.js"/>"></script>

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
		<div class="center_all">
			<div class="comments">
				<jsp:include
					page="/WEB-INF/views/user/store/common/store_header.jsp" />


				<div class="sc-dCVVYJ dYImYF">
					<div class="sc-vBKru hEaZqn">
						<div class="comments_54">
							<a class="comments_55" style="font-size: 14px;"
								href="${pageContext.request.contextPath}/shop/${storeVO.storeNo }/products.do">상품
								<span class="comments_56">${fn:length(storeProductVO)}</span>
							</a> <a class="comments_57" style="font-size: 14px;"
								href="${pageContext.request.contextPath}/shop/${storeVO.storeNo }/comments.do">상점문의
								<span class="comments_58">${fn:length(storeCommentVO)}</span>
							</a> <a class="comments_59" style="font-size: 14px;"
								href="${pageContext.request.contextPath}/shop/${storeVO.storeNo }/favorites.do">찜
								<span class="comments_60">${fn:length(storeFavoriteVO)}</span>
							</a> <a class="comments_61" style="font-size: 14px;"
								href="${pageContext.request.contextPath}/shop/${storeVO.storeNo }/reviews.do">상점후기
								<span class="comments_62">${fn:length(storeReviewVO)}</span>
							</a>
						</div>
					</div>

					<div class="comments_67">
						<div>
							상점문의<span class="comments_68">
								${fn:length(storeCommentVO)}</span>
						</div>
					</div>
					<c:set var="isLogin" value="${user.storeNo}" />
					<c:if test="${not empty isLogin }">
						<div class="sc-kFLxrv fSsRvc">
							<div class="comments_69">
								<form id="insertComment" method="POST" action="newComment.do">
									<div class="comments_70">

										<textarea placeholder="상품문의 입력" class="comments_71"
											name="storeCommentContent" style="border: none" maxlength="100"></textarea>
										<input type="hidden" value="${user.storeNo}"
											name="storeCommentWriter" />

									</div>

									<div class="comments_72">
										<div class="comments_73"></div>
										<button class="comments_74" type="submit" id="insertComment">
											<img
												src="<c:url value="/resources/images/user/store/storeCommentSubmit.png"/>"
												width="15" height="16" alt="문의등록버튼 아이콘">등록
										</button>
								</form>
							</div>
						</div>
					</c:if>
				</div>

				<div class="comments_75">
					<c:forEach var="storeCommentVO" items="${storeCommentVO}">
						<div class="comments_76">
							<div class="comments_77">
								<div class="comments_79">
									<div class="comments_80">
										<div class="sc-kGeDwz ektOSj">${storeCommentVO.storeName}</div>
										<div class="comments_81">${storeCommentVO.storeCommentRegDt}</div>
									</div>
									<div class="comments_82">${storeCommentVO.storeCommentContent}</div>
									<div class="comments_83">
										<!-- <div class="comments_84">
											<img
												src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAcCAYAAAAEN20fAAAAAXNSR0IArs4c6QAABIFJREFUSA2tl0lok0EUx5M0tVYpsVvqRhQFe6gH0VKkWrFKl1TrQaSggsvR/eAKoiJCbxZRwV0Ul4N6UbCLbU314EatC0b0oJY0Rg1aEcS0DWn9vfRLnH79EmPNwMt787b5z8z7ZiZmUwLN5XJZ+/r6ivr7+xfhPn9gYGAi3G42m7OQf8D99L9Aj5Cb8XtQVVXVSz/hZo7n2dTUZA+FQptJvpEBs+P5qjb8f9I/Q0wdgLyqLZZsCERWoLe3dx+JdkGjteB++EvonnAG+2qxWL4ij2YF8vCbhG4BfCG6DMhEPwg7YbPZ9hQXFwdEF6sNA9LS0jIjGAxeJeEcCSKZDzoJnaqoqJAtiNtkEj09PdU4ySTmijOxr1NSUlaXl5c/jxU8BEhjY2MBwS4ol2CZTa3D4agtKCjoi5Ugnp6tdbJaZ8k3kXyyXeVOp/OhUUwUiKwEBXkfpzzIQ2A1QbIV/9WYXBZgLpJkKTmlsBdVVlZ26JNaRAFiC9txCTEPx3epqaklyQAhuRm02263LyfvTcaxAep6e3v7GLGpLQwE1NtwKsLwi710lpWVeVSn/5ULCwuDbHENYJ6Qa5rf7z+gz2l2u92jPB6PDyDZfAVbmMFxvVNDQ0O7XpdIn1UtVP2kBlmRDgBZIAdjfYrYrV6vt0pAYPDyVZyIGFSOPfwFqbqRyAzsZlJyvmwifiVUF8ljBWGN1rkAmFDEoHK2a8jMVNu/yoA4R4wAWQX9AUJnBiStaZAN/2Wlng7XjkzDSfuMVekkeiagmLt5QDJZIYcIKDuFG7VEa0RfE0a5NN07xpva1tYmR8Vn0VlRjBUhPT1djmvDhk9SakRJ7hOZa0Tur0EgLE0XA+VzmE1A+UEc9C2ZNaLlFgCmtLQ0ubHDTVZEzox8inYa3BBIMmtkcFjTdHigtLQ0ugtSI61QGbRMk2FDW6I1MjTKZDKqGXLlyw6wE7dVfwFyBarFuIrDbafRBYctmTWyTgNwXeNhZpWHCyhvM1h1V1fXbrSHVAeRk1Ujra2tUyjQrayGj1P8hjpO+PYFyFSAuDFYGXQONfFKdUqGTH6zTJhcTkCs4ZSVSzbawpcee9mJZi80iqJtqK+vl2JKagPEURI6WY1bTPSyPnkYiCjZoiM41YF8MryNC2q23nmkfUAcJnYz9Dg3N3cl+cOnqZovCkSUrMx2nI4KGOgRYPbxdkhVA0YikytF4sh9kyfBL6Mc0ReaamRrVtA/DWVCH6FjGRkZp0tKSr4jx23Nzc22zMzMoDqg9m9AHtzZgFrC6t/RJzEEIk5U+CRO2/2IawlOg4dIJJffXegt5EffjW6sDEBf3hqLkYvQf6MgD+bk5JyTRxE2E5Obi60RWzrdDYA5L/pIiwkk4sCrfHwgENhIkqXoZpHorzGRWGK68b8GKBf0DKCy5TegLHxO8oTcHlm5hJNKckDlcA7MQ5wM2UkoS93DID/gPj79Fwz2Htt6+E643K4xG0DfQKv5lDv+CUjMjAYG7f/NYgDK6302fDp8HFy2WQpXVusj/AMT2PEbeA0W2gj2azwAAAAASUVORK5CYII="
												width="17" height="14" alt="댓글달기 버튼 이미지">댓글달기
										</div> -->
										<div class="comments_85">
											<img
												src="<c:url value="/resources/images/user/store/storeCommentReport.png"/>"
												width="14" height="14" alt="신고하기 버튼 이미지">신고하기
										</div>

										<c:set var="storeNoV1" value="${user.storeNo}" />
										<c:set var="storeNoV2"
											value="${storeCommentVO.storeCommentWriter }" />
										<c:if test="${storeNoV1 eq storeNoV2}">

											<div class="comments_85" style="margin-bottom: 1px;">
												<form id="deleteComment" method="POST"
													action="delComment.do">

													<button type="submit" id="deleteComment">
														<img
															src="<c:url value="/resources/images/user/store/storeCommentDel.png"/>"
															width="14" height="14" alt="삭제하기 버튼 이미지">삭제하기
													</button>
													<input type="hidden"
														value="${storeCommentVO.storeCommentNo }"
														name="storeCommentNo" />
												</form>
											</div>
										</c:if>


									</div>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>
				<div class="comments_98">
					<br> <br> <br>
				</div>
			</div>
		</div>
		</div>
	</section>
	<%
		/* 공통 푸터 */
	%>
	<jsp:include page="/WEB-INF/views/user/include/footer.jsp" />
</body>
</html>