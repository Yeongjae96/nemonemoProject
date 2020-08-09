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
	<link rel="stylesheet" href="<c:url value="/resources/css/admin/sites/notice/site_notice_list.css"/>">
	
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
                        <h1>공지사항 관리</h1>
                    </div>
                    <div class="notice-flex">
                      	<button type="button" class="btn bg-pink waves-effect" data-toggle="modal" data-target="#notice_in">공지사항 등록</button>
                    </div>
                    <!--헤더끝-->
                    <div class="body">
                        <div class="table-responsive" style="overflow-x: hidden;">
                            <table id="notice-table" class="table table-bordered table-striped table-hover display">
                                <thead>
                                    <tr>
                                    	<th width="10%">공지 번호</th>
                                        <th width="15%">공지 제목</th>
                                        <th width="45%">내용</th>
                                        <th width="10%">게시일</th>
                                        <th width="10%">수정일</th>
                                        <th width="10%">수정/삭제</th>
                                    </tr>
                                </thead>
                                <tbody id="result">
                                	<c:forEach var="notice" items="${noticeList}">
                                   <tr>
                                   		<td>${notice.noticeNo }</td>
                                        <td>${notice.noticeTitle}</td>
                                        <td>${notice.noticeContent}</td>
                                        <td>${notice.noticeRegYmd}</td>
                                        <td>${notice.noticeEditYmd}</td>
                                        <td class ="text-center"><button type="button" class ="notice-upd-btn" data-noticeNo="${notice.noticeNo}">수정</button>
                                            <button type="button" class ="notice-del-btn" data-noticeNo="${notice.noticeNo}">삭제</button></td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!-- 등록 수정 분류-->

                    </div>
                </div>
                <!-- Modal -->
                <div class="modal fade" id="notice_in" role="dialog">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <!-- modal header-->
                            <div class="modal-header">
                                <h2 class="modal-title">공지사항 등록</h2>
                            </div>
				
                            <div class="modal-body">
	                           	<form method="POST" action="new.mdo" name="noticeForm">
	                                <div class="form-group">
	                                	<div class="notice-registry--title">
		                                    <label for="InputNoticeName">공지사항 제목</label>
		                                    <input type="text" class="form-control" name="noticeTitle" id="noticeTitle" placeholder="제목을 입력해주세요">
	                                	</div>
	                                	<div class="notice-registry--content">
		                                    <label for="InputNoticeName">공지사항 내용</label>
	                                	</div>
		                                    <textarea class="form-control" id="noticeContent" name="noticeContent" placeholder="내용을 입력해주세요"></textarea>
	                                </div>
                                </form>
                            </div>
                            
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success" data-dismiss="modal" id="NoticeInsert">등록</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
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
        
        <!-- 개인 JS -->
		<script src="<c:url value ="/resources/js/admin/sites/notice/site_notice_list.js"/>"></script>
		

	
</body>
</html>