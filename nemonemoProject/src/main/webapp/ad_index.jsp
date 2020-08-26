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
<%-- 	<link rel="stylesheet" href="<c:url value="/resources/css/admin/sites/site_banner_list.css"/>"> --%>
	
	
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
	
			<!-- Jquery Core Js -->
    		<script src="<c:url value ="/resources/vendor/plugins/jquery/jquery.js"/>"></script>
    		
    		<!-- Bootstrap Core Js -->
			<script src="<c:url value ="/resources/vendor/plugins/bootstrap/js/bootstrap.js"/>"></script>
   			 	
        <!-- Select Plugin Js -->
<%-- 		<script src="<c:url value ="/resources/vendor/plugins/bootstrap-select/js/bootstrap-select.js"/>"></script> --%>


        <!-- Slimscroll Plugin Js -->
<%-- 		<script src="<c:url value ="/resources/vendor/plugins/jquery-slimscroll/jquery.slimscroll.js"/>"></script>
 --%>
         <!-- Waves Effect Plugin Js -->
       		 <script src="<c:url value ="/resources/vendor/plugins/node-waves/waves.js"/>"></script>
        
        
<%-- 		<!-- Jquery CountTo Plugin Js -->
   			<script src="<c:url value ="/resources/vendor/plugins/jquery-countto/jquery.countTo.js"/>"></script> --%>
     
        <!-- Custom Js -->
        <script src="<c:url value ="/resources/vendor/common/javascript/pages/admin.js"/>"></script>
<%--    <script src="<c:url value ="/resources/vendor/common/javascript/pages/index.js"/>"></script> --%>

        <!-- Demo Js -->
<%--         <script src="<c:url value ="/resources/vendor/common/javascript/pages/demo.js"/>"></script> --%>
        

       

<%-- 
        <!-- Morris Plugin Js -->
		<script src="<c:url value ="/resources/vendor/plugins/raphael/raphael.min.js"/>"></script>
		<script src="<c:url value ="/resources/vendor/plugins/morrisjs/morris.js"/>"></script>

        <!-- ChartJs -->   
		<script src="<c:url value ="/resources/vendor/plugins/chartjs/Chart.bundle.js"/>"></script>

        <!-- Flot Charts Plugin Js -->
		<script src="<c:url value ="/resources/vendor/plugins/flot-charts/jquery.flot.time.js"/>"></script>
		<script src="<c:url value ="/resources/vendor/plugins/flot-charts/jquery.flot.categories.js"/>"></script>
		<script src="<c:url value ="/resources/vendor/plugins/flot-charts/jquery.flot.pie.js"/>"></script>
		<script src="<c:url value ="/resources/vendor/plugins/flot-charts/jquery.flot.resize.js"/>"></script>
		<script src="<c:url value ="/resources/vendor/plugins/flot-charts/jquery.flot.js"/>"></script>
		      
        <!-- Sparkline Chart Plugin Js -->
        <script src="<c:url value ="/resources/vendor/plugins/jquery-sparkline/jquery.sparkline.js"/>"></script> --%>

		<!-- Dateppicker bootstrap -->
    	<script src="<c:url value ="/resources/vendor/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"/>"></script>
    	
    	<!-- 개인 JS -->
	<%-- <script src="<c:url value ="/resources/js/admin/sites/site_coupon_list.js"/>"></script> --%>
	
	
</body>
</html>