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
	href="<c:url value="/resources/css/admin/members/member_report.css"/>">

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
	<section class="content">
		<div class="container-fluid">
			<!-- mem-list -->
			<div class="row clearfix">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="card">
						<div class="header">
							<h1>신고관리</h1>
						</div>

						<div class="body">
							<button type="button" class="btn bg-pink waves-effect m-r-20"
								data-toggle="modal" data-target="#registryModal"
								onclick="location.href = 'redirect:/members/report/listgo.mdo' ">신고
								카테고리</button>
							<div class="table-responsive">
								<table id="mem-report-list"
									class="table table-bordered table-striped table-hover dataTable display text-center">
									<h4>상점 신고목록</h4>
									<thead>
										<tr>
											<th style="width: 10%">신고번호</th>
											<th style="width: 10%">상품코드</th>
											<th style="width: 10%">상점코드</th>
											<th style="width: 10%">신고 카테고리</th>
											<th style="width: 10%">신고자</th>
											<th style="width: 10%">신고 대상</th>
											<th style="width: 10%">신고 내용</th>
											<th style="width: 10%">신고 날짜</th>
											<th style="width: 10%">처리상태</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="col-md-1">1</td>
											<td class="col-md-1">상점1102호</td>
											<!-- 해당 상점 정보 수정하기로 이동-->
											<td>어플광고</td>
											<td>2019/05/07</td>
											<td>호랑이네</td>
											<td>-</td>
											<td><a href="www.naver.com" alt="글">해당 글</a></td>
											<td class="col-md-1"><span class="label label-default">미완료</span></td>
											<td class="col-md-1"><span class="label label-default">미완료</span></td>
										</tr>
										<tr>
											<td class="col-md-1">1</td>
											<td class="col-md-2">공룡이네</td>
											<td>-</td>
											<td>2019/05/07<span class="label label-warning">
													New</span></td>
											<td>호랑이네</td>
											<td>-</td>
											<td><a href="www.daum.net" alt="글">해당 글</a></td>
											<td class="col-md-1"><span class="label label-primary">처리완료</span></td>
												<td class="col-md-1"><span class="label label-primary">처리완료</span></td>
										</tr>

									</tbody>
								</table>
							</div>
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

	<!-- 개인 JS -->
	<script
		src="<c:url value ="/resources/js/admin/members/member_report.js"/>"></script>


</body>
</html>