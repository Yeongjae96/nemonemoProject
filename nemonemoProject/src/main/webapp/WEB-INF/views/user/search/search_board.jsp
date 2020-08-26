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
<link rel="stylesheet" href="<c:url value="/resources/css/user/search/search_board.css"/>">


<!-- 라이브러리 -->
<script src="<c:url value="/resources/vendor/jquery/jquery-3.5.1.min.js"/>"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="<c:url value="/resources/vendor/fontawsome/js/all.js"/>"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="<c:url value="/resources/js/user/common/common.js"/>"></script>

<!-- 해당 페이지 JS파일 -->



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
		<div class="search__area">
        <div class="search__div">
            <div class="search-search__area">
                <div class="search-search__div">
                    <div class="search-search--title">
                        카테고리
                    </div>
                    <div class="search-search__list">
                        <!-- 아이템 1개 -->
                        <a class="search-search__item" href="#">
                            <div class="search-search__prev">
                                디지털/가전
                                <i class="fas fa-chevron-right"></i>
                            </div>
                            <div class="search-search__next">
                                기타(가전제품)
                            </div>
                            <div class="search-search__count">
                                2백+
                            </div>
                        </a>
                        <!-- 아이템 1개 -->
                        <a class="search-search__item" href="#">
                            <div class="search-search__prev">
                                남성의류
                                <i class="fas fa-chevron-right"></i>
                            </div>
                            <div class="search-search__next">
                                라운드넥 / 티셔츠
                            </div>
                            <div class="search-search__count">
                                2백+
                            </div>
                        </a>
                        <!-- 아이템 1개 -->
                        <a class="search-search__item" href="#">
                            <div class="search-search__prev">
                                디지털/가전
                                <i class="fas fa-chevron-right"></i>
                            </div>
                            <div class="search-search__next">
                                기타(음반/음향기기)
                            </div>
                            <div class="search-search__count">
                                2백+
                            </div>
                        </a>
                        <!-- 아이템 1개 -->
                        <a class="search-search__item" href="#">
                            <div class="search-search__prev">
                                디지털/가전
                                <i class="fas fa-chevron-right"></i>
                            </div>
                            <div class="search-search__next">
                                일반디카/토이카메라
                            </div>
                            <div class="search-search__count">
                                2백+
                            </div>
                        </a>
                    </div>
                </div>
            </div>



            <!-- 카테고리 메뉴 버튼 -->
            <div class="search-search-menu__btn">
                <a class="search-search-menu__link" href="#">
                    <i class="fas fa-chevron-left"></i>이전 카테고리
                </a>
                <a class="search-reset__btn" href="#">
                    <i class="fas fa-undo"></i>
                    초기화
                </a>
            </div>

            <!-- 카테고리 메뉴 -->
            <div class="search-search-sub__area">
                <div class="search-search-sub__div">

                    <!-- 아이템 1개 -->
                    <div class="search-search-sub__item">
                        <a class="search-search-sub__item-link">
                            <div class="search-search-sub__item-title">
                                디지털/가전
                            </div>
                            <div class="search-search-sub__item-count">
                                1284
                            </div>
                        </a>
                    </div>
                    <div class="search-search-sub__item">
                        <a class="search-search-sub__item-link">
                            <div class="search-search-sub__item-title">
                                디지털/가전
                            </div>
                            <div class="search-search-sub__item-count">
                                1284
                            </div>
                        </a>
                    </div>
                    <div class="search-search-sub__item">
                        <a class="search-search-sub__item-link">
                            <div class="search-search-sub__item-title">
                                디지털/가전
                            </div>
                            <div class="search-search-sub__item-count">
                                1284
                            </div>
                        </a>
                    </div>
                    <div class="search-search-sub__item">
                        <a class="search-search-sub__item-link">
                            <div class="search-search-sub__item-title">
                                디지털/가전
                            </div>
                            <div class="search-search-sub__item-count">
                                1284
                            </div>
                        </a>
                    </div>
                    <div class="search-search-sub__item">
                        <a class="search-search-sub__item-link">
                            <div class="search-search-sub__item-title">
                                디지털/가전
                            </div>
                            <div class="search-search-sub__item-count">
                                1284
                            </div>
                        </a>
                    </div>
                    <div class="search-search-sub__item">
                        <a class="search-search-sub__item-link">
                            <div class="search-search-sub__item-title">
                                디지털/가전
                            </div>
                            <div class="search-search-sub__item-count">
                                1284
                            </div>
                        </a>
                    </div>
                    <div class="search-search-sub__item">
                        <a class="search-search-sub__item-link">
                            <div class="search-search-sub__item-title">
                                디지털/가전
                            </div>
                            <div class="search-search-sub__item-count">
                                1284
                            </div>
                        </a>
                    </div>
                </div>
            </div>

            <!-- 제목 영역-->
            <div class="search-title__area">
                <div class="search-title__div">
                    <div class="search-title__left">
                        <span class="search--empha">디지털</span>
                        의 검색결과
                        <span class="search--count">3,417개</span>
                    </div>
                    <!-- ad 마크 -->

                    <div class="search-sort__right">
                        <div class="search-sort__item--active">
                            최신순
                        </div>
                        <div class="search-sort__item">
                            인기순
                        </div>
                        <div class="search-sort__item">
                            저가순
                        </div>
                        <div class="search-sort__item">
                            고가순
                        </div>
                    </div>
                </div>
            </div>

            <!-- 내용내용 -->
            <div class="search-content__area">
                <div class="search-content__list">
                    <!-- 아이템 1개-->
                    <div class="search-content__item">
                        <a href="#" class="search-content__link">
                            <div class="search-content__image">
                                <img src="<c:url value="/resources/images/user/search/image_1.jpg"/>" alt="상품이미지" />
                            </div>
                            <div class="search-content__title">
                                <div class="search-content__title-text">
                                    국내배송 20SS 생♥︎♥︎ 모노그램 마틀라세 클러치[내부 각인 O ]
                                </div>
                                <div class="search-content__title-price">
                                    <div class="search-content__title-price--text">169,000</div>

                                </div>
                                <!-- 광고마크 생략 -->
                            </div>
                            <div class="search-content__location">
                                <i class="fas fa-map-marker-alt fa-2x"></i>
                                전국
                            </div>
                        </a>
                    </div>

                    <div class="search-content__item">
                        <a href="#" class="search-content__link">
                            <div class="search-content__image">
                                <img src="<c:url value="/resources/images/user/search/image_1.jpg"/>" alt="상품이미지" />
                            </div>
                            <div class="search-content__title">
                                <div class="search-content__title-text">
                                    국내배송 20SS 생♥︎♥︎ 모노그램 마틀라세 클러치[내부 각인 O ]
                                </div>
                                <div class="search-content__title-price">
                                    <div class="search-content__title-price--text">169,000</div>

                                </div>
                                <!-- 광고마크 생략 -->
                            </div>
                            <div class="search-content__location">
                                <i class="fas fa-map-marker-alt fa-2x"></i>
                                전국
                            </div>
                        </a>
                    </div>

                    <div class="search-content__item">
                        <a href="#" class="search-content__link">
                            <div class="search-content__image">
                                <img src="<c:url value="/resources/images/user/search/image_1.jpg"/>" alt="상품이미지" />
                            </div>
                            <div class="search-content__title">
                                <div class="search-content__title-text">
                                    국내배송 20SS 생♥︎♥︎ 모노그램 마틀라세 클러치[내부 각인 O ]
                                </div>
                                <div class="search-content__title-price">
                                    <div class="search-content__title-price--text">169,000</div>

                                </div>
                                <!-- 광고마크 생략 -->
                            </div>
                            <div class="search-content__location">
                                <i class="fas fa-map-marker-alt fa-2x"></i>
                                전국
                            </div>
                        </a>
                    </div>

                    <div class="search-content__item">
                        <a href="#" class="search-content__link">
                            <div class="search-content__image">
                                <img src="<c:url value="/resources/images/user/search/image_1.jpg"/>" alt="상품이미지" />
                            </div>
                            <div class="search-content__title">
                                <div class="search-content__title-text">
                                    국내배송 20SS 생♥︎♥︎ 모노그램 마틀라세 클러치[내부 각인 O ]
                                </div>
                                <div class="search-content__title-price">
                                    <div class="search-content__title-price--text">169,000</div>

                                </div>
                                <!-- 광고마크 생략 -->
                            </div>
                            <div class="search-content__location">
                                <i class="fas fa-map-marker-alt fa-2x"></i>
                                전국
                            </div>
                        </a>
                    </div>

                    <div class="search-content__item">
                        <a href="#" class="search-content__link">
                            <div class="search-content__image">
                                <img src="<c:url value="/resources/images/user/search/image_1.jpg"/>" alt="상품이미지" />
                            </div>
                            <div class="search-content__title">
                                <div class="search-content__title-text">
                                    국내배송 20SS 생♥︎♥︎ 모노그램 마틀라세 클러치[내부 각인 O ]
                                </div>
                                <div class="search-content__title-price">
                                    <div class="search-content__title-price--text">169,000</div>

                                </div>
                                <!-- 광고마크 생략 -->
                            </div>
                            <div class="search-content__location">
                                <i class="fas fa-map-marker-alt fa-2x"></i>
                                전국
                            </div>
                        </a>
                    </div>

                    <div class="search-content__item">
                        <a href="#" class="search-content__link">
                            <div class="search-content__image">
                                <img src="<c:url value="/resources/images/user/search/image_1.jpg"/>" alt="상품이미지" />
                            </div>
                            <div class="search-content__title">
                                <div class="search-content__title-text">
                                    국내배송 20SS 생♥︎♥︎ 모노그램 마틀라세 클러치[내부 각인 O ]
                                </div>
                                <div class="search-content__title-price">
                                    <div class="search-content__title-price--text">169,000</div>

                                </div>
                                <!-- 광고마크 생략 -->
                            </div>
                            <div class="search-content__location">
                                <i class="fas fa-map-marker-alt fa-2x"></i>
                                전국
                            </div>
                        </a>
                    </div>`
                </div>
            </div>

            <!-- 페이징 부분 -->
            <div class="search-paging__area">
                <div class="search-paging__div">
                    <a class="search-paging__prev" href="#">
                        <i class="fas fa-chevron-left"></i>
                    </a>
                    <a class="search-paging__page--active" href="#">1</a>
                    <a class="search-paging__page" href="#">2</a>
                    <a class="search-paging__page" href="#">3</a>
                    <a class="search-paging__page" href="#">4</a>
                    <a class="search-paging__page" href="#">5</a>
                    <a class="search-paging__next" href="#">
                        <i class="fas fa-chevron-right"></i>
                    </a>
                </div>
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