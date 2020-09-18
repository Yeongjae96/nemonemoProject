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
<link rel="shortcut icon" href="<c:url value="/resources/images/common/logo/favicon.png"/>"> 

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
	href="<c:url value="/resources/css/admin/members/qna/category/member_qna_category_list.css"/>">

<!-- JQuery DataTable Css -->
<link rel="stylesheet"
	href="<c:url value="/resources/vendor/plugins/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css"/>">
	
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


	<!--모달 끝-->
	<section class="content">
		<div class="container-fluid">
			<div class="block-header">
			<i class="fas fa-arrow-left" id="backToQnaList"> 뒤로</i>
			</div>
			

			
			<div class="row clearfix">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="card">
						<div class="body">						
							<div class="table-responsive">
								<table id="qna-category-list"
									class="table table-bordered table-striped table-hover display">
									<div>
									<h3>QNA 카테고리 관리</h3>
									
									<button type="button" class="btn bg-pink waves-effect m-r-20"
											data-toggle="modal" data-target="#qna_category_in" id = "addQnaBtn">
									카테고리 등록</button>
									</div>
								
									<thead>
										<tr>
											<th>번호</th>
											<th>카테고리 이름</th>
											<th>사용여부</th>
											<th>관리버튼</th>
										</tr>
									</thead>
									<tbody id="result">
										<c:forEach var="qnaCategory" items="${qnaCategoryList}">
											<tr>
												<td>${qnaCategory.qnaCategoryNo}</td>
												<td>${qnaCategory.qnaCategoryName}</td>
												<td><c:if test="${qnaCategory.qnaCategoryUseFl eq 'Y'}">
														<span style="color: blue;"
															data-qnano="${qnaCategory.qnaCategoryNo}">사용함</span>
													</c:if> 
													<c:if test="${qnaCategory.qnaCategoryUseFl ne 'Y'}">
														<span style="color: #EE5058; font-weight: bold;"
															data-qnano="${qnaCategory.qnaCategoryNo}">사용안함</span>
													</c:if>
												</td>
												<td class="text-center">
													<button type="button" data-toggle="modal"
														data-target="#qna_category_update"
														class="qna-category-upd-btn btn btn-success"
														data-qnano="${qnaCategory.qnaCategoryNo}">수정</button>
													<button type="button"
														class="qna-category-del-btn btn btn-danger"
														data-toggle="modal" data-target="#qna_category_delete"
														data-qnano="${qnaCategory.qnaCategoryNo}">삭제</button>
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
			<!-- Modal -->

			<div class="modal fade" id="qna_category_in" role="dialog">
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
										<!-- <label for="categoryParent">대분류</label> <input type="text"
											class="qna-parent-category-reg-content--input"
											name="qnaCategoryParent" id="qnaCategoryParentContent"
											placeholder="대분류를 입력해주세요"> --> 
										<label for="categoryName">카테고리 이름</label>
										<input type="text"
											class="qna-name-category-reg-content--input"
											name="qnaCategoryName" id="qnaCategoryNameContent"
											placeholder="등록할 카테고리를 입력해 주세요">
										<input type="hidden" name="qnaCategoryUseFl" value="Y">
									</div>

									<div id="checkInput">이미 사용하고 있는 카테고리 이름입니다.</div>
								</div>
							</form>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-success"
								data-dismiss="modal" id="qnaCategoryInsert">등록</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 등록 Modal -->
			<!-- 수정 Modal -->
			<div class="modal fade" id="qna_category_update" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <!-- modal header-->
                            <div class="modal-header">
                                <h2 class="modal-title" id="qnaCategoryUpdateModalTitle">QNA 카테고리 수정</h2>
                            </div>
				
                            <div class="modal-body">
                                <div class="form-group">
<!-- 	                               		 <div class="qna-category-registry--content">
	                               		 	<input type="hidden" id="qnaUpdateNo">
		                                    <label for="categoryName">대분류</label>
		                                   <input type="text" class="qna-category-reg-content--input" name="qnaCategoryParent" id="qnaCateParentUpd" placeholder="대분류 이름을 입력해주세요">
	                                	</div> -->
	                                	<div class="qna-category-registry--content">
		                                    <label for="categoryName">카테고리 이름</label>
		                                    <input type="text" class="qna-category-reg-content--input" name="qnaCategoryName" id="qnaCateNameUpd" placeholder="카테고리 이름을 입력해주세요">
		                                    <input type="hidden" name="qnaCategoryUseFl" value="Y">
	                                	</div>
                                </div>
                            </div>
                            
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success" data-dismiss="modal" id="qnaCategoryUpdate">수정</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                            </div>
                         </div>
                    </div>
                </div>
			<!-- 수정 Modal -->

			<!-- 삭제 Modal -->
			<div class="modal fade" id="qna_category_delete" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<!-- modal header-->
						<div class="modal-header">
							<h2 class="modal-title" id="qnaDeleteModal">
							<i class="fas fa-trash-alt"></i>
								<span></span>
								카테고리를 정말 삭제하시겠습니까?
							</h2>
						</div>
						<div class="modal-body">
							<button type="button" class="btn btn-danger" data-dismiss="modal"
								id="qnaCategoryDelete">삭제</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>ㄴ
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
	<script>
		window.result = '${operResult}';
		console.log(window.result);
	</script>
	<script
		src="<c:url value ="/resources/js/admin/members/qna/category/member_qna_category_list.js"/>"></script>

	<!-- Date picker bootstrap -->
	<script
		src="<c:url value ="/resources/vendor/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"/>"></script>





</body>
</html>