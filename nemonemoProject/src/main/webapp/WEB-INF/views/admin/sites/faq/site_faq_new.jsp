<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<title>네모내모</title>
<!-- Favicon-->

<link rel="icon" href="favicon.ico" type="image/x-icon">

<!-- Google Fonts -->
<link
	href="https://fotnts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext"
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
<link rel="stylesheet"
	href="<c:url value="/resources/css/admin/sites/faq/site_faq_new.css"/>">

<!--  테마 색상  -->
<link rel="stylesheet"
	href="<c:url value="/resources/vendor/common/stylesheets/theme-red.css"/>">



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

	<!-------------------------------------SECTION ---------------------------------------->
	<section class="content">
		<div class="container-fluid">
			<div class="block-header">
			</div>

			<!-- Advanced Validation -->
			<div class="row clearfix">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="card">
						<div class="header">
							<h2>자주묻는 질문 등록</h2>
						</div>
						<div class="body">
							<form id="faqNewForm" method="POST" action="new.mdo" class="faq-form">
								<div class="faq-row">
									<label class="">FAQ 카테고리</label>
									<select class="faq-category--list" name="faqCategoryNo">
										
									</select>
								</div>
								<div class="faq-row">
									<label class="">FAQ 제목</label>
									<div class="input-area">
										<input id="inputTitle" type="text" name="faqTitle"/>
										<div class="input-size">
											<span id="size">0</span>/30									
										</div>
									</div>
								</div>
								<div class="faq-row">
									<label class="">FAQ 내용</label>
								</div>
									<textarea id="faqContent" cols="120" rows="20" name="faqContent"></textarea>
								<div class="faq-row">
									<button id="newBtn" class="new-btn btn btn-success">등록</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-------------------------------------SECTION ---------------------------------------->


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

	<!-- Custom Js -->
	<script
		src="<c:url value ="/resources/vendor/common/javascript/pages/admin.js"/>"></script>
	
	<script src="<c:url value ="/resources/js/admin/sites/faq/site_faq_new.js"/>"></script>
	<!-- smartEditor -->
	<script src="<c:url value ="/resources/vendor/smarteditor/js/HuskyEZCreator.js"/>"></script>
	<script>
		var oEditors = [];
		   nhn.husky.EZCreator.createInIFrame({
		      oAppRef: oEditors,
		      elPlaceHolder: "faqContent",
		      //SmartEditor2Skin.html 파일이 존재하는 경로
		      sSkinURI : "../../resources/vendor/smarteditor/SmartEditor2Skin.html", 
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
		   $('#newBtn').click(function() {
		    	oEditors.getById["faqContent"].exec("UPDATE_CONTENTS_FIELD", []);	
		    	const faqForm = document.getElementById('faqNewForm');
		    	faqForm.submit();
		    }); 
		</script>
	
</body>
</html>