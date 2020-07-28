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

<!-- Favicon -->
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
	href="<c:url value="/resources/css/admin/transaction/order_list.css"/>">

<!-- JQuery DataTable Css -->
<link rel="stylesheet"
	href="<c:url value="/resources/vendor/plugins/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css"/>">

<!-- Bootstrap Material Datetime Picker Css -->
<link rel="stylesheet"
	href="<c:url value="/resources/vendor/plugins/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css"/>">

<!-- Bootstrap DatePicker Css -->
<link rel="stylesheet"
	href="<c:url value="/resources/vendor/plugins/bootstrap-datepicker/css/bootstrap-datepicker.css"/>">



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
							<h1>전체 주문 내역</h1>
						</div>
						<div class="body">
							<div class="table-responsive">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12  m-p-0">
									<h4 class="col-lg-2 col-md-2 col-sm-2 col-xs-2">기간검색</h4>
									<div class="m-b-0 col-lg-2 col-md-2 col-sm-2 col-xs-2 m-p-0">
										<div class="input-group date" id="members_prev">
											<div class="form-line">
												<input type="text" class="form-control"
													placeholder="날짜를 입력해주세요">
											</div>
											<span class="input-group-addon"> <i
												class="material-icons">date_range</i>
											</span>
										</div>
									</div>
									<div class="col-xs-1 text-c m-p-0">
										<span class="very-strong-word">-</span>
									</div>
									<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 m-p-0">
										<div class="input-group date" id="members_next">
											<div class="form-line">
												<input type="text" class="form-control"
													placeholder="날짜를 입력해주세요">
											</div>
											<span class="input-group-addon"> <i
												class="material-icons">date_range</i>
											</span>
										</div>
									</div>
									<button type="button"
										class="btn btn-danger waves-effect m-l-50">
										<span>찾기</span>
									</button>
								</div>
								<div class="clearfix"></div>
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 m-p-0">
									<h4 class=" col-lg-2 col-md-2 col-sm2 col-xs-2">저장하기</h4>
									<button class="btn waves-effect bg-pink"
										id="statics-image__btn">이미지 파일</button>
									<button class="btn waves-effect bg-pink">CSV</button>
									<button class="btn waves-effect bg-pink">엑셀 파일</button>
								</div>
								<div class="clearfix"></div>
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 m-p-0">
									<h4 class="col-lg-2 col-md-2 col-sm2 col-xs-2">기간별로 보기</h4>
									<button class="btn waves-effect bg-pink"
										id="statics-image__btn">연간</button>
									<button class="btn waves-effect bg-pink">월간</button>
									<button class="btn waves-effect bg-pink">주간</button>
								</div>
								<table id="mem-care-list"
									class="table table-bordered table-striped table-hover dataTable display text-center">
									<thead>
										<tr>
											<th>주문 번호</th>
											<th>결제 번호</th>
											<th>상품명</th>
											<th>거래유형</th>
											<th>구매자</th>
											<th>판매자</th>
											<th>거래 일자</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>342</td>
											<td>젤리셔스</td>
											<td>직거래 <span class="label label-warning">New</span>
											</td>
											<td>상점523호</td>
											<td>상점234호</td>
											<td>2020/07/21</td>
										</tr>
										<tr>
											<td>1</td>
											<td>342</td>
											<td>젤리셔스</td>
											<td>직거래</td>
											<td>상점523호</td>
											<td>상점523호</td>
											<td>2020/07/21</td>
										</tr>
										<tr>
											<td>1</td>
											<td>342</td>
											<td>젤리셔스</td>
											<td>직거래</td>
											<td>상점523호</td>
											<td>상점523호</td>
											<td>2020/07/21</td>
										</tr>
										<tr>
											<td>1</td>
											<td>342</td>
											<td>젤리셔스</td>
											<td>안전거래</td>
											<td>상점523호</td>
											<td>상점523호</td>
											<td>2020/07/21</td>
										</tr>
										<tr>
											<td>1</td>
											<td>342</td>
											<td>젤리셔스</td>
											<td>안전거래</td>
											<td>상점523호</td>
											<td>상점2143호</td>
											<td>2020/07/21</td>
										</tr>
										<tr>
											<td>1</td>
											<td>342</td>
											<td>젤리셔스</td>
											<td>안전거래</td>
											<td>상점523호</td>
											<td>상점2143호</td>
											<td>2020/07/21</td>
										</tr>
										<tr>
											<td>1</td>
											<td>342</td>
											<td>젤리셔스</td>
											<td>안전거래</td>
											<td>상점523호</td>
											<td>상점2143호</td>
											<td>2020/07/21</td>
										</tr>
										<tr>
											<td>1</td>
											<td>342</td>
											<td>젤리셔스</td>
											<td>안전거래</td>
											<td>상점523호</td>
											<td>상점2143호</td>
											<td>2020/07/21</td>
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

	<!-- Jquery CountTo Plugin Js -->
	<script
		src="<c:url value ="/resources/vendor/plugins/jquery-countto/jquery.countTo.js"/>"></script>

	<!-- Custom Js -->
	<script
		src="<c:url value ="/resources/vendor/common/javascript/pages/admin.js"/>"></script>


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
	<script
		src="<c:url value ="/resources/vendor/puglins/jquery-datatable/jquery-datatable.js"/>"></script>


	<!-- Date Picker bootstrap -->
    <script src="<c:url value ="/resources/vendor/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"/>"></script>
    <script src="<c:url value ="/resources/vendor/plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"/>"></script>

	<!-- 개인 JS -->
	<script
		src="<c:url value ="/resources/js/admin/transaction/order_list.js"/>"></script>


</body>
</html>