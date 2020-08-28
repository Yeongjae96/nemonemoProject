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
	href="<c:url value="/resources/css/admin/sites/faq/category/site_faq_category_list.css"/>">

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

	
	<!--모달 끝-->
	<section class="content">
		<div class="container-fluid">
			<div class="block-header">
				<h1>FAQ 카테고리 관리</h1>
			</div>
			<!-- faq-category- -->
			<div class="faq_table-top">
				<button type="button" class="btn bg-pink waves-effect m-r-20"
					data-toggle="modal" data-target="#faq_category_in">FAQ 카테고리 등록</button>
				<button type="button" id="faqBtn" class="btn bg-pink waves-effect m-r-20">
					FAQ로 돌아가기
				</button>
			</div>
			<div class="row clearfix">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="card">
						<div class="body">
							<div class="table-responsive">
								<table id="faq-category-list"
									class="table table-bordered table-striped table-hover display">
									<h3>FAQ 카테고리 정보</h3>
									<thead>
                                    <tr>
                                    	<th width="15%">카테고리 번호</th>
										<th width="40%">카테고리 이름</th>
										<th width="10%">등록일</th>
										<th width="10%">사용여부</th>
										<th width="20%">관리버튼</th>
                                    </tr>
                                </thead>
                                <tbody id="result">
                                	<c:forEach var="faqCategory" items="${faqCategoryList}">
                                   <tr>
                                        <td>${faqCategory.faqCategoryNo}</td>
                                        <td>${faqCategory.faqCategoryName}</td>
                                        <td>${faqCategory.faqCategoryRegYmd}</td>
                                        <td>
                                        	<c:if test="${faqCategory.faqCategoryUseFl eq 'Y'}">
                                        		<span style="color:blue;" data-faqno="${faqCategory.faqCategoryNo}">사용</span>
                                        	</c:if>
                                        	<c:if test="${faqCategory.faqCategoryUseFl ne 'Y'}">
                                        		<span style="color:#EE5058; font-weight: bold;" data-faqno="${faqCategory.faqCategoryNo}">미사용</span>
                                        	</c:if>
                                        </td>
                                        <td class ="text-center">
	                                        <button type="button" data-toggle="modal" data-target="#faq_category_update" class ="faq-category-upd-btn btn btn-success" data-faqno="${faqCategory.faqCategoryNo}">수정</button>
	                                        <button type="button" class ="faq-category-del-btn btn btn-danger" data-toggle="modal" data-target="#faq_category_delete" data-faqno="${faqCategory.faqCategoryNo}">



</button>
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
			<div class="modal fade" id="faq_category_update" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <!-- modal header-->
                            <div class="modal-header">
                                <h2 class="modal-title" id="faqCategoryUpdateModalTitle">FAQ 카테고리 수정</h2>
                            </div>
				
                            <div class="modal-body">
                                <div class="form-group">
	                                <div class="faq-category-registry--content">
		                                    <label for="categoryName">카테고리 번호</label>
		                                    <input type="text" class="faq-category-reg-content--input" disabled id="faqUpdateModalNo">
	                                	</div>
	                                	<div class="faq-category-registry--content">
		                                    <label for="categoryName">카테고리 명</label>
		                                    <input type="text" class="faq-category-reg-content--input" name="faqCategoryName" id="faqCategoryUpdateInput" placeholder="카테고리 이름을 입력해주세요">
	                                	</div>
	                                	<div class="faq-category-registry--content">
		                                    <label for="categoryName">사용 여부</label>
		                                    <label><input type="radio" name="useFlag" value="Y" class="modal--radio"/>사용</label>
		                                    <label><input type="radio" name="useFlag" value="N" class="modal--radio"/>미사용</label>		                                    
	                                	</div>
                                </div>
                            </div>
                            
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success" data-dismiss="modal" id="faqCategoryUpdate">수정</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
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
                                <h2 class="modal-title" id="faqCategoryModalTitle">FAQ 카테고리 등록</h2>
                            </div>
				
                            <div class="modal-body">
	                           	<form method="POST" action="new.mdo" name="faqCategoryForm">
	                                <div class="form-group">
	                                	<div class="faq-category-registry--content">
		                                    <label for="categoryName">카테고리 명</label>
		                                    <input type="text" class="faq-category-reg-content--input" name="faqCategoryName" id="faqCategoryContent" placeholder="카테고리 이름을 입력해주세요">
	                                	</div>
	                                	<div id="checkInput">
	                                		이미 사용하고 있는 카테고리 이름입니다.
	                                	</div>
	                                </div>
                                </form>
                            </div>
                            
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success" data-dismiss="modal" id="faqCategoryInsert" disabled>등록</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                            </div>
                         </div>
                    </div>
                </div>
                
                <!-- Modal -->
			<div class="modal fade" id="faq_category_delete" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <!-- modal header-->
                            <div class="modal-header">
                                <h2 class="modal-title" id="faqDeleteModal"><span></span>카테고리를 정말 삭제하시겠습니까?</h2>
                            </div>
                            <div class="modal-body">
	                           	<button type="button" class="btn btn-danger" data-dismiss="modal" id="faqCategoryDelete">삭제</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
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

	<!-- 개인 JS -->
	<script> window.result = '${operResult}'; 
			console.log(window.result);
	</script>
	<script
		src="<c:url value ="/resources/js/admin/sites/faq/category/site_faq_category_list.js"/>"></script>
	
	<!-- Date picker bootstrap -->
	<script
		src="<c:url value ="/resources/vendor/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"/>"></script>

	
	


</body>
</html>