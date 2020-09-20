<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네 모든것, 내 모든것!</title>
<!-- 공통 CSS -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/common/common.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/main/main.css?v=<%=System.currentTimeMillis()%>"/>">

<!-- 페이지 CSS  -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="shortcut icon"
	href="<c:url value="/resources/images/common/logo/favicon.png"/>">

<!-- 라이브러리 -->
<script
	src="<c:url value="/resources/vendor/jquery/jquery-3.5.1.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/fontawesome/js/all.js"/>"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	window.contextPath = "<c:url value="/"/>"
</script>
<script src="<c:url value="/resources/js/user/common/common.js"/>"></script>

<!-- 해당 페이지 JS파일 -->
<script
	src="<c:url value="/resources/js/user/main/main.js?v=<%=System.currentTimeMillis()%>"/>"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script
	src="<c:url value="/resources/js/user/main/jquery.scrolltabs.js"/>"></script>
<!-- 리다이렉트로 값을 받아 alert문 안내 -->
<script>

	var result = '${msg}';

	if (result == 'success') {
		alert("로그인 성공\n네모내모에 어서오세요!");
	} else if (result == 'idfail') {
		alert("아이디가 없습니다. \n회원가입 해주시길 바랍니다");
		$(function() {
			$('#loginModal').show();
		})
	} else if (result == 'passwordfail') {
		alert("비밀번호가 틀렸습니다. \n다시 로그인해주세요.");
		$(function() {
			$('#loginModal').show();
		})
	} else if (result == 'stop') {
		alert("정지된 아이디입니다.");
	} else if (result == 'slogininfo') {
		alert("소셜로그인 처음 하셨습니다 .\n내계정에 가서 회원수정해주시길 바랍니다.");
	} else if (result == 'logout') {
		alert("로그아웃 되셨습니다. \n안녕히가세요.");
	}
