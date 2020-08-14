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
							<h1>신고 카테고리 관리</h1>
							<button type="button" class="btn bg-pink waves-effect m-r-20"
								data-toggle="modal" data-target="#registryModal">신고
								카테고리</button>
							<button type="button" id="reportCategoryBtnz"
								class="btn bg-pink waves-effect m-r-20">신고 리스트 이동</button>
						</div>

						<div class="body">

							<div class="table-responsive">
								<table id="mem-report-list"
									class="table table-bordered table-striped table-hover dataTable display text-center">
									<h4>신고 카테고리 관리</h4>
									<thead>
										<tr>
											<th style="width: 20%">카테고리 번호</th>
											<th style="width: 20%">카테고리 이름</th>
											<th style="width: 20%">상위 카테고리 번호</th>
											<th style="width: 20%">사용여부</th>
											<th style="width: 20%">수정/삭제</th>


										</tr>
									</thead>
									<tbody>
										<c:forEach var="reportCategory" items="${reportCategoryList}">
											<tr>
												<td>${reportCategory.reportCategoryNO}</td>
												<td>${reportCategory.reportCategoryName}</td>
												<td>${reportCategory.reportCategoryTopCategoryCode}</td>
												<td>${reportCategory.reportCategoryUseFl}</td>
												<td class="text-center"><button type="button"
														class="Category-upd-btn"
														data-reportCategoryNO="${reportCategory.reportCategoryNO}">수정</button>

													<button type="button" class="Category-del-btn"
														data-toggle="modal" data-target="#category_delete"
														data-reportCategoryNO="${reportCategory.reportCategoryNO}">삭제</button></td>



											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>





			<!-- 등록 카테고리 -->

			<form action="add.mdo" method="post">
				<div class="modal fade" id="registryModal" tabindex="-1"
					role="dialog">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<div class="modal-flex--center">
									<h3 class="modal-title" id="category-modal-title">신고 카테고리
										등록</h3>
								</div>
							</div>
							<div class="modal-body">
								<div class="modal-flex--column">
									<div class="modal-flex--body">
										<p>
											<strong>분류</strong>
										</p>

										<div class="modal-row--content">
											<div class="input-group input-group-lg">
												<span class="input-group-addon"> <input type="radio"
													class="with-gap" id="top-category"
													name="reportCategoryCODE" value="1"> <label
													for="top-category">대분류</label> <input type="radio"
													class="with-gap" id="mid-category"
													name="reportCategoryCODE" value="2"> <label
													for="mid-category">소분류</label>


												</span>

											</div>
										</div>
									</div>


									<div id="con">
										<div class="modal-flex--body" id="hiden1">
											<p>
												<strong>분류</strong>
											</p>
											<!-- 각종 카테고리가 들어가야함 -->

											<select class="form-control show-tick"
												id="lg-category--select" name="reportCategoryTopCategory">
												<option>광고(상점홍보, 낚시글, 도배글)</option>
												<option>물품정보 부정확(카테고리, 가격, 사진)</option>
												<option>거래 금지 품목(담배, 주류, 장물)</option>
												<option>언어폭력(비방, 욕설, 성희롱)</option>


											</select>
										</div>

										<div class="modal-flex--body" id="hiden2">
											<p>
												<strong>카테고리 명</strong>
											</p>

											<div class="form-group form-group-lg">
												<div class="form-line">
													<input type="text" name="reportCategoryContents"
														class="form-control" placeholder="카테고리명을 입력해주세요" />
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
			
			<!-- 삭제 Modal -->
			<div class="modal fade" id="category_delete" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<!-- modal header-->
						<div class="modal-header">
							<h2 class="modal-title" id="CategotyDeleteModal">
							<i class="fas fa-trash-alt"></i>
								<span></span>
								카테고리를 정말 삭제하시겠습니까?
							</h2>
						</div>
						<div class="modal-body">
							<button type="button" class="btn btn-danger" data-dismiss="modal"
								id="CategoryDelete">삭제</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
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
		src="<c:url value ="/resources/js/admin/members/member_report_list.js"/>"></script>


</body>
</html>