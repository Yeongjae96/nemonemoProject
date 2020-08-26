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
	href="<c:url value="/resources/css/admin/sites/site_coupon_list.css"/>">

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

	<!-- 컨텐츠 -->
	<!-- 모달 시작-->
	<div class="modal fade" id="coupon_del" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title text-center modal-col-red"
						id="smallModalLabel">경 고</h3>
				</div>
				<div class="modal-body">
					<h1 class="text-center">쿠폰삭제</h1>
					<h5 class="text-center">확인 버튼을 누르시면</h5>
					<h5 class="text-center">해당 쿠폰은 삭제 됩니다.</h5>
					<h5 class="text-center">삭제 하시겠습니까?</h5>

				</div>
				<div class="modal-footer">
					<button id ="coupon-del" type="button"
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
				<h1>쿠폰 정보</h1>
			</div>
			<!-- banner-list -->
			<div class="banner_table-top">
				<button type="button" class="btn bg-pink waves-effect m-r-20"
					data-toggle="modal" data-target="#coupon_in">쿠폰 등록</button>
			</div>
			<div class="row clearfix">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="card">
						<div class="body">
							<div class="table-responsive">
								<table id="coupon-list"
									class="table table-bordered table-striped table-hover display">
									<h3>쿠폰 관리</h3>
									
									<thead>
                                    <tr>
                                    	<th>쿠폰번호</th>
										<th>쿠폰명</th>
										<th>쿠폰 내용</th>
										<th>쿠폰 기한</th>
										<th>혜택 금액</th>
										<th>수정/삭제</th>
                                    </tr>
                                </thead>
                                <tbody id="result">
                                	<c:forEach var="coupon" items="${couponList}">
                                   <tr>
                                   		<td>${coupon.couponNo }</td>
                                        <td>${coupon.couponName}</td>
                                        <td>${coupon.couponContent}</td>
                                        <td>${coupon.couponPrd}</td>
                                        <td>${coupon.couponDisPrice}</td>
                                        <td class ="text-center">
                                        <button type="button" class ="btn bg-cyan waves-effect coupon-upd-btn" data-couponNo="${coupon.couponNo}">수정</button>
                                        <button type="button" class="btn bg-red waves-effect" id="coupon-del-btn" data-toggle="modal" data-target="#coupon_del" data-couponsq="${coupon.couponNo}" >삭제</button></td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Modal -->
			<div class="modal fade" id="coupon_in" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<!-- modal header-->
						<div class="modal-header">
							<h4 class="modal-title">쿠폰 등록</h4>
						</div>

						<div class="modal-body">
						<form method="POST" action="new.mdo" name="couponForm">
							<div class="form-group">
								<label for="couponName">쿠폰명</label>
								<input type="text"
									class="form-control" name="couponName" id="couponName"
									placeholder="쿠폰명을 입력하세요"> 
								<label for="couponName">쿠폰 내용</label> 
								<input type="text"
									class="form-control" name="couponContent" id="couponContent"
									placeholder="쿠폰 내용을 입력하세요"> 
								<label for="couponImage">쿠폰 기한</label>
								<input type="text"
									class="form-control" name="couponPrd" id="couponPrd"
									placeholder="쿠폰 기한을 입력하세요"> 
								<label for="couponImage">혜택 금액</label>
								<input type="text"
									class="form-control" name="couponDisPrice" id="couponDisPrice"
									placeholder="혜택 금액을 입력하세요"> 
									
							</div>
							</form>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-success"
								data-dismiss="modal" value="Upload" id="CouponInsert">등록</button>
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
		src="<c:url value ="/resources/js/admin/sites/site_coupon_list.js?v=<%=System.currentTimeMillis() %>"/>"></script>
	
	<!-- Date picker bootstrap -->
	<script
		src="<c:url value ="/resources/vendor/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"/>"></script>

	
	


</body>
</html>