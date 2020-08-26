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
<link rel="stylesheet"
	href="<c:url value="/resources/css/admin/sites/notice/site_notice_edit.css"/>">

<!--  테마 색상  -->
<link rel="stylesheet"
	href="<c:url value="/resources/vendor/common/stylesheets/theme-red.css"/>">



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

	<!-------------------------------------SECTION ---------------------------------------->
	<section class="content">
		<div class="container-fluid">
			<div class="block-header">
			</div>

			<!-- Advanced Validation -->
			<div class="row clearfix">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="btn-area clearfix">
								<button id="backBtn" class="btn btn-danger">뒤로 돌아가기</button>
						</div>
					<div class="card">
						
						<div class="header">
							<h2>공지사항 <span>수정</span></h2>
						</div>
						<div class="body">
								<div class="faq-row">
									<label class="">공지사항 제목</label>
									<div class="input-area">
										<input id="inputTitle" type="text" name="faqTitle"/>
										<div class="input-size">
											<span id="size">0</span>/30									
										</div>
									</div>
								</div>
								<div class="faq-row">
									<label class="">공지사항 사용 여부</label>
									<div class="radio-area">
										<label><input type="radio" value="Y" name="useFlag"/>사용</label> 
										<label><input type="radio" value="N" name="useFlag"/>미사용</label> 
									</div>
								</div>
								<div class="faq-row">
									<label class="">공지사항 내용</label>
								</div>
									<textarea id="faqContent" cols="120" rows="20" name="faqContent"></textarea>
								<div class="faq-row">
									<button id="newBtn" class="new-btn btn btn-success">수정</button>
								</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-------------------------------------SECTION ---------------------------------------->


	<!-- Jquery Core Js -->
	<script
		src="<c:url value ="/resources/vendor/plugins/jquery/jquery.js"/>"></script>

	<!-- Bootstrap Core Js -->
	<script
		src="<c:url value ="/resources/vendor/plugins/bootstrap/js/bootstrap.js"/>"></script>

	<!-- Slimscroll Plugin Js -->
	<script 
		src="<c:url value ="/resources/vendor/plugins/jquery-slimscroll/jquery.slimscroll.js"/>"></script>
		
	<!-- Waves Effect Plugin Js -->
	<script
		src="<c:url value ="/resources/vendor/plugins/node-waves/waves.js"/>"></script>

	<!-- Custom Js -->
	<script
		src="<c:url value ="/resources/vendor/common/javascript/pages/admin.js"/>"></script>
	
	<!-- smartEditor -->
	<script src="<c:url value ="/resources/vendor/smarteditor/js/HuskyEZCreator.js"/>"></script>
	<script>var contextPath = "${pageContext.request.contextPath}";</script>
	<script src="<c:url value ="/resources/js/admin/sites/notice/site_notice_edit.js"/>"></script>

	
</body>
</html>