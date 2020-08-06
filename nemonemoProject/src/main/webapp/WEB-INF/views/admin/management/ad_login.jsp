<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("adminId");
	String pw = request.getParameter("adminPw");
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>네모내모</title>
    <!-- Favicon-->
  <!--   <link rel="icon" href="../favicon.ico" type="image/x-icon"> -->
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">
 
    <!-- Bootstrap Core Css -->
    <link rel="stylesheet" href="<c:url value="/resources/vendor/plugins/bootstrap/css/bootstrap.css"/>">
    
    <!-- Animation Css -->
	<link rel="stylesheet" href="<c:url value="/resources/vendor/plugins/animate-css/animate.css"/>">
	
	<!-- Waves Effect Css -->
	<link rel="stylesheet" href="<c:url value="/resources/vendor/plugins/node-waves/waves.css"/>">
	
    <!-- common CSS -->
	<link rel="stylesheet" href="<c:url value="/resources/css/admin/common/style.css"/>">
    



    </head>

<body class="login-page">
    <div class="login-box">
        <div class="logo">
            <a href="javascript:void(0);">Admin<b>NemoNemo</b></a>
            <small>로그인 페이지</small>
        </div>
        <div class="card">
            <div class="body">
                <form id="loginAdmin" method="POST" action="login.mdo">
						<div class="msg">
							<b>로그인 하기</b>
						</div>
						<div class="input-group">
							<span class="input-group-addon"> <i class="material-icons">person</i>
							</span>
							<div class="form-line">
								<input type="text" class="form-control" id="adminId"
									name="adminId" placeholder="아이디를 입력하세요" required autofocus>
							</div>
						</div>
						<div class="input-group">
							<span class="input-group-addon"> <i class="material-icons">lock</i>
							</span>
							<div class="form-line">
								<input type="password" class="form-control"
									name="adminPw" minlength="6" placeholder="비밀번호를 입력하세요" required>
							</div>
						</div>
						<button class="btn btn-block btn-lg bg-pink waves-effect" type="submit" id="ad_login_submit">로그인</button>
						<!-- <div class="row">
							<div class="col-xs-4" style="margin-left: 30%;">
								<button class="btn btn-block bg-pink waves-effect" type="submit" value="로그인">로그인</button>
							</div>
						</div> -->
						<div class="row m-t-15 m-b--20">
							<div class="col-xs-6">
								<a href="signup.mdo">회원가입</a>
							</div>
							<div class="col-xs-6 align-right">
								<a href="forgotpw.mdo">비밀번호찾기</a>
							</div>
						</div>
					<c:if test="${msg == false}">
						<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
					</c:if>
				</form>
            </div>
        </div>
    </div>


	<!-- Jquery Core Js -->
	<script
		src="<c:url value ="/resources/vendor/plugins/jquery/jquery.js"/>"></script>

	<!-- Bootstrap Core Js -->
	<script
		src="<c:url value ="/resources/vendor/plugins/bootstrap/js/bootstrap.js"/>"></script>

	<!-- Waves Effect Plugin Js -->
	<script
		src="<c:url value ="/resources/vendor/plugins/node-waves/waves.js"/>"></script>

	<!-- Validation Plugin Js -->
	<script
		src="<c:url value ="/resources/vendor/plugins/jquery-validation/jquery.validate.js"/>"></script>

	<!-- Custom Js -->
	<script src="<c:url value ="/resources/vendor/common/javascript/pages/admin.js"/>"></script>


	<!-- 개인 JS -->
	<script src="<c:url value ="/resources/js/admin/management/ad_login.js"/>"></script>
	
</body>

</html>