<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네모내모</title>
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
<script src="<c:url value="/resources/js/user/common/common.js"/>"></script>

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

                <div class="detail-menu-cbox__item">
                    <i class="fas fa-chevron-right"></i>
                    <div class="detail-menu-cbox__area">
                        <div class="detail-menu-cbox__div">
                            <div class="detail-menu-cbox__display">
                                패션잡화
                                <i class="fas fa-chevron-down"></i>
                            </div>
                            <div class="detail-menu-cbox__list">
                                <div class="detail-menu-cbox__item--active">
                                    패션잡화
                                </div>
                                <div class="detail-menu-cbox__item">여성의류</div>
                                <div class="detail-menu-cbox__item">남성의류</div>
                                <div class="detail-menu-cbox__item">디지털/가전</div>
                                <div class="detail-menu-cbox__item">도서/티켓/취미/애완</div>
                                <div class="detail-menu-cbox__item">생활/문구/가구/식품</div>
                                <div class="detail-menu-cbox__item">유아동/출산</div>
                                <div class="detail-menu-cbox__item">스타굿즈</div>
                                <div class="detail-menu-cbox__item">스포츠/레저</div>
                                <div class="detail-menu-cbox__item">뷰티/미용</div>
                                <div class="detail-menu-cbox__item">기타</div>
                                <div class="detail-menu-cbox__item">차량/오토바이</div>
                                <div class="detail-menu-cbox__item">구인구직</div>
                                <div class="detail-menu-cbox__item">재능</div>
                                <div class="detail-menu-cbox__item">번개나눔</div>
                                <div class="detail-menu-cbox__item">지역 서비스</div>
                                <div class="detail-menu-cbox__item">원룸/함께살아요</div>
                                <div class="detail-menu-cbox__item">커뮤니티</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="detail-menu-cbox__item">
                    <i class="fas fa-chevron-right"></i>
                    <div class="detail-menu-cbox__area">
                        <div class="detail-menu-cbox__div">
                            <div class="detail-menu-cbox__display">
                                패션잡화
                                <i class="fas fa-chevron-down"></i>
                            </div>
                            <div class="detail-menu-cbox__list">
                                <div class="detail-menu-cbox__item--active">
                                    패션잡화
                                </div>
                                <div class="detail-menu-cbox__item">여성의류</div>
                                <div class="detail-menu-cbox__item">남성의류</div>
                                <div class="detail-menu-cbox__item">디지털/가전</div>
                                <div class="detail-menu-cbox__item">도서/티켓/취미/애완</div>
                                <div class="detail-menu-cbox__item">생활/문구/가구/식품</div>
                                <div class="detail-menu-cbox__item">유아동/출산</div>
                                <div class="detail-menu-cbox__item">스타굿즈</div>
                                <div class="detail-menu-cbox__item">스포츠/레저</div>
                                <div class="detail-menu-cbox__item">뷰티/미용</div>
                                <div class="detail-menu-cbox__item">기타</div>
                                <div class="detail-menu-cbox__item">차량/오토바이</div>
                                <div class="detail-menu-cbox__item">구인구직</div>
                                <div class="detail-menu-cbox__item">재능</div>
                                <div class="detail-menu-cbox__item">번개나눔</div>
                                <div class="detail-menu-cbox__item">지역 서비스</div>
                                <div class="detail-menu-cbox__item">원룸/함께살아요</div>
                                <div class="detail-menu-cbox__item">커뮤니티</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 상품 정보 -->
            <div class="detail-info__area">
                <div class="detail-info__div">
                    <div class="detail-info__image__div">
                        <!-- 이미지 리스트 -->
                        <div class="detail-info__image__list">
                            <!-- 상세 상품 이미지 1장-->
                            <img class="detail-info__image__item--active" src="<c:url value="/resources/images/user/products/product_1.jpg"/>" alt="상세 상품 이미지" />
                            <img class="detail-info__image__item" src="<c:url value="/resources/images/user/products/product_2.jpg"/>" alt="상세 상품 이미지" />
                            <div class="detail-info__image__watermark"></div>

                            <!-- 이전 버튼 -->
                            <button direction="next" class="detail-info__image--prev">
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

                            <!-- 이미지 개수 ~ -->
                            <div class="detail-info__image-count">
                                <button disabled class="detail-info__image-count-btn--active"></button>
                                <button class="detail-info__image-count-btn"></button>
                                <button class="detail-info__image-count-btn"></button>
                                <button class="detail-info__image-count-btn"></button>
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
                                        프로피쿡 디지털 에어프라이어 튀김기 보토 필립스 전기오븐렌지
                                    </div>
                                    <div class="detail-info__text-price__div">
                                        <div class="detail-info__price">62,500<span>원</span>
                                        </div>
                                    </div>
                                    <!-- 앱 광고 버튼 -->
                                </div>
                                <div class="detail-info__text-body">
                                    <div class="detail-info__text-body-top">
                                        <!-- 찜, 조회수, 시간 -->
                                        <div class="detail-info__text-body-topL">
                                            <div class="detail-info--topL-item">
                                                <i class="fas fa-heart"></i>
                                                <div class="">
                                                    30
                                                </div>
                                            </div>
                                            <div class="detail-info--topL-item">
                                                <i class="fas fa-eye"></i>
                                                <div class="">
                                                    418
                                                </div>
                                            </div>
                                            <div class="detail-info--topL-item">
                                                <i class="fas fa-clock"></i>
                                                <div class="">
                                                    58분전
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
                                                새상품
                                            </div>
                                        </div>
                                        <!-- 아이템 한개 -->
                                        <div class="detail-info__text-body-bItem">
                                            <div class="detail-info__text-body-bItem-title">
                                                교환여부
                                            </div>
                                            <div class="detail-info__text-body-bItem-content">
                                                교환불가능
                                            </div>
                                        </div>
                                        <!-- 아이템 한개 -->
                                        <div class="detail-info__text-body-bItem">
                                            <div class="detail-info__text-body-bItem-title">
                                                배송비
                                            </div>
                                            <div class="detail-info__delivery">
                                                배송비 별도
                                            </div>
                                        </div>
                                        <!-- 아이템 한개 -->
                                        <div class="detail-info__text-body-bItem">
                                            <div class="detail-info__text-body-bItem-title">
                                                거래지역
                                            </div>
                                            <div class="detail-info__location">
                                                서울특별시 은평구 응암제2동
                                                <div class="detail-info__mark">지역인증</div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="detail-info__btn-list">
                                <div class="detail-info__btn-zzim__div" id="zzimBtn">
                                    <button class="detail-info__btn-zzim">
                                        <i class="fas fa-heart"></i>
                                        <span>찜</span>
                                        <span>30</span>
                                    </button>
                                    <!-- 찜 메시지 -->
                                    <div class="detail-zzim--div">
                                        <i class="fas fa-heart"></i>
                                        <span class="detail-zzim--msg">찜이 해제</span> 되었습니다.
                                    </div>
                                </div>
                                <button class="detail-call__btn" id="callBtn">
                                    연락하기
                                </button>
                                <button class="detail-buy_btn" id="buyBtn">
                                    바로구매
                                </button>
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

            <!-- 상품 정보 부터 -->
            <div class="detail-product__area">
                <!-- 상품 설명 및 댓글 -->
                <div class="detail-explain__div">
                    <div class="detail-explain__tabs">
                        <div class="detail-explain__tab">
                            <span>상품 정보</span> &
                            <span class="">상품문의</span>
                            <span class="tab__count">(276)</span>
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
                                <div class="detail-article__text">
                                ⛔ 글 비슷하게 올린 사칭업체 주의 (⭐글 조회수 비교)
                                🔥LED케이스(신품) 무상교체 (유명제품 취향 택1)
                                🔥총알 안전배송 오후 4시이전 주문- 당일출고 ˘◡˘

                                ▶ 카카오톡 문의 : hh339
                                ▶ 전화,문자 문의 : 010-8417-7707

                                ⛔80PLUS 인증없는 뻥파워 주의 (거짓 표기전압)
                                🔥저희는 80PLUS 정격파워 사용 (인증된 전압 부품)
                                ⛔본체기준 무상AS 6개월 최초진행⛔

                                🌈 0번 (본체만 입니다) 【특가진행 330,000원】
                                ⭐ 서든, 롤, 피파, 오버워치, GTA5 ⭐
                                CPU- 인텔 코어 i5 3570 {쿼드코어}
                                VGA- 게이밍 RX470 4GB (⭐GTX1050Ti 보다 좋음)
                                RAM- 삼성램 8G &gt;&gt; 👍16G 변경시 +4
                                SSD- 120G &gt;&gt; 👍240G 새거 변경시 +2
                                POWER- 80PLUS 인증 정격 700W
                                ⭐케이스- COX RC 170T (새거교체)

                                🌈 1번세트 (모니터+본체) 【한정수량 450,000원】
                                ⭐ 서든, 롤, 피파, 오버워치, GTA5, 배그 ⭐
                                CPU- 인텔 코어 i5 3570 {쿼드코어}
                                VGA- 게이밍 RX470 4GB (⭐GTX1050Ti 보다 좋음)
                                RAM- 삼성램 8G &gt;&gt; 👍16G 변경시 +4
                                SSD- 120G &gt;&gt; 👍240G 새거 변경시 +2
                                POWER- 80PLUS 인증 정격 700W
                                ⭐케이스- LED 케이스 새걸로 교체 (추가금X)
                                모니터- 게이밍 24인치 초슬림 (새거) or 32인치 (중고)

                                🌈 2번세트 (모니터+본체) 【한정수량 520,000원】
                                ⭐ 서든, 롤, 피파, 오버워치, GTA5, 배그 ⭐
                                ㅡ👉 (CPU &gt; i7- 4770 변경 +8/ 변경시 배그상옵)
                                CPU- 인텔 코어 i5 4670 하스웰 {쿼드코어}
                                VGA- 게이밍 RX580 4GB (⭐GTX1060보다 좋음)
                                RAM- 삼성램 8G &gt;&gt; 👍16G 변경시 +4
                                SSD- 120G &gt;&gt; 👍240G 새거 변경시 +2
                                POWER- 80PLUS 인증 정격 700W
                                ⭐케이스- LED 케이스 새걸로 교체 (추가금X)
                                모니터- 게이밍 24인치 초슬림 (새거) or 32인치 (중고)

                                👉 구성품세트 (전부 신품새거) +2
                                LED 게이밍{키보드+마우스} +장패드 +스피커
                                ⛔찝찝하게 중고쓰지말고 새거 쓰세요^^⛔

                                👉 헤드셋 (신품새거) +1
                                ⛔찝찝하게 중고쓰지말고 새거 쓰세요^^⛔

                                👉 기본 SSD구성 + 하드 추가시
                                🏈500GB = 2만원 / 1TB (1000GB) = 3만원

                                ✦본체 내부 부품은 세척후 검수 테스트 (새것느낌)
                                상태 새것같은 중고 입니다, 선물용으로도 좋아요!
                                성능저하없이 성능 매우 좋습니다, 부품상태도 S급

                                🔥 택배발송 가능해요 / 전문포장업체 통해서 발송 / 파손걱정NO
                                🔥 배송중 파손시 제가 책임집니다 / 에어캡 무장</div>
                                <div class="detail-article__seller-list">
                                    <!-- 지역 아이템 -->
                                    <div class="detail-article__seller-item">
                                        <div class="detail-article-item__header">
                                            <i class="fas fa-map-marker-alt fa-2x"></i>
                                            거래지역
                                        </div>
                                        <div class="detail-article-item__body">
                                            <div class="detail-article--location">
                                                경기도 의정부시
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
                                            <a class="detail-article--category" href="#">
                                                <span>디지털/가전기기</span>
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
                                                <div class="detail-article--tag-item">
                                                    #생활가전
                                                </div>
                                                <div class="detail-article--tag-item">
                                                    #싸다싸
                                                </div>
                                                <div class="detail-article--tag-item">
                                                    #단돈 6만 9천원
                                                </div>
                                                <div class="detail-article--tag-item">
                                                    #태그태그
                                                </div>
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
                                <span class="detail--empha">0</span>
                            </div>
                            <div class="detail-comment__body">
                                <div class="detail-comment__input">
                                    <textarea class="detail-comment__textarea" placeholder="상품문의 입력"></textarea>
                                </div>
                                <div class="detail-comment__reg">
                                    <div class="detail-comment__reg-count">0/100</div>
                                    <button class="detail-comment__reg-btn">
                                        <i class="fas fa-pencil-alt"></i>
                                        등록
                                    </button>
                                </div>
                            </div>
                            <div class="detail-comment__history">
                                <!-- 댓글 아이템 1개 -->
                                <div class="detail-history__area">
                                    <div class="detail-history__item">
                                        <a class="detail-history__left" href="#">
                                            <img src="<c:url value="/resources/images/user/products/image_1.jpg"/>" alt="프로필 이미지">
                                        </a>
                                        <div class="detail-history__right">
                                            <div class="detail-right__head">
                                                <div class="detail-right__title">번개알림센터</div>
                                                <div class="detail-right__time">1초전</div>
                                            </div>
                                            <div class="detail-right__body">
                                                [공지글] 안전거래를 위한 네모장터만의 서비스가 출시되었습니다!
                                            </div>
                                            <div class="detail-right__footer">
                                                <div class="right-footer__btn">
                                                    <i class="fas fa-comment"></i>
                                                    댓글 달기
                                                </div>
                                                <div class="right-footer__btn">
                                                    <i class="fas fa-lightbulb"></i>
                                                    신고 하기
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- 댓글 아이템 1개 -->
                                <div class="detail-history__area">
                                    <div class="detail-history__item">
                                        <a class="detail-history__left" href="#">
                                            <img src="<c:url value="/resources/images/user/products/image_1.jpg"/>" alt="프로필 이미지">
                                        </a>
                                        <div class="detail-history__right">
                                            <div class="detail-right__head">
                                                <div class="detail-right__title">번개알림센터</div>
                                                <div class="detail-right__time">1초전</div>
                                            </div>
                                            <div class="detail-right__body">
                                                [공지글] 안전거래를 위한 네모장터만의 서비스가 출시되었습니다!
                                            </div>
                                            <div class="detail-right__footer">
                                                <div class="right-footer__btn">
                                                    <i class="fas fa-comment"></i>
                                                    댓글 달기
                                                </div>
                                                <div class="right-footer__btn">
                                                    <i class="fas fa-lightbulb"></i>
                                                    신고 하기
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- 댓글 아이템 1개 -->
                                <div class="detail-history__area">
                                    <div class="detail-history__item">
                                        <a class="detail-history__left" href="#">
                                            <img src="<c:url value="/resources/images/user/products/store_1.png"/>" alt="프로필 이미지">
                                        </a>
                                        <div class="detail-history__right">
                                            <div class="detail-right__head">
                                                <div class="detail-right__title">번개알림센터</div>
                                                <div class="detail-right__time">1초전</div>
                                            </div>
                                            <div class="detail-right__body">
                                                [공지글] 안전거래를 위한 네모장터만의 서비스가 출시되었습니다!
                                            </div>
                                            <div class="detail-right__footer">
                                                <div class="right-footer__btn">
                                                    <i class="fas fa-comment"></i>
                                                    댓글 달기
                                                </div>
                                                <div class="right-footer__btn">
                                                    <i class="fas fa-lightbulb"></i>
                                                    신고 하기
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- 댓글 아이템 1개 -->
                                <div class="detail-history__area">
                                    <div class="detail-history__item">
                                        <a class="detail-history__left" href="#">
                                            <img src="<c:url value="/resources/images/user/products/store_1.png"/>" alt="프로필 이미지">
                                        </a>
                                        <div class="detail-history__right">
                                            <div class="detail-right__head">
                                                <div class="detail-right__title">번개알림센터</div>
                                                <div class="detail-right__time">1초전</div>
                                            </div>
                                            <div class="detail-right__body">
                                            
                                                [공지글] 안전거래를 위한 네모장터만의 서비스가 출시되었습니다!
                                            </div>
                                            <div class="detail-right__footer">
                                                <div class="right-footer__btn">
                                                    <i class="fas fa-comment"></i>
                                                    댓글 달기
                                                </div>
                                                <div class="right-footer__btn">
                                                    <i class="fas fa-lightbulb"></i>
                                                    신고 하기
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- 댓글 아이템 1개 -->
                                <div class="detail-history__area">
                                    <div class="detail-history__item">
                                        <a class="detail-history__left" href="#">
                                            <img src="<c:url value="/resources/images/user/products/image_1.jpg"/>" alt="프로필 이미지">
                                        </a>
                                        <div class="detail-history__right">
                                            <div class="detail-right__head">
                                                <div class="detail-right__title">번개알림센터</div>
                                                <div class="detail-right__time">1초전</div>
                                            </div>
                                            <div class="detail-right__body">
                                                [공지글] 안전거래를 위한 네모장터만의 서비스가 출시되었습니다!
                                            </div>
                                            <div class="detail-right__footer">
                                                <div class="right-footer__btn">
                                                    <i class="fas fa-comment"></i>
                                                    댓글 달기
                                                </div>
                                                <div class="right-footer__btn">
                                                    <i class="fas fa-lightbulb"></i>
                                                    신고 하기
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
                        <button type="button" class="detail-export__naver">
                            <img src="<c:url value="/resources/images/user/products/naverblog.png"/>" alt="블로그 아이콘">
                        </button>
                        <button type="button" class="detail-export__facebook">
                            <img src="<c:url value="/resources/images/user/products/facebook.png"/>" alt="페이스북 아이콘">
                        </button>
                        <button type="button" class="detail-export__twitter">
                            <img src="<c:url value="/resources/images/user/products/twitter.png"/>" alt="트위터 아이콘">
                        </button>
                        <button type="button" class="detail-export__url">
                            <img src="<c:url value="/resources/images/user/products/url.png"/>" alt="url 아이콘">
                            <span class="url__msg">
                                복사중...
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