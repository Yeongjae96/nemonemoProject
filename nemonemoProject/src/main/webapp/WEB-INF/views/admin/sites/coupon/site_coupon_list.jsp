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
	<div class="modal fade" id="smallModal" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title text-center modal-col-red"
						id="smallModalLabel">주의</h3>
				</div>
				<div class="modal-body">
					<h1 class="text-center">쿠폰삭제</h1>
					<h5 class="text-center">확인 버튼을 누르시면</h5>
					<h5 class="text-center">해당 쿠폰은 삭제 됩니다.</h5>
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
				<h1>이벤트 정보</h1>
			</div>
			<!-- banner-list -->
			<div class="banner_table-top">
				<button type="button" class="btn bg-pink waves-effect m-r-20"
					data-toggle="modal" data-target="#event_in">이벤트 등록</button>
			</div>
			<div class="row clearfix">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="card">
						<div class="body">
							<div class="table-responsive">
								<table id="event-list"
									class="table table-bordered table-striped table-hover display">
									<h3>이벤트(프로모션) 관리</h3>
									<thead>
										<tr>
											<th>번호</th>
											<th>이미지</th>
											<th>제목</th>
											<th>이벤트 링크</th>
											<th>등록일</th>
											<th>이벤트 여부</th>
											<th>수정/삭제</th>
										</tr>
									</thead>

									<tbody>
										<tr>
											<td>1</td>
											<td><img src="event_image/event1.jpg"
												style="width: 300px; height: 130px;"></td>
											<td>이벤트 이름1</td>
											<td><a href="#">이벤트 링크1</a></td>
											<td>2020-05-04</td>
											<td>Y</td>
											<td class="text-center"><button type="button"
													class="event-upd-btn">수정</button>
												<button type="button" class="event-del-btn">삭제</button></td>
										</tr>
										<tr>
											<td>2</td>
											<td><img src="event_image/event2.jpg"
												style="width: 300px; height: 130px;"></td>
											<td>이벤트 이름2</td>
											<td><a href="#">이벤트 링크2</a></td>
											<td>2020-03-20</td>
											<td>N</td>
											<td class="text-center"><button type="button"
													class="event-upd-btn">수정</button>
												<button type="button" class="event-del-btn">삭제</button></td>
										</tr>
										<tr>
											<td>3</td>
											<td><img src="event_image/event3.jpg"
												style="width: 300px; height: 130px;"></td>
											<td>이벤트 이름3</td>
											<td><a href="#">이벤트 링크3</a></td>
											<td>2020-03-25</td>
											<td>Y</td>
											<td class="text-center"><button type="button"
													class="event-upd-btn">수정</button>
												<button type="button" class="event-del-btn">삭제</button></td>
										</tr>
										<tr>
											<td>4</td>
											<td><img src="event_image/event4.jpg"
												style="width: 300px; height: 130px;"></td>
											<td>이벤트 이름4</td>
											<td><a href="#">이벤트 링크4</a></td>
											<td>2020-03-01</td>
											<td>N</td>
											<td class="text-center">
												<button type="button" class="event-upd-btn">수정</button>
												<button type="button" class="event-del-btn">삭제</button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Modal -->
			<div class="modal fade" id="event_in" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<!-- modal header-->
						<div class="modal-header">
							<h4 class="modal-title">이벤트 등록</h4>
						</div>

						<div class="modal-body">
							<div class="form-group">
								<label for="eventName">이벤트 제목</label> <input type="text"
									class="form-control" id="event_title"
									placeholder="Enter event_title"> <label
									for="eventImage">이벤트 이미지</label>
								<form method='post' action='' enctype="multipart/form-data">
									Select file : <input type='file' name='file' id='file'
										class='form-control'><br>
								</form>
								<label for="eventName">이벤트 링크</label> <input type="text"
									class="form-control" id="event_link"
									placeholder="Enter event_link"><br> <label
									for="eventstart">등록일</label> <input type="text" id="startdate"
									class="form-control" value="" placeholder="등록일을 입력하세요"><br>

								<label for="event-end">종료일</label> <input type="text"
									id="enddate" class="form-control" value=""
									placeholder="종료일을 입력하세요"><br>
							</div>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-success"
								data-dismiss="modal" vlaue="Upload" id="event_insert">등록</button>
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
		src="<c:url value ="/resources/js/admin/sites/site_coupon_list.js"/>"></script>

	<!-- Date picker bootstrap -->
	<script
		src="<c:url value ="/resources/vendor/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"/>"></script>




</body>
</html>