</script>

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
		String kakaonickname = request.getParameter("kakaonickname");
	session.setAttribute("kakaonickname", kakaonickname);
	if (kakaonickname != null) {
	%>

	<%=" (카카오톡) " + session.getAttribute("kakaonickname")%>님 방문을 환영합니다.

	<form action="kakao_logout.do" method="post">
		<button type="submit" name="submit">로그아웃</button>
	</form>

	<%
		}
	;
	%>

	<%
		/* 각 페이지의 특성! */
	%>
	<section>
		<!-- banner -->
		<section class="banner">
			<div>
				<img
					src="<c:url value="/resources/images/user/main/first_banner.png"/>"
					alt="배너1" width="1024" height="300">
			</div>
			<div>
				<img
					src="<c:url value="/resources/images/user/main/second_banner.png"/>"
					alt="배너2" width="1024" height="300">
			</div>
			<div>
				<img
					src="<c:url value="/resources/images/user/main/third_banner.png"/>"
					alt="배너3" width="1024" height="300">
			</div>
		</section>
		<!-- banner end -->

		<!-- contents 영역 -->
		<div class="second_content_back">
			<!--좌우 여백을 제외한 실질적인 contents 영역-->
			<div class="second_content">
				<!-- 추천상품 영역 -->
				<div class="main-recommend">
					<div class="main-recommend-title">
						<h4>네모내모 추천 상품</h4>
					</div>
					<br>
					<div class="swiper-container">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<div class="bx_group">
									<c:forEach var="recommendProductList"
										items="${recommendProductList}" varStatus="status" begin="0"
										end="4">
										<div>
											<a
												href="${pageContext.request.contextPath}/products/${recommendProductList.productNo }.do">
												<div class="main-recommend-box-pic">
													<img
														src="<c:url value="/resources/images/user/store/storeProfile.png"/>"
														alt="추천상품1">
												</div>

												<div class="main-recommend-box-title">${recommendProductList.productName }</div>
												<div class="main-recommend-box-price">
													⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅ <br> <b>${recommendProductList.productPrice }</b>원
												</div>
											</a>
										</div>
									</c:forEach>
								</div>
							</div>
							<div class="swiper-slide">
								<div class="bx_group">
									<c:forEach var="recommendProductList2"
										items="${recommendProductList2}" varStatus="status" begin="0"
										end="4">
										<div>
											<a
												href="${pageContext.request.contextPath}/products/${recommendProductList2.productNo }.do">
												<div class="main-recommend-box-pic">
													<img
														src="<c:url value="/resources/images/user/store/storeProfile.png"/>"
														alt="추천상품1">
												</div>
												<div class="main-recommend-box-title">${recommendProductList2.productName }</div>
												<div class="main-recommend-box-price">
													⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅ <br> <b>${recommendProductList2.productPrice }</b>원
												</div>
											</a>
										</div>
									</c:forEach>
								</div>
							</div>
							<div class="swiper-slide">
								<div class="bx_group">
									<c:forEach var="recommendProductList3"
										items="${recommendProductList3}" varStatus="status" begin="0"
										end="4">
										<div>
											<a
												href="${pageContext.request.contextPath}/products/${recommendProductList3.productNo }.do">
												<div class="main-recommend-box-pic">
													<img
														src="<c:url value="/resources/images/user/store/storeProfile.png"/>"
														alt="추천상품1">
												</div>

												<div class="main-recommend-box-title">${recommendProductList3.productName }</div>
												<div class="main-recommend-box-price">
													⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅⋅ <br> <b>${recommendProductList3.productPrice }</b>원
												</div>
											</a>
										</div>
									</c:forEach>
								</div>
							</div>

						</div>

						<!-- Add Arrows -->
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
					</div>
				</div>
				<br>

				<!-- 추천상품 영역 끝-->
				<!--카테고리별 인기상품 영역-->

				<!--카테고리 탭-->

				<div class="main-popular">
					<div class="main-popular-title">
						<h4>전체 카테고리 인기 상품</h4>
					</div>
					<br>
					<%-- <div id="main-popular-scroll">
						<c:forEach var="popularCateList" items="${popularCateList}"
							varStatus="status">
							<span><a href="#${popularCateList.productCateNo}">${popularCateList.productCateLarge}</a></span>
						</c:forEach>
					</div> --%>
					<!--카테고리 탭 끝-->

					<br>
					
						<div class="main-popular-body">
							<div id="" class="main-popular-div">
								<%-- <div class="main-popular-all-title"> ${popularProductList.productCateLarge}</div> --%>
								<div class="main-popular-contents">
								<c:forEach var="popularProductList" items="${popularProductList}">
									<div class="main-popular-content-div">
										<a class="main-popular-content-a"
											href="${pageContext.request.contextPath}/products/${popularProductList.productNo }.do">
											<div class="main-popular-contents-div">
												<img
													src="<c:url value="/resources/images/user/store/storeProfile.png"/>"
													width="194" height="194" alt="상품 이미지">
											</div>
											<div class="main-popular-content-disc">
												<div class="main-popular-content-disc-title">
													${popularProductList.productName}</div>
												<div class="main-popular-content-disc-pNt">
													<div class="main-popular-content-disc-price">${popularProductList.productPrice}</div>
													<div class="main-popular-content-disc-time">
														<jsp:useBean id="now" class="java.util.Date" />
														<fmt:parseNumber
															value="${popularProductList.productRegDt.time}"
															integerOnly="true" var="oldDays" scope="request" />
														<fmt:parseNumber value="${now.time}" integerOnly="true"
															var="nowDays" scope="page" />
														<c:choose>
															<c:when test="${nowDays-oldDays < (1000*60)}">
																<fmt:parseNumber value="${(nowDays-oldDays) / (1000)}"
																	integerOnly="true" var="secDate" />
																<span><c:out value="${secDate}" /> 초 전</span>
															</c:when>
															<c:when test="${(nowDays-oldDays) < (1000*60*60)}">
																<fmt:parseNumber
																	value="${(nowDays-oldDays) / (1000*60)}"
																	integerOnly="true" var="minDate" />
																<span><c:out value="${minDate}" /> 분 전</span>
															</c:when>
															<c:when test="${(nowDays-oldDays) < (1000*60*60*24)}">
																<fmt:parseNumber
																	value="${(nowDays-oldDays) / (1000*60*60)}"
																	integerOnly="true" var="hourDate" />
																<span><c:out value="${hourDate}" /> 시간 전</span>
															</c:when>
															<c:otherwise>
																<fmt:parseNumber
																	value="${(nowDays-oldDays) / (1000*60*60*24)}"
																	integerOnly="true" var="dayDate" />
																<span><c:out value="${dayDate }" /> 일 전</span>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</a>
									</div>
									</c:forEach>
								</div>
							</div>
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