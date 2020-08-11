<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운영정책</title>
<!-- 공통 CSS -->
<link rel="stylesheet" href="<c:url value="/resources/css/user/common/common.css"/>">

<!-- 페이지 CSS  -->
<link rel="stylesheet" href="<c:url value="/resources/css/user/customer/customer_nav.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/user/customer/policy.css"/>">


<!-- 라이브러리 -->
<script src="<c:url value="/resources/vendor/jquery/jquery-3.5.1.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/fontawesome/js/all.js"/>"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="<c:url value="/resources/js/user/common/common.js"/>"></script>

<!-- 해당 페이지 JS파일 -->
<script src="<c:url value="/resources/js/user/customer/policy.js"/>"></script>


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
		<div class="policy-body">
        <div class="policy-body-div">
            <!-- customer 공통 nav -->
				<jsp:include page="/WEB-INF/views/user/customer/common/customer_nav.jsp"/>
            <main class="policy-main">
                <div class="policy-contents">
                    <header class="policy-contents-header">
                        <div class="policy-contents-header-logo"></div>
                        <h1><b>네모내모</b>는 모두가<br>이용하는 열린공간입니다.</h1>
                        <h2>공정한 거래문화를 위해 네모내모는 다음과 같은 약속들을 준수합니다.</h2>
                    </header>
                    <ul class="policy-contents-ul">
                        <li class="policy-contents-li">
                            <div class="policy-contents-li-icon1"></div>
                            <div class="policy-contents-li-content">
                                <h2>거래 금지 품목 거래시 제재 받을 수 있습니다</h2>
                                <p>전자 통신판매법 등에 의해 저촉되어 인터넷 거래기준에 적용되는 상품으로 1회 적발시 즉시 이용제한이 될 수 있습니다.</p><a
                                    href="ban.html">거래 금지 품목 보기</a>
                            </div>
                        </li>
                        <li class="policy-contents-li">
                            <div class="policy-contents-li-icon2"></div>
                            <div class="policy-contents-li-content">
                                <h2>랜덤박스(비공개/반공개)는 분쟁의 원인이 되고 있습니다</h2>
                                <p>랜덤박스는 상품의 상태 및 내용물을 확인할 수 없거나 모호하여 분쟁과 신고 접수의 원인이 되고 있어 운영자에 의해 제재 받을 수 있습니다.</p>
                            </div>
                        </li>
                        <li class="policy-contents-li">
                            <div class="policy-contents-li-icon3"></div>
                            <div class="policy-contents-li-content">
                                <h2>상품, 댓글의 10회 이상 도배, 번개톡 도배 등록을 피해주세요</h2>
                            </div>
                        </li>
                        <li class="policy-contents-li">
                            <div class="policy-contents-li-icon4"></div>
                            <div class="policy-contents-li-content">
                                <h2>욕설, 성희롱 등 비매너 행위는 타인을 불쾌하게 합니다</h2>
                                <p>비매너 행위에 관한 게시물과 댓글은 운영진에 의해 제재 받을 수 있습니다.</p>
                            </div>
                        </li>
                        <li class="policy-contents-li">
                            <div class="policy-contents-li-icon5"></div>
                            <div class="policy-contents-li-content">
                                <h2>선정적이거나 판매 상품에 적절치 않은 이미지는 사용자 혼란을 일으킵니다</h2>
                                <p>판매하려는 상품을 명확히 표현하는 사진을 사용해주세요.</p>
                            </div>
                        </li>
                        <li class="policy-contents-li">
                            <div class="policy-contents-li-icon6"></div>
                            <div class="policy-contents-li-content">
                                <h2>상품명, 키워드에 판매 상품과 관계없는 단어 삽입은 제재 받을 수 있습니다</h2>
                                <p>상품 노출을 높여보고자 인기 검색어를 마구 집어 넣는 행위는 여러 유저들에게 불편을 일으키는 원인이 됩니다.</p>
                            </div>
                        </li>
                        <li class="policy-contents-li">
                            <div class="policy-contents-li-icon7"></div>
                            <div class="policy-contents-li-content">
                                <h2>정확한 상품 가격 정보를 입력해 주세요</h2>
                                <p>실제 판매하려는 가격과 다른 상품 가격정보를 써 놓아 구매자에게 혼돈을 주지 마세요.</p>
                            </div>
                        </li>
                    </ul>
                    <footer class="policy-contents-footer">
                        <div class="policy-contents-footer-img"></div>
                        <figure class="policy-contents-footer-img2"><img src="img_manage_4out_step.d654e7f6.png" width="315"
                                alt="4진아웃 절차"></figure>
                        <div class="policy-contents-footer-logo">
                            <div class="policy-contents-footer-logo-img"></div>
                        </div>
                    </footer>
                </div>
            </main>
        </div>
    </div>
	</section>
	<% 
		/* 공통 푸터 */
	%>
	<jsp:include page="/WEB-INF/views/user/include/footer.jsp"/>
</body>
</html>