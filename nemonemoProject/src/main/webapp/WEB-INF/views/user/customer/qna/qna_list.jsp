<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:set var="qnaList" value="${vo.qnaVOList}"/>
<c:set var="pageVO" value="${vo.pageVO}" scope="request"/>
<c:set var="pageName" value="list" scope="request"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네모내모 | 1:1상담</title>
<!-- 공통 CSS -->
<link rel="stylesheet" href="<c:url value="/resources/css/user/common/common.css"/>">

<!-- 페이지 CSS  -->
<link rel="stylesheet" href="<c:url value="/resources/css/user/customer/qna/qna_list.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/user/customer/customer_nav.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/common/paging/paging.css"/>">
<link rel="shortcut icon" href="<c:url value="/resources/images/common/logo/favicon.png"/>"> 


<!-- 라이브러리 -->
<script src="<c:url value="/resources/vendor/jquery/jquery-3.5.1.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/fontawesome/js/all.js"/>"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 해당 페이지 JS파일 -->
<script> window.contextPath = "<c:url value="/"/>";</script>
<script src="<c:url value="/resources/js/user/common/common.js"/>"></script>
<script src="<c:url value="/resources/js/user/customer/qna/qna_list.js"/>"></script>



</head>
<body>
	<% 
		/* 공통 Header */
	%>
	<jsp:include page="/WEB-INF/views/user/include/top-menu.jsp"/>
	<% 
		/* 공통 Header */
	%>
	<header class="sticky-top">
		<jsp:include page="/WEB-INF/views/user/include/header.jsp" />
		<jsp:include page="/WEB-INF/views/user/include/side-nav.jsp"/>		
	</header>
	<% 
		/* 각 페이지의 특성! */
	%>
	 
	<section>
		<div class="consulting_list_div">
        <main class="consulting_list_main">
	        <!-- customer 공통 nav -->
				<jsp:include page="/WEB-INF/views/user/customer/common/customer_nav.jsp"/>
	        <hr>
        	
            <nav class="consulting_list_nav">
                <a class="consulting_list_nav_a1" href="<c:url value="/customer/qna.do"/>">1:1 상담하기</a>
                <a class="consulting_list_nav_a2" href="<c:url value="/customer/qna/list.do"/>">상담내역
                    <div class="title_hover"></div>
                </a>
            </nav>
           
            <ul class="qna_list">
       			<c:forEach var="qna" items="${qnaList}">
                <article class="qna_article">
                  	<input type ="hidden" value ="${qna.qnaRegId}">
                  	<input type ="hidden" value ="${qna.qnaNo}">
                  		<!-- 글 여는 버튼  -->
                    <button class="qna_open_btn">
                        <div class="qna_intro">                        	
                            <h1>${qna.qnaCategoryName}</h1>
                            <time class="qna_reg_time">${qna.qnaRegYmd}</time>
                        </div>
                        <div class="qna_reply_flag">
                         	<c:if test="${qna.qnaReplyFl eq 'Y'}"><h1>답장완료</h1></c:if>
                        	<c:if test="${qna.qnaReplyFl ne 'Y'}"><h1 class="wait">확인중</h1></c:if> 
                        	
                        </div>
                        <span class="qna_arrow"></span>
                    </button>
                            											<!-- 네모내모 답변 -->
                    <div class="qna_section">
                        <c:if test ="${qna.qnaReplyFl eq 'Y'}">
                         <section class="answer_section">
                            <div class="qna_section_align">
                                <div class="qna_content_title">
                                    <img src="<c:url value="/resources/images/common/logo/favicon.png"/>"
                                        width="40" height="40" class="qna_logo_img">
                                    <div class="qna_font_div">
                                        <h2 class="answer_h2">네모내모 운영센터 답변</h2>
                                        <time class="answer_time">${qna.qnaReplyYmd}</time>
                                    </div>
                                    <a class="to_anther_question" href="<c:url value="/customer/qna.do"/>">다른 문의하기</a>
                                </div>
                                <div class="qna_content">
                                ${qna.qnaAdminContent}
                                </div>
                            </div>
                        </section>		
                        </c:if>                     
                                        					<!-- 고객의 문의사항 -->
                        <section class="question_section">
                            <div class="qna_section_align">
                                <div class="qna_content_title">
                                    <img
                                src="<c:url value="/resources/images/user/qna/customer.svg"/>"
                                        width="40" height="40" class="qna_logo_img">
                                    <div class="qna_font_div">
                                        <h2 class="question_h2">문의내용</h2>
                                        <time class="question_time">${qna.qnaRegYmd}</time>
                                    </div>
                                </div>
                                <p class="qna_content">
                                	${qna.qnaUserContent}
                                </p>
                            </div>
                        </section>  
                    </div>
                </article>
               </c:forEach>
            </ul>  
            <div class="qna_list_footer">
            <jsp:include page="/WEB-INF/views/common/paging/paging.jsp"/>
            </div>
        </main>
    </div>
	</section>

	<% 
		/* 공통 푸터 */
	%>
	<jsp:include page="/WEB-INF/views/user/include/footer.jsp"/>
</body>
</html>