<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="main_header container-fluid">
	<div class="flex">
		<!-- 로고 영역 -->
		<a href="<c:url value="/index.do"/>" id="main-logo-area"><img
			src="<c:url value="/resources/images/user/common/mainLogo.png"/>"
			alt="mainLogo" id="main-logo"></a>
		<!-- 검색창 영역 -->
		<div class="search">
			<div class="search_content">
				<!-- 검색창 -->
				<input type="text" placeholder="상품명, 지역명, @상점명 입력" id="searching"
					value="">

				<!-- 검색 내용 -->
				<div id="searched-box" class="invisible search-box">
					<div class="item" style="border-bottom: 1px solid #EEEEEE">
						<i class="fas fa-store">상점점색></i>
						<!-- 검색 데이터가 담길곳 -->
						<span id="searched-box-content"></span> <span
							class="recommend-message" id="searched-box-store">상점명으로 검색</span>
					</div>
					<div id="search-close-div">
						<a href="#" class="search-close">닫기</a>
					</div>
				</div>

				<!-- 인기검색어 및 최근 검색어 탭 -->
				<div id="recommend-box" class="invisible search-box">
					<ul class="nav nav-pills">
						<li class="active"><a href="#">Home</a></li>
						<li><a href="#">Menu 1</a></li>
						<li><a href="#">Menu 2</a></li>
						<li><a href="#">Menu 3</a></li>
					</ul>
					<!-- 검색 버튼 아이콘 -->
				</div>
				<a href="#"><img
					src="<c:url value="/resources/images/user/common/search_icon.png"/>"
					alt="검색 버튼 아이콘" id="search-icon"></a>
			</div>
		</div>
		<!-- 우측메뉴 -->
		<div class="my-menu">
			<a class="my-menu-box" href="<c:url value="/products/new.do"/>">
				<img src="<c:url value="/resources/images/user/common/sell2.png"/>"
				alt="판매하기아이콘" id="sell-icon">&nbsp;&nbsp;판매하기
			</a> <a href="${pageContext.request.contextPath}/shop/${user.storeNo }/products.do"> <img
				src="<c:url value="/resources/images/user/common/my_store.png"/>"
				alt="내상점아이콘" id="store-icon">&nbsp;&nbsp;내 상점
			</a>
		</div>
	</div>
	<div class="cate-icon--area">
		<div class="cate-icon--div">
			<i class="fas fa-bars"></i>
			<div class="cate-menu--area">
				<!-- 대분류 -->
				<div class="cate-menu--list" id="lgCateList">
					<div class="cate-menu-list--title">전체 카테고리
						<i class="fas fa-chevron-right"></i>
					</div>
					<div class="cate-menu-list--body">
					</div>
				</div>
				<!-- 중분류 -->
				<div class="cate-menu--list" id="mdCateList">
					<div class="cate-menu-list-md--title">대분류 선택
						<i class="fas fa-chevron-right"></i>
					</div>
					<div class="cate-menu-list--body">
					</div>
				</div>
				<!-- 소분류 -->
				<div class="cate-menu--list" id="smCateList">
					<div class="cate-menu-list-sm--title">중분류 선택
						<i class="fas fa-chevron-right"></i>
					</div>
					<div class="cate-menu-list--body">
					</div>
				</div>
			</div>
		</div>
	</div>

</div>

