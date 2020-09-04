<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="main_header container-fluid">
	<div class="flex">
		<!-- 로고 영역 -->
		<a href="<c:url value="/index.do"/>" id="main-logo-area"><img
			src="<c:url value="/resources/images/common/logo/mainLogo.png"/>"
			alt="mainLogo" id="main-logo"></a>

		<!-- 검색창 영역 -->
		<div class="search-area">
			<!-- 검색 입력 -->
			<div class="search-input">
				<input type="text" placeholder="상품명, 지역명, @상점명 입력"
					class="search-input__input" id="searchInput" value=""> <button 
					id="searchIconBtn"> <i class="fas fa-search fa-2x search-icon"></i>
				</button>
			</div>
			<!-- 나오는 영역 -->
			<div class="search-box" id="searchArea">
				<!-- 최근검색어 영역 -->
				<div class="search-recently__area" id="recentlyArea">
					<div class="recently-header">
						<button class="recently-menu"> 최근검색어 </button>
						<button class="popular-menu"> 인기검색어</button>
					</div>
					<div class="recently-body">
						<div class="recently-area">
							<div class="recently-div">
								<div class="recently-list" id="recentlyList">
								</div>
								<div class="recently-nothing" id="nothingRecently">
									<i class="fas fa-file-alt fa-2x"></i>
									<div>최근 검색어가 없습니다.</div>
								</div>
							</div>
						</div>
						<div class="popular-area">
							<div class="popular-div">
								<!-- 인기검색어가 들어갈 곳 -->
							</div>
						</div>
					</div>
				</div>
				<!-- 검색어 영역 -->
				<div class="box-search" id="searchBox">
					<div class="store-search">
						<div class=""></div>
						<a class="store-search-link"> <i class="fas fa-store"></i>
							상점검색 > <span id="searchKeyword"></span> <span
							class="store-search-span"> 상점명으로 검색 </span>
						</a>
					</div>
					<div class="search-result-list">
						<!-- 아이템 1개 -->
					</div>
				</div>
				<!-- 삭제 영역 -->
				<div class="search-close__area">
					<a class="search-close" id="searchAreaClose">닫기</a> <a
						class="search-all-delete__area" id="allDeleteBtn"> <i
						class="fas fa-trash-alt"></i> 검색어 전체삭제
					</a>
				</div>
			</div>
		</div>
		<!-- 우측메뉴 -->
		<div class="my-menu">
			<a class="my-menu-box" href="<c:url value="/products/new.do"/>">
				<img src="<c:url value="/resources/images/user/common/sell2.png"/>"
				alt="판매하기아이콘" id="sell-icon">&nbsp;&nbsp;판매하기
			</a> 
			<c:set var="isLogin" value="${user.storeNo}" />
			<c:choose>
				<c:when test="${not empty isLogin }"> 
				<a href="${pageContext.request.contextPath}/shop/${user.storeNo }/products.do"> 
					<img
					src="<c:url value="/resources/images/user/common/my_store.png"/>"
					alt="내상점아이콘" id="store-icon">&nbsp;&nbsp;내 상점 </a>
				</c:when>
				<c:otherwise>
				<a onclick="javascript:alert('로그인이 필요한 서비스입니다.');">
					<img
					src="<c:url value="/resources/images/user/common/my_store.png"/>"
					alt="내상점아이콘" id="store-icon">&nbsp;&nbsp;내 상점 </a> 
				</c:otherwise>
			</c:choose>

			
				
			
		</div>
	</div>
	<div class="cate-icon--area">
		<div class="cate-icon--div">
			<i class="fas fa-bars"></i>
			<div class="cate-menu--area">
				<!-- 대분류 -->
				<div class="cate-menu--list" id="lgCateList">
					<div class="cate-menu-list--title">
						전체 카테고리 <i class="fas fa-chevron-right"></i>
					</div>
					<div class="cate-menu-list--body"></div>
				</div>
				<!-- 중분류 -->
				<div class="cate-menu--list" id="mdCateList">
					<div class="cate-menu-list-md--title">
						대분류 선택 <i class="fas fa-chevron-right"></i>
					</div>
					<div class="cate-menu-list--body"></div>
				</div>
				<!-- 소분류 -->
				<div class="cate-menu--list" id="smCateList">
					<div class="cate-menu-list-sm--title">
						중분류 선택 <i class="fas fa-chevron-right"></i>
					</div>
					<div class="cate-menu-list--body"></div>
				</div>
			</div>
		</div>
	</div>

</div>
