<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네모내모 | 거래 금지 품목 안내</title>
<!-- 공통 CSS -->
<link rel="stylesheet" href="<c:url value="/resources/css/user/common/common.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/user/customer/ban.css"/>">

<!-- 페이지 CSS  -->
<link rel="stylesheet" href="<c:url value="/resources/css/user/sign/signin.css"/>">


<!-- 라이브러리 -->
<script src="<c:url value="/resources/vendor/jquery/jquery-3.5.1.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/fontawesome/js/all.js"/>"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 해당 페이지 JS파일 -->
<script src="<c:url value="/resources/js/user/common/common.js"/>"></script>



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
		<div class="ban-body">
        <div class="ban-body-div">
            <section class="ban-header">
                <h1><span>네모내모</span><br>거래 금지 품목 안내</h1>
                <p>인터넷에서 거래 시 법에 저촉되는 모든 상품에 대해서는 거래를 포함한 나눔까지 모두 제재 대상이 됩니다.<br>수제 음식 및 식품을 판매하는 상점에서는 상점 메인에 반드시
                    운영진이 확인 가능한 식품 제조 허가증과 사업자등록증 번호를 기재해 주시기 바랍니다.</p>
            </section>
            <ul class="ban-contents-ul">
                <li class="ban-contents-li">주민등록증 (각종 신분증)</li>
                <li class="ban-contents-li">담배 (전자담배)</li>
                <li class="ban-contents-li">주류</li>
                <li class="ban-contents-li">의약품</li>
                <li class="ban-contents-li">수제 (음식, 화장품 등)</li>
                <li class="ban-contents-li">소분판매 (식품, 화장품 등)</li>
                <li class="ban-contents-li">불법도박글 (토토)</li>
                <li class="ban-contents-li">타투 (불법시술)</li>
                <li class="ban-contents-li">개통 불가 휴대폰</li>
                <li class="ban-contents-li">온라인게임 계정</li>
                <li class="ban-contents-li">성인용품 (콘돔제외)</li>
                <li class="ban-contents-li">대포차</li>
                <li class="ban-contents-li">대포통장</li>
                <li class="ban-contents-li">불법 소프트웨어 복제품</li>
                <li class="ban-contents-li">암표</li>
                <li class="ban-contents-li">판매가 불가능한 각종 티켓 (비매품/증정용)</li>
                <li class="ban-contents-li">렌즈</li>
                <li class="ban-contents-li">화장품 샘플</li>
                <li class="ban-contents-li">랜덤박스 (비공개/반공개박스)</li>
                <li class="ban-contents-li">온누리상품권, 지역사랑상품권, 지역화폐 등</li>
                <li class="ban-contents-li">재난기본소득 등으로 지급받은 선불카드, 지역화폐카드 등</li>
                <li class="ban-contents-li">유사군복류(전투복, 전투모, 전투화, 계급장, 야전상의, 방한복, 비행복, 특전복 등)</li>
                <li class="ban-contents-li">군용장구(권총집, 수통, 야전삽, 천막류, 침낭, 모포, 방탄모, 방탄복, 배낭 등)</li>
                <li class="ban-contents-li">건강기능식품</li>
                <li class="ban-contents-li">도수 있는 안경, 콘택트렌즈 및 썬글라스</li>
                <li class="ban-contents-li">상표권 침해 물품</li>
                <li class="ban-contents-li">저작권 침해 물품</li>
                <li class="ban-contents-li">모의총포</li>
                <li class="ban-contents-li">안전인증표시 없는 안전인증대상제품</li>
                <li class="ban-contents-li">음란물</li>
                <li class="ban-contents-li">불법현금융통 목적의 상품</li>
                <li class="ban-contents-li">청소년유해매체물, 청소년유해약물, 청소년유해물건</li>
                <li class="ban-contents-li">총포·도검·화약류·분사기·전자충격기·석궁</li>
                <li class="ban-contents-li">유해화학물질</li>
                <li class="ban-contents-li">반려동물</li>
                <li class="ban-contents-li">응모권</li>
                <li class="ban-contents-li">적합성 평가를 받지 않은 불법방송통신기자재</li>
                <li class="ban-contents-li">개인 사용 목적으로 해외직구한 전자제품</li>
                <li class="ban-contents-li">휴대폰 소액결제(통신과금서비스)를 통한 자금 융통 목적의 상품</li>
                <li class="ban-contents-li">그외 법률을 위반하는 모든 상품</li>
            </ul>
            <div class="ban-footer">거래 금지 상품은 지속적으로 업데이트 됩니다.</div>
        </div>
    </div>
	</section>
	<% 
		/* 공통 푸터 */
	%>
	<jsp:include page="/WEB-INF/views/user/include/footer.jsp"/>
</body>
</html>