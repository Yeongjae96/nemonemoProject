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

<!-- bootstrap select -->
<link rel="stylesheet"
	href="<c:url value="/resources/vendor/plugins/bootstrap-select/css/bootstrap-select.css"/>">


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

	<!------------------------------------------------SECTION----------------------------------------------->

	<section class="content">
		<div class="container-fluid">
			<div class="block-header">
				<h2>쿠폰 관리</h2>
			</div>

			<!-- Advanced Validation -->
			<div class="">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="card">
						<div class="header">
							<h2>쿠폰 수정</h2>
						</div>
						<div class="body">
							<form id="couponEditForm" method="POST" action="edit.mdo">
								<div class="form-group form-float">
									<div class="form-line">
										<input type="text" class="form-control" name="couponNm"
											min="2" max="200" required value="${couponVO.couponNm}"> <label class="form-label">쿠폰명</label>
									</div>
									<div class="help-info">쿠폰명 수정</div>
								</div>
								<div class="form-group form-float">
									<div class="form-line">
										<input type="url" class="form-control" name="couponContent"
											required value="${couponVO.couponContent}" > <label class="form-label">쿠폰내용</label>
									</div>
									<div class="help-info">쿠폰내용 수정</div>
								</div>
								<div class="form-group form-float" style="margin-top: 30px;">
									<label
									for="coupon-start">등록일</label> <input type="text" name="couponSrtYmd" id="couponSrtYmd"
									class="form-control" value="${couponVO.couponSrtYmd}" placeholder="등록일 수정"><br>

								<label for="coupon-end">종료일</label> <input type="text" name="couponEndYmd" id="couponEndYmd"
									class="form-control" value="${couponVO.couponEndYmd}"
									placeholder="종료일 수정"><br>
								</div>
								<div class="form-group form-float">
									<div class="form-line">
										<input type="text" class="form-control" name="couponDisPrice"
											required value="${couponVO.couponDisPrice}"> <label class="form-label">혜택 금액</label>
									</div>
									<div class="help-info">혜택금액 수정</div>
								</div>
								<input type="hidden" name="couponCd" value="${param.couponCd}"/>
								<button class="btn btn-primary waves-effect" type="submit">SUBMIT</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!------------------------------------------------SECTION----------------------------------------------->


	<!-- Jquery Core Js -->
	<script
		src="<c:url value ="/resources/vendor/plugins/jquery/jquery.js"/>"></script>

	<!-- Bootstrap Core Js -->
	<script
		src="<c:url value ="/resources/vendor/plugins/bootstrap/js/bootstrap.js"/>"></script>

	<%-- <!-- Select Plugin Js -->
	<script
		src="<c:url value ="/resources/vendor/plugins/bootstrap-select/js/bootstrap-select.js"/>"></script>
 --%>

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
		src="<c:url value ="/resources/js/admin/sites/site_coupon_list.js"/>"></script>
		
	<!-- Date picker bootstrap -->
	<script
		src="<c:url value ="/resources/vendor/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"/>"></script>


</body>
</html>