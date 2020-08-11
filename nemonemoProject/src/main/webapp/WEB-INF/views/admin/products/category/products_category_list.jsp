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
	href="<c:url value="/resources/css/admin/products/category/products_category_list.css"/>">

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
				<h1>상품 카테고리 관리</h1>
			</div>
			<!-- product-category- -->
			<div class="product_table-top">
				<button type="button" class="btn bg-pink waves-effect m-r-20"
					data-toggle="modal" data-target="#product_category_in"
					id="regPopupBtn">상품 카테고리 등록</button>
				<button type="button" id="productBtn"
					class="btn bg-pink waves-effect m-r-20">상품으로 돌아가기</button>
			</div>
			<div class="row clearfix">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="card">
						<div class="body">
							<div class="table-responsive">
								<table id="product-category-list"
									class="table table-bordered table-striped table-hover display">
									<h3>상품 카테고리 정보</h3>
									<thead>
										<tr>
											<th width="10%">카테고리 번호</th>
											<th width="5%">대분류 명</th>
											<th width="5%">중분류 명</th>
											<th width="5%">소분류 명</th>
											<th width="10%">이름</th>
											<th width="5%">등록자</th>
											<th width="5%">등록일</th>
											<th width="5%">수정자</th>
											<th width="5%">수정일</th>
											<th width="5%">사용여부</th>
											<th width="10%">관리버튼</th>
										</tr>
									</thead>
									<tbody id="result">
										<c:forEach var="pc" items="${productCategory}">
											<tr data-no="${pc.productCateNo}">
												<td>${pc.productCateNo}</td>
												<td>${pc.productCateLarge}</td>
												<td>${pc.productCateMedium}</td>
												<td>${pc.productCateSmall}</td>
												<td>
													<span style="font-size: 20px; font-weight: bold;">
														<c:if test="${pc.productCateType eq 'L'}">
															${pc.productCateLarge}
														</c:if>
														<c:if test="${pc.productCateType eq 'M'}">
															${pc.productCateMedium}
														</c:if>
														<c:if test="${pc.productCateType eq 'S'}">
															${pc.productCateSmall}
														</c:if>
													</span>
												</td>
												<td>
													${pc.adminRegId}
												</td>
												<td>
													${pc.productCateRegYmd}
												</td>
												<td>
													<c:if test="${pc.adminEditId ne 0}">
														${pc.adminEditId}
													</c:if>
												</td>
												<td>
													${pc.productCateEditYmd}
												</td>
												<td id="useFlagTd">
													<c:if test="${pc.productCateDelFl eq 'Y'}">
														<span style="color: blue;">사용</span>
													</c:if> 
													<c:if test="${pc.productCateDelFl ne 'Y'}">
														<span style="color: #EE5058; font-weight: bold;">미사용</span>
													</c:if>
												</td>
												<td class="text-center">
													<button type="button" data-toggle="modal"
														data-target="#product_category_update"
														class="product-category-upd-btn btn btn-success"
														>수정</button>
													<button type="button"
														class="product-category-del-btn btn btn-danger"
														data-toggle="modal" data-target="#product_category_delete"
														>삭제</button>
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
			
			<!-- 수정 -->
			<div class="modal fade" id="product_category_update" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h2 class="modal-title" id="productCategoryModalTitle">상품
								카테고리 수정</h2>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<div class="product-category-update--content">
									<label for="categoryName">카테고리 번호</label> 
									<input type="text" id="updateCategoryNo">
								</div>
								<div class="product-category-update--content">
									<label for="categoryName">사용여부</label>
									<div class="radio-area">
										<label><input type="radio" name="cateUseType" value="Y" />사용</label> 
										<label><input type="radio" name="cateUseType" value="N" />미사용</label>
									</div>
								</div>
								<div class="product-category-update--content">
									<label for="categoryName">분류</label>
									<div class="radio-area">
										<label><input type="radio" name="categoryUpdateType" value="L" />대분류</label> 
										<label><input type="radio" name="categoryUpdateType" value="M" />중분류</label>
										<label><input type="radio" name="categoryUpdateType" value="S" />소분류</label>
									</div>
								</div>
								<div class="product-category-update--content">
									<label for="categoryName">대분류</label> 
									<select id="productUpdateLgCategory">
									</select>
								</div>
								<div class="product-category-update--content">
									<label for="categoryName">중분류</label> <select
										id="productUpdateMdCategory">
									</select>
								</div>
								<div class="product-category-update--content">
									<label for="categoryName">카테고리 명</label> <input type="text"
										class="product-category-upd-content--input"
										name="productCategoryName" id="productUpdateCategoryContent"
										placeholder="카테고리 이름을 입력해주세요">
								</div>
								<div id="updateCheckInput"></div>
							</div>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-success"
								data-dismiss="modal" id="productCategoryUpdate" disabled>수정</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 등록 -->
			<div class="modal fade" id="product_category_in" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<!-- modal header-->
						<div class="modal-header">
							<h2 class="modal-title" id="productCategoryModalTitle">상품
								카테고리 등록</h2>
						</div>

						<div class="modal-body">
							<div class="form-group">

								<div class="product-category-registry--content">
									<label for="categoryName">분류</label>
									<div class="radio-area">
										<label><input type="radio" name="categoryType"
											value="L" />대분류</label> <label><input
											type="radio" name="categoryType" value="M" />중분류</label>
										<label><input type="radio" name="categoryType"
											value="S" />소분류</label>
									</div>
								</div>
								<div class="product-category-registry--content">
									<label for="categoryName">대분류</label> 
									<select id="productLgCategory">
									</select>
								</div>
								<div class="product-category-registry--content">
									<label for="categoryName">중분류</label> <select
										id="productMdCategory">
									</select>
								</div>
								<div class="product-category-registry--content">
									<label for="categoryName">카테고리 명</label> <input type="text"
										class="product-category-reg-content--input"
										name="productCategoryName" id="productCategoryContent"
										placeholder="카테고리 이름을 입력해주세요">
								</div>
								<div id="checkInput">이미 사용하고 있는 카테고리 이름입니다.</div>
							</div>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-success"
								data-dismiss="modal" id="productCategoryInsert" disabled>등록</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="product_category_delete" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<!-- modal header-->
						<div class="modal-header">
							<h2 class="modal-title" id="productDeleteModal">
								<span></span>카테고리를 정말 삭제하시겠습니까?
							</h2>
						</div>
						<div class="modal-body">
							<button type="button" class="btn btn-danger" data-dismiss="modal"
								id="productCategoryDelete">삭제</button>
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

	<!-- 개인 JS -->
	<script>
		var contextPath = ('${pageContext.request.contextPath}' == '') ? '/'
				: '${pageContext.request.contextPath}' + '/';
	</script>
	<script
		src="<c:url value ="/resources/js/admin/products/category/products_category_list.js"/>"></script>

	<!-- Date picker bootstrap -->
	<script
		src="<c:url value ="/resources/vendor/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"/>"></script>





</body>
</html>