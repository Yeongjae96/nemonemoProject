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
<link rel="stylesheet" href="<c:url value="/resources/css/admin/members/qna/member_qna_reply_review.css"/>">

	<!-- 개인 JS -->
<!-- 	<script> var contextPath = "${pageContext.request.contextPath}";</script> -->
<%-- 	<script src="<c:url value ="/resources/js/admin/members/qna/member_qna_reply_review.js"/>"></script> --%>

<!-- FontAwesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">

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
				<div class="row clearfix">
					<div>
						<div class="body">
							<form id="qnaReplyForm" method="GET">
								<div class="table-responsive">
									<table class="table" id ="replyForm">
										<thead class="col-m-2"> 
										<p id ="qna_rpl_title">
										<i class="fas fa-bookmark" id ="fasmargin"></i>Q&A
										<i class="fas fa-bookmark"></i>
										</p></thead>
											<tbody>
											<tr>
												<th><i class="fas fa-user"></i>고객 아이디 </th>
												<td>${qnaVO.qnaRegId}</td>
								
											</tr>
											<tr>
												<th><i class="fas fa-check-circle"></i>카테고리 </th>
												<td>${qnaVO.qnaCategoryName}</td>
											</tr>
											<tr>
												<th><i class="far fa-clock"></i>문의날짜 </th>
												<td>${qnaVO.qnaRegYmd}</td>
											</tr>
											<tr>
												<th><i class="fas fa-book"></i>문의내용 </th>
												<td><textarea cols="120" rows="20"
														id="qnaUserContent" name="qnaUserContent" disabled>
														<c:out value="${qnaVO.qnaUserContent}" />
                                                </textarea></td>
												
											</tr>
											<tr>
												<th><i class="fas fa-pen-square"></i>네모내모 답변</th>
												<td>
													<textarea cols="120" rows="20" name="qnaAdminContent" id="qnaAdminContent" disabled>
													<c:out value="${qnaVO.qnaAdminContent}" />
													</textarea>
												</td>
											</tr>
											</tbody>									
									</table>
								</div>
									<input type ="hidden" name ="qnaNo" value ="${param.qnaNo}"/>
							</form>
								<div class="btn-layout">
									<button class="btn waves-affect backToListBtn">뒤로가기</button>						
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

	<!-- Custom Js -->
	<script
		src="<c:url value ="/resources/vendor/common/javascript/pages/admin.js"/>"></script>
		
	<script>
		$('.backToListBtn').click(function() {
		window.location.href="../list.mdo"});
	</script>

</body>
</html>