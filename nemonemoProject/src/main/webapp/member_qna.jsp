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
	href="<c:url value="/resources/css/admin/members/qna/member_qna.css"/>">

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
			<!-- member-qna-list -->
			<div class="row clearfix">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="card">
						<div class="header">
							<h1>고객문의함</h1>
						</div>
						<div class="qna_btn_flex">
							<button type="button" id="qna-cate-btn" class="btn bg-blue waves-effect m-r-20"> 카테고리 관리 </button>
						</div>
						<div class="body">
							<div class="table-responsive">
								<table id="qna-table"
									class="table table-bordered table-striped table-hover dataTable display text-center">
									<h4>1:1 고객센터</h4>
									<thead>
										<tr>
											<th>번호</th>
											<th>상점명</th>
											<th>분류</th>
											<th>제목</th>
											<th>작성날짜</th>
											<th>답변상태</th>
											<th>처리</th>
										</tr>
									</thead>
									<tbody id ="result">
										<c:forEach var="qna" items="${qnaList}">
										<tr data-qnano="${qna.qnano}">
											<td class="col-md-1">${qna.qnaNo}</td>
											<td class="col-md-2">${qna.qnaStore}</td>
											<td>${qna.qnaCateName}</td>
											<td>${qna.qnaTitle} 
											</td>
											<td>${qna.regDate}
											<span class="label label-warning">New</span>
											</td>
											<td class="col-md-1">
											<c:if test="${qna.qnaReplyFlag eq 'Y'}">
												<span class="label label-primary">답변완료</span>
                                        	</c:if>
                                        	<c:if test="${qna.qnaReplyFlag ne 'Y'}">
                                        		<span class="label label-default">미완료</span>
                                        	</c:if>
                                        	</td>
											<td><button type="button" class="btn bg-indigo waves-affect to_reply" >답변하기</button></td>
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
			<div class="modal fade" id="faq_category_in" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <!-- modal header-->
                            <div class="modal-header">
                                <h2 class="modal-title" id="qnaCategoryModalTitle">QNA 카테고리 등록</h2>
                            </div>
				
                            <div class="modal-body">
	                           	<form method="POST" action="new.mdo" name="qnaCategoryForm">
	                                <div class="form-group">
	                                	<div class="qna-category-registry--content">
		                                    <label for="categoryName">카테고리 명</label>
		                                    <input type="text" class="qna-category-reg-content--input" name="qnaCategoryName" id="qnaCategoryContent" placeholder="카테고리 이름을 입력해주세요">
	                                	</div>
	                                	<div id="checkInput">
	                                		이미 사용하고 있는 카테고리 이름입니다.
	                                	</div>
	                                </div>
                                </form>
                            </div>
                            
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success" data-dismiss="modal" id="qnaCategoryInsert" disabled>등록</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                            </div>
                         </div>
                    </div>
                </div>
                
                <!-- Modal -->
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
		src="<c:url value ="/resources/js/admin/members/qna/member_qna.js"/>"></script>


</body>
</html>