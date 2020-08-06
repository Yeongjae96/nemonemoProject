<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>네모내모</title>
    <!-- Favicon-->
 
    <link rel="icon" href="favicon.ico" type="image/x-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

    <!-- Bootstrap Core Css -->
    <link rel="stylesheet" href="<c:url value="/resources/vendor/plugins/bootstrap/css/bootstrap.css"/>">
    
    <!-- Animation Css -->
	<link rel="stylesheet" href="<c:url value="/resources/vendor/plugins/animate-css/animate.css"/>">
	
    <!-- common CSS -->
	<link rel="stylesheet" href="<c:url value="/resources/css/admin/common/style.css"/>">
    
    <!--  테마 색상  -->
	<link rel="stylesheet" href="<c:url value="/resources/vendor/common/stylesheets/theme-red.css"/>">
	
	<!-- 개인 CSS -->
	<link rel="stylesheet" href="<c:url value="/resources/css/admin/members/member_care_reply.css"/>">
	
	
</head>
<body class="theme-red">

	<% 
		/* 공통 Header and Nav */
	%>
	<header>
		<jsp:include page="/WEB-INF/views/admin/include/header.jsp"/>
		<jsp:include page="/WEB-INF/views/admin/include/side-nav.jsp"/>		
	</header>
		

	<% 
		/* 각 페이지의 SECTION */
	%>
	

        <!-------------------------------------------SECTION--------------------------------------------------->
	<section class="content">
		<div class="container-fluid">
			<div class="card">
				<div class="header">
					<p>1:1 문의</p>
				</div>
				<div class="row clearfix">
					<div>
						<div class="body">
							<form id="form_validation" method="POST">
								<div class="table-responsive">
									<table class="table">
										<thead class="col-m-2">
											<tr>
												<th>상점명 <i class="material-icons">check</i>
												<td>공룡이네</td>
												</th>
											</tr>
											<tr>
												<th>카테고리 <i class="material-icons">check</i>
												<td>서비스/불만족</td>
												</th>
											</tr>
											<tr>
												<th>문의내용 <i class="material-icons">check</i>
												<td><textarea cols="80" rows="10" required
														id="qna-from-cus" readonly>
                                                </textarea></td>
												</th>
											</tr>
											<tr>
												<th>파일 다운로드</th>
												<td><a class="btn" href="상대경로" download="">download</a></td>
											</tr>
											<tr>
												<th>답변상태
												<td><input type="radio" name="jb-radio"
													id="delay_reply" class="custom-control-input"> <label
													class="custom-control-label" for="delay_reply">답변대기</label>
													<input type="radio" name="jb-radio" id="done_reply"
													class="custom-control-input"> <label
													class="custom-control-label" for="done_reply">답변완료</label>
												</td>
												</th>
											</tr>
											<tr>
												<th>네모내모 답변
												<td><textarea cols="80" rows="10" required></textarea></td>
												</td>
												</th>
											</tr>
											<tr>
												<th>파일첨부
												<td><input type="file" class="custom-file-input "
													id="file-to-cus" lang="es"> <label
													class="custom-file-label" for="customFileLang"></label></td>
												</th>
											</tr>
										</thead>
									</table>
								</div>
								<div class="btn-layout">
									<button class="btn-primary btn-lg waves-effect" type="submit">저장하기</button>
									<button class="btn-danger btn-lg waves-effect">취소</button>
								</div>
							</form>
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

	<!-- Custom Js -->
	<script
		src="<c:url value ="/resources/vendor/common/javascript/pages/admin.js"/>"></script>


	<!-- 개인 JS -->
	<%-- 	<script
		src="<c:url value ="/resources/js/admin/members/member_care_reply.js"/>"></script> --%>


</body>
</html>