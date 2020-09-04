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
<title>네모내모</title>
<!-- 공통 CSS -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/common/common.css"/>">

<!-- 페이지 CSS  -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/store/reviews/reviews.css?v=<%=System.currentTimeMillis()%>"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/store/common/store_header.css?v=<%=System.currentTimeMillis()%>"/>">
<link rel="shortcut icon" href="<c:url value="/resources/images/common/logo/favicon.png"/>">

<!-- 라이브러리 -->
<script src="<c:url value="/resources/vendor/jquery/jquery-3.5.1.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/fontawesome/js/all.js"/>"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="<c:url value="/resources/js/user/common/common.js"/>"></script>
<script>this.contextPath = "<c:url value="/"/>"</script>

<!-- 해당 페이지 JS파일 -->
<script
	src="<c:url value="/resources/js/user/store/reviews/reviews.js"/>"></script>

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
			<div class="rv_1">
				<jsp:include
					page="/WEB-INF/views/user/store/common/store_header.jsp" />
				<div class="sc-dCVVYJ dYImYF">
					<div class="sc-vBKru hEaZqn">
						<div class="rv_55">
							<a class="rv_56" style="font-size: 14px;"
								href="${pageContext.request.contextPath}/shop/${storeVO.storeNo }/products.do">상품
								<span class="rv_57">${fn:length(storeProductVO)}</span>
							</a> <a class="rv_58" style="font-size: 14px;"
								href="${pageContext.request.contextPath}/shop/${storeVO.storeNo }/comments.do">상점문의
								<span class="rv_59">${fn:length(storeCommentVO)}</span>
							</a> <a class="rv_60" style="font-size: 14px;"
								href="${pageContext.request.contextPath}/shop/${storeVO.storeNo }/favorites.do">찜
								<span class="rv_61">${fn:length(storeFavoriteVO)}</span>
							</a> <a class="rv_62" style="font-size: 14px;"
								href="${pageContext.request.contextPath}/shop/${storeVO.storeNo }/reviews.do">상점후기
								<span class="rv_63">${fn:length(storeReviewVO)}</span>
							</a>
						</div>
					</div>




				</div>

				<div class="rv_100">
					<div class="rv_101">
						<div>
							상점후기 <span class="rv_102">${fn:length(storeReviewVO)}</span>
						</div>
					</div>
					<c:forEach var="storeReviewVO" items="${storeReviewVO}">
						<div class="sc-zDqdV kckyLf">
							<div class="rv_103">
								<div class="rv_104">
								<img
									src="<c:url value="/resources/images/user/store/storeProfile.png"/>"
									width="60" height="60" alt="로딩 이미지"></div>
								<div class="rv_105">
									<div class="rv_106">
										<div class="rv_107">
											<div class="rv_108" 
												style="font-size: 15px;"> ${storeReviewVO.storeName } 
											</div>
											<div class="rv_110">
												<jsp:useBean id="now" class="java.util.Date" />
												<fmt:parseNumber
													value="${storeReviewVO.storeReviewRegDt.time}"
													integerOnly="true" var="oldDays" scope="request" />
												<fmt:parseNumber value="${now.time}" integerOnly="true"
													var="nowDays" scope="page" />

												<c:choose>
													<c:when test="${nowDays-oldDays < (1000*60)}">
														<fmt:parseNumber value="${(nowDays-oldDays) / (1000)}"
															integerOnly="true" var="secDate" />
														<c:out value="${secDate}" /> 초 전
                                                    	</c:when>
													<c:when test="${(nowDays-oldDays) < (1000*60*60)}">
														<fmt:parseNumber value="${(nowDays-oldDays) / (1000*60)}"
															integerOnly="true" var="minDate" />
														<c:out value="${minDate}" /> 분 전
                                                    	</c:when>
													<c:when test="${(nowDays-oldDays) < (1000*60*60*24)}">
														<fmt:parseNumber
															value="${(nowDays-oldDays) / (1000*60*60)}"
															integerOnly="true" var="hourDate" />
														<c:out value="${hourDate}" /> 시간 전
                                                    	</c:when>
													<c:otherwise>
														<fmt:parseNumber
															value="${(nowDays-oldDays) / (1000*60*60*24)}"
															integerOnly="true" var="dayDate" />
														<c:out value="${dayDate }" /> 일 전
                                                    	</c:otherwise>
												</c:choose>
											</div>
										</div>
										<div class="rv_111">
											<div class="rv_112">
												<jsp:include
													page="/WEB-INF/views/user/products/common/rating.jsp">
													<jsp:param value="${storeReviewVO.storeReviewRating}"
														name="rating" />
												</jsp:include>
											</div>
										</div>
									</div>
									<a class="rv_113" href="${pageContext.request.contextPath}/products/${storeReviewVO.productNo }.do"><button
											class="rv_114">
											${storeReviewVO.productName } 
											<img
												src="<c:url value="/resources/images/user/store/storeReviewArrow.png"/>"
												width="6" height="10" alt="화살표 아이콘">
										</button></a>
									<div class="rv_115">${storeReviewVO.storeReviewContent }</div>
									<div class="rv_116">
										<a class="rv_117"><img
											src="<c:url value="/resources/images/user/store/storeReviewReport.png"/>"
											width="14" height="14" alt="신고하기 버튼 아이콘">신고하기</a>
									</div>
								</div>
							</div>
							
						</div>
					</c:forEach>
					<div class="rv_128"></div>
					<div class="rv_131">
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