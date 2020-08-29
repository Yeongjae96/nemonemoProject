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
<link rel="stylesheet" href="<c:url value="/resources/css/user/search/search_board.css"/>">
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
<script src="<c:url value="/resources/js/user/search/search_board.js"/>"></script>
</head>
<body>

	<!--  필수 변수  -->
	<c:set var="pageVO" value="${vo.pageVO}"/>
	<c:set var="pageName" value="products" scope="request"/>
	
	<%-- 상품 꺼내기 --%>
	<c:set var="pdList" value="${vo.pdPdImgList}" />
	<c:if test="${vo.selectedCategory != null}">
		<c:set var="selectedCate" value="${vo.selectedCategory}"/>
	</c:if>
	<%-- <c:if test="${vo.searchedCateMap != null}">
		<c:forEach var="entry" items="${vo.searchedCateMap}">
			<c:set var="key" value="${entry.key}" />
			<c:set var="value" value="${entry.value}" />
			<c:if test="${key eq 'small'}">
				<c:set var="PdSmCateList" value="${value}" />
			</c:if>
			<c:if test="${key eq 'medium'}">
				<c:set var="PdMdCateList" value="${value}" />
			</c:if>
			<c:if test="${key eq 'large'}">
				<c:set var="PdLgCateList" value="${value}" />
			</c:if>
		</c:forEach>
	</c:if> --%>
	<c:set var="searchedCateList" value="${vo.searchedCateList}" />
	
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
		<div class="search__area">
			<div class="search__div">
				<div class="search-search__area">
					<c:if test="${not empty PdSmCateList}">
						<div class="search-search__div">
							<div class="search-search--title">카테고리</div>
							<div class="search-search__list">
							<!-- 아이템 1개 -->
								<c:forEach var="sm" items="${PdSmCateList}">
									<a class="search-search__item" href="#">
										<div class="search-search__prev">
											${sm.productCateLarge} <i class="fas fa-chevron-right"></i>
										</div>
										<div class="search-search__next">${sm.productCateSmall}
										</div>
										<div class="search-search__count">${fn:length(PdSmCateList)}</div>
									</a>
								</c:forEach>
							</div>
						</div>
					</c:if>
				</div>
				
			<c:if test="${selectedCate.productCateType != null}">
			<!-- 카테고리 메뉴 버튼 -->
				<div class="search-search-menu__btn">
					<a class="search-search-menu__link" href="javascript:history.go(-1);"> <i
						class="fas fa-chevron-left"></i>이전 카테고리
					</a> <a class="search-reset__btn" href="<c:url value="/search/products.do?q=${param.q}"/>" > <i class="fas fa-undo"></i>
						초기화
					</a>
				</div>
			</c:if>
		<!-- 카테고리 메뉴 -->
			<div class="search-search-sub__area">
					<div class="search-search-sub__div">
						<!-- 아이템 1개 -->
						<c:if test="${selectedCate.productCateType != 'S'}">
							<c:forEach var="lg" items="${searchedCateList}">
								<div class="search-search-sub__item">
									<a class="search-search-sub__item-link" href="<c:url value="/search/products.do?q=${param.q}&order=date&pageNo=1&categoryNo=${lg.productCateNo}"/>">
										<c:choose>
											<c:when test="${selectedCate.productCateType == 'L'}">
												<div class="search-search-sub__item-title">${lg.productCateMedium}</div>
											</c:when>
											<c:when test="${selectedCate.productCateType == 'M'}">
												<div class="search-search-sub__item-title">${lg.productCateSmall}</div>
											</c:when>
											<c:otherwise>
												<div class="search-search-sub__item-title">${lg.productCateLarge}</div>
											</c:otherwise>
										</c:choose>
										<div class="search-search-sub__item-count">${lg.productCateCnt}</div>
									</a>
								</div>
							</c:forEach>
						</c:if>
					</div>
			</div>
		<!-- 제목 영역-->
		<div class="search-title__area">
			<div class="search-title__div">
				<div class="search-title__left">
					<c:if test="${selectedCate == null}">
						<span class="search--empha">${param.q}</span> 의 검색결과
						<span class="search--count">${vo.productCnt}개</span>
					</c:if>
					<c:if test="${selectedCate != null}">
						<c:choose>
							<c:when test="${selectedCate.productCateType == 'L' }">
								<span class="search--empha">${selectedCate.productCateLarge}</span> 의 검색결과
								<span class="search--count">${vo.productCnt}개</span>
							</c:when>
							<c:when test="${selectedCate.productCateType == 'M' }">
								${selectedCate.productCateLarge} > <span class="search--empha" style="margin: 0px 5px;">${selectedCate.productCateMedium}</span> 의 검색결과
								<span class="search--count">${vo.productCnt}개</span>
							</c:when>
							<c:when test="${selectedCate.productCateType == 'S' }">
								${selectedCate.productCateLarge} > ${selectedCate.productCateMedium} > <span class="search--empha" style="margin: 0px 5px;">${selectedCate.productCateSmall}</span> 의 검색결과
								<span class="search--count">${vo.productCnt}개</span>
							</c:when>
						</c:choose>
						
					</c:if>
				</div>
				<c:if test="${not empty vo.pdPdImgList}">	
					<div class="search-sort__right">
						<div class="search-sort__item">최신순</div>
						<!-- <div class="search-sort__item">인기순</div> -->
						<div class="search-sort__item">저가순</div>
						<div class="search-sort__item">고가순</div>
					</div>
				</c:if>
			</div>
		</div>

		<!-- 내용내용 -->
		<div class="search-content__area">
			<c:if test="${empty vo.pdPdImgList}">
				<div class="search-body__area">
	                <div class="search-body__div">
	                    <div class="search-body--title">
	                        <div class="search-body--keyword">${param.q}</div>
	                        에 대한 검색결과가 없습니다.
	                    </div>
	                    <div class="search-body--content">
	                        - 단어의 철자가 정확한지 확인해 보세요<br>- 보다 일반적인 검색어로 다시 검색해 보세요<br>- 검색어의 띄어쓰기를 다르게 해보세요<br>- 유해/금지어가 아닌지 확인해주세요
	                    </div>
	                </div>
	            </div>
            </c:if>
			<c:if test="${not empty vo.pdPdImgList}">
				<div class="search-content__list">
					<!-- 아이템 1개-->
					<c:forEach var="pd" items="${pdList}">
						<div class="search-content__item">
							<a href="<c:url value="/products/${pd.productVO.productNo}.do"/>" class="search-content__link">
								<div class="search-content__image">
									<img src="<c:url value="/image/product/${pd.productImgVO.productImgNo}.img"/>" alt="상품이미지" />
								</div>
								<div class="search-content__title">
									<div class="search-content__title-text">${pd.productVO.productName}</div>
									<div class="search-content__title-price">
										<div class="search-content__title-price--text">${pd.productVO.productPrice}</div>
									</div>
								</div>
								<div class="search-content__location">
									<i class="fas fa-map-marker-alt fa-2x"></i>${pd.productVO.productDealArea}
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
			 </c:if>
		</div>

		<!-- 페이징 부분 -->
		<%-- 페이징처리에 필요한 변수  --%>
		<jsp:include page="/WEB-INF/views/common/paging/paging.jsp"/>

		</div>
		</div>
	</section>
	<% 
		/* 공통 푸터 */
	%>
	<jsp:include page="/WEB-INF/views/user/include/footer.jsp" />
</body>
</html>