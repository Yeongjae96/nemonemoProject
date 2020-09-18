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
<link rel="shortcut icon" href="<c:url value="/resources/images/common/logo/favicon.png"/>"> 

<!-- Google Fonts -->
<link
	href="https://fotnts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext"
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


<!-- alert CDN -->	
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>



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
				<h2>신고 조치 관리</h2>
			</div>

			<!-- Advanced Validation -->
			<div class="row clearfix">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="card">
						<div class="header">
							<h2>조치 상태 변경</h2>
						</div>
						<div class="body">
							<form id="reportEditForm" method="POST" action="edit.mdo">
								
								  <div class="form-group form-float" style="margin-top: 30px;">
                                    <label class="form-label">조치 상태</label>
                                    <select class="selectpicker" id="reportST" name="reportST">
                                        <option value="Y" <c:if test="${reportListVO.reportST eq 'Y'}">selected</c:if>>Y</option>
                                        <option value="N" <c:if test="${reportListVO.reportST eq 'N'}">selected</c:if>>N</option>
                                    </select>
                                    
                                </div>
							
								<input type="hidden" name="reportNO" value="${param.reportNO}"/>
								<button class="btn btn-primary waves-effect" type="submit">조치확인</button>
							
							</form>
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
		
		<!-- 개인 JS -->
	<script
		src="<c:url value ="/resources/js/admin/members/member_report_list_js"/>"></script>
		


</body>
</html>