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
	href="<c:url value="/resources/css/user/store/favorites/favorites.css?v=<%=System.currentTimeMillis()%>"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/store/common/store_header.css?v=<%=System.currentTimeMillis() %>"/>">


<!-- 라이브러리 -->
<script src="<c:url value="/resources/vendor/jquery/jquery-3.5.1.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/fontawesome/js/all.js"/>"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
		<div class="center_all">
			<div class="fa_1">
				<jsp:include
					page="/WEB-INF/views/user/store/common/store_header.jsp" />
				<div class="sc-dCVVYJ dYImYF">
					<div class="sc-vBKru hEaZqn">
						<div class="fa_55">
							<a class="fa_56" style="font-size: 14px;"
								href="${pageContext.request.contextPath}/shop/${storeVO.storeNo }/products.do">상품
								<span class="fa_57">${fn:length(storeProductVO)}</span>
							</a> <a class="fa_58" style="font-size: 14px;"
								href="${pageContext.request.contextPath}/shop/${storeVO.storeNo }/comments.do">상점문의
								<span class="fa_59">${fn:length(storeCommentVO)}</span>
							</a> <a class="fa_60" style="font-size: 14px;"
								href="${pageContext.request.contextPath}/shop/${storeVO.storeNo }/favorites.do">찜
								<span class="fa_61">${fn:length(storeFavoriteVO)}</span>
							</a> <a class="fa_62" style="font-size: 14px;"
								href="${pageContext.request.contextPath}/shop/${storeVO.storeNo }/reviews.do">상점후기
								<span class="fa_63">${fn:length(storeReviewVO)}</span>
							</a>
						</div>
					</div>

					<div class="fa_68">
						<div>
							찜 <span class="fa_69">${fn:length(storeFavoriteVO)}</span>
						</div>
					</div>
					<div class="fa_70">
						<div class="fa_71">
							
						</div>
						<div class="fa_80">
							<c:forEach var="storeFavoriteVO" items="${storeFavoriteVO}">
								<div class="fa_81">
									<a class="fa_82" href="${pageContext.request.contextPath}/products/${storeFavoriteVO.productNo }.do">
										<div class="fa_83">
											<!-- <div class="fa_84"></div> -->
										</div>
										<div class="fa_85">
											<img
												src="<c:url value="/resources/images/user/store/storeProfile.png"/>"
												alt="상품 이미지">
										</div>
										<div class="fa_86">
											<div class="fa_87">
												<div class="fa_88">${storeFavoriteVO.productName}</div>
												<div class="fa_89">
													<div>${storeFavoriteVO.productPrice}</div>
												</div>
												<div class="fa_90">${storeFavoriteVO.productRegDt}</div>
											</div>
											<div class="fa_91">
												<img
													src="<c:url value="/resources/images/user/store/storeLocation.png"/>"
													width="13" height="15" alt="위치 아이콘">${storeFavoriteVO.productDealArea}</div>
										</div>
									</a>
								</div>
							</c:forEach>
						</div>
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