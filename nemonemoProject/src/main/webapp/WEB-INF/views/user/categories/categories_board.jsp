<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네 모든것 내 모든것!, 네모내모</title>
<!-- 공통 CSS -->
<link rel="stylesheet" href="<c:url value="/resources/css/user/common/common.css"/>">

<!-- 페이지 CSS  -->
<link rel="stylesheet" href="<c:url value="/resources/css/user/categories/categories_board.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/common/paging/paging.css"/>">


<!-- 라이브러리 -->
<script src="<c:url value="/resources/vendor/jquery/jquery-3.5.1.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/fontawesome/js/all.js"/>"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script> window.contextPath = "<c:url value="/"/>"</script>
<script src="<c:url value="/resources/js/user/common/common.js"/>"></script>


<!-- 해당 페이지 JS파일 -->
<script src="<c:url value="/resources/js/user/categories/categories_board.js"/>"></script>

</head>
<body>

<c:set var="productList" value="${vo.productList}"/>
<c:set var="pdImgArticleList" value="${vo.pdImgArticleList}"/>
<c:set var="selectedCate" value="${vo.selectedCategory}"/>
<%-- paging처리에 필요한 변수  --%>
<c:set var="pageName" value="${selectedCate.productCateNo}" scope="request"/> 
<c:set var="pageVO" value="${vo.pageVO}" scope="request"/> 

<c:forEach var="entry" items="${vo.categoryMap}">
	<c:set var="key" value="${entry.key}"/>
	<c:set var="value" value="${entry.value}"/>
	<c:if test="${key eq 'S'}"> 
		<c:set var="PdSmCateList" value="${value}"/>
	</c:if>
	<c:if test="${key eq 'M'}"> 
		<c:set var="PdMdCateList" value="${value}"/>
	</c:if>
	<c:if test="${key eq 'L'}"> 
		<c:set var="PdLgCateList" value="${value}"/>
	</c:if>
</c:forEach>

<c:if test="${selectedCate.productCateType eq 'L'}">
	<c:set var="selectedName" value="${selectedCate.productCateLarge}"/>
</c:if>
<c:if test="${selectedCate.productCateType eq 'M'}">
	<c:set var="selectedName" value="${selectedCate.productCateMedium}"/>
</c:if>
<c:if test="${selectedCate.productCateType eq 'S'}">
	<c:set var="selectedName" value="${selectedCate.productCateSmall}"/>
