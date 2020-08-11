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
<%-- <link rel="stylesheet"
	href="<c:url value="/resources/css/admin/sites/site_terms.css"/>"> --%>

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
			<div class="card">
				<div class="header">
					<h1>이용약관 관리</h1>
					<ul class="header-dropdown m-r--5">
						<li class="dropdown"><a href="javascript:void(0);"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false"> <i
								class="material-icons">more_vert</i>
						</a>
							<ul class="dropdown-menu pull-right">
								<li><a href="javascript:void(0);">Action</a></li>
								<li><a href="javascript:void(0);">Another action</a></li>
								<li><a href="javascript:void(0);">Something else here</a></li>
							</ul></li>
					</ul>
				</div>
				<!--헤더끝-->
				<div class="body">
					<div class="table-responsive" style="overflow-x: hidden;">
						<table id="serviceUse-table"
							class="table table-bordered table-striped table-hover display">
							<thead>
								<tr>
									<th>일련번호</th>
									<th>약관 제목</th>
									<th>필수여부</th>
									<th>삭제여부</th>
									<th>약관등록일</th>
									<th>작성자</th>
									<th>약관수정일</th>
									<th>수정자</th>
									<th>수정/삭제</th>
								</tr>
							</thead>
							<tbody id="result">
								<c:forEach var="terms" items="${termsList}">
									<tr>
										<td>${terms.termsNo}</td>
										<!-- <td><a href="terms">
											필수 이용 약관</a>
										</td> -->
										<td>${terms.termsTitle}</td>
										<td>${terms.termsRequiredFl}</td>
										<td>${terms.termsDeleteFl}</td>
										<td>${terms.termsRegistryYmd}</td>
										<td>${terms.adminRegistryId}</td>
										<td>${terms.termsModifyYmd}</td>
										<td>${terms.adminModifyId}</td>
										<td>
										<button type="button" class="btn bg-pink waves-effect m-r-20" id ="terms-upd-btn" data-couponCd="${terms.termsNo}">수정</button>
                                        <button type="button" class="btn bg-pink waves-effect m-r-20" id ="terms-del-btn" data-couponCd="${terms.termsNo}">삭제</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="serviceUse-flex">
							<button type="button" class="btn bg-pink waves-effect m-r-20" id="terms-add-btn">약관 등록</button>
							<!-- <button type="button" class="btn bg-pink waves-effect m-r-20" id="terms-udp-btn">약관 수정</button>
							<button type="button" class="btn bg-pink waves-effect m-r-20" id="terms-del-btn">약관 삭제</button> -->
							<!-- <label class="label-export">외부파일로 저장하기</label> -->
						</div>
					</div>
					<!-- 등록 수정 분류-->

				</div>
			</div>
			<!-- Modal -->
			<!-- <div class="modal fade" id="seriveUse_in" role="dialog">
				<div class="modal-dialog">
					Modal content
					<div class="modal-content">
						modal header
						<div class="modal-header">
							<h4 class="modal-title">이용약관 등록</h4>
						</div>

						<div class="modal-body">
							<form method="POST" action="new.mdo" name="couponForm">
							<div class="form-group">
								<label for="InputNoticeName">이용약관 제목</label> 
								<input type="text" class="form-control" id="serviceUse_title" placeholder="약관명 입력"> 
									<label for="InputNoticeName">약관 내용</label>
									<textarea rows="20" cols="50" name="serviceUse_content" id="serviceUse_content" ></textarea>	
								</div>
							</form>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-success"
								data-dismiss="modal" value="Upload" id="service_in">등록</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div> -->
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
	<script src="<c:url value ="/resources/js/admin/sites/site_terms.js"/>"></script>	
</body>
</html>