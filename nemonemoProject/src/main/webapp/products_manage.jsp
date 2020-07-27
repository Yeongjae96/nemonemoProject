<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네모내모!</title>
<!-- 공통 CSS -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/common/common.css"/>">

<!-- 페이지 CSS  -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/products/products_manage.css"/>">


<!-- 라이브러리 -->
<script
	src="<c:url value="/resources/vendor/jquery/jquery-3.5.1.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/fontawsome/js/all.js"/>"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="<c:url value="/resources/js/user/common/common.js"/>"></script>

<!-- 해당 페이지 JS파일 -->
<script src="<c:url value="/resources/js/user/products/products_manage.js"/>"></script>


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
		<!-- 상품등록 메뉴바 -->
    <div class="container-fluid d-flex justify-content-center border-bottom">
        <!-- 메뉴 nav -->
        <nav class="flex-box products-nav">
            <div class="product-nav-item">
                <a href="#" class="product-nav-link">상품등록</a>
            </div>
            <div class="product-nav-item">
                <a href="#" class="product-nav-link">상품관리</a>
            </div>
            <div class="product-nav-item">
                <a href="#" class="product-nav-link">구매/판매 내역</a>
            </div>
        </nav>
    </div>

    <!-- 상품 관리 시작 -->
    <div class="products-manage__div">
        <main class="products-manage__main">
            <header class="products-manage__header">
                <form class="products-manage__form">
                    <input type="text" placeholder="상품명을 입력해주세요." value="">
                    <button type="submit" class="products-manage__search-Btn">
                        <i class="fas fa-search"></i>
                    </button>
                </form>
                <div class="products-manage__cbox-div">
                    <div class="products-manage__cbox-div2">
                        <div class="products-manage__cbox-div3" id="countComBox">
                            <div class="products-manage__cbox-div4" >
                                <div class="products-manage__cbox--item">10개씩</div>
                                <input id="react-select-3-input" readonly="" tabindex="0" aria-autocomplete="list"
                                    class="products-manage__cbox--input" value="">
                            </div>
                            <div class="products-manage__cbox--icon" id="countArrow">
                                <i class="fas fa-chevron-down"></i>
                            </div>
                            <div class="products-manage__count--list" id="countList">
                                <div class="products-manage__count--item">10개씩</div>
                                <div class="products-manage__count--item">20개씩</div>
                                <div class="products-manage__count--item">50개씩</div>
                                <div class="products-manage__count--item">100개씩</div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="products-manage__cbox-div">
                    <div class="products-manage__cbox-div2">
                        <div class="products-manage__cbox-div3" id="statusComBox">
                            <div class="products-manage__cbox-div4" >
                                <div class="products-manage__cbox--item">전체</div>
                                <input id="" readonly="" tabindex="0" aria-autocomplete="list"
                                    class="products-manage__cbox--input" value="">
                            </div>
                            <div class="products-manage__cbox--icon" id="statusArrow">
                                <i class="fas fa-chevron-down"></i>
                            </div>
                            <div class="products-manage__count--list" id="statusList">
                                <div class="products-manage__count--item">전체</div>
                                <div class="products-manage__count--item">판매중</div>
                                <div class="products-manage__count--item">예약중</div>
                                <div class="products-manage__count--item">판매완료</div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <table>
                <thead>
                    <tr>
                        <th>사진</th>
                        <th>판매상태</th>
                        <th>상품명</th>
                        <th>가격</th>
                        <th>찜/댓글</th>
                        <th>최근수정일</th>
                        <th>기능</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <a href="/products/128610767"><img
                                    src="https://media.bunjang.co.kr/product/128610767_1_1594281791_w304.jpg"
                                    alt="상품이미지"></a></td>
                        <td>
                            <div class="products-manage__cbox-div2">
                                <div class="products-manage__cbox-div3">
                                    <div class="products-manage__cbox-div4">
                                        <div class="products-manage__cbox--item">예약 중</div><input
                                            id="react-select-5-input" readonly="" tabindex="0" aria-autocomplete="list"
                                            class="products-manage__cbox--input" value="">
                                    </div>
                                    <div class="products-manage__cbox--icon">
                                        <i class="fas fa-chevron-down"></i>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td><a href="/products/128610767">에어팟 2세대 케이스</a></td>
                        <td>500원</td>
                        <td>0/2</td>
                        <td>2020-07-08 14:44</td>
                        <td><button type="button" class="products-manage__up-btn">UP</button>
                            <a class="products-manage__modify-link" href="/products/128610767/edit">수정</a></td>
                    </tr>
                </tbody>
            </table>
        </main>
        <div class="products-manage__footer">
            <div class="products-manage__footer--div">
                <a class="products-manage-paging__prev" href="#">
                    <i class="fas fa-chevron-left"></i>
                </a>
                <a class="products-manage-paging__page--active" href="#">1</a>
                <a class="products-manage-paging__page" href="#">2</a>
                <a class="products-manage-paging__page" href="#">3</a>
                <a class="products-manage-paging__page" href="#">4</a>
                <a class="products-manage-paging__page" href="#">5</a>
                <a class="products-manage-paging__next" href="#">
                    <i class="fas fa-chevron-right"></i>
                </a>
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