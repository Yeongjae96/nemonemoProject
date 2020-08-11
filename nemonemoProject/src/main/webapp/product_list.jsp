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
	<link rel="stylesheet" href="<c:url value="/resources/css/admin/products/product_list.css"/>">
	
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


                <!-- prod-list -->
                <div class="row clearfix">
                    <div>
                        <div class="card">
                            <div class="header">
                                <h1>
                                    상품 정보
                                </h1>
                            </div>
                            <div class="body">
                                <div class="table-responsive ">
                                    <table id="prod-list"
                                        class="table table-bordered table-striped table-hover dataTable display">
                                        <h4>네모내모 상품 리스트</h4>
                                        <thead>
                                            <tr>
                                                <th>번호</th>
                                                <th>상품 코드</th>
                                                <th>상품명</th>
                                                <th>카테고리</th>
                                                <th>게시일</th>
                                                <th>판매자(상점 이름)</th>
                                                <th>상태 변경</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>DJF2244</td>
                                                <td>공룡인형</td>
                                                <td>소품</td>
                                                <td>2019/07/09</td>
                                                <td>상점324호</td>
                                                <td class="text-center">
                                                    <button id="mod-prod-btn" type="button" data-toggle="modal"
                                                    data-target="#registryModal" class="prd-upd-btn">상태수정</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>ZNF322</td>
                                                <td>공룡인형</td>
                                                <td>소품</td>
                                                <td>2019/07/09</td>
                                                <td>상점324호</td>
                                                <td class="text-center">
                                                    <button id="mod-prod-btn" type="button" data-toggle="modal"
                                                        data-target="#registryModal" class="prd-upd-btn">상태수정</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>GONG234</td>
                                                <td>공룡인형</td>
                                                <td>소품</td>
                                                <td>2019/07/09</td>
                                                <td>상점324호</td>
                                                <td class="text-center">
                                                    <button id="mod-prod-btn" type="button" data-toggle="modal"
                                                        data-target="#registryModal" class="prd-upd-btn">상태수정</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>GONG234</td>
                                                <td>공룡인형</td>
                                                <td>소품</td>
                                                <td>2019/07/09</td>
                                                <td>상점324호</td>
                                                <td class="text-center"> <button id="mod-prod-btn" type="button"
                                                        data-toggle="modal" data-target="#registryModal"
                                                        class="prd-upd-btn">상태수정</button></td>

                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>GONG234</td>
                                                <td>공룡인형</td>
                                                <td>소품</td>
                                                <td>2019/07/09</td>
                                                <td>상점3224호</td>
                                                <td class="text-center">
                                                    <button id="mod-prod-btn" type="button" data-toggle="modal"
                                                        data-target="#registryModal" class="prd-upd-btn">상태수정</button>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>GONG234</td>
                                                <td>공룡인형</td>
                                                <td>소품</td>
                                                <td>2019/07/09</td>
                                                <td>상점3224호</td>
                                                <td class="text-center">
                                                    <button id="mod-prod-btn" type="button" data-toggle="modal"
                                                    data-target="#registryModal" class="prd-upd-btn">상태수정</button>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>GONG234</td>
                                                <td>공룡인형</td>
                                                <td>소품</td>
                                                <td>2019/07/09</td>
                                                <td>상점32234호</td>
                                                <td class="text-center">
                                                    <button id="mod-prod-btn" type="button" data-toggle="modal"
                                                        data-target="#registryModal" class="prd-upd-btn">상태수정</button>
                                                </td>

                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- #END# 1:!  -->
            </div>

            <!-- 상품 상태 변경  -->
            <div class="modal fade" id="registryModal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <div class="modal-flex--center">
                                <h2 class="modal-title" id="category-modal-title">상품 상태 변경</h2>
                            </div>
                        </div>
                        <div class="modal-body">
                            <div class="modal-flex--column">
                                <div class="modal-flex--body">
                                    <p><strong>상태</strong></p>
                                    <div class="modal-row--content">
                                        <div class="input-group input-group-lg">
                                            <span class="input-group-addon">
                                                <input type="radio" class="with-gap" id="sale"
                                                    name="productStatus" value="1">
                                                <label for="sale">판매중</label>
                                            </span>
                                            <span class="input-group-addon">
                                                <input type="radio" class="with-gap" id="sale-pause"
                                                    name="productStatus" value="2">
                                                <label for="sale-pause">판매중지</label>
                                            </span>
                                            <span class="input-group-addon">
                                                <input type="radio" class="with-gap" id="sale-complete"
                                                    name="productStatus" value="3">
                                                <label for="sale-complete">판매완료</label>
                                            </span>
                                            <span class="input-group-addon">
                                                <input type="radio" class="with-gap" id="reservation"
                                                    name="productStatus" value="4">
                                                <label for="reservation">예약중</label>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>      
                        <div class="modal-footer">
                            <div class="modal-flex--center">
                                <button type="button" class="btn btn-link waves-effect bg-blue"
                                    id="categoryModalRegistryBtn">변경</button>
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
	<script
		src="<c:url value ="/resources/vendor/common/javascript/pages/admin.js"/>"></script>
	<script src="<c:url value ="/resources/vendor/puglins/jquery-datatable/jquery-datatable.js"/>"></script>
	
	<!-- 개인 JS -->
	<script
		src="<c:url value ="/resources/js/admin/products/product_list.js"/>"></script>


</body>
</html>