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
	href="<c:url value="/resources/css/admin/sites/site_banner_list.css"/>">

<!-- DatePicker Css -->
<link rel="stylesheet"
	href="<c:url value="/resources/vendor/plugins/bootstrap-datepicker/css/bootstrap-datepicker.css"/>">

<!-- bootstrap select -->
<link rel="stylesheet"
	href="<c:url value="/resources/vendor/plugins/bootstrap-select/css/bootstrap-select.css"/>">

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
	<!-- 모달 시작-->
	<div class="modal fade" id="smallModal" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title text-center modal-col-red"
						id="smallModalLabel">배너삭제</h3>
				</div>
				<div class="modal-body">
					<h1 class="text-center">주의!</h1>
					<h5 class="text-center">확인 버튼을 누르시면</h5>
					<h5 class="text-center">해당 배너는 삭제 됩니다.</h5>
					<h5 class="text-center">삭제 하시겠습니까?</h5>

				</div>
				<div class="modal-footer">
					<button id="del-confirm" type="button"
						class="btn btn-link waves-effect" data-dismiss="modal">삭제</button>
					<button type="button" class="btn btn-link waves-effect"
						data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<!--모달 끝-->

	<section class="content">
		<div class="container-fluid">
			<div class="block-header">
				<h1>배너 정보</h1>
			</div>
			<!-- banner-list -->
			<div class="banner_table-top">
				<button type="button" class="btn bg-pink waves-effect m-r-20"
					data-toggle="modal" data-target="#bannerModal">배너 등록</button>
			</div>
			<div class="row clearfix">
				<div class="col-lg-12 col-sm-12 col-xs-12">
					<div class="card">
						<div class="body">
							<div class="table-responsive">
								<table id="banner-list"
									class="table table-bordered table-striped table-hover display">
									<h3>배너(광고) 관리</h3>
									<thead>
										<tr>
											<th>번호</th>
											<th>순서</th>
											<th>의뢰주</th>
											<th>이미지 링크</th>
											<th>DEST_URL</th>
											<th>사용여부</th>
											<th>등록 날짜</th>
											<th>수정/삭제</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach var="bannerli" items="${bannerList}">
											<tr>
												<td>${bannerli.bannerNo}</td>
												<td>${bannerli.bannerOrder}</td>
												<td>${bannerli.bannerClient}</td>
												<td>${bannerli.bannerImageUrl}</td>
												<td>${bannerli.bannerDestUrl}</td>
												<td>${bannerli.bannerDelFl}</td>
												<td>${bannerli.bannerRegDt}</td>

												<td class="text-center">
													<button type="button"
														class="banner-upd-btn btn btn-success"
														data-bannerno="${bannerli.bannerNo}">수정</button>

													<button type="button" class="banner-del-btn btn btn-danger"
														data-toggle="modal" data-target="#banner_delete"
														data-bannerno="${bannerli.bannerNo}">삭제</button>
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






			<div class="modal fade" id="banner_delete" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<!-- modal header-->
						<div class="modal-header">
							<h2 class="modal-title" id="faqDeleteModal">
								<span></span>배너를 정말 삭제하시겠습니까?
							</h2>
						</div>
						<div class="modal-body">
							<button type="button" class="btn btn-danger" data-dismiss="modal"
								id="bannerDelete">삭제</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>




		</div>



		<!-- 등록 카테고리 -->

		<form action="add.mdo" method="post">
			<div class="modal fade" id="bannerModal" tabindex="-1" role="dialog">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<div class="modal-flex--center">
								<h3 class="modal-title" id="category-modal-title">배너 등록</h3>
							</div>
						</div>
						<div class="modal-body">
							<div class="modal-flex--column">


								<div id="con">


									<div class="modal-flex--body" id="hiden1">
										<p>
											<strong>배너 순서 등록</strong>
										</p>

										<div class="form-group form-group-lg">
											<div class="form-line">
												<input type="text" name="bannerOrder" class="form-control"
													placeholder="배너 순서을 입력해주세요" />
											</div>
										</div>

									</div>

									<div class="modal-flex--body" id="hiden2">
										<p>
											<strong>배너 의뢰주 등록</strong>
										</p>

										<div class="form-group form-group-lg">
											<div class="form-line">
												<input type="text" name="bannerClient" class="form-control"
													placeholder="의뢰주(기업)을 입력해주세요" />
											</div>
										</div>

									</div>

									<div class="modal-flex--body" id="hiden3">
										<p>
											<strong>배너 URL 등록</strong>
										</p>

										<div class="form-group form-group-lg">
											<div class="form-line">
												<input type="text" name="bannerImageUrl" class="form-control"
													placeholder="배너 URL을 등록해 주세요" />
											</div>
										</div>

									</div>
									
									
									<div class="modal-flex--body" id="hiden4">
										<p>
											<strong>배너 링크 등록</strong>
										</p>

										<div class="form-group form-group-lg">
											<div class="form-line">
												<input type="text" name="bannerDestUrl" class="form-control"
													placeholder="배너 URL을 등록해 주세요" />
											</div>
										</div>

									</div>

								</div>
							</div>
						</div>
						<div class="modal-footer">
							<div class="modal-flex--center">
								<input type="submit" class="btn btn-link waves-effect bg-blue"
									id="categoryModalRegistryBtn" value="등록" />
								<button type="button" class="btn btn-link waves-effect bg-red"
									data-dismiss="modal">취소</button>
							</div>
						</div>

					</div>
				</div>
			</div>
		</form>










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

	<!-- Dateppicker bootstrap -->
	<script
		src="<c:url value ="/resources/vendor/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"/>"></script>

	<!-- Custom Js -->
	<script
		src="<c:url value ="/resources/vendor/common/javascript/pages/admin.js"/>"></script>
	<script
		src="<c:url value ="/resources/js/admin/sites/site_banner_list.js"/>"></script>


</body>
</html>