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

<!-- JQuery DataTable Css -->
<link rel="stylesheet"
	href="<c:url value="/resources/vendor/plugins/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css"/>">



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

	<!-- 직원 삭제 경고창 모달 -->
	<div class="modal fade" id="smallModal" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title text-center modal-col-red"
						id="smallModalLabel">주의</h3>
				</div>
				<div class="modal-body">
					<h1 class="text-center">직원삭제</h1>
					<h5 class="text-center">확인 버튼을 누르시면</h5>
					<h5 class="text-center">해당 직원은 삭제 됩니다.</h5>
					<h5 class="text-center">삭제 하시겠습니까?</h5>

				</div>
				<div class="modal-footer">
					<button id="admin-del-confirm" type="button"
						class="btn btn-link waves-effect" data-dismiss="modal">삭제</button>
					<button id="admin-del-cancel" type="button" class="btn btn-link waves-effect"
						data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 직원 삭제 경고창 모달 끝-->


	<section class="content">
		<div class="container-fluid">
			<div class="block-header">
				<h1>관리자 정보</h1>
			</div>
			<div class="row clearfix">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="card">
						<div class="body">
							<div class="table-responsive">
								<table id="admin-table"
									class="table table-bordered table-striped table-hover display">
									<h3>직원 관리</h3>
									<thead>
										<tr>
											<th>직원 번호</th>
											<th>아이디</th>
											<th>이메일</th>
											<th>수정/삭제</th>
										</tr>
									</thead>
									<tbody id="result">
										<c:forEach var="admin" items="${adminList}">
											<tr>
												<td>${admin.adminNo}</td>
												<td>${admin.adminId}</td>
												<td>${admin.adminEmail}</td>
												<td class="text-center">
													<!-- 직원수정  -->
													<button type="button"
														class="btn bg-blue waves-effect admin-upd-btn"
														data-target="#admin_upd_btn" 
														data-toggle="modal"
														data-adminNo="${admin.adminNo}">수정</button>
													<button type="button"
														class="btn bg-red waves-effect admin-del-btn"
														data-adminNo="${admin.adminNo}">삭제</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 직원 수정 -->
 			<div class="modal fade" id="coupon_in" role="dialog">
				<div class="modal-dialog">
					Modal 내용
					<div class="modal-content">
						modal header
						<div class="modal-header">
							<h4 class="modal-title">직원 수정</h4>
						</div>

						<div class="modal-body">
							<form method="POST" action="new.mdo" name="adminForm">
								<div class="form-group">
									<label for="adminEmail">이메일</label> 
									<input type="text" class="form-control" name="adminEmail" id="adminEmail" placeholder="이메일을 입력해 주세요"> 
								</div>
							</form>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-success"
								data-dismiss="modal" value="Upload" id="adminInsert">업데이트</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
						</div>
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


	<!-- Slimscroll Plugin Js -->
	<script
		src="<c:url value ="/resources/vendor/plugins/jquery-slimscroll/jquery.slimscroll.js"/>"></script>

	<!-- Waves Effect Plugin Js -->
	<script
		src="<c:url value ="/resources/vendor/plugins/node-waves/waves.js"/>"></script>

	<!-- Jquery DataTable Plugin Js -->
	<script
		src="<c:url value ="/resources/vendor/plugins/jquery-datatable/jquery.dataTables.js"/>"></script>
	<script
		src="<c:url value ="/resources/vendor/plugins/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js"/>"></script>
	<script
		src="<c:url value ="/resources/vendor/plugins/jquery-datatable/extensions/export/dataTables.buttons.min.js"/>"></script>
	<script
		src="<c:url value ="/resources/vendor/plugins/jquery-datatable/extensions/export/buttons.flash.min.js"/>"></script>
	<script
		src="<c:url value ="/resources/vendor/plugins/jquery-datatable/extensions/export/jszip.min.js"/>"></script>
	<script
		src="<c:url value ="/resources/vendor/plugins/jquery-datatable/extensions/export/pdfmake.min.js"/>"></script>
	<script
		src="<c:url value ="/resources/vendor/plugins/jquery-datatable/extensions/export/vfs_fonts.js"/>"></script>
	<script
		src="<c:url value ="/resources/vendor/plugins/jquery-datatable/extensions/export/buttons.html5.min.js"/>"></script>
	<script
		src="<c:url value ="/resources/vendor/plugins/jquery-datatable/extensions/export/buttons.print.min.js"/>"></script>

	<!-- Custom Js -->
	<script
		src="<c:url value ="/resources/vendor/common/javascript/pages/admin.js"/>"></script>
	<script
		src="<c:url value ="/resources/vendor/puglins/jquery-datatable/jquery-datatable.js"/>"></script>

	<!-- 개인 JS -->
	<script
		src="<c:url value ="/resources/js/admin/management/ad_profile.js"/>"></script>

	<!-- Date picker bootstrap -->
	<script
		src="<c:url value ="/resources/vendor/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"/>"></script>