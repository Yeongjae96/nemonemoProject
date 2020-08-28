<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="commentList" value="${vo.commentList}"/>
<c:set var="productVO" value="${vo.selectedProduct.productVO}"/>
<c:set var="productImgList" value="${vo.selectedProduct.productImgList}"/>
<c:set var="selectedCate" value="${vo.selectedProduct.productCateVO}"/>
<c:set var="favoriteList" value="${vo.favoriteList}"/>

<c:if test="${user != null}">	
	<c:forEach var="fa" items="${favoriteList}">
		<c:if test="${user.userNo == fa.favoriteSender}">
			<c:set var="zzimStatus" value="true"/>
		</c:if>
	</c:forEach>
	<c:if test="${user.userNo == productVO.productSeller}">
		<c:set var="myproduct" value="true"/>
	</c:if>
</c:if>



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


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네모내모 | ${vo.selectedProduct.productVO.productName}</title>
<!-- 공통 CSS -->
<link rel="stylesheet" href="<c:url value="/resources/css/user/common/common.css"/>">

<!-- 페이지 CSS  -->
<link rel="stylesheet" href="<c:url value="/resources/css/user/products/products_article.css"/>">


<!-- 라이브러리 -->
<script src="<c:url value="/resources/vendor/jquery/jquery-3.5.1.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/fontawesome/js/all.js"/>"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>this.contextPath = "<c:url value="/"/>"</script>
<script src="<c:url value="/resources/js/user/common/common.js"/>"></script>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v8.0&appId=308411826950117&autoLogAppEvents=1" nonce="GguEtP2Q"></script>
<%-- 카카오링크  --%>
<script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>

