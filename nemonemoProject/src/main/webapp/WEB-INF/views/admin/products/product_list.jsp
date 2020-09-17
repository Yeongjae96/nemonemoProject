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
	<link rel="shortcut icon" href="<c:url value="/resources/images/common/logo/favicon.png"/>"> 

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
	
	<!-- FontAwesome -->
	<link rel="stylesheet" href="https:cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">
	
	
	
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
                                    <i class="fas fa-clipboard-list"></i> 상품 정보
                            <button type="button" class="btn bg-pink waves-effect m-r-20" id="product_cate"> 카테고리 등록</button>
                                </h1>
                            </div>
                            <div class="body">
                                <div class="table-responsive ">
                                    <table id="prod-list"
                                        class="table table-bordered table-striped table-hover dataTable display">
                                        <thead>
                                            <tr>
                                                <th width="10%">번호</th>
                                                <th width ="10%">상점</th>
                                                <th width = "20%">카테고리</th>
                                                <th width ="20%">상품명</th>
                                                <th width = "20%">게시일</th>
                                                <th width = "10%">판매날짜</th>
                                                <th width = "10%">게시글</th>
                                            </tr>
                                        </thead>
                                        <tbody id="result">
                                        	<c:forEach var ="prod" items="${productList}">
                                            <tr>
                                                <td>${prod.productNo}</td>
                                                <td>${prod.storeName}</td>
                                                <td id ="cate">
                                                	${prod.productCateLarge}
                                                <c:if test ="${prod.productCateLarge eq NULL}">
                                                	${prod.productCateMedium}
                                                </c:if>	
                                                <c:if test = "${prod.productCateLarge ne NULL and 
                                                				prod.productCateSmall ne NULL}">
                                                	<i class="fas fa-chevron-right"></i> ${prod.productCateMedium}
                                                </c:if>
                                                <c:if test = "${prod.productCateMedium ne NULL and
                                                				prod.productCateSmall ne NULL}">
                                                	<i class="fas fa-chevron-right"></i> ${prod.productCateSmall}
                                                </c:if>
                                                	</td>
                                                <td><a target="_blank" href="<c:url value="/products/${prod.productNo}.do"/>">${prod.productName}</a></td>
                                                <td>${prod.productRegDt}</td>
                                                <td align ="center">
                                                <c:if test="${prod.productSoldDt eq NULL
                                                			and prod.productDispSt eq 'S'}">
                                        		<span class="label label-default">판매중</span>
                                        		</c:if>
                                        		 <c:if test="${prod.productSoldDt ne NULL}">
                                        						${prod.productSoldDt}
                                        		</c:if>
                                        		 <c:if test="${prod.productDispSt eq 'P'}">
                                        			게시중지
                                        		</c:if>
                                        		</td>
                                                <td>
                                        			<c:if test="${prod.productDispSt eq 'S'}">
                                        				<span style="color:blue; cursor : pointer;"
                                        					data-prodno ="${prod.productNo}">게시중</span>	
                                        			</c:if>
                                        			<c:if test="${prod.productDispSt eq 'P'}">
                                        				<span style="color:#EE5058; font-weight: bold; cursor : pointer;"
                                        					data-prodno ="${prod.productNo}">게시중지</span>
                                        			</c:if>
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
                <!-- #END# 1:!  -->
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