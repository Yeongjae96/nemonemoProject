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
	href="<c:url value="/resources/css/admin/members/member/member_list.css"/>">

<!-- FontAwesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">

<!-- JQuery DataTable Css -->
<link rel="stylesheet"
	href="<c:url value="/resources/vendor/plugins/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css"/>">


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
        
<!-- 컨텐츠 -->
    <!-- 모달 시작-->
    <div class="modal fade" id="smallModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title text-center modal-col-red" id="smallModalLabel" >주의</h3>
                </div>
                <div class="modal-body">
                    <h3 class="text-center">활동 중지</h3>
                    <h5 class="text-center"> 확인 버튼을 누르시면</h5> 
                        <h5 class="text-center">해당 고객은의 활동은 중지됩니다.</h5>
                            <h5 class="text-center">중지 하시겠습니까?</h5>
                    
                </div>
                <div class="modal-footer">
                    <button id ="del-confirm" type="button" class="btn btn-link waves-effect" data-dismiss="modal">삭제</button>
                    <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>
    <!--모달 끝-->

        <section class="content">
            <div class="container-fluid">
                <div class="row clearfix">
                    <div>
                        <div class="card">
                            <div class ="header">
                                <h1>
                                   <i class="fas fa-user" style ="color : red;"></i> 회원 리스트
                                </h1>
                            </div>
                            <div class="body">
                                <div class="table-responsive">
                                    <table id ="mem-list" class="table table-bordered table-striped table-hover dataTable display">
                                        <thead>
                                            <tr>
                                                <th>번호</th>
                                                <th>이메일</th>
                                                <th>상점명</th>
                                                <th>등급</th>
                                                <th>연락처</th>
                                                <th>가입일</th>
                                                <th>처리</th>
                                            </tr>
                                        </thead>
                                        <tbody>
		                                    <c:forEach var="member" items="${memberList}">
                                            <tr>
                                                <td>${member.userNo}</td>
                                                <td>${member.userEmail}</td>
                                                <td>${member.storeName}</td>
                                                <td><c:if test="${member.userStatus eq 'N'}">활동중</c:if>
                                                	<c:if test="${member.userStatus eq 'V'}">
                                                	<span class="label label-warning">VIP</span></c:if>
                                                	<c:if test="${member.userStatus eq 'P'}">
                                                	 <span class="label label-danger">계정정지</span></c:if>
                                                	<c:if test="${member.userStatus eq 'W'}">                                                	 
                                                	<span class="label label-default">탈퇴</span></c:if>                                            
                                                </td>
                                                <td>${member.userPhone}</td>
                                                <td>${member.userRegYmd}</td>
                                                <td class ="text-center"><button type="button" class ="btn bg-indigo waves-affect mem-upd-btn"
                                                	data-userno="${member.userNo}">상세보기</button>
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
	<script
		src="<c:url value ="/resources/js/admin/members/member/member_list.js"/>"></script>


</body>
</html>