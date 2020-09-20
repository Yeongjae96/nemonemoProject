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
<title>네모내모 | 내상점</title>
<!-- 공통 CSS -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/common/common.css"/>">

<!-- 페이지 CSS  -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/store/products/products.css?v=<%=System.currentTimeMillis()%>"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/store/common/store_header.css?v=<%=System.currentTimeMillis()%>"/>">
<link rel="shortcut icon" href="<c:url value="/resources/images/common/logo/favicon.png"/>">


<!-- 라이브러리 -->
<script>window.contextPath = '<c:url value="/"/>';</script>
<script src="<c:url value="/resources/vendor/jquery/jquery-3.5.1.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/fontawesome/js/all.js"/>"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="<c:url value="/resources/js/user/common/common.js"/>"></script>
<script src="<c:url value="/resources/js/user/store/store_header.js"/>"></script>
<script>this.contextPath = "<c:url value="/"/>"</script>

<!-- 해당 페이지 JS파일 -->
<script
	src="<c:url value="/resources/js/user/store/products/products.js"/>"></script>

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

		<div class="product_all">
			<div class="product_all2">
				<jsp:include
					page="/WEB-INF/views/user/store/common/store_header.jsp" />
				<div class="sc-dCVVYJ dYImYF">
					<div class="sc-vBKru hEaZqn">
						<div class="product_all56">
							<a class="product_all57" style="font-size: 14px;"
								href="${pageContext.request.contextPath}/shop/${storeVO.storeNo }/products.do">상품
								<span class="product_all58">${fn:length(storeProductVO)}</span>
							</a> <a class="product_all59" style="font-size: 14px;"
								href="${pageContext.request.contextPath}/shop/${storeVO.storeNo }/comments.do">상점문의
								<span class="product_all60">${fn:length(storeCommentVO)}</span>
							</a> <a class="product_all61" style="font-size: 14px;"
								href="${pageContext.request.contextPath}/shop/${storeVO.storeNo }/favorites.do">찜
								<span class="product_all62">${fn:length(storeFavoriteVO)}</span>
							</a> <a class="product_all63" style="font-size: 14px;"
								href="${pageContext.request.contextPath}/shop/${storeVO.storeNo }/reviews.do">상점후기
								<span class="product_all64">${fn:length(storeReviewVO)}</span>
							</a>

						</div>
					</div>
					<div class="sc-kIXKos cxqMue">
						<div class="product_all69">
							<div class="product_all70">
								<div>
									상품 <span class="product_all71">${fn:length(storeProductVO)}</span>
								</div>
								<div class="product_all72"></div>
							</div>

							<div class="product_all78">
								<div class="product_all79">
									<div class="product_all80">
										<div class="product_all81">
											<div>전체</div>
											<div class="product_all82">${fn:length(storeProductVO)}개</div>
										</div>
									</div>
								</div>


								<!------------------------- 상품 영역 ----------------------------->
								<div class="product_all88" id="result">
									<c:forEach var="storeProductVO" items="${storeProductVO}">
										<div class="product_all89">
											<a data-pid="128683129" class="product_all90"
												href="${pageContext.request.contextPath}/products/${storeProductVO.productNo }.do">
												<div class="product_all91">
													<img
														src="<c:url value="/resources/images/user/store/storeProfile.png"/>"
														alt="상품 이미지" style="width: 100%">
												</div>
												<div class="product_all92">
													<div class="product_all93">${storeProductVO.productName }</div>
													<div class="product_all94">
														<div class="product_all95">${storeProductVO.productPrice }</div>
														<div class="product_all96">
															<span>${storeProductVO.productRegDt }</span>
														</div>
													</div>
												</div>
												<div class="product_all97">
													<img
														src="<c:url value="/resources/images/user/store/storeLocation.png"/>"
														width="13" height="15" alt="위치 아이콘">${storeProductVO.productDealArea }
												</div>
											</a>
										</div>
									</c:forEach>
								</div>

								<div class="product_all98"></div>
							</div>
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