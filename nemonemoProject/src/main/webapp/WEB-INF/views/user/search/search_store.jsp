<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네 모든것 내 모든것!, 네모내모</title>
<!-- 공통 CSS -->
<link rel="stylesheet" href="<c:url value="/resources/css/user/common/common.css"/>">

<!-- 페이지 CSS  -->
<link rel="stylesheet" href="<c:url value="/resources/css/user/search/search_store.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/common/paging/paging.css"/>">

<!-- 라이브러리 -->
<script
	src="<c:url value="/resources/vendor/jquery/jquery-3.5.1.min.js"/>"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="<c:url value="/resources/vendor/fontawesome/js/all.js"/>"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script> window.contextPath = "<c:url value="/"/>"</script>
<script src="<c:url value="/resources/js/user/common/common.js"/>"></script>

<!-- 해당 페이지 JS파일 -->
<script src="<c:url value="/resources/js/user/search/search_store.js"/>"></script>
</head>
<body>

	<!--  필수 변수  -->
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
	
	<div class="store-search-area">
		<div class="store-search-width">
			<div class="store-search-mb">
				<div class="store-search-title">
					검색결과
					<span id="searchCnt">
						<c:if test="${vo.storeCnt == 0}">
							없음
						</c:if>
						<c:if test="${vo.storeCnt != 0}">
							${vo.storeCnt}개
						</c:if>
					</span>
				</div>
				<c:if test="${vo.storeCnt > 0}">
					<c:forEach var="store" items="${vo.searchStoreList}">
						<a class="store-search-item" href="<c:url value="/shop/${store.storeNo}/products.do"/>">
							<div class="store-image-area">
								<c:if test="${store.storeImgNo == -1}">
									<img src="<c:url value="/resources/images/user/products/store_1.png"/>" alt="기본 이미지">
								</c:if>
								<c:if test="${store.storeImgNo != -1}">
									<img src="<c:url value="/image/store/${store.storeImgNo}"/>" alt="프로필 이미지"/>
								</c:if>
							</div>
							<div class="store-info-area">
								<div class="store-info-title">
									${store.storeName}
								</div>
								<div class="store-info-content">
									<div class="store-info-product">
										상품<b>${store.storeProductCnt}</b>
									</div>
									<div class="store-info-review">
										후기수
										<b>${store.storeReviewCnt}</b>
									</div>
									<div class="store-info-rating">
										평점
										<div class="store-info-stars">
											<jsp:include page="/WEB-INF/views/user/products/common/rating.jsp">
		                                      <jsp:param value="${store.storeRating}" name="rating"/>
		                                    </jsp:include>
										</div>
									</div>
								</div>
							</div>
							<div class="store-go-area"> 
								<button class="store-go-btn" data-location="<c:url value="/shop/${store.storeNo}/products.do"/>">
									<i class="fas fa-store"></i>
									상점 찾아가기
								</button>
							</div>
						</a>
					</c:forEach>
				</c:if>
				<c:if test="${vo.storeCnt == 0}">
					<div class="store-nothing-area">
						<p class="store-nothing-text">
							- 단어의 철자가 정확한지 확인해 보세요<br>- 보다 일반적인 검색어로 다시 검색해 보세요<br>- 검색어의 띄어쓰기를 다르게 해보세요<br>- 유해/금지어가 아닌지 확인해주세요
						</p>
					</div>
				</c:if>
			</div>
		</div>
	</div>
		<!-- 페이징 부분 -->
		<%-- 페이징처리에 필요한 변수  --%>
		<jsp:include page="/WEB-INF/views/common/paging/paging.jsp"/>
	</section>
	<% 
		/* 공통 푸터 */
	%>
	<jsp:include page="/WEB-INF/views/user/include/footer.jsp" />
</body>
</html>