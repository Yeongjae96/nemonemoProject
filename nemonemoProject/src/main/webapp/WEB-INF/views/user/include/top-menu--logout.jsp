<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!-- top-menu -->
       <nav class="navbar nav-expand-sm navbar-light top-nav">
        <div class="top-menus">
            <div class="nav-box">
                <button class="btn-layout addFavorite"><img src="<c:url value="/resources/images/user/common/fav.png"/>" width="20" height="18"
                        alt="즐겨찾기아이콘">&nbsp;&nbsp;즐겨찾기</button>
            </div>
            <div class="nav-box">
                <!-- 오른쪽 네비 -->
                <button class="btn-layout" id="logoutBtn">로그아웃</button>
                <!--내 상점 시작-->
                <div class="com-outline">
                    <div class="dropdown-position">
                        <a class="mystore" href="#">내상점</a>
                        <div class="mystore-box">
                            <button type="button" class="mystore-menu" onclick="location.href='#'">내상품</button>
                            <button type="button" class="mystore-menu" onclick="location.href='sign/info.do' ">내계정</button>
                            <button type="button" class="mystore-menu" onclick="location.href='sign/info.do' ">내계정</button>
                            <button type="button" class="mystore-menu" onclick="location.href='#'">찜한상품</button>
                            <button type="button" class="mystore-menu" onclick="location.href='sign/setting.do'">계정설정</button>
                        </div>
                    </div>
                </div> <!-- 내상점 끝-->
                <div class="com-outline">
                    <!-- 알림 아웃라인 -->
                    <div class="alert-position">
                        <a id = "alert" class="alert-font" href="#">알림</a>
                        <div class="alert-content-box">
                            <a class="alert-anchor" href="#">
                                <div class="alert-content">
                                    상점1111118호님이 회원님의 상점에 문의를 남겼습니다.<br>
                                    <span>3일 전</span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <!--알림 끝 -->
                <!-- 고객센터 시작 -->
               <div class="com-outline">
                    <div class="dropdown-position">
                        <div class="cs">고객센터</div>
                        <div class="cs-box">
                            <a class="cs-menu" href="<c:url value="/customer/notice.do"/>">공지사항</a>
                            <a class="cs-menu" href="<c:url value="/customer/policy.do"/>">운영정책</a>
                            <a class="cs-menu" href="<c:url value="/customer/faq/start.do"/>">자주묻는 질문</a>
                            <a class="cs-menu" href="<c:url value="/customer/qna.do"/>">1:1상담하기</a>
                            <a class="cs-menu" href="<c:url value="/customer/qna/list.do"/>">상담내역</a>
                        </div>
                    </div>
                </div> <!-- 고객센터 끝-->
            </div>
            <!--오른쪽 네비 끝 -->
        </div>
    </nav>
    
<!-- 모달 시작-->
<div id="myModal" class="modal">
	<!-- 모달 내용 -->
	<form method="post" action="${pageContext.request.contextPath}/sign/logout.do">
		<div class="modal-content">
			<div class="logout_h2">
				<h2>로그아웃</h2>
				<p>로그아웃 시 6개월 이상 경과된 번개톡 대화 내용이 모두 삭제됩니다. 계속하시겠습니까?</p>
			</div>
			<div class=logout_button_group>
				<div>
					<button class="confirm_logout" type="submit">확인</button>
				</div>
				<div>
					<input type="button" id="model-cancel" class="cancel_logout" value="취소">
				</div>	
			</div>
		</div>
	</form>
</div>
<!--End Modal-->