<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네모내모 관리자</title>

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
	<!-- JQuery DataTable Css -->
	<link rel="stylesheet" href="<c:url value="/resources/vendor/plugins/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css"/>">
	<!-- FontAwesome -->
	<link rel="stylesheet" href="https:cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">
	
	
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
	
        <!-- 메인 -->
        <section class="content">
            <div class="container-fluid">
                <!-- 대쉬보드 -->
                <div class="block-header">
                    <h2>DASHBOARD</h2>
                </div>
                <div class="row clearfix">
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="info-box bg-cyan hover-expand-effect">
                            <div class="icon">
                                <i class="material-icons">help</i>
                            </div>
                            <div class="content">
                                <div class="text">새로운 1:1 문의</div>
                                <div class="number count-to" data-from="0" data-to="257" data-speed="1000"
                                    data-fresh-interval="20"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="info-box bg-orange hover-expand-effect">
                            <div class="icon">
                                <i class="material-icons">person_add</i>
                            </div>
                            <div class="content">
                                <div class="text">새로운 회원</div>
                                <div class="number count-to" data-from="0" data-to="1225" data-speed="1000"
                                    data-fresh-interval="20"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="info-box bg-green">
                            <div class="icon">
                                <i class="material-icons">equalizer</i>
                            </div>
                            <div class="content">
                                <div class="text">DAILY SALES</div>
                                <div class="number">200,000원</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                        <div class="info-box bg-pink">
                            <div class="icon">
                                <i class="material-icons">equalizer</i>
                            </div>
                            <div class="content">
                                <div class="text">TOTAL SALES</div>
                                <div class="number">$125 543</div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- #END# 대쉬보드 -->
            </div>
        </section>
        
        <!-------------------------------------------SECTION--------------------------------------------------->

	<!-- Jquery Core Js -->
	<script src="<c:url value ="/resources/vendor/plugins/jquery/jquery.js"/>"></script>
	
	<!-- Bootstrap Core Js -->
	<script src="<c:url value ="/resources/vendor/plugins/bootstrap/js/bootstrap.js"/>"></script>

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
	<script src="<c:url value ="/resources/js/admin/products/product_list.js"/>"></script>
		


</body>
</html>

