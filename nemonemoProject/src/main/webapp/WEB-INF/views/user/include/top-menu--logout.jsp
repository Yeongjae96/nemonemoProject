<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script> window.contextPath = "<c:url value="/"/>"</script>    
<html>
	<head>
		<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <style>
					/********** nav 시작 **********/
.top-nav{
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    height: 40px;
    border-bottom: 1px solid rgb(238, 238, 238);
    background: rgb(255, 255, 255);
   	padding: 0px;
}

.top-nav button:focus{
	outline: 0;
}

.top-menus{
    width: 1024px;
    display: flex;
    -webkit-box-pack: justify;
    justify-content: space-between;
}

.nav-box{
    display: flex;
    flex-shrink: 0;
}


.btn-layout{
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    font-size: 13px;
    color: rgb(102, 102, 102);
    position: relative;
    line-height: 1.4;
    padding: 0px 15px;
    
}


/* 알림 시작 */

.com-outline{
    display: flex;
    align-items: center;
    font-size: 13px;
    color: rgb(102, 102, 102);
    position: relative;
    line-height: 1.4;
    padding: 0px 15px;
    height : 40px;
}

.alert-content-box{
    position: absolute;
    width: 400px;
    max-height: 450px;
    overflow-y: auto;
    top: 100%;
    left: calc(50% - 200px);
    visibility: hidden;
    z-index: 3000;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(238, 238, 238);
    border-image: initial;
    background: rgb(249, 249, 249);
}
.alert-content{
    display: block;
}
.alert-content > span{
    display: inline-block;
    color: rgb(136, 136, 136);
    font-size: 11px;
    margin-left: 5px;
}

.alert-anchor{
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    color: rgb(33, 33, 33);
    background: rgb(255, 255, 255);
    padding: 20px;
    border-bottom: 1px solid rgb(250, 250, 250);
}


.alert-position{
    position: relative;
    width: 100%;
    height: 100%;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
}

.com-outline::after{
    content: "";
    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAKCAYAAAC0VX7mAAAAAXNSR0IArs4c6QAAAGxJREFUKBWt0s0NgDAIBWDbztS747CFdQvGcQBmAoOJiT+0ovUl3B7f6QUAKMw8DT8kxjgnIlpyzkFExh5TMUQsSZFedMfU2sAe9IidwC/oFbuBb1ALM0EPWsOqYAttYU3QQp8w/XFFx6/nKa8iD1fC7ZiLwQAAAABJRU5ErkJggg==);
    background-size: 10px 5px;
    position: absolute;
    top: 18px;
    right: 0px;
    width: 10px;
    height: 5px;
    cursor: default;
}

.alert-font{
    display: block;
    font-size: 13px;
    color: rgb(102, 102, 102);
}


/* 알림 끝 */

/* 내상점, 고객센터 포지션*/
.dropdown-position{
    position: relative;
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
}
/* 내상점 */
.mystore{
    display: block;
    font-size: 13px;
    color: rgb(102, 102, 102);
}

.mystore-box{
    position: absolute;
    width: 88px;
    top: 100%;
    left: calc(50% - 44px);
    visibility: hidden;
    z-index: 3000;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(238, 238, 238);
    border-image: initial;
    padding: 15px 15px;
    background: rgb(255, 255, 255);
}

.mystore-menu{
    display: block;
    text-align: center;
    margin-bottom: 10px;
    color: rgb(136, 136, 136);
}

.mystore-menu:last-child {
    margin-bottom: 0px;
}

/* 고객센터 시작*/

.cs{
    display: block;
    font-size: 13px;
    color: rgb(102, 102, 102);
}

.cs-box{
    position: absolute;
    width: 110px;
    top: 100%;
    left: calc(50% - 44px);
    visibility: hidden;
    z-index: 3000;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(238, 238, 238);
    border-image: initial;
    padding: 15px 15px;
    background: rgb(255, 255, 255);
}

.cs-menu{
    display: block;
    text-align: center;
    margin-bottom: 10px;
    color: rgb(136, 136, 136);
}

.cs-menu:last-child {
    margin-bottom: 0px;
}
    
    </style>
    <title>상품등록</title>
	</head>
<script>
	$(function() {
		$('#logoutBtn').click(function() {
			$('#myModal').show()
		});
		$('#model-cancel').click(function() {
			$('#myModal').hide()
		});
	})
</script>
<body>
		<!-- top-menu -->
       <nav class="top navbar nav-expand-sm navbar-light top-nav">
        <div class="top-menus">
            <div class="nav-box">
                <button class="btn-layout"><img src="<c:url value="/resources/images/user/common/fav.png"/>" width="20" height="18"
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
                        <a class="cs" href="#">고객센터</a>
                        <div class="cs-box">
                            <a class="cs-menu" href="<c:url value="/customer/notice.do"/>">공지사항</a>
                            <a class="cs-menu" href="#">운영정책</a>
                            <a class="cs-menu" href="#">자주묻는 질문</a>
                            <a class="cs-menu" href="#">1:1상담하기</a>
                            <a class="cs-menu" href="#">상담내역</a>
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
	<form method="post" action="sign/logout.do">
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
</body>


</html>