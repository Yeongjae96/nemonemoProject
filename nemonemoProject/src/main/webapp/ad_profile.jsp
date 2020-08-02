<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<title>네모내모</title>
<!-- Favicon-->

<link rel="icon" href="favicon.ico" type="image/x-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" type="text/css">

<!-- Bootstrap Core Css -->
<link rel="stylesheet"
	href="<c:url value="/resources/vendor/plugins/bootstrap/css/bootstrap.css"/>">

<!-- Animation Css -->
<link rel="stylesheet"
	href="<c:url value="/resources/vendor/plugins/animate-css/animate.css"/>">

<!-- common CSS -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/admin/common/style.css"/>">

<!--  테마 색상  -->
<link rel="stylesheet"
	href="<c:url value="/resources/vendor/common/stylesheets/theme-red.css"/>">

<!-- 개인 CSS -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/admin/management/ad_profile.css"/>">


</head>
<body class="theme-red">

	<% 
		/* 공통 Header and Nav */
	%>
	<header>
		<jsp:include page="/WEB-INF/views/admin/include/header.jsp" />
		<jsp:include page="/WEB-INF/views/admin/include/side-nav.jsp" />
	</header>

	<% 
		/* 각 페이지의 SECTION */
	%>


	<!-------------------------------------------SECTION--------------------------------------------------->

	<section class="content">
 				<div class="col-xs-12 col-sm-3">
					<div class="card profile-card">
						<div class="profile-header">&nbsp;</div>
						<div class="profile-body">
							<div class="image-area">
								<img src="adminPhoto.jpg" alt="관리자 사진" />
							</div>
							<div class="content-area">
								<h3>관리자</h3>
								<p>메인 관리자</p>
								<p>Administrator</p>
							</div>
						</div>
					</div>
				</div>			
				
				<div class="col-xs-12 col-sm-7">
					<div class="card">
						<div class="body">
							<div style ="padding-top : 40px;">
								<form class="form-horizontal" method="GET" action="management.profile.mdo">
								
									<div class="form-group">																				
										<label for="Email" class="col-sm-2 control-label">직책</label>
										<div class="col-sm-10">
											<div class="form-line">
												<input type="text" class="form-control" id="adminPosition"
													name="adminPosition" placeholder="관리자 직책" value=""
													required>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="Email" class="col-sm-2 control-label">아이디</label>
										<div class="col-sm-10">
											<div class="form-line">
												<input type="email" class="form-control" id="adminEmail"
													name="adminId" placeholder="아이디" value="${managementVO.adminId}" required>
											</div>
										</div>
									</div>
									
									<div class="form-group">
										<label for="Email" class="col-sm-2 control-label">이메일</label>
										<div class="col-sm-10">
											<div class="form-line">
												<input type="email" class="form-control" id="adminEmail"
													name="adminEmail" placeholder="이메일" value="${managementVO.adminEmail}" required>
											</div>
										</div>
									</div>
									<%-- <div class="form-group">
										<label for="Email" class="col-sm-2 control-label">휴대폰</label>
										<div class="col-sm-10">
											<div class="form-line">
												<input type="text" class="form-control" id="adminPhone"
													name="adminPhone" placeholder="휴대폰" value="${managementVO.adminPhone}" required>
											</div>
										</div>
									</div> --%>

									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<button type="submit" class="btn btn-danger">수정</button>
										</div>
									</div>
									
								</form>
							</div>
						</div>
					</div>
				</div>

	</section>

	<!-------------------------------------------SECTION--------------------------------------------------->

	<!-- Jquery Core Js -->
	<script
		src="<c:url value ="/resources/vendor/plugins/jquery/jquery.js"/>"></script>

	<!-- Bootstrap Core Js -->
	<script
		src="<c:url value ="/resources/vendor/plugins/bootstrap/js/bootstrap.js"/>"></script>

	<!-- Select Plugin Js -->
	<script
		src="<c:url value ="/resources/vendor/plugins/bootstrap-select/js/bootstrap-select.js"/>"></script>

	<!-- Slimscroll Plugin Js -->
	<script
		src="<c:url value ="/resources/vendor/plugins/jquery-slimscroll/jquery.slimscroll.js"/>"></script>

	<!-- Waves Effect Plugin Js -->
	<script
		src="<c:url value ="/resources/vendor/plugins/node-waves/waves.js"/>"></script>

	<!-- Custom Js -->
	<script
		src="<c:url value ="/resources/vendor/common/javascript/pages/admin.js"/>"></script>

	<!-- 개인 JS -->
	<script
		src="<c:url value ="/resources/js/admin/transaction/ad_profile.js"/>"></script>


</body>
</html>