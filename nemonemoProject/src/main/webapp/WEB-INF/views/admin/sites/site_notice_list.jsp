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
	<link rel="stylesheet" href="<c:url value="/resources/css/admin/sites/site_notice_list.css"/>">
	
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
        <div class="modal fade" id="smallModal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title text-center modal-col-red" id="smallModalLabel" >배너삭제</h3>
                    </div>
                    <div class="modal-body">
                        <h1 class="text-center">주의!</h1>
                        <h5 class="text-center">
                            확인 버튼을 누르시면</h5> 
                            <h5 class="text-center">해당 고객은 배너가 됩니다.</h5>
                                <h5 class="text-center">삭제 하시겠습니까?</h5>
                        
                    </div>
                    <div class="modal-footer">
                        <button id ="del-confirm" type="button" class="btn btn-link waves-effect" data-dismiss="modal">삭제</button>
                        <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">취소</button>
                    </div>
                </div>
            </div>
        </div>
        
        <section class="content">
            <div class="container-fluid">
                <div class="card">
                    <div class="header">
                        <h1>공지사항 관리</h1>
                     
                    </div>
                    <!--헤더끝-->
                    <div class="body">
                        <div class="table-responsive" style="overflow-x: hidden;">
                            <table id="notice-table" class="table table-bordered table-striped table-hover display">
                                <h3>공지 관리</h3>
                                <thead>
                                    <tr>
                                    	<th>공지 번호></th>
                                        <th>공지 제목</th>
                                        <th>내용</th>
                                        <th>게시일</th>
                                        <th>수정/삭제</th>
                                    </tr>
                                </thead>
                                <tbody id="result">
                                	<c:forEach var="notice" items="${noticeList}">
                                   <tr>
                                   		<td>${notice.noticeNo }</td>
                                        <td>${notice.noticeTitle}</td>
                                        <td>
                                            <textarea style="width: 100%;">${notice.noticeContent}
                                        </textarea></td>
                                        <td>${notice.noticeYmd}</td>
                                        <td class ="text-center"><button type="button" class ="notice-upd-btn" data-noticeNo="${notice.noticeNo}">수정</button>
                                            <button type="button" class ="notice-del-btn" data-noticeNo="${notice.noticeNo}">삭제</button></td>
                                    </tr>
                                    <!-- <tr>
                                        <td>공지1</td>
                                        <td>
                                            <textarea style="width: 100%;">이 편지는 영국에서 최초로 시작되어 일년에 한 바퀴 돌면서 받는 사람에게 행운을 주었고 지금은 당신에게로 옮겨진 이 편지는 4일 안에 당신 곁을 떠나야 합니다. 이 편지를 포함해서 7통을 행운이 필요한 사람에게 보내 주셔야 합니다. 복사를 해도 좋습니다. 혹 미신이라 하실지 모르지만 사실입니다. 영국에서 HGXWCH이라는 사람은 1930년에 이 편지를 받았습니다. 그는 비서에게 복사해서 보내라고 했습니다. 며칠 뒤에 복권이 당첨되어 20억을 받았습니다. 어떤 이는 이 편지를 받았으나 96시간 이내 자신의 손에서 떠나야 한다는 사실을 잊었습니다. 그는 곧 사직되었습니다. 나중에야 이 사실을 알고 7통의 편지를 보냈는데 다시 좋은 직장을 얻었습니다. 미국의 케네디 대통령은 이 편지를 받았지만 그냥 버렸습니다. 결국 9일 후 그는 암살 당했습니다. 기억해 주세요. 이 편지를 보내면 7년의 행운이 있을 것이고 그렇지 않으면 3년의 불행이 있을 것입니다. 그리고 이 편지를 버리거나 낙서를 해서는 절대로 안됩니다. 7통입니다. 이 편지를 받은 사람은 행운이 깃들 것입니다. 힘들겠지만 좋은게 좋다고 생각하세요. 7년의 행운을 빌면서...
                                        </textarea></td>
                                        <td>2020-05-20</td>
                                        <td class ="text-center"><button type="button" class ="notice-upd-btn">수정</button>
                                            <button type="button" class ="notice-del-btn">삭제</button></td>
                                    </tr> -->
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div class="notice-flex">
                                <button type="button" class="btn bg-pink waves-effect m-r-20" data-toggle="modal"
                                    data-target="#notice_in">공지사항 등록</button>
                            </div>
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
	                           	<form method="POST" action="notice/new.mdo" name="noticeForm">
	                                <div class="form-group">
	                                	<div class="notice-registry--title">
		                                    <label for="InputNoticeName">공지사항 제목</label>
		                                    <input type="text" class="form-control" name="noticeTitle" id="noticeTitle" placeholder="제목을 입력해주세요">
	                                	</div>
	                                	<div class="notice-registry--content">
		                                    <label for="InputNoticeName">공지사항 내용</label>
	                                	</div>
		                                    <textarea class="form-contr ol" id="noticeContent" name="noticeContent" placeholder="내용을 입력해주세요"></textarea>
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
        <script src="<c:url value ="/resources/vendor/puglins/jquery-datatable/jquery-datatable.js"/>"></script>
        
        <!-- 개인 JS -->
		<script src="<c:url value ="/resources/js/admin/sites/site_notice_list.js"/>"></script>

	
</body>
</html>