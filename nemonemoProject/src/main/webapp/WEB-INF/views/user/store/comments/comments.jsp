<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네모네모</title>
<!-- 공통 CSS -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/common/common.css"/>">

<!-- 페이지 CSS  -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/store/comments/comments.css?v=<%=System.currentTimeMillis()%>"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/store/comments/products.css?v=<%=System.currentTimeMillis()%>"/>">
	

<!-- 라이브러리 -->
<script
	src="<c:url value="/resources/vendor/jquery/jquery-3.5.1.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/fontawesome/js/all.js"/>"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>




</head>
<body>
	<%
		/* 공통 Header */
	%>
	<jsp:include page="/WEB-INF/views/user/include/top-menu.jsp" />
	<%
		/* 공통 Header */
	%>
	<header class="sticky-top">
		<jsp:include page="/WEB-INF/views/user/include/header.jsp" />
		<jsp:include page="/WEB-INF/views/user/include/side-nav.jsp" />
	</header>
	<%
		/* 각 페이지의 특성! */
	%>
	<section>
		<div class="center_all">
			<div class="comments">
			<jsp:include page="/WEB-INF/views/user/store/common/store_header.jsp" />
				
				
				<div class="sc-dCVVYJ dYImYF">
					<div class="sc-vBKru hEaZqn">
						<div class="comments_54">
							<a class="comments_55"
								href="${pageContext.request.contextPath}/shop/${storeVO.storeNo }/products.do">상품
								<span class="comments_56">${fn:length(storeProductVO)}</span>
							</a> 
							<a class="comments_57"
								href="${pageContext.request.contextPath}/shop/${storeVO.storeNo }/comments.do">상점문의
								<span class="comments_58">${fn:length(storeCommentVO)}</span>
							</a> 
							<a class="comments_59"
								href="${pageContext.request.contextPath}/shop/${storeVO.storeNo }/favorites.do">찜
								<span class="comments_60">${fn:length(storeFavoriteVO)}</span>
							</a> 
							<a class="comments_61"
								href="${pageContext.request.contextPath}/shop/${storeVO.storeNo }/reviews.do">상점후기 <span
								class="comments_62">${fn:length(storeReviewVO)}</span>
							</a>
						</div>
					</div>

					<div class="comments_67">
						<div>
							상점문의<span class="comments_68"> ${fn:length(storeCommentVO)}</span>
						</div>
					</div>
					<div class="sc-kFLxrv fSsRvc">
						<div class="comments_69">
						<form id="insertComment" method="POST" action="newComment.do">
							<div class="comments_70">
							
								<textarea placeholder="상품문의 입력" class="comments_71" name="storeCommentContent"
									style="border: none"></textarea>
									<input type="hidden" value="${user.storeNo}" name="storeCommentWriter" />
								
							</div>
							<div class="comments_72">
								<div class="comments_73"></div>
								<button class="comments_74" type="submit" id="insertComment">
									<img
										src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAgCAYAAAAFQMh/AAAAAXNSR0IArs4c6QAABFdJREFUSA3Nl11MVEcUgPfnIj8B1kRi4AFI9cEiITFGfZXUYNWKxJ9CtBqC0WCMuoEGgfIPBsVsU7MpVdRV0qZpgkZLjU2qrYD6oCTw4A+YoGktTQhiIE1hC7td8Dsb7ua6ruxd2IdOMsy5Z84535wzM/cuRkOYW0tLS8zw8PCR6enpfKPRaCH865mZmRuKolysrKx8qeKMqhCO0WazJUxMTNwBlAF0gJjXkBGNHzN+wHi4pqbme2GFDexwOOIGBwf/JHgccW0pKSm1BQUFkwKRVl9fv4cqnDWZTNbq6urWsIA7OjqUrq6uH4DmwFDI7nRtbW2Zl6j509DQ8JHH42k3m83rzBr9vMS2tjZzT0+PlG9LVFTURrJahvxZZmZmdGdn56/aoCzwd/Qr0a0yaSdClQXa39//HRlm4fvH5ORkc0xMzKdk3kU/Ttan/GOS7RXsc+YNxtnU19fXSuBNERERWfHx8euBucfHx38LAv8PO8u8wAKtq6u7TIBsMthYUVHRW1xcPBoZGbmBhTjngrMVW7F5FfLhAmrkhDoYd3I3s7ib3QTytebm5tiRkZGbKBbHxsZucDqdUtr19NMs9CH6K4zHQgLjLNALOOdKpkAf+IgaQV4iQ0ND7aiW+sE9QG+npaVl6y61QCnvOcY8oJveBxV+YWGhMzU1NRvxLyk75e0Wf9rfsv+5ubkeXRnPQr8h0F7KuxnofQEEa5z6RZz6XvzTgV7nuuWXlpb+I3667jFvm69xzAf6CdB7wYDqfEZGRgnQ3QJNTEzMs1qt/6pzQUtNee04FwDfCvSu6hhsxK+EEp9UoZTfrfWZE8wL4CuMD7Cn2VVVVZ1ax7lkDmAxi5VT7M3UHyq+7wWzYhvzh+g5QO+IsZ6Gn5VMv5wLKnGUQMHItAn9EZxz+IzdDmQTSAf0KJmeCQYV33cyBir7YmVuO9BfAgEC6SjvYaB2PVDxf+s6seITOJfgvAOovH10NfwKMTxL/1FOb6A99Q/kKzWZ1jF5nIO0iz3VDSXTAyw2JKgswpsxH+hdHIg2AoyQ7QDjIAu4zAJu+a9U+wx0P7YX0enOVPX37jHQJBQu+nkCyX3bhq5SNQo0Ut58bC4wFzJU4nlLDWwNcj/lrhIlmXxB0OUiB2rM72X+EtVp17un/nHUPRZwrzpJ0BUEnZJSIqch/8xh65B5dHtYaOtCoBLHJN9Pxg8J9EQUs20ZwQ8CdaDfhywfCAPlzUP+FvGn+WY6G9+gjI2NreaBV7HpqU+pKJ8DSIiOju52u92LXS7XM6C7BcpCFgwVjkJWUmYDXx5fxnwMfL8q7Ha7a2pqygxQoDcWmqmwpAl4LeN4WVnZy/LyckNTU1McoJVkJz9D00dHR9PFkOfepKQkXS8HsQ/WjJzkAYwS6A/IKB1Asjghexie0x+he2GxWOxFRUVDMheOJqd6EV3usMhX2etHjI+Tk5Ofav8FQRfe1tjYuCS8Ef/n0d4Ah7Y0Xn+VgFMAAAAASUVORK5CYII="
										width="15" height="16" alt="문의등록버튼 아이콘" >등록
								</button>
							</form>
							</div>
						</div>
					</div>
					
					<div class="comments_75">
					<c:forEach var="storeCommentVO" items="${storeCommentVO}">
						<div class="comments_76">
							<div class="comments_77">
								<!-- <a class="comments_78" href="/store/2110988/reviews"><img
									src="https://hawaiiseoulcdn.bunjang.net/images/crop/363112_w{res}.jpg"
									width="48" height="48" alt="프로필 이미지"></a> -->
								<div class="comments_79">
									<div class="comments_80">
										<div class="sc-kGeDwz ektOSj">${storeCommentVO.storeName}</div>
										<div class="comments_81">${storeCommentVO.storeCommentRegDt}</div>
									</div>
									<div class="comments_82">${storeCommentVO.storeCommentContent}</div>
									<div class="comments_83">
										<!-- <div class="comments_84">
											<img
												src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAcCAYAAAAEN20fAAAAAXNSR0IArs4c6QAABIFJREFUSA2tl0lok0EUx5M0tVYpsVvqRhQFe6gH0VKkWrFKl1TrQaSggsvR/eAKoiJCbxZRwV0Ul4N6UbCLbU314EatC0b0oJY0Rg1aEcS0DWn9vfRLnH79EmPNwMt787b5z8z7ZiZmUwLN5XJZ+/r6ivr7+xfhPn9gYGAi3G42m7OQf8D99L9Aj5Cb8XtQVVXVSz/hZo7n2dTUZA+FQptJvpEBs+P5qjb8f9I/Q0wdgLyqLZZsCERWoLe3dx+JdkGjteB++EvonnAG+2qxWL4ij2YF8vCbhG4BfCG6DMhEPwg7YbPZ9hQXFwdEF6sNA9LS0jIjGAxeJeEcCSKZDzoJnaqoqJAtiNtkEj09PdU4ySTmijOxr1NSUlaXl5c/jxU8BEhjY2MBwS4ol2CZTa3D4agtKCjoi5Ugnp6tdbJaZ8k3kXyyXeVOp/OhUUwUiKwEBXkfpzzIQ2A1QbIV/9WYXBZgLpJkKTmlsBdVVlZ26JNaRAFiC9txCTEPx3epqaklyQAhuRm02263LyfvTcaxAep6e3v7GLGpLQwE1NtwKsLwi710lpWVeVSn/5ULCwuDbHENYJ6Qa5rf7z+gz2l2u92jPB6PDyDZfAVbmMFxvVNDQ0O7XpdIn1UtVP2kBlmRDgBZIAdjfYrYrV6vt0pAYPDyVZyIGFSOPfwFqbqRyAzsZlJyvmwifiVUF8ljBWGN1rkAmFDEoHK2a8jMVNu/yoA4R4wAWQX9AUJnBiStaZAN/2Wlng7XjkzDSfuMVekkeiagmLt5QDJZIYcIKDuFG7VEa0RfE0a5NN07xpva1tYmR8Vn0VlRjBUhPT1djmvDhk9SakRJ7hOZa0Tur0EgLE0XA+VzmE1A+UEc9C2ZNaLlFgCmtLQ0ubHDTVZEzox8inYa3BBIMmtkcFjTdHigtLQ0ugtSI61QGbRMk2FDW6I1MjTKZDKqGXLlyw6wE7dVfwFyBarFuIrDbafRBYctmTWyTgNwXeNhZpWHCyhvM1h1V1fXbrSHVAeRk1Ujra2tUyjQrayGj1P8hjpO+PYFyFSAuDFYGXQONfFKdUqGTH6zTJhcTkCs4ZSVSzbawpcee9mJZi80iqJtqK+vl2JKagPEURI6WY1bTPSyPnkYiCjZoiM41YF8MryNC2q23nmkfUAcJnYz9Dg3N3cl+cOnqZovCkSUrMx2nI4KGOgRYPbxdkhVA0YikytF4sh9kyfBL6Mc0ReaamRrVtA/DWVCH6FjGRkZp0tKSr4jx23Nzc22zMzMoDqg9m9AHtzZgFrC6t/RJzEEIk5U+CRO2/2IawlOg4dIJJffXegt5EffjW6sDEBf3hqLkYvQf6MgD+bk5JyTRxE2E5Obi60RWzrdDYA5L/pIiwkk4sCrfHwgENhIkqXoZpHorzGRWGK68b8GKBf0DKCy5TegLHxO8oTcHlm5hJNKckDlcA7MQ5wM2UkoS93DID/gPj79Fwz2Htt6+E643K4xG0DfQKv5lDv+CUjMjAYG7f/NYgDK6302fDp8HFy2WQpXVusj/AMT2PEbeA0W2gj2azwAAAAASUVORK5CYII="
												width="17" height="14" alt="댓글달기 버튼 이미지">댓글달기
										</div> -->
										<div class="comments_85">
											<img
												src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAYAAAByDd+UAAAAAXNSR0IArs4c6QAAAgtJREFUSA3tVrtOAkEUdQnKkvADFGtpIR01DYXyMLGwVisLjFEbE42FhYWJiY0YEwsqtLYwkZcFf2C3FJZuwQdIAvgAz8EdGHZZwpJIInGS3blzzzn3zty5m6wyM8Iol8tqs9lca7Vaq6CHFUUJUtZut6uYnj0ez4PP57uPRqMN+ocNZRhILJ/Pr2M6Q3BtGBebMIAfJxKJu6E8JxCn8tbr9SvgKXIQsIIpg7kUCARe6avVavPYyDLMLcyL9GHc+P3+XZz282fZ//b2L3srkQwJPuA9iMfj17C/eoyOpeOtI1m6UCjswL6AnYKW4DZf1jGwpCwjhLdMhvtZicViT1bhoHWxWFzCPT9COwvtxqDy2hKyQRqNxgtEGkT7EKVFcF3X5wzDOAW2SR/wrKZpJ6FQ6F1wsNk94JfADFVVF6yN5BFEMbMbzWQVllH4OTMZTnAIPMiHNn0yxyx9hTEYS8Zo2xKarU+MDdJ3ZwjSORlBMaw+U5MhLsUSdHtCIGGiEJa6LJeGpO3EkuW2E4Lc+ahF68tkYFl5TXuQT2hFLFljS4gSBUiIRCJvMpE2GwRde45AVT606bPyhFbEknHH71AmCdvsxiOs+Yw1bCccK4oL0X9CF8UajTr9JXX8LHK5XHu0IrljTbyk7rb3F9nKb92VUzEmfofdLk0mk7bfDaddjuMXlZz4Caf/Dr8BRaXTUmgtW58AAAAASUVORK5CYII="
												width="14" height="14" alt="신고하기 버튼 이미지">신고하기
										</div>
										
										<c:set var="storeNoV1" value="${user.storeNo}" />
										<c:set var="storeNoV2" value="${storeCommentVO.storeCommentWriter }" />
										<%-- 세션값 : <c:out value="${storeNoV1}"/>
										상점값 : <c:out value="${storeNoV2}"/> --%>
										<c:if test="${storeNoV1 eq storeNoV2}">

											<div class="comments_85">
											<form id="deleteComment" method="POST" action="delComment.do">
											<input type="hidden" value="${storeCommentVO.storeCommentNo }" name="storeCommentNo" />
													<button type="submit" id="deleteComment">
														<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAcCAYAAAB2+A+pAAAAAXNSR0IArs4c6QAAANpJREFUSA1jZCAB7N+/n+Xr16+1QC3J////lwZpZWRkfAqk5nJzczc7Ojr+AYkRA1iIUQRTA7IUaGEdjA+ioQ6oA8qBuPUgghjARIwiJDXJIDYzM7O7r68vIwiD2FB5sBySWrxMkiyGBa+Xl9cumKkwNkwOJk6IZty8efN/QopoIU+Sj2nhALiZoBCgZijgMm/AfDxqMTyu0RnocUWIj64fnT8a1OghQjP+aFDTLGjRDR4NavQQoRl/5AU10Y09UPsKOdwJ8ZHVYmOPvKAeMB/jjGNqtrsGVRwDANq3T3QbKT/vAAAAAElFTkSuQmCC" width="15" height="14" alt="삭제하기 버튼 이미지"  >삭제하기
													</button>
											</form>
											</div>
										</c:if>
										
										
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
						
					</div>
					<div class="comments_98">
					<br><br><br>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%
		/* 공통 푸터 */
	%>
	<jsp:include page="/WEB-INF/views/user/include/footer.jsp" />
</body>
</html>