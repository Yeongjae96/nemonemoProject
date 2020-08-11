<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="main_header container-fluid">
	<div class="flex">
		<!-- 로고 영역 -->
		<a href="<c:url value="/index.do"/>" id="main-logo-area"><img
			src="<c:url value="/resources/images/user/common/mainLogo.png"/>" alt="mainLogo"
			id="main-logo"></a>
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
						<a href="#" class	="search-close">닫기</a>
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
				<a href="#"><img src="<c:url value="/resources/images/user/common/search_icon.png"/>"
					alt="검색 버튼 아이콘" id="search-icon"></a>
			</div>
		</div>
		<!-- 우측메뉴 -->
		<div class="my-menu">
			<a class="my-menu-box" href="<c:url value="/products/new.do"/>"> <img
				src="<c:url value="/resources/images/user/common/sell2.png"/>" alt="판매하기아이콘"
				id="sell-icon">&nbsp;&nbsp;판매하기
			</a> <a href="#"> <img src="<c:url value="/resources/images/user/common/my_store.png"/>"
				alt="내상점아이콘" id="store-icon">&nbsp;&nbsp;내 상점
			</a>
		</div>
	</div>
	<div class="categories">
		<!-- 카테고리 -->
		<div id="menu-container">
			<div id="menu-wrapper">
				<!-- hamburger-menu -->
				<div id="hamburger-menu">
					<span></span><span></span><span></span>
				</div>
			</div>

			<!-- menu-wrapper -->
			<ul class="menu-list accordion">
				<li id="nav1" class="toggle accordion-toggle"><span
					class="icon-plus"></span> <a class="menu-link" href="#">패션잡화</a></li>
				<ul class="menu-submenu accordion-content">
					<li><a class="head" href="#">여성가방</a></li>
					<li><a class="head" href="#">운동화/캐주얼화</a></li>
					<li><a class="head" href="#">주얼리/액세서리</a></li>
				</ul>
				<li id="nav2" class="toggle accordion-toggle"><span
					class="icon-plus"></span> <a class="menu-link" href="#">여성의류</a></li>
				<ul class="menu-submenu accordion-content">
					<li><a class="head" href="#">Submenu1</a></li>
					<li><a class="head" href="#">Submenu2</a></li>
				</ul>
				<li id="nav3" class="toggle accordion-toggle"><span
					class="icon-plus"></span> <a class="menu-link" href="#">남성의류</a></li>
				<ul class="menu-submenu accordion-content">
					<li><a class="head" href="#">Submenu1</a></li>
					<li><a class="head" href="#">Submenu2</a></li>
					<li><a class="head" href="#">Submenu3</a></li>
					<li><a class="head" href="#">Submenu4</a></li>
				</ul>
			</ul>
			<!-- menu-list accordion-->
		</div>
	</div>
</div>

<!-- 모달 시작-->
<div id="myModal" class="modal">

	<!-- 모달 내용 -->
	<form method="post" action="sign/logout.do">
		<div class="modal-content">
			<div class="logout_h2">
				<h2>로그아웃</h2>
				<p>로그아웃 시 6개월 이상 경과된 번개톡 대화 내용이 모두 삭제됩니다. 계속하시겠습니까?</p>
			</div>
			<div class=logout_button_group>
				<div>
					<button id="model-cancel" class="cancel_logout">취소</button>
				</div>
				<div>
					<button class="confirm_logout" type="submit">확인</button>
				</div>
			</div>
		</div>
	</form>

</div>
<!--End Modal-->
