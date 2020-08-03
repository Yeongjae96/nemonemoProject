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
	
	<section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>
                    
                </h2>
            </div>
            
            <!-- Advanced Validation -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>이용약관</h2>
                        </div>
                        <div class="body">
                            <form id="form_advanced_validation" method="POST">
                                <div class="form-group form-float">
                                    <div class="form-line">
                                        <input type="text" class="form-control" name="editserviceUse-title" minlength="3" required>
                                        <label class="form-label">약관 이름</label>
                                    </div>
                                    <div class="help-info">약관 이름을 적으세요</div>
                                </div>
                                <div class="form-group form-float">
                                                   
                                        <label for="InputNoticeName">약관 내용</label>
									<textarea cols="120" rows="20" name="serviceUse_content" id="serviceUse_content" ></textarea>
                                    
                                </div>
                               <!--  <div class="form-group form-float" style="margin-top: 30px;">
                                    <label class="form-label">표시 여부</label>
                                    <select class="selectpicker">
                                        <option value="Y">Y</option>
                                        <option value="Y">S</option>
                                        <option value="N">N</option>
                                    </select>
                                </div> -->
                                <button class="btn btn-primary waves-effect" type="submit">SUBMIT</button>
                            </form>
                        </div>
                    </div>
                    </div>
                </div>
            </div>          
    </section>
    
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

        <!-- Custom Js -->
        <script src="<c:url value ="/resources/vendor/common/javascript/pages/admin.js"/>"></script>

		<!-- Dateppicker bootstrap -->
    	<script src="<c:url value ="/resources/vendor/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"/>"></script>
    	
    	<!-- 개인 JS -->
		<script src="<c:url value ="/resources/js/admin/sites/site_terms.js"/>"></script>	
		
		<!-- smartEditor -->
		<script src="<c:url value ="/resources/vendor/SmartEditor/js/HuskyEZCreator.js"/>"></script>
		<script>

		var oEditors = [];
		   nhn.husky.EZCreator.createInIFrame({
		      oAppRef: oEditors,
		      elPlaceHolder: "serviceUse_content",
		      //SmartEditor2Skin.html 파일이 존재하는 경로
		      sSkinURI : "resources/vendor/SmartEditor/SmartEditor2Skin.html", 
		      htParams : {
		          // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		          bUseToolbar : true,             
		          // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		          bUseVerticalResizer : true,     
		          // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		          bUseModeChanger : true,         
		          fOnBeforeUnload : function(){
		               
		          }
		      }, 
		      fOnAppLoad : function(){
		          //textarea 내용을 에디터상에 바로 뿌려주고자 할때 사용
		          oEditors.getById["serviceUse_content"].exec("PASTE_HTML", ["약관을 입력해주세요."]);
		      },
		      fCreator: "createSEditor2"
		      
	});
	</script>
		
	
</body>
</html>