<!-- 해당 페이지 JS파일 -->
<script src="<c:url value="/resources/js/user/products/products_article.js"/>"></script>


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
		<div class="detail__area">
        <div class="detail__div">
            <!-- 상단 메뉴 -->
            <div class="detail-menu__div">
                <div class="detail-menu-home">
                    <i class="fas fa-home"></i>
                  	  홈
                </div>
				<c:if test="${selectedCate.productCateType eq 'L' || selectedCate.productCateType eq 'M' || selectedCate.productCateType eq 'S'}">
	                <div class="detail-menu-cbox__item">
	                    <i class="fas fa-chevron-right"></i>
	                    <div class="detail-menu-cbox__area">
	                        <div class="detail-menu-cbox__div">
	                            <div class="detail-menu-cbox__display">
	                            	${selectedCate.productCateLarge}
	                                <i class="fas fa-chevron-down"></i>
	                            </div>
	                            <div class="detail-menu-cbox__list">
	                            <c:forEach var="lg" items="${PdLgCateList}">
	                                <c:if test="${selectedCate.productCateLarge eq lg.productCateLarge}">
	                                	<div class="detail-menu-cbox__item--active">${lg.productCateLarge}</div>
	                                </c:if>
	                                <c:if test="${selectedCate.productCateLarge ne lg.productCateLarge}">
		                                <a href="<c:url value="/categories/${lg.productCateNo}.do"/>" class="detail-menu-cbox__item">${lg.productCateLarge}</a>
	                                </c:if>
	                           </c:forEach>
	                            </div>
	                        </div>
	                    </div>
	                </div>
				</c:if>
				<c:if test="${selectedCate.productCateType eq 'M' || selectedCate.productCateType eq 'S'}">
	                <div class="detail-menu-cbox__item">
	                    <i class="fas fa-chevron-right"></i>
	                    <div class="detail-menu-cbox__area">
	                        <div class="detail-menu-cbox__div">
	                            <div class="detail-menu-cbox__display">
	                                ${selectedCate.productCateMedium}
	                                <i class="fas fa-chevron-down"></i>
	                            </div>
	                            <div class="detail-menu-cbox__list">
		                            <c:forEach var="md" items="${PdMdCateList}">
		                            	<c:if test="${selectedCate.productCateMedium eq md.productCateMedium}">
		                                	<div class="detail-menu-cbox__item--active">${md.productCateMedium}</div>
		                            	</c:if>
		                            	<c:if test="${selectedCate.productCateMedium ne md.productCateMedium}">
	                                   		<a class="detail-menu-cbox__item" href="<c:url value="/categories/${md.productCateNo}.do"/>">${md.productCateMedium}</a>
	                                   	</c:if>
		                            </c:forEach>
	                            </div>
	                        </div>
	                    </div>
	                </div>
                </c:if>
                
				<c:if test="${selectedCate.productCateType eq 'S'}">
	                <div class="detail-menu-cbox__item">
	                    <i class="fas fa-chevron-right"></i>
	                    <div class="detail-menu-cbox__area">
	                        <div class="detail-menu-cbox__div">
	                            <div class="detail-menu-cbox__display">
	                                ${selectedCate.productCateSmall}
	                                <i class="fas fa-chevron-down"></i>
	                            </div>
	                            <div class="detail-menu-cbox__list">
		                            <c:forEach var="sm" items="${PdSmCateList}">
		                            	<c:if test="${selectedCate.productCateSmall eq sm.productCateSmall}">
		                                	<div class="detail-menu-cbox__item--active">${sm.productCateSmall}</div>
		                            	</c:if>
		                            	<c:if test="${selectedCate.productCateSmall ne sm.productCateSmall}">
	                                   		<a class="detail-menu-cbox__item" href="<c:url value="/categories/${sm.productCateNo}.do"/>">${sm.productCateSmall}</a>
	                                   	</c:if>
		                            </c:forEach>
	                            </div>
	                        </div>
	                    </div>
	                </div>
                </c:if>
            </div>

            <!-- 상품 정보 -->
            <div class="detail-info__area">
                <div class="detail-info__div">
                    <div class="detail-info__image__div">
                        <!-- 이미지 리스트 -->
                        <div class="detail-info__image__list">
                            <!-- 상세 상품 이미지 1장-->
                            <c:forEach var="img" items="${productImgList}" varStatus="st">
                            	<c:if test="${st.first}"> 
	                            	<img class="detail-info__image__item image--active" src="/image/product/${img.productImgNo}.img" alt="상세 상품 이미지" />
	                            </c:if>
	                            <c:if test="${not st.first}">
		                            <img class="detail-info__image__item" src="/image/product/${img.productImgNo}.img" alt="상세 상품 이미지" />
	                            </c:if>
	                            <div class="detail-info__image__watermark"></div>
								
	                            <!-- 이전 버튼 -->
	                            <button direction="prev" class="detail-info__image--prev">
	                                <i class="fas fa-chevron-left fa-2x"></i>
	                            </button>
	                            <!-- 다음 버튼 -->
	                            <button direction="next" class="detail-info__image--next">
	                                <i class="fas fa-chevron-right fa-2x"></i>
	                            </button>
	                            <!-- 확대 버튼-->
	                            <button class="detail-info__image--enlg">
	                                <i class="fas fa-search"></i>
	                             	  확대
	                            </button>
							</c:forEach>
								
	                            <!-- 이미지 개수 ~ -->
	                            <div class="detail-info__image-count">
	                            	<c:forEach begin="0" end="${fn:length(productImgList)-1}" varStatus="st">
	                            		<c:if test="${st.first}">
			                                <button disabled class="detail-info__image-count-btn count--active"></button>
	                            		 </c:if>
	                            		<c:if test="${not st.first}">
			                                <button class="detail-info__image-count-btn"></button>
	                            		 </c:if>
	                            	</c:forEach>
	                            </div>
                            <!-- 이미지 모달 -->
                            <div class="enlarge-modal__area">
                                <div class="enlarge-modal__div">
                                    <button class="enlarge-modal__close-btn">
                                        <i class="fas fa-times"></i>
                                    </button>
                                    <div class="enlarge-modal__div2">
                                        <div class="enlarge-modal--title">
                                            프로피쿡 디지털 에어프라이어 튀김기 보토 필립스 전기오븐렌지
                                        </div>
                                        <div class="enlarge-modal--list">
                                            <!-- 이미지 한개 -->
                                            <div class="enlarge-modal--item">
                                                <img src="<c:url value="/resources/images/user/products/product_1.jpg"/>" alt="리뷰 이미지">
                                                <div class="enlarge-modal--watermark">
                                                </div>
                                            </div>
                                            <div class="enlarge-modal--item">
                                                <img src="<c:url value="/resources/images/user/products/product_2.jpg"/>" alt="리뷰 이미지">
                                                <div class="enlarge-modal--watermark">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 아래 페이지 -->
                                        <div class="enlarge-modal--count-list">
                                            <button class="enlarge-modal--count-item--active">
                                            </button>
                                            <button class="enlarge-modal--count-item">
                                            </button>
                                            <button class="enlarge-modal--count-item">
                                            </button>
                                            <button class="enlarge-modal--count-item">
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="detail-info__text__div">
                        <div class="detail-info__text__div2">
                            <div class="detail-info__text__div3">
                                <div class="detail-info__text-header">
                                    <div class="detail-info__text-title">
                                    	${productVO.productName}
                                    </div>
                                    <div class="detail-info__text-price__div">
                                        <div class="detail-info__price"><fmt:formatNumber value="${productVO.productPrice}" pattern="#,###"/><span>원</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="detail-info__text-body">
                                    <div class="detail-info__text-body-top">
                                        <!-- 찜, 조회수, 시간 -->
                                        <div class="detail-info__text-body-topL">
                                            <div class="detail-info--topL-item">
                                                <i class="fas fa-heart"></i>
                                                <div id="zzimCount">
                                                   	${fn:length(favoriteList)}
                                                </div>
                                            </div>
                                            <div class="detail-info--topL-item">
                                                <i class="fas fa-eye"></i>
                                                <div id="viewCount">
                                                    ${productVO.productView}
                                                </div>
                                            </div>
                                            <div class="detail-info--topL-item">
                                                <i class="fas fa-clock"></i>
                                                <div class="">
                                                	<jsp:useBean id="now" class="java.util.Date"/>
                                                    <fmt:parseNumber value="${productVO.productRegDt.time}" integerOnly="true" var="oldDays" scope="request"/>
                                                    <fmt:parseNumber value="${now.time}" integerOnly="true" var="nowDays" scope="page"/>
                                                    
                                                    <c:choose>
                                                    	<c:when test="${nowDays-oldDays < (1000*60)}">
                                                    		<fmt:parseNumber value="${(nowDays-oldDays) / (1000)}" integerOnly="true" var="secDate"/>
                                                    		<c:out value="${secDate}"/> 초전
                                                    	</c:when>
                                                    	<c:when test="${(nowDays-oldDays) < (1000*60*60)}">
                                                    		<fmt:parseNumber value="${(nowDays-oldDays) / (1000*60)}" integerOnly="true" var="minDate"/>
                                                    		<c:out value="${minDate}"/> 분전
                                                    	</c:when>
                                                    	<c:when test="${(nowDays-oldDays) < (1000*60*60*24)}">
                                                    		<fmt:parseNumber value="${(nowDays-oldDays) / (1000*60*60)}" integerOnly="true" var="hourDate"/>
                                                    		<c:out value="${hourDate}"/> 시간전
                                                    	</c:when>
                                                    	<c:otherwise>
                                                    		<fmt:parseNumber value="${(nowDays-oldDays) / (1000*60*60*24)}" integerOnly="true" var="dayDate"/>
                                                    		<c:out value="${dayDate }"/> 일전
                                                    	</c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                        <button class="detail-info__text-body-topR">
                                            <i class="fas fa-lightbulb fa-"></i>
                                            신고하기
                                        </button>
                                    </div>
                                    <div class="detail-info__text-body-bottom">
                                        <!-- 아이템 한개 -->
                                        <div class="detail-info__text-body-bItem">
                                            <div class="detail-info__text-body-bItem-title">
                                                상품상태
                                            </div>
                                            <div class="detail-info__text-body-bItem-content">
                                                <c:if test="${productVO.productUsedSt eq 'N'}">
                                                	새상품
                                                </c:if>
                                                <c:if test="${productVO.productUsedSt eq 'Y'}">
                                                	중고상품
                                                </c:if>
                                            </div>
                                        </div>
                                        <!-- 아이템 한개 -->
                                        <div class="detail-info__text-body-bItem">
                                            <div class="detail-info__text-body-bItem-title">
                                                교환여부
                                            </div>
                                            <div class="detail-info__text-body-bItem-content">
                                               <c:if test="${productVO.productExchSt eq 'Y'}">
                                               		교환가능
                                               </c:if>
                                               <c:if test="${productVO.productExchSt eq 'N'}">
                                               		교환불가능
                                               </c:if>
                                            </div>
                                        </div>
                                        <!-- 아이템 한개 -->
                                        <div class="detail-info__text-body-bItem">
                                            <div class="detail-info__text-body-bItem-title">
                                                배송비
                                            </div>
                                            <div class="detail-info__delivery">
                                                <c:if test="${productVO.productFreeShippingSt eq 'Y'}">
                                                	무료배송
                                                </c:if>
                                                <c:if test="${productVO.productFreeShippingSt eq 'N'}">
                                                	배송비 별도
                                                </c:if>
                                            </div>
                                        </div>
                                        <!-- 아이템 한개 -->
                                        <div class="detail-info__text-body-bItem">
                                            <div class="detail-info__text-body-bItem-title">
                                                거래지역
                                            </div>
                                            <div class="detail-info__location">
                                               	${productVO.productDealArea}
                                               	<%-- 나중에 지역인증 추가 시 --%>
                                               	<c:if test="false">
	                                                <div class="detail-info__mark">지역인증</div>
                                               	</c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="detail-info__btn-list">
                            	<c:if test="${myproduct}">
	                            	<a class="detail-myproduct" href="<c:url value="/products/manage.do"/>">
			                            	내 상점 관리
	                            	</a>
                           		</c:if>
                           		<c:if test="${not myproduct}">
                           			<div class="detail-info__btn-zzim__div" >
                                	<c:if test="${zzimStatus}"> 
                                		<button class="detail-info__btn-zzim detail--active" id="zzimBtn">
                                	</c:if>
                                	<c:if test="${not zzimStatus}"> 
	                                    <button class="detail-info__btn-zzim" id="zzimBtn">
                                	</c:if>
                                        <i class="fas fa-heart"></i>
                                        <span>찜</span>
                                        <span id="favoriteCnt">${fn:length(favoriteList)}</span>
                                    </button>
                                    <!-- 찜 메시지 -->
                                    <div class="detail-zzim--div" id="favoriteToast">
                                        <i class="fas fa-heart"></i>
                                        <span class="detail-zzim--msg" id="favoriteMsg">찜이 해제</span> 되었습니다.
                                    </div>
	                                </div>
	                                <button class="detail-call__btn" id="callBtn">
	                                   	 연락하기
	                                </button>
	                                <button class="detail-buy_btn" id="buyBtn">
	                                   	 바로구매
	                                </button>
                           		</c:if>
                                
                            </div>

                            <!-- 신고 모달-->
                            <div class="detail-modal" id="productReportModal">
                                <div class="report-modal__area">
                                    <div class="report-modal__head">
                                        <div class="report-modal__title">
                                            <div class="report-modal__subject">신고하기</div>
                                            <button class="report-modal__close">
                                                <i class="fas fa-times"></i>
                                            </button>
                                        </div>

                                    </div>
                                    <div class="report-modal__body">
                                        <!-- 아이템 1개 -->
                                        <div class="report-modal__item">
                                            <div class="report-modal__item-title">
                                                <span>광고(상점홍보, 낚시글, 도배글)</span>
                                                <button type="button">
                                                    <i class="fas fa-chevron-down"></i>
                                                </button>
                                            </div>
                                            <div class="report-modal__item-content">
                                                <div class="report-modal--report">
                                                    <button type="button">상점홍보</button>
                                                </div>
                                                <div class="report-modal--input">
                                                    <input type="text" placeholder="기타(사유)" />
                                                    <button type="button">등록</button>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 아이템 1개 -->
                                        <div class="report-modal__item">
                                            <div class="report-modal__item-title">
                                                <span>광고(상점홍보, 낚시글, 도배글)</span>
                                                <button type="button">
                                                    <i class="fas fa-chevron-down"></i>
                                                </button>
                                            </div>
                                            <div class="report-modal__item-content">
                                                <div class="report-modal--report">
                                                    <button type="button">상점홍보</button>
                                                </div>
                                                <div class="report-modal--input">
                                                    <input type="text" placeholder="기타(사유)" />
                                                    <button type="button">등록</button>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 아이템 1개 -->
                                        <div class="report-modal__item">
                                            <div class="report-modal__item-title">
                                                <span>광고(상점홍보, 낚시글, 도배글)</span>
                                                <button type="button">
                                                    <i class="fas fa-chevron-down"></i>
                                                </button>
                                            </div>
                                            <div class="report-modal__item-content">
                                                <div class="report-modal--report">
                                                    <button type="button">상점홍보</button>
                                                </div>
                                                <div class="report-modal--input">
                                                    <input type="text" placeholder="기타(사유)" />
                                                    <button type="button">등록</button>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 아이템 1개 -->
                                        <div class="report-modal__item">
                                            <div class="report-modal__item-title">
                                                <span>광고(상점홍보, 낚시글, 도배글)</span>
                                                <button type="button">
                                                    <i class="fas fa-chevron-down"></i>
                                                </button>
                                            </div>
                                            <div class="report-modal__item-content">
                                                <div class="report-modal--report">
                                                    <button type="button">상점홍보</button>
                                                </div>
                                                <div class="report-modal--input">
                                                    <input type="text" placeholder="기타(사유)" />
                                                    <button type="button">등록</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
	<%-- 연관상품 기능 추가 시 다시 부활시킴 --%>
			<%--
            <div class="detail-rel__area">
                <div class="detail-rel__div">
                    <div class="detail-rel__head">
                        <div class="detail-rel__title">
                            연관상품
                            <!-- 광고 마크 -->
                        </div>
                        <div class="detail-rel__page">
                            1/4
                        </div>
                    </div>
                    <div class="detail-rel__body">
                        <!-- 아이템 1개 -->
                        <div class="detail-rel__item">
                            <a class="detail-rel__link" href="#">
                                <div class="detail-rel__image">
                                    <img src="<c:url value="/resources/images/user/products/product_2.jpg"/>" alt="연관 상품 이미지">
                                </div>
                                <div class="detail-rel2__title">
                                    쿠쿠 멀티양면생선그릴 생선구이기
                                </div>
                            </a>
                        </div>
                        <div class="detail-rel__item">
                            <a class="detail-rel__link" href="#">
                                <div class="detail-rel__image">
                                    <img src="<c:url value="/resources/images/user/products/product_1.jpg"/>" alt="연관 상품 이미지">
                                </div>
                                <div class="detail-rel2__title">
                                    쿠쿠 멀티양면생선그릴 생선구이기
                                </div>
                            </a>
                        </div>
                        <div class="detail-rel__item">
                            <a class="detail-rel__link" href="#">
                                <div class="detail-rel__image">
                                    <img src="<c:url value="/resources/images/user/products/product_2.jpg"/>" alt="연관 상품 이미지">
                                </div>
                                <div class="detail-rel2__title">
                                    쿠쿠 멀티양면생선그릴 생선구이기
                                </div>
                            </a>
                        </div>
                        <div class="detail-rel__item">
                            <a class="detail-rel__link" href="#">
                                <div class="detail-rel__image">
                                    <img src="<c:url value="/resources/images/user/products/product_2.jpg"/>" alt="연관 상품 이미지">
                                </div>
                                <div class="detail-re2l__title">
                                    쿠쿠 멀티양면생선그릴 생선구이기
                                </div>
                            </a>
                        </div>
                    </div>

                    <!-- 이전 버튼 다음 버튼-->
                    <button direction="prev" disabled class="detail-rel__prev">
                        <i class="fas fa-chevron-left fa-2x"></i>
                    </button>
                    <button direction="next" disabled class="detail-rel__next">
                        <i class="fas fa-chevron-right fa-2x"></i>
                    </button>
                </div>
            </div>
			 --%>
			 
			 
            <!-- 상품 정보 부터 -->
            <div class="detail-product__area">
                <!-- 상품 설명 및 댓글 -->
                <div class="detail-explain__div">
                    <div class="detail-explain__tabs">
                        <div class="detail-explain__tab">
                            <span>상품 정보</span> &
                            <span class="detail-explain-span">상품문의</span>
                            <span class="tab__count">(${fn:length(commentList)})</span>
                        </div>
                    </div>
                    <div class="detail-explain__content">
                        <!-- 상품 설명 영역 -->
                        <div class="detail-explain__content-info">
                            <div class="detail-explain__title">
                                상품정보
                            </div>
                            <div class="detail-explain__article">
                                <div class="detail-article__margin"></div>
                                <div class="detail-article__text">${productVO.productInfo}</div>
                                <div class="detail-article__seller-list">
                                    <!-- 지역 아이템 -->
                                    <div class="detail-article__seller-item">
                                        <div class="detail-article-item__header">
                                            <i class="fas fa-map-marker-alt fa-2x"></i>
                                            거래지역
                                        </div>
                                        <div class="detail-article-item__body">
                                            <div class="detail-article--location">
                                                ${productVO.productDealArea}
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 카테고리 아이템 -->
                                    <div class="detail-article__seller-item">
                                        <div class="detail-article-item__header">
                                            <i class="fas fa-folder fa-2x"></i>
                                            카테고리
                                        </div>
                                        <div class="detail-article-item__body">
                                            <a class="detail-article--category" href="<c:url value="/categories/${selectedCate.productCateNo}.do"/>">
                                               	${selectedName}
                                               	<i class="fas fa-chevron-right"></i>
                                            </a>
                                            
                                        </div>
                                    </div>
                                    <!-- 상품태그 아이템 -->
                                    <div class="detail-article__seller-item">
                                        <div class="detail-article-item__header">
                                            <i class="fas fa-tags fa-2x"></i>
                                            상품태그
                                        </div>
                                        <div class="detail-article-item__body">
                                            <div class="detail-article--tag-list">
                                                <!-- 태그 아이템 1개 -->
                                                <c:forTokens var="token" items="${productVO.productTag}" delims=",">
	                                                <%-- 검색기능 추가시 링크 연결시킬 것 --%>
	                                                <a href="<c:url value="/search/products.do?q=${token}"/>" class="detail-article--tag-item">
	                                                    #${token}
	                                                </a>
                                                </c:forTokens>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>		
                        </div>
                        <!-- 댓글 영역-->
                        <div class="detail-comment__area">
                            <div class="detail-comment__header">
                                상품문의
                                <span class="detail--empha">${fn:length(commentList)}</span>
                            </div>
                            <div class="detail-comment__body">
                                <div class="detail-comment__input">
                                    <textarea class="detail-comment__textarea" id="commentTextArea" placeholder="상품문의 입력"></textarea>
                                </div>
                                <div class="detail-comment__reg">
                                    <div class="detail-comment__reg-count" id="commentSize">0/100</div>
                                    <button class="detail-comment__reg-btn">
                                        <i class="fas fa-pencil-alt"></i>
                                        등록
                                    </button>
                                </div>
                            </div>
                            <div class="detail-comment__history">
                                <!-- 댓글 아이템 1개 -->
                                <c:forEach var="comment" items="${commentList}">
	                                <div class="detail-history__area" data-commentno="${comment.productCommentNo}">
	                                    <div class="detail-history__item">
	                                        <a class="detail-history__left" href="#">
	                                            <img src="<c:url value="/resources/images/user/products/image_1.jpg"/>" alt="프로필 이미지">
	                                        </a>
	                                        <div class="detail-history__right">
	                                            <div class="detail-right__head">
	                                                <div class="detail-right__title">${comment.storeName}</div>
	                                                <div class="detail-right__time">

														<fmt:parseNumber value="${comment.productCommentRegDt.time}" integerOnly="true" var="paramDays" scope="request"/>
	                                                    
	                                                    <c:choose>
	                                                    	<c:when test="${nowDays-paramDays < (1000*60)}">
	                                                    		<fmt:parseNumber value="${(nowDays-paramDays) / (1000)}" integerOnly="true" var="secDate"/>
	                                                    		<c:out value="${secDate}"/> 초전
	                                                    	</c:when>
	                                                    	<c:when test="${(nowDays-paramDays) < (1000*60*60)}">
	                                                    		<fmt:parseNumber value="${(nowDays-paramDays) / (1000*60)}" integerOnly="true" var="minDate"/>
	                                                    		<c:out value="${minDate}"/> 분전
	                                                    	</c:when>
	                                                    	<c:when test="${(nowDays-paramDays) < (1000*60*60*24)}">
	                                                    		<fmt:parseNumber value="${(nowDays-paramDays) / (1000*60*60)}" integerOnly="true" var="hourDate"/>
	                                                    		<c:out value="${hourDate}"/> 시간전
	                                                    	</c:when>
	                                                    	<c:otherwise>
	                                                    		<fmt:parseNumber value="${(nowDays-paramDays) / (1000*60*60*24)}" integerOnly="true" var="dayDate"/>
	                                                    		<c:out value="${dayDate }"/> 일전
	                                                    	</c:otherwise>
	                                                    </c:choose>
													</div>
	                                            </div>
	                                            <div class="detail-right__body">${comment.productCommentContent}</div>
	                                            <div class="detail-right__footer">
	                                                <div class="right-footer__btn comment-response-btn">
	                                                    <i class="fas fa-comment"></i>
                                                  		  댓글 달기
	                                                </div>
                                               		<c:if test="${user.userNo != comment.productCommentWriter}">
		                                                <div class="right-footer__btn comment-report-btn">
                                                    	<i class="fas fa-lightbulb"></i>
                                                    		신고 하기
		                                              	</div>
                                               		</c:if>
                                               		<c:if test="${user.userNo == comment.productCommentWriter}">
		                                                <div class="right-footer__btn comment-del-btn">
                                               			<i class="fas fa-trash-alt"></i>
                                                    		삭제 하기
		                                              	</div>
                                               		</c:if>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
                                </c:forEach>
                                <!-- 댓글 신고 모달-->
                                <div class="comment-report-modal__area">
                                    <div class="comment-report-modal__div">
                                        <div class="creport-modal__head">
                                            <div class="creport-modal__title">
                                                신고하기
                                            </div>
                                            <button class="creport-modal__close">
                                                <i class="fas fa-times fa-2x"></i>
                                            </button>
                                        </div>
                                        <div class="creport-modal__body">
                                            <div class="creport-modal__item">
                                                <div class="creport-modal__item-title">
                                                    <span>광고(교신 및 상점홍보)</span>
                                                    <button type="button">
                                                        <i class="fas fa-chevron-down fa-2x"></i>
                                                    </button>
                                                </div>
                                                <div class="creport-modal__item-content">
                                                    <div class="creport-modal__link">
                                                        <button type="button">교환신청</button>
                                                    </div>
                                                    <div class="creport-modal__link">
                                                        <button type="button">상점홍보</button>
                                                    </div>
                                                    <div class="creport-modal__link">
                                                        <button type="button">타사이트,어플광고</button>
                                                    </div>
                                                    <div class="creport-modal__input">
                                                        <input type="text" placeholder="기타(사유)">
                                                        <button type="button">등록</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="detail-comment__bottom-margin"></div>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <!-- 상점 정보-->
                <div class="detail-store__area">
                    <div class="detail-export__link-list">
                   		<%-- 페이스북 조건부 완성  --%>
                    	<!-- div id="fb-root"></div> -->
                        <%-- <button type="button" class="detail-export__facebook" id="shareFacebookBtn" >
                            <img src="<c:url value="/resources/images/user/products/facebook.png"/>" alt="페이스북 아이콘">
                        </button>
                        <button type="button" class="detail-export__twitter" id="shareTwitterBtn">
                            <img src="<c:url value="/resources/images/user/products/twitter.png"/>" alt="트위터 아이콘">
                        </button> --%>
                        <button id="kakao-link-btn" class="detail-export_kakao">
							<img src="<c:url value="/resources/images/user/products/kakao.png"/>" width="10px" />
						</button>
                        <button type="button" class="detail-export__url" id="shareUrlBtn">
                            <img src="<c:url value="/resources/images/user/products/url.png"/>" alt="url 아이콘">
                            <span class="url__msg">
                               	 클릭하여 복사하기
                            </span>
                        </button>
                    </div>
                    <div class="detail-store__div">
                        <div class="detail-store__title">상점정보</div>
                        <div class="detail-store__content">
                            <div class="detail-store__content--title">
                                <a class="store-content-title__left">
                                    <img src="<c:url value="/resources/images/user/products/store_1.png"/>" alt="판매자 프로필 이미지" />
                                </a>
                                <div class="store-content-title__right">
                                    <a class="store-content-title__link">
                                        가성비갑득템상점
                                    </a>
                                    <div class="store-content-info__list">
                                        <a class="store-content-info__item" href="#">
                                            상품 41
                                        </a>
                                        <a class="store-content-info__item" href="#">
                                            팔로우 5
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <button class="detail-store__follow">
                                <i class="fas fa-user"></i>
                                팔로우
                            </button>
                            <!-- 판매자 상품 이미지 -->
                            <div class="detail-store__image-list">
                                <!-- 상품 이미지 1개 -->
                                <div class="detail-store__image-item">
                                    <a class="detail-store__image-link">
                                        <img src="<c:url value="/resources/images/user/products/product_1.jpg"/>" alt="상품 이미지">
                                        <div class="detail-store__image-price">
                                            <span>50,000</span>
                                            원
                                        </div>
                                    </a>
                                </div>
                                <!-- 상품 이미지 1개 -->
                                <div class="detail-store__image-item">
                                    <a class="detail-store__image-link">
                                        <img src="<c:url value="/resources/images/user/products/product_1.jpg"/>" alt="상품 이미지">
                                        <div class="detail-store__image-price">
                                            <span>50,000</span>
                                            원
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <!-- 상품 더보기 -->
                            <div class="detail-store__more-btn">
                                <a class="detail-store__more-link" href="#">
                                    <span class="detail--empha">37개</span>
                                     상품 더보기
                                </a>
                            </div>
                            <!-- 상점 리뷰 -->
                            <div class="detail-store__review-div">
                                    <div class="detail-review__head">
                                        상점후기
                                        <span class="detail--empha">3</span>
                                    </div>
                                    <div class="detail-review__body">
                                        <!-- 상점후기 댓글 1개-->
                                        <div class="detail-review__comment">
                                            <a class="review-comment__left" href="#">
                                                <img src="<c:url value="/resources/images/user/products/store_1.png"/>" alt="리뷰 쓴 사람 프로필 이미지">
                                            </a>
                                            <div class="review-comment__right">
                                                <div class="review-comment-right__title">
                                                    <a href="#" class="reivew-comment-right__link">
                                                        상점11344422호
                                                    </a>
                                                    <div class="review-comment-right__time">1주 전</div>
                                                </div>
                                                <div class="review-comment-right__content">
                                                    <div class="review-comment-right__stars">
                                                        <i class="light fas fa-star"></i>
                                                        <i class="light fas fa-star"></i>
                                                        <i class="light fas fa-star"></i>
                                                        <i class="light fas fa-star"></i>
                                                        <i class="light fas fa-star"></i>
                                                    </div>
                                                </div>
                                                <div class="review-comment-right__text">
                                                    와 번개하면서 입금 하자마자 새벽인데...
                                                    나가서 보내주시구 감사해요.....
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 상점후기 댓글 1개-->
                                        <div class="detail-review__comment">
                                            <a class="review-comment__left" href="#">
                                                <img src="<c:url value="/resources/images/user/products/store_1.png"/>" alt="리뷰 쓴 사람 프로필 이미지">
                                            </a>
                                            <div class="review-comment__right">
                                                <div class="review-comment-right__title">
                                                    <a href="#" class="reivew-comment-right__link">
                                                        상점11344422호
                                                    </a>
                                                    <div class="review-comment-right__time">1주 전</div>
                                                </div>
                                                <div class="review-comment-right__content">
                                                    <div class="review-comment-right__stars">
                                                        <i class="light fas fa-star"></i>
                                                        <i class="light fas fa-star"></i>
                                                        <i class="light fas fa-star"></i>
                                                        <i class="light fas fa-star"></i>
                                                        <i class="light fas fa-star"></i>
                                                    </div>
                                                </div>
                                                <div class="review-comment-right__text">
                                                    와 번개하면서 입금 하자마자 새벽인데...
                                                    나가서 보내주시구 감사해요.....
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="detail-review__more-btn">
                                        <a class="detail-review__more-link">
                                            상점후기 더보기
                                        </a>
                                    </div>
                            </div>

                            <!-- 하단 버튼 -->
                            <div class="detail-bottom__btns">
                                <div class="detail-bottom__call-btn" id="bottomCallBtn">
                                    연락하기
                                </div>
                                <div class="detail-bottom__buy-btn" id="bottomBuyBtn">
                                    바로구매
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    
                </div>
            </div>

            <!-- 연락하기 모달-->
            <div class="detail-modal" id="callModal">
                <div class="call-modal__area">
                    <button class="call-modal__close">
                        <i class="fas fa-times"></i>
                    </button>
                    <img src="<c:url value="/resources/images/user/products/store_1.png"/>" alt="연락하기 프로필 이미지" class="call-modal__profile">
                    <div class="call-modal__title">
                        <div class="call-modal__title-text">가성비갑득템상점</div>
                    </div>
                    <div class="call-modal__content">
                        <div class="call-modal__item">
                            <div class="call-modal__item-title">
                                연락가능시간
                            </div>
                            <div class="call-modal__item-content">
                                <span class="detail--empha">24시간</span>
                            </div>
                        </div>
                        <div class="call-modal__item">
                            <div class="call-modal__item-title">
                                상점별점후기
                            </div>
                            <div class="call-modal__item-content">
                                <div class="call-modal__item-stars">
                                    <i class="light fas fa-star"></i>
                                    <i class="light fas fa-star"></i>
                                    <i class="light fas fa-star"></i>
                                    <i class="light fas fa-star"></i>
                                    <i class="light fas fa-star"></i>
                                </div>
                            </div>
                        </div>
                        <div class="call-modal__item">
                            <div class="call-modal__item-title">
                                상점연락처
                            </div>
                            <div class="call-modal__item-content">
                                연락처 비공개
                            </div>
                        </div>
                    </div>
                    <div class="call-modal__btn">
                        <a class="call-modal__link" href="#">
                            <i class="fas fa-phone"></i>
                            연락하기</a>
                    </div>
                </div>
            </div>

            <!-- 바로구매 모달 -->
            <div class="detail-modal" id="buyModal">
                <div class="buy-modal__area">
                    <h2 class="buy-modal__title">
                        <!-- 메인 로고 -->
                        <img src="<c:url value="/resources/images/user/products/store_1.png"/>" alt="">안전결제
                        <a href="#" target="_blank" rel="noopener noreferrer">
                            <i class="fas fa-truck"></i>
                            안전결제란?
                        </a>
                    </h2>
                    <div class="buy-modal__content">
                        <a class="buy-modal-content--item" target="_blank" href="#">
                            <div class="buy-content__text">
                                <div class="buy-content__div">
                                    <h3 class="buy-content__title">
                                        안전거래(택배거래)
                                    </h3>
                                    <span class="buy-content__gray">안전하게 상품을 받을 때까지,<br>네모내모가 결제금액을 보관해요</span>
                                </div>
                            </div>
                            <i class="fas fa-chevron-right"></i>
                        </a>
                    </div>
                </div>

            </div>
        </div>
    </div>

   

	<% 
		/* 공통 푸터 */
	%>
	<jsp:include page="/WEB-INF/views/user/include/footer.jsp"/>
</body>
</html>