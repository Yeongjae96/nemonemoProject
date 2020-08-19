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
				<h2>배너 정보 수정</h2>
			</div>

			<!-- Advanced Validation -->
			<div class="row clearfix">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="card">
						<div class="header">
							<h2>배너 수정</h2>
						</div>
						<div class="body">
							<form id="bannerEditForm" method="POST" action="edit.mdo">

								<!-- 배너 순서 -->
								<div class="form-group form-float">
									<div class="form-line">
										<textarea class="form-control" name="bannerOrder"
											style="width: 100%; height: 40px; border: 1px;" required>${bannerVO.bannerOrder}</textarea>
										<label class="form-label">배너 순서 수정</label>
									</div>
									<div class="help-info">배너 순서를 수정하세요</div>
								</div>

								<!-- 의뢰주 -->
								<div class="form-group form-float">
									<div class="form-line">
										<textarea class="form-control" name="bannerClient"
											style="width: 100%; height: 40px; border: 1px;" required>${bannerVO.bannerClient}</textarea>
										<label class="form-label">의뢰주 정보 수정</label>
									</div>
									<div class="help-info">의뢰주 정보를 수정하세요</div>
								</div>

								<!-- 이미지 링크-->
								<div class="form-group form-float">
									<div class="form-line">
										<textarea class="form-control" name="bannerImageUrl"
											style="width: 100%; height: 40px; border: 1px;" required>${bannerVO.bannerImageUrl}</textarea>
										<label class="form-label">이미지 링크 수정</label>
									</div>
									<div class="help-info">이미지 링크를 수정하세요</div>
								</div>

								<!-- 이미지 링크 페이지-->
								<div class="form-group form-float">
									<div class="form-line">
										<textarea class="form-control" name="bannerDestUrl"
											style="width: 100%; height: 40px; border: 1px;" required>${bannerVO.bannerDestUrl}</textarea>
										<label class="form-label">배너 페이지 수정</label>
									</div>
									<div class="help-info">배너 페이지를 수정하세요</div>
								</div>

								<!-- 사용 여부 -->
								<div class="form-group form-float" style="margin-top: 30px;">
									<label class="form-label">사용 여부</label> <select
										class="selectpicker" id="bannerDelFl" name="bannerDelFl">
										<option value="Y"
											<c:if test="${bannerVO.bannerDelFl eq 'Y'}">selected</c:if>>Y</option>
										<option value="N"
											<c:if test="${bannerVO.bannerDelFl eq 'N'}">selected</c:if>>N</option>
									</select>

								</div>



								<input type="hidden" name="bannerNo" value="${param.bannerNo}" />
								<button class="btn btn-primary waves-effect" type="submit">수정하기</button>

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
		src="<c:url value ="/resources/js/admin/sites/site_banner_list.js"/>"></script>



</body>
</html>