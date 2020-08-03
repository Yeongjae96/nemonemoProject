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
                            <h1>이용약관 등록</h1>
                        </div>
                        <div class="body">
                            <form id="termsForm" method="POST">
                                <div class="form-group form-float">
                                    <div class="form-line">
                                    <label class="form-label">약관명</label>
                                        <input type="text" class="form-control" id="termsTitle" name="termsTitle" minlength="3" required>   
                                    </div>           
                                </div>
                                <div class="form-group form-float">
                                    <div class="form-line">
                                    <label class="form-label">등록자 ID</label>
                                        <input type="text" class="form-control" id="adminRegistryId" name="adminRegistryId" required>   
                                    </div>           
                                </div>
                                <div class="form-group form-float" style="margin-top: 30px;">
                                    <label class="form-label">표시 여부</label>
                                    <select class="selectpicker" id="termsRequiredFl" name="termsRequiredFl">
                                        <option value="Y">Y</option>
                                        <option value="S">S</option>
                                        <option value="N">N</option>
                                    </select>
                                </div> 
                                <div class="form-group form-float">
									<textarea cols="120" rows="20" name="termsContent" id="termsContent" ></textarea>     
                                </div>
                               
                                <button class="btn btn-primary waves-effect" type="submit" id="termsInsert">등록하기</button>
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
    	
		<!-- smartEditor -->
		<script src="<c:url value ="/resources/vendor/smarteditor/js/HuskyEZCreator.js"/>"></script>
    	<!-- 개인 JS -->
		
    	
		<script>
		var oEditors = [];
		   nhn.husky.EZCreator.createInIFrame({
		      oAppRef: oEditors,
		      elPlaceHolder: "termsContent",
		      //SmartEditor2Skin.html 파일이 존재하는 경로
		      sSkinURI : "../../resources/vendor/SmartEditor/SmartEditor2Skin.html", 
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
		      /* fOnAppLoad : function(){
		          //textarea 내용을 에디터상에 바로 뿌려주고자 할때 사용
		          oEditors.getById["termsContent"].exec("PASTE_HTML", ["약관을 입력해주세요."]);
		      }, */
		      fCreator: "createSEditor2"  
			});
		   $('#termsInsert').click(function() {
		    	oEditors.getById["termsContent"].exec("UPDATE_CONTENTS_FIELD", []);	
		    	termsForm.submit();
		    }); 
		</script>
		
	
</body>
</html>
