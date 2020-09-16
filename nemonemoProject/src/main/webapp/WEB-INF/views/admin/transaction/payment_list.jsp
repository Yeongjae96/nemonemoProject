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
<link rel="stylesheet" href="<c:url value="/resources/css/admin/payments/payment_list.css"/>">


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
			<div class="row clearfix">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="card">
						<div class="header">
							<h1>결제 관리</h1>
						</div>
						<div class="body">
								<table id="mem-care-list"
									class="table table-bordered table-striped table-hover dataTable display text-center">
									<thead>
										<tr>
											<th>결제 번호</th>
											<th>상품 번호</th>
											<th>판매 회원번호</th>
											<th>상품명</th>
											<th>상품가격</th>
											<th>거래방법</th>
											<th>인수 상태</th>
											<th>구매자</th>
											<th>거래 일자</th>
											<th>송금</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${empty boardList }">
												<p>판매한 내역이 없습니다!</p>
											</c:when>
											<c:when test="${!empty boardList}">
												<c:forEach var="list" items="${boardList}">
													<c:if test="${list.purchasePaySt eq 'Y'}">
														<tr>
															<td><c:out value="${list.purchaseNo}" /></td>
															<td><c:out value="${list.productNo}" /></td>
															<td><c:out value="${list.productSeller}" /></td>
															<td><c:out value="${list.productName}" /></td>
															<td><c:out value="${list.purchasePrice}" /></td>
															<td><c:out value="${list.purchaseWay}" /></td>
															<td>물품 인수 확인</td>
															<td><c:out value="${list.buyerName}" /></td>
															<td><c:out value="${list.puchaseDt}" /></td>
															<td><button type="button" class="btn bg-indigo waves-affect to_reply">송금하기</button></td>
														</tr>
												</c:if>
												</c:forEach>
											</c:when>
										</c:choose>
										<tr>
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

	<!-- Select Plugin Js -->
	<script src="<c:url value ="/resources/vendor/plugins/bootstrap-select/js/bootstrap-select.js"/>"></script>

	<!-- Slimscroll Plugin Js -->
	<script src="<c:url value ="/resources/vendor/plugins/jquery-slimscroll/jquery.slimscroll.js"/>"></script>

	<!-- Waves Effect Plugin Js -->
	<script
		src="<c:url value ="/resources/vendor/plugins/node-waves/waves.js"/>"></script>

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
	<script
		src="<c:url value ="/resources/vendor/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"/>"></script>
	<script
		src="<c:url value ="/resources/vendor/plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"/>"></script>

	<!-- 개인 JS -->
	<script
		src="<c:url value ="/resources/js/admin/transaction/payment_list.js"/>"></script>


</body>
</html>