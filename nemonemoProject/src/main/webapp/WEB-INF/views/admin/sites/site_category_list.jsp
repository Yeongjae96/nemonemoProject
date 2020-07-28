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
	
	<!-- bootstrap select -->
	<link rel="stylesheet" href="<c:url value="/resources/vendor/plugins/bootstrap-select/css/bootstrap-select.css"/>">
	
	<!-- JQuery DataTable Css -->
	<link rel="stylesheet" href="<c:url value="/resources/vendor/plugins/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css"/>">
	
	
	
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
                        <h1>
                            카테고리 목록
                        </h1>
                     
                    </div>
                    <div class="body">
                        <div class="table-responsive" style="overflow-x: hidden;">
                            <div class="category-flex">
                                <button type="button" class="btn bg-pink waves-effect m-r-20" data-toggle="modal"
                                    data-target="#registryModal">카테고리 등록</button>
                                <button type="button" class="btn bg-pink waves-effect m-r-20">카테고리 수정</button>
                                <button type="button" class="btn bg-pink waves-effect m-r-20">카테고리 삭제</button>
                                <!-- <label class="label-export">외부파일로 저장하기</label> -->
                            </div>
                            <table class="table table-bordered table-striped table-hover category-table">
                                <thead>
                                    <tr>
                                        <th>카테고리 코드</th>
                                        <th>대분류</th>
                                        <th>중분류</th>
                                        <th>소분류</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
            </div>


            <!-- 등록 카테고리 -->
            <div class="modal fade" id="registryModal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="modal-flex--center">
                                <h3 class="modal-title" id="category-modal-title">신규 카테고리 등록</h3>
                            </div>
                        </div>
                        <div class="modal-body">
                            <div class="modal-flex--column">
                                <div class="modal-flex--body">
                                    <p><strong>분류</strong></p>
                                    <div class="modal-row--content">
                                        <div class="input-group input-group-lg">
                                            <span class="input-group-addon">
                                                <input type="radio" class="with-gap" id="lg-category"
                                                    name="categoryType" value="1">
                                                <label for="lg-category">대분류</label>
                                            </span>
                                            <span class="input-group-addon">
                                                <input type="radio" class="with-gap" id="md-category"
                                                    name="categoryType" value="2">
                                                <label for="md-category">중분류</label>
                                            </span>
                                            <span class="input-group-addon">
                                                <input type="radio" class="with-gap" id="sm-category"
                                                    name="categoryType" value="3">
                                                <label for="sm-category">소분류</label>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-flex--body">
                                    <p><strong>대분류</strong></p>
                                    <!-- 각종 카테고리가 들어가야함 -->
                                    <select class="form-control show-tick" id="lg-category--select">
                                        <option>대대대</option>
                                        <option>중중</option>
                                        <option>소</option>
                                    </select>
                                </div>
                                <div class="modal-flex--body">
                                    <p><strong>중분류</strong></p>
                                    <!-- 각종 카테고리가 들어가야함 -->
                                    <select class="form-control show-tick" id="md-category--select">
                                        <option>중중중</option>
                                        <option>소소</option>
                                        <option>대</option>
                                    </select>
                                </div>
                                <div class="modal-flex--body">
                                    <p><strong>카테고리 명</strong></p>

                                    <div class="form-group form-group-lg">
                                        <div class="form-line">
                                            <input type="text" class="form-control" placeholder="카테고리명을 입력해주세요" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="modal-flex--center">
                                <button type="button" class="btn btn-link waves-effect bg-blue"
                                    id="categoryModalRegistryBtn">등록</button>
                                <button type="button" class="btn btn-link waves-effect bg-red"
                                    data-dismiss="modal">취소</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </section>
        <!-------------------------------------------SECTION--------------------------------------------------->

	
	
		<!-- Jquery Core Js -->
    	<script src="<c:url value ="/resources/vendor/plugins/jquery/jquery.js"/>"></script>
    		
    	<!-- Bootstrap Core Js -->
		<script src="<c:url value ="/resources/vendor/plugins/bootstrap/js/bootstrap.js"/>"></script>
   			 	
        <!-- Select Plugin Js -->
		<script src="<c:url value ="/resources/vendor/plugins/bootstrap-select/js/bootstrap-select.js"/>"></script>


        <!-- Slimscroll Plugin Js -->
 		<script src="<c:url value ="/resources/vendor/plugins/jquery-slimscroll/jquery.slimscroll.js"/>"></script>

        <!-- Waves Effect Plugin Js -->
       	<script src="<c:url value ="/resources/vendor/plugins/node-waves/waves.js"/>"></script>
       	
       	 <!-- Jquery DataTable Plugin Js -->    	
    	<script src="<c:url value ="/resources/vendor/plugins/jquery-datatable/jquery.dataTables.js"/>"></script>
    	<script src="<c:url value ="/resources/vendor/plugins/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js"/>"></script>
    	<script src="<c:url value ="/resources/vendor/plugins/jquery-datatable/extensions/export/dataTables.buttons.min.js"/>"></script>
    	<script src="<c:url value ="/resources/vendor/plugins/jquery-datatable/extensions/export/buttons.flash.min.js"/>"></script>
    	<script src="<c:url value ="/resources/vendor/plugins/jquery-datatable/extensions/export/jszip.min.js"/>"></script>
    	<script src="<c:url value ="/resources/vendor/plugins/jquery-datatable/extensions/export/pdfmake.min.js"/>"></script>
    	<script src="<c:url value ="/resources/vendor/plugins/jquery-datatable/extensions/export/vfs_fonts.js"/>"></script>
    	<script src="<c:url value ="/resources/vendor/plugins/jquery-datatable/extensions/export/buttons.html5.min.js"/>"></script>
    	<script src="<c:url value ="/resources/vendor/plugins/jquery-datatable/extensions/export/buttons.print.min.js"/>"></script>
        
        <!-- Custom Js -->
        <script src="<c:url value ="/resources/vendor/common/javascript/pages/admin.js"/>"></script>
  		<script src="<c:url value ="/resources/vendor/puglins/jquery-datatable/jquery-datatable.js"/>"></script>
  		
  		<!-- 개인 JS -->
  		<script src="<c:url value ="/resources/js/admin/sites/site_category_list.js"/>"></script>
  		<script src="<c:url value ="/resources/vendor/pages/tables/jquery-datatable.js"/>"></script> <!-- ??? -->
  		

</body>
</html>