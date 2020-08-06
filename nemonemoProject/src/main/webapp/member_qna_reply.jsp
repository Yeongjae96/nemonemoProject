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
<link rel="stylesheet" href="<c:url value="/resources/css/admin/members/qna/member_qna_reply.css"/>">


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


	<!-------------------------------------------SECTION--------------------------------------------------->
	<section class="content">
		<div class="container-fluid">
			<div class="card">
				<div class="header">
					<p id="qna_rpl_title">1:1 문의</p>
				</div>
				<div class="row clearfix">
					<div>
						<div class="body">
							<form id="form_validation" method="POST">
								<div class="table-responsive">
									<table class="table">
										<thead class="col-m-2">
											<tr>
												<th>상점명 <i class="material-icons">check</i></th>
												<td>공룡이네</td>
												
											</tr>
											<tr>
												<th>카테고리 <i class="material-icons">check</i></th>
												<td>서비스/불만족</td>
												
											</tr>
											<tr>
												<th>문의내용 <i class="material-icons">check</i></th>
												<td><textarea cols="120" rows="20" required
														id="qna-from-cus" readonly>
                                                </textarea></td>
												
											</tr>
											<tr>
												<th>파일 다운로드</th>
												<td><a class="btn" href="상대경로" download="">download</a></td>
											</tr>
											<tr>
												<th>답변상태</th>
												
												<td><input type="radio" name="jb-radio"
													id="delay_reply" class="custom-control-input"> <label
													class="custom-control-label" for="delay_reply">답변대기</label>
													<input type="radio" name="jb-radio" id="done_reply"
													class="custom-control-input"> <label
													class="custom-control-label" for="done_reply">답변완료</label>
												</td>
											</tr>
											<tr>
												<th>네모내모 답변</th>
												<td><textarea cols="120" rows="20"
														name="qnaReplyContent" id="qnaReplyContent"></textarea></td>
											</tr>
										</thead>
									</table>
								</div>
							
								<div class="btn-layout">
									<button class="btn bg-success waves-effect m-r-20" type="submit">저장하기</button>
									<button class="btn btn-danger waves-effect m-r-20">취소</button>
						
								</div>
							</form>
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

	<!-- Custom Js -->
	<script
		src="<c:url value ="/resources/vendor/common/javascript/pages/admin.js"/>"></script>


	<!-- 개인 JS -->
	<%-- 	<script
		src="<c:url value ="/resources/js/admin/members/member_care_reply.js"/>"></script> --%>

	<!-- smartEditor -->
	<script
		src="<c:url value ="/resources/vendor/SmartEditor/js/HuskyEZCreator.js"/>"></script>
	<script>
		var oEditors = [];
		   nhn.husky.EZCreator.createInIFrame({
		      oAppRef: oEditors,
		      elPlaceHolder: "qnaReplyContent",
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
		          //oEditors.getById["termsContent"].exec("PASTE_HTML", ["약관을 입력해주세요."]);
		      }, 
		      fCreator: "createSEditor2"  
			});
		   
		   $('#termsInsert').click(function() {
				oEditors.getById["qnaReplyContent"].exec("UPDATE_CONTENTS_FIELD", []);	 	
		    	termsEditForm.submit();
		    });
		   
		   /* $(function(){
			    $.ajax({
			        type:"POST", 
			        url: "./editor_template.jsp",
			        success: function(data){
			            $(".termsContent").html(data);
			            setConfig(content); // 에디터 초기화시 글이 수정모드일 경우 본문영역의 내용을 파라미터로 가져간다.
			        }, 
			        error : function(request, status, error) {
			            alert("다음 에디터 로딩 에러");
			        }
			    }); 
			}); */


		</script>


</body>
</html>