<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- top-menu -->
<nav class="top navbar nav-expand-sm navbar-light top-nav">
	<div class="top-menus">
		<div class="nav-box">
			<button class="btn-layout">
				<img src="<c:url value="/resources/images/user/common/fav.png"/>"
					width="20" height="18" alt="즐겨찾기아이콘">&nbsp;&nbsp;즐겨찾기
			</button>
		</div>
		<div class="nav-box">
			<!-- 오른쪽 네비 -->
			<button class="btn-layout" onclick="open_pop()">로그아웃</button>
			<!--내 상점 시작-->
			<div class="com-outline">
				<div class="dropdown-position">
					<a class="mystore" href="#">내상점</a>
					<div class="mystore-box">
						<a class="mystore-menu" href="#">내상품</a> <a class="mystore-menu"
							href="#">찜한상품</a> <a class="mystore-menu" href="#">계정설정</a>
					</div>
				</div>
			</div>
			<!-- 내상점 끝-->
			<div class="com-outline">
				<!-- 알림 아웃라인 -->
				<div class="alert-position">
					<a id="alert" class="alert-font" href="#">알림</a>
					<div class="alert-content-box">
						<a class="alert-anchor" href="#">
							<div class="alert-content">
								상점1111118호님이 회원님의 상점에 문의를 남겼습니다.<br> <span>3일 전</span>
							</div>
						</a>
					</div>
				</div>
			</div>
			<!--알림 끝 -->
			<!-- 고객센터 시작 -->
			<div class="com-outline">
				<div class="dropdown-position">
					<a class="cs" href="#">고객센터</a>
					<div class="cs-box">
						<a class="cs-menu" href="<c:url value="/customer/notice.do"/>">공지사항</a>
						<a class="cs-menu" href="#">운영정책</a> <a class="cs-menu" href="#">자주묻는
							질문</a> <a class="cs-menu" href="#">1:1상담하기</a> <a class="cs-menu"
							href="#">상담내역</a>
					</div>
				</div>
			</div>
			<!-- 고객센터 끝-->
		</div>
		<!--오른쪽 네비 끝 -->
	</div>
</nav>