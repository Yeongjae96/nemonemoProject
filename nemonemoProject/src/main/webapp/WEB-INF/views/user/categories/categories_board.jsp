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


<!-- 라이브러리 -->
<script src="<c:url value="/resources/vendor/jquery/jquery-3.5.1.min.js"/>"></script>
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
		<div class="categories__area">
        <div class="category-head__area">
            <div class="category-head__div">
                <!-- 상단 메뉴 -->
                <div class="category-menu__div">
                    <div class="category-menu-home">
                        <i class="fas fa-home"></i>
                        홈
                    </div>

                    <div class="category-menu-cbox__item">
                        <i class="fas fa-chevron-right"></i>
                        <div class="category-menu-cbox__area">
                            <div class="category-menu-cbox__div">
                                <div class="category-menu-cbox__display">
                                    패션잡화
                                    <i class="fas fa-chevron-down"></i>
                                </div>
                                <div class="category-menu-cbox__list">
                                    <div class="category-menu-cbox__item--active">
                                        패션잡화
                                    </div>
                                    <div class="category-menu-cbox__item">여성의류</div>
                                    <div class="category-menu-cbox__item">남성의류</div>
                                    <div class="category-menu-cbox__item">디지털/가전</div>
                                    <div class="category-menu-cbox__item">도서/티켓/취미/애완</div>
                                    <div class="category-menu-cbox__item">생활/문구/가구/식품</div>
                                    <div class="category-menu-cbox__item">유아동/출산</div>
                                    <div class="category-menu-cbox__item">스타굿즈</div>
                                    <div class="category-menu-cbox__item">스포츠/레저</div>
                                    <div class="category-menu-cbox__item">뷰티/미용</div>
                                    <div class="category-menu-cbox__item">기타</div>
                                    <div class="category-menu-cbox__item">차량/오토바이</div>
                                    <div class="category-menu-cbox__item">구인구직</div>
                                    <div class="category-menu-cbox__item">재능</div>
                                    <div class="category-menu-cbox__item">번개나눔</div>
                                    <div class="category-menu-cbox__item">지역 서비스</div>
                                    <div class="category-menu-cbox__item">원룸/함께살아요</div>
                                    <div class="category-menu-cbox__item">커뮤니티</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="category-menu-cbox__item">
                        <i class="fas fa-chevron-right"></i>
                        <div class="category-menu-cbox__area">
                            <div class="category-menu-cbox__div">
                                <div class="category-menu-cbox__display">
                                    패션잡화
                                    <i class="fas fa-chevron-down"></i>
                                </div>
                                <div class="category-menu-cbox__list">
                                    <div class="category-menu-cbox__item--active">
                                        패션잡화
                                    </div>
                                    <div class="category-menu-cbox__item">여성의류</div>
                                    <div class="category-menu-cbox__item">남성의류</div>
                                    <div class="category-menu-cbox__item">디지털/가전</div>
                                    <div class="category-menu-cbox__item">도서/티켓/취미/애완</div>
                                    <div class="category-menu-cbox__item">생활/문구/가구/식품</div>
                                    <div class="category-menu-cbox__item">유아동/출산</div>
                                    <div class="category-menu-cbox__item">스타굿즈</div>
                                    <div class="category-menu-cbox__item">스포츠/레저</div>
                                    <div class="category-menu-cbox__item">뷰티/미용</div>
                                    <div class="category-menu-cbox__item">기타</div>
                                    <div class="category-menu-cbox__item">차량/오토바이</div>
                                    <div class="category-menu-cbox__item">구인구직</div>
                                    <div class="category-menu-cbox__item">재능</div>
                                    <div class="category-menu-cbox__item">번개나눔</div>
                                    <div class="category-menu-cbox__item">지역 서비스</div>
                                    <div class="category-menu-cbox__item">원룸/함께살아요</div>
                                    <div class="category-menu-cbox__item">커뮤니티</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 카테고리 서브 메뉴 -->
                <div class="category-sub__area">
                    <div class="category-sub__list">
                        <a class="category-sub__total-link" href="#">
                            전체보기
                            <i class="fas fa-chevron-right"></i>
                        </a>
                        <div class="category-sub__item">
                            <a class="category-sub__item-link">
                                <div class="category-sub__item-name">
                                    숄더백
                                </div>
                                <div class="category-sub__item-count">
                                    19만+
                                </div>
                            </a>
                        </div>
                        <div class="category-sub__item">
                            <a class="category-sub__item-link">
                                <div class="category-sub__item-name">
                                    크로스백
                                </div>
                                <div class="category-sub__item-count">
                                    13만+
                                </div>
                            </a>
                        </div>
                        <div class="category-sub__item">
                            <a class="category-sub__item-link">
                                <div class="category-sub__item-name">
                                    토트백
                                </div>
                                <div class="category-sub__item-count">
                                    7만+
                                </div>
                            </a>
                        </div>
                        <div class="category-sub__item">
                            <a class="category-sub__item-link">
                                <div class="category-sub__item-name">
                                    클러치백
                                </div>
                                <div class="category-sub__item-count">
                                    4만+
                                </div>
                            </a>
                        </div>
                        <div class="category-sub__item">
                            <a class="category-sub__item-link">
                                <div class="category-sub__item-name">
                                    기타(여성가방)
                                </div>
                                <div class="category-sub__item-count">
                                    3만+
                                </div>
                            </a>
                        </div>
                        <div class="category-sub__item">
                            <a class="category-sub__item-link">
                                <div class="category-sub__item-name">
                                    백팩
                                </div>
                                <div class="category-sub__item-count">
                                    2만+
                                </div>
                            </a>
                        </div>
                        <div class="category-sub__item">
                            <a class="category-sub__item-link">
                                <div class="category-sub__item-name">
                                    미니백
                                </div>
                                <div class="category-sub__item-count">
                                    1만+
                                </div>
                            </a>
                        </div>
                        <div class="category-sub__item">
                            <a class="category-sub__item-link">
                                <div class="category-sub__item-name">
                                    파우치
                                </div>
                                <div class="category-sub__item-count">
                                    1만+
                                </div>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- 카테고리 추천 상품  제목-->
                <div class="category-rec-title__area">
                    <div class="category-rec-title__div">
                        <span class="category--empha">여성가방</span>
                        의 추천상품
                        <!-- AD 마크 들어가는 부분-->
                    </div>
                </div>
                <!-- 카테고리 추천 상품 내용 -->
                <div class="category-rec-content__area">
                    <div class="category-rec-content__list">
                        <!-- 아이템 1개-->
                        <div class="category-rec-content__item">
                            <a href="#" class="category-rec-content__link">
                                <div class="category-rec-content__image">
                                    <img src="<c:url value="/resources/images/user/categories/image_1.jpg"/>"/>
                                </div>
                                <div class="category-rec-content__title">
                                    <div class="category-rec-content__title-text">
                                        국내배송 20SS 생♥︎♥︎ 모노그램 마틀라세 클러치[내부 각인 O ]
                                    </div>
                                    <div class="category-rec-content__title-price">
                                        <div class="category-rec-content__title-price--text">169,000</div>

                                    </div>
                                    <!-- 광고마크 생략 -->
                                </div>
                                <div class="category-rec-content__location">
                                    <i class="fas fa-map-marker-alt fa-2x"></i>
                                    전국
                                </div>
                            </a>
                        </div>

                        <div class="category-rec-content__item">
                            <a href="#" class="category-rec-content__link">
                                <div class="category-rec-content__image">
                                    <img src="<c:url value="/resources/images/user/categories/image_1.jpg"/>" alt="상품이미지" />
                                </div>
                                <div class="category-rec-content__title">
                                    <div class="category-rec-content__title-text">
                                        국내배송 20SS 생♥︎♥︎ 모노그램 마틀라세 클러치[내부 각인 O ]
                                    </div>
                                    <div class="category-rec-content__title-price">
                                        <div class="category-rec-content__title-price--text">169,000</div>

                                    </div>
                                    <!-- 광고마크 생략 -->
                                </div>
                                <div class="category-rec-content__location">
                                    <i class="fas fa-map-marker-alt fa-2x"></i>
                                    전국
                                </div>
                            </a>
                        </div>

                        <div class="category-rec-content__item">
                            <a href="#" class="category-rec-content__link">
                                <div class="category-rec-content__image">
                                    <img src="<c:url value="/resources/images/user/categories/image_1.jpg"/>" alt="상품이미지" />
                                </div>
                                <div class="category-rec-content__title">
                                    <div class="category-rec-content__title-text">
                                        국내배송 20SS 생♥︎♥︎ 모노그램 마틀라세 클러치[내부 각인 O ]
                                    </div>
                                    <div class="category-rec-content__title-price">
                                        <div class="category-rec-content__title-price--text">169,000</div>

                                    </div>
                                    <!-- 광고마크 생략 -->
                                </div>
                                <div class="category-rec-content__location">
                                    <i class="fas fa-map-marker-alt fa-2x"></i>
                                    전국
                                </div>
                            </a>
                        </div>

                        <div class="category-rec-content__item">
                            <a href="#" class="category-rec-content__link">
                                <div class="category-rec-content__image">
                                    <img src="<c:url value="/resources/images/user/categories/image_1.jpg"/>" alt="상품이미지" />
                                </div>
                                <div class="category-rec-content__title">
                                    <div class="category-rec-content__title-text">
                                        국내배송 20SS 생♥︎♥︎ 모노그램 마틀라세 클러치[내부 각인 O ]
                                    </div>
                                    <div class="category-rec-content__title-price">
                                        <div class="category-rec-content__title-price--text">169,000</div>

                                    </div>
                                    <!-- 광고마크 생략 -->
                                </div>
                                <div class="category-rec-content__location">
                                    <i class="fas fa-map-marker-alt fa-2x"></i>
                                    전국
                                </div>
                            </a>
                        </div>

                        <div class="category-rec-content__item">
                            <a href="#" class="category-rec-content__link">
                                <div class="category-rec-content__image">
                                    <img src="<c:url value="/resources/images/user/categories/image_1.jpg"/>" alt="상품이미지" />
                                </div>
                                <div class="category-rec-content__title">
                                    <div class="category-rec-content__title-text">
                                        국내배송 20SS 생♥︎♥︎ 모노그램 마틀라세 클러치[내부 각인 O ]
                                    </div>
                                    <div class="category-rec-content__title-price">
                                        <div class="category-rec-content__title-price--text">169,000</div>

                                    </div>
                                    <!-- 광고마크 생략 -->
                                </div>
                                <div class="category-rec-content__location">
                                    <i class="fas fa-map-marker-alt fa-2x"></i>
                                    전국
                                </div>
                            </a>
                        </div>

                        <div class="category-rec-content__item">
                            <a href="#" class="category-rec-content__link">
                                <div class="category-rec-content__image">
                                    <img src="<c:url value="/resources/images/user/categories/image_1.jpg"/>" alt="상품이미지" />
                                </div>
                                <div class="category-rec-content__title">
                                    <div class="category-rec-content__title-text">
                                        국내배송 20SS 생♥︎♥︎ 모노그램 마틀라세 클러치[내부 각인 O ]
                                    </div>
                                    <div class="category-rec-content__title-price">
                                        <div class="category-rec-content__title-price--text">169,000</div>

                                    </div>
                                    <!-- 광고마크 생략 -->
                                </div>
                                <div class="category-rec-content__location">
                                    <i class="fas fa-map-marker-alt fa-2x"></i>
                                    전국
                                </div>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- 페이징 부분 -->
                <div class="category-paging__area">
                    <div class="category-paging__div">
                        <a class="category-paging__prev" href="#">
                            <i class="fas fa-chevron-left"></i>
                        </a>
                        <a class="category-paging__page--active" href="#">1</a>
                        <a class="category-paging__page" href="#">2</a>
                        <a class="category-paging__page" href="#">3</a>
                        <a class="category-paging__page" href="#">4</a>
                        <a class="category-paging__page" href="#">5</a>
                        <a class="category-paging__next" href="#">
                            <i class="fas fa-chevron-right"></i>
                        </a>
                    </div>
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