</c:if>




	<% 
		/* 공통 Header */
	%>
	<jsp:include page="/WEB-INF/views/user/include/top-menu.jsp"/>
	<%-- 
		/* 공통 Header */
	--%>
	<header class="sticky-top">
		<jsp:include page="/WEB-INF/views/user/include/header.jsp" />
		<jsp:include page="/WEB-INF/views/user/include/side-nav.jsp"/>		
	</header>
	<%-- 
		/* 각 페이지의 특성! */
	--%>
	<section>
		<div class="categories__area">
        <div class="category-head__area">
            <div class="category-head__div">
                <!-- 상단 메뉴 -->
                <div class="category-menu__div">
                    <div class="category-menu-home">
                        <i class="fas fa-home"></i>
                        홈
                    </div>
					<c:if test="${selectedCate.productCateType eq 'L' || selectedCate.productCateType eq 'M' || selectedCate.productCateType eq 'S'}">
	                    <div class="category-menu-cbox__item">
	                        <i class="fas fa-chevron-right"></i>
	                        <div class="category-menu-cbox__area">
	                            <div class="category-menu-cbox__div">
	                                <div class="category-menu-cbox__display">
                                  		<c:forEach var="lg" items="${PdLgCateList}">
		                                    	<c:if test="${selectedCate.productCateLarge eq lg.productCateLarge}">
		                                    		${lg.productCateLarge}
		                                    	</c:if>
                                    	</c:forEach> 
	                                    <i class="fas fa-chevron-down"></i>
	                                </div>
	                                <div class="category-menu-cbox__list">
	                                    <c:forEach var="lg" items="${PdLgCateList}">
	                                    	<c:if test="${selectedCate.productCateLarge eq lg.productCateLarge}">
	                                    		<div class="category-menu-cbox__item--active">${lg.productCateLarge}</div>
	                                    	</c:if>
	                                    	<c:if test="${selectedCate.productCateLarge ne lg.productCateLarge}">
	                                    		<a class="category-menu-cbox__item" href="<c:url value="/categories/${lg.productCateNo}.do"/>">${lg.productCateLarge}</a>
	                                    	</c:if>
	                                    </c:forEach>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
					</c:if>
					<c:if test="${selectedCate.productCateType eq 'M' || selectedCate.productCateType eq 'S'}">
	                    <div class="category-menu-cbox__item">
	                        <i class="fas fa-chevron-right"></i>
	                        <div class="category-menu-cbox__area">
	                            <div class="category-menu-cbox__div">
	                                <div class="category-menu-cbox__display">
                                  		<c:forEach var="md" items="${PdMdCateList}">
		                                    	<c:if test="${selectedCate.productCateMedium eq md.productCateMedium}">
		                                    		${md.productCateMedium}
		                                    	</c:if>
                                    	</c:forEach> 
	                                    <i class="fas fa-chevron-down"></i>
	                                </div>
	                                <div class="category-menu-cbox__list">
	                                    <c:forEach var="md" items="${PdMdCateList}">
	                                    	<c:if test="${selectedCate.productCateMedium eq md.productCateMedium}">
	                                    		<div class="category-menu-cbox__item--active">${md.productCateMedium}</div>
	                                    	</c:if>
	                                    	<c:if test="${selectedCate.productCateMedium ne md.productCateMedium}">
	                                    		<a class="category-menu-cbox__item" href="<c:url value="/categories/${md.productCateNo}.do"/>">${md.productCateMedium}</a>
	                                    	</c:if>
	                                    </c:forEach>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
					</c:if>
					<c:if test="${selectedCate.productCateType eq 'S'}">
	                    <div class="category-menu-cbox__item">
	                        <i class="fas fa-chevron-right"></i>
	                        <div class="category-menu-cbox__area">
	                            <div class="category-menu-cbox__div">
	                                <div class="category-menu-cbox__display">
                                  		<c:forEach var="sm" items="${PdSmCateList}">
		                                    	<c:if test="${productCateNo eq sm.productCateNo}">
		                                    		${sm.productCateSmall}
		                                    	</c:if>
                                    	</c:forEach> 
	                                    <i class="fas fa-chevron-down"></i>
	                                </div>
	                                <div class="category-menu-cbox__list">
	                                    <c:forEach var="sm" items="${PdSmCateList}">
	                                    	<c:if test="${selectedCate.productCateSmall eq sm.productCateSmall}">
	                                    		<div class="category-menu-cbox__item--active">${sm.productCateSmall}</div>
	                                    	</c:if>
	                                    	<c:if test="${selectedCate.productCateSmall ne sm.productCateSmall}">
	                                    		<a class="category-menu-cbox__item" href="<c:url value="/categories/${sm.productCateNo}.do"/>">${sm.productCateSmall}</a>
	                                    	</c:if>
	                                    </c:forEach>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
					</c:if>
                </div>

                <!-- 카테고리 서브 메뉴 -->
                <c:if test="${selectedCate.productCateType eq 'L'}">
	                <div class="category-sub__area">
	                    <div class="category-sub__list">
	                        <a class="category-sub__total-link" href="#">
	                           	 전체보기
	                            <i class="fas fa-chevron-right"></i>
	                        </a>
	                        <c:forEach items="${PdMdCateList}" var="sub">
		                        <div class="category-sub__item">
		                            <a class="category-sub__item-link" href="<c:url value="/categories/${sub.productCateNo}.do"/>">
		                                <div class="category-sub__item-name">
		                                    ${sub.productCateMedium}
		                                </div>
		                                <i class="fas fa-chevron-right"></i>
		                            </a>
		                        </div>
	                         </c:forEach>
	                    </div>
	                </div>
 				</c:if>
                <!-- 카테고리 서브 메뉴 -->
                <c:if test="${selectedCate.productCateType eq 'M'}">
	                <div class="category-sub__area">
	                    <div class="category-sub__list">
	                        <a class="category-sub__total-link" href="#">
	                           	 전체보기
	                            <i class="fas fa-chevron-right"></i>
	                        </a>
	                        <c:forEach items="${PdSmCateList}" var="sub">
		                        <div class="category-sub__item">
		                            <a class="category-sub__item-link" href="<c:url value="/categories/${sub.productCateNo}.do"/>">
		                                <div class="category-sub__item-name">
		                                    ${sub.productCateSmall}
		                                </div>
		                                <i class="fas fa-chevron-right"></i>
		                            </a>
		                        </div>
	                         </c:forEach>
	                    </div>
	                </div>
 				</c:if>
                <!-- 카테고리 추천 상품  제목-->
                <div class="category-rec-title__area">
                    <div class="category-rec-title__div">
                        <span class="category--empha">${selectedName}</span>
                        의 카테고리 상품
                        <!-- AD 마크 들어가는 부분-->
                    </div>
                </div>
                <!-- 카테고리 추천 상품 내용 -->
                <div class="category-rec-content__area">
                    <div class="category-rec-content__list">
                        <!-- 아이템 1개-->
                        <c:if test="${pdImgArticleList ne null}">
	                        <c:forEach items="${pdImgArticleList}" var="article">
		                        <div class="category-rec-content__item">
		                            <a href="<c:url value="/products/${article.productVO.productNo}.do"/>" class="category-rec-content__link">
		                                <div class="category-rec-content__image">
		                                <c:if test="${not empty article.productImageVO.productImgNo}">
		                                    <img src="<c:url value="/image/product/${article.productImageVO.productImgNo}.img"/>"/>
		                                </c:if>
		                                <c:if test="${empty article.productImageVO.productImgNo}">
		                                    <img src="<c:url value="/resources/images/user/categories/image_1.jpg"/>"/>
		                                </c:if>
		                                </div>
		                                <div class="category-rec-content__title">
		                                    <div class="category-rec-content__title-text">
		                                     	${article.productVO.productName}
		                                    </div>
		                                    <div class="category-rec-content__title-price">
		                                        <div class="category-rec-content__title-price--text">
													${article.productVO.productPrice}
												</div>
		                                    </div>
		                                    <!-- 광고마크 생략 -->
		                                </div>
		                                <div class="category-rec-content__location">
		                                    <i class="fas fa-map-marker-alt fa-2x"></i>
		                                    ${article.productVO.productDealArea}
		                                </div>
		                            </a>
		                        </div>
							</c:forEach>
						 </c:if>
						 <c:if test="${pdImgArticleList eq null}">
						 	<div class="category-nothing__div">
							 	<div class="iYNBvN">
							 		<div class="SEFjX">
			 			                <c:if test="${selectedCate.productCateType eq 'L'}">
							 				${selectedCate.productCateLarge}
							 			</c:if>
			 			                <c:if test="${selectedCate.productCateType eq 'M'}">
							 				${selectedCate.productCateMedium}
							 			</c:if>
			 			                <c:if test="${selectedCate.productCateType eq 'S'}">
							 				${selectedCate.productCateSmall}
							 			</c:if>
							 		</div> 카테고리에 대한 상품이 없습니다.
							 	</div>
						 	</div>
						 </c:if>
                    </div>
                </div>
                <%-- 페이징처리에 필요한 변수  --%>
				<jsp:include page="/WEB-INF/views/common/paging/paging.jsp"/>
            </div>
        </div>
    </div>
	</section>
	<% 
		/* 공통 푸터 */
	%>
	<jsp:include page="/WEB-INF/views/user/include/footer.jsp"/>
</body>
</html>