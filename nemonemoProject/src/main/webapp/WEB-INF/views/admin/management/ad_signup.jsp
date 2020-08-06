<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


<body class="signup-page">
    <div class="signup-box">
        <div class="logo">
            <a href="javascript:void(0);"><b>네모내모</b></a>
            <small>관리자 회원가입</small>
        </div>
        <div class="card">
            <div class="body">
                <form id="ad_sign_up" method="POST" action="signup.mdo">
                    <div class="msg"><b>Sign Up</b></div>
                    <input type="hidden" name="adminUse" value="Y">
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">person</i>
                        </span>
                        <div class="form-line">
                            <input type="text" class="form-control" id="adminId" name="adminId" placeholder="아이디를 입력하세요" required autofocus>
                        </div>
                        <button type="button" class="idCheck">중복확인</button>
                        <p class="result">
                        	<span class=msg>아이디를 확인해주세요</span>
                        </p>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">email</i>
                        </span>
                        <div class="form-line">
                            <input type="email" class="form-control" name="adminEmail" placeholder="이메일을 입력하세요" required>
                        </div>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">lock</i>
                        </span>
                        <div class="form-line">
                            <input type="password" class="form-control" id="pwd1" name="adminPw" minlength="6" placeholder="비밀번호를 입력하세요" required>
                        </div>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">lock</i>
                        </span>
                        <div class="form-line">
                            <input type="password" class="form-control" id="pwd2" name="adminPwConfirm" minlength="6" placeholder="비밀번호 중복확인" required>
                        </div>
                    </div>
                    <button class="btn btn-block btn-lg bg-pink waves-effect" type="submit" id="ad_signup_submit">회원가입</button>

                    <div class="m-t-25 m-b--5 align-center">
                        <a href="login.mdo">이미 가입하셨나요??</a>
                    </div>
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

	<!-- 개인 JS -->
	<script src="<c:url value ="/resources/js/admin/management/ad_signup.js"/>"></script>
	<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
	<script> 
			$(".idCheck").click(function() {
			var query = {
				adminId : $("#adminId").val()
			};

			$.ajax({
				url : "/nemonemoProject/management/idCheck",
				type : "post",
				data : query,
				success : function(data) {

					if (data == 1) {
						$(".result .msg").text("사용 불가");
						$(".result .msg").attr("style", "color:#f00");
					} else {
						$(".result .msg").text("사용 가능");
						$(".result .msg").attr("style", "color:#00f");
					}
				}
			}); // ajax 끝
		});
	</script>
</body>

</html>