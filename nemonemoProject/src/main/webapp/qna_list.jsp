<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 공통 CSS -->
<link rel="stylesheet" href="<c:url value="/resources/css/user/common/common.css"/>">


<!-- 페이지 CSS  -->
<link rel="stylesheet" href="<c:url value="/resources/css/user/customer/qna/qna_list.css"/>">

<!-- 라이브러리 -->
<script src="<c:url value="/resources/vendor/jquery/jquery-3.5.1.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/fontawsome/js/all.js"/>"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 해당 페이지 JS파일 -->
<script src="<c:url value="/resources/js/user/common/common.js"/>"></script>

<script>
    $(function () {
        $('.notice-list-btn').click(function () {
            $(this).next().slideToggle();
        });
    });
    
    $(function () {
        $('.consulting_list_ul_article1_button').click(function () {
            $(this).next().slideToggle();
        });
    });
</script>


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
        	<!-- 공지사항등 큰 nav bar -->
	        <nav class="total-nav">
				<a class="total-nav-not-selected" href="#">공지사항</a>
				<a class="total-nav-not-selected" href="#">운영정책</a>
				<a class="total-nav-not-selected" href="#">자주묻는 질문</a>
				<a class="total-nav-selected" href="#">1:1문의</a>
			</nav>
	        <hr>
        	
            <nav class="consulting_list_nav">
                <a class="consulting_list_nav_a1" href="qna.html">1:1 상담하기</a>
                <a class="consulting_list_nav_a2" href="qna_list_em.html">상담내역
                    <div class="consulting_list_nav_a2_hover"></div>
                </a>
            </nav>
            
            <!-- 공지사항하고 비슷하게 만들시 예시용 -->
			<ul class="notice-list">
				<li class="notice-list-li">
					<article class="notice-list-art">
						<button class="notice-list-btn">
							<div class="notice-list-title">
								<h1>[공지] 번개장터 개인정보처리방침 개정 안내</h1>
								<time class="notice-list-time">2020/07/15</time>
							</div>
							<span class="notice-list-arrow"></span>
						</button>
						
						<div class="notice-list-content">
								<strong style="box-sizing: border-box;"
											data-renderer-mark="true">[최신 사기 수법 안내]</strong><br><br>
									새상품은 받은날로부터 7일 이내 반품 및 환불이 가능합니다. (판매자가 사업자 일 경우 해당) 상품이<br><br>
										불량이라면 동일한 상품으로 교환이나 환불을 받아보시고, 변심이시라면 왕복택배비는 구매자께서 부담하셔야 합니다.<br>
									&lt;반품기간 및 반품운송비&gt;<br><br>
									: 상품상세설명에 반품불가라고 표기하더라도 관련법이 우선하므로 구매자의 반품시 이를 받아주어야 함.<br><br>
									- 구매자 단순변심 : 상품 수령 후 7일 이내 (구매자 반품비 부담)<br><br>
									- 표시/광고와 상이 : 상품 수령 후 3개월 이내 또는 사실을 안 날로부터 30일 이내 (판매자 반품비 부담)<br><br>
						</div>
					</article>
				</li>
			</ul>
            <ul class="consulting_list_ul">
                <article class="consulting_list_ul_article1">
                    <button class="consulting_list_ul_article1_button">
                        <div class="consulting_list_ul_article1_button_div">
                            <h2>서비스기능 &gt; 안전결제/번개페이</h2>
                            <time class="consulting_list_ul_article1_button_div_time">2020/07/16 20:15</time>
                        </div>
                        <div class="consulting_list_ul_article1_button_div2">답장완료(1)</div>
                        <span class="consulting_list_ul_article1_button_span"></span>
                    </button>
                    <div class="consulting_list_ul_article1_div">
                        <section class="consulting_list_ul_article1_div_section">
                            <div class="consulting_list_ul_article1_div_section_div">
                                <div class="consulting_list_ul_article1_div_section_div_div">
                                    <img src="https://hawaiiseoulcdn.bunjang.net/images/crop/199870305_w300.jpg"
                                        width="40" height="40" class="consulting_list_ul_article1_div_section_div_div_img">
                                    <div class="consulting_list_ul_article1_div_section_div_div_div">
                                        <h2 class="consulting_list_ul_article1_div_section_div_div_div_h2">번장운영센터 답변</h2>
                                        <time class="consulting_list_ul_article1_div_section_div_div_div_time">2020/07/16 20:15</time>
                                    </div>
                                    <a class="consulting_list_ul_article1_div_section_div_div_div_a" href="/qna?discussion_id=1215007">재문의하기</a>
                                </div>
                                <p style="text-align: left;" class="consulting_list_ul_article1_div_section_div_div_p">안녕하세요.번개장터입니다.<br><br>이후 문의글에 답변 드렸으니 확인 부탁드립니다.<br><br>감사합니다.</p>
                            </div>
                        </section>
                        <section class="consulting_list_ul_article1_div_section">
                            <div class="consulting_list_ul_article1_div_section_div">
                                <div class="consulting_list_ul_article1_div_section_div_div">
                                    <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0OCIgaGVpZ2h0PSI0OCIgdmlld0JveD0iMCAwIDQ4IDQ4Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGNpcmNsZSBjeD0iMjQiIGN5PSIyNCIgcj0iMjQiIGZpbGw9IiNEQ0RCRTQiLz4KICAgICAgICA8ZyBmaWxsPSIjRkZGIiBmaWxsLXJ1bGU9Im5vbnplcm8iPgogICAgICAgICAgICA8cGF0aCBkPSJNMjUgMjNjNi4xNDIgMCAxMSA0LjM4NyAxMSA5LjY2NyAwIC43MzYtLjU4IDEuMzMzLTEuMjk0IDEuMzMzSDE1LjI5NEMxNC41OCAzNCAxNCAzMy40MDMgMTQgMzIuNjY3IDE0IDI3LjM4IDE4Ljg1NCAyMyAyNSAyM3pNMjUgMTFhNSA1IDAgMSAxIDAgMTAgNS4wMSA1LjAxIDAgMCAxLTUtNSA1IDUgMCAwIDEgNS01eiIvPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+Cg=="
                                        width="40" height="40" class="consulting_list_ul_article1_div_section_div_div_img">
                                    <div class="consulting_list_ul_article1_div_section_div_div_div">
                                        <h2 class="consulting_list_ul_article1_div_section_div_div_div_h2" style="text-decoration-color: gray;">문의내용</h2>
                                        <time class="consulting_list_ul_article1_div_section_div_div_div_time" style="text-decoration-color: gray;">2020/07/16 02:51</time>
                                    </div>
                                </div>
                                <p style="text-align: left;" class="consulting_list_ul_article1_div_section_div_div_p">&lt;문의 양식&gt;<br><br>1) 구분(번개페이/번개송금) : <br>2) 주문번호:<br>※ 구매/판매내역&gt; 번개페이- 구매/판매 탭에서 확인 가능합니다. ※<br>3) 상대방 상점명:<br>4) 구매상품(판매/구매): <br>5) 문의내용 :</p>
                            </div>
                        </section>
                    </div>
                </article>
            </ul>
        </main>
    </div>
	</section>
	<% 
		/* 공통 푸터 */
	%>
	<jsp:include page="/WEB-INF/views/user/include/footer.jsp"/>
</body>
</html>