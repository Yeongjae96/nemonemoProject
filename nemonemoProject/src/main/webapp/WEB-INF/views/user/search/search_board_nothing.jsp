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
<link rel="stylesheet" href="<c:url value="/resources/css/user/search/search_board_nothing.css"/>">


<!-- 라이브러리 -->
<script src="<c:url value="/resources/vendor/jquery/jquery-3.5.1.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/fontawsome/js/all.js"/>"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
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
            <div class="search-title__area">
                <div class="search-title__div">
                    <div class="search-title__left">
                        <span class="search--empha">아무거나 검색</span>
                        의 검색결과
                        <span class="search--count">0개</span>
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
            <div class="search-body__area">
                <div class="search-body__div">
                    <div class="search-body--title">
                        <div class="search-body--keyword">아무거나 검색</div>
                        에 대한 검색결과가 없습니다.
                    </div>
                    <div class="search-body--content">
                        - 단어의 철자가 정확한지 확인해 보세요<br>- 보다 일반적인 검색어로 다시 검색해 보세요<br>- 검색어의 띄어쓰기를 다르게 해보세요<br>- 유해/금지어가 아닌지 확인해주세요
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