<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="product_all3">
	<div class="product_all4">
		<div class="product_all5">
			<div size="310" class="product_all6">
				<div class="product_all7">
					<div class="product_all8"></div>
				</div>

				<div class="product_all9">
					<div class="sc-hZhUor dKChES">
						<img
							src="<c:url value="/resources/images/user/store/storeProfile.png"/>"
							width="100" height="100" alt="상점 프로필 이미지" class="product_all10">
					</div>
					<div class="product_all11">${ storeVO.storeName }</div>
					<div class="product_all12">
						<div class="review-comment-right__stars"></div>
					</div>
					<c:set var="storeBtn1" value="${user.storeNo}" />
					<c:set var="storeBtn2" value="${storeVO.storeNo }" />

					<c:choose>
						<c:when test="${storeBtn1 eq storeBtn2}">
							<div class="product_all13">
								<a class="product_all14 product_all14_1"
									href="${pageContext.request.contextPath}/shop/${storeVO.storeNo }/info.do">내
									상점 관리</a> &nbsp;&nbsp;&nbsp;&nbsp;<a
									class="product_all14 product_all14_1"
									href="${pageContext.request.contextPath}/products/manage.do">내
									상품 관리</a>
							</div>
						</c:when>
						<c:otherwise>
							<div class="product_all13">
								<a class="product_all14 product_all14_1" id="contactBtn" data-userno="${storeVO.userNo}">연락하기</a>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>

		<div class="product_all15">
			<div class="product_all16">
				<div class="product_all17">${ storeVO.storeName }</div>
			</div>
			<div class="product_all20">
				<div class="product_all21">
					<img
						src="<c:url value="/resources/images/user/store/storeYmd.png"/>"
						width="14" height="13" alt="상점오픈일 아이콘">&nbsp;&nbsp;상점오픈일
					<div class="product_all26">
						<jsp:useBean id="now" class="java.util.Date" />
						<fmt:parseNumber value="${storeVO.userRegYmd.time}"
							integerOnly="true" var="oldDays" scope="request" />
						<fmt:parseNumber value="${now.time}" integerOnly="true"
							var="nowDays" scope="page" />
						<c:choose>
							<c:when test="${nowDays-oldDays < (1000*60)}">
								<fmt:parseNumber value="${(nowDays-oldDays) / (1000)}"
									integerOnly="true" var="secDate" />
								<c:out value="${secDate}" /> 초 전
                                                    	</c:when>
							<c:when test="${(nowDays-oldDays) < (1000*60*60)}">
								<fmt:parseNumber value="${(nowDays-oldDays) / (1000*60)}"
									integerOnly="true" var="minDate" />
								<c:out value="${minDate}" /> 분 전
                                                    	</c:when>
							<c:when test="${(nowDays-oldDays) < (1000*60*60*24)}">
								<fmt:parseNumber value="${(nowDays-oldDays) / (1000*60*60)}"
									integerOnly="true" var="hourDate" />
								<c:out value="${hourDate}" /> 시간 전
                                                    	</c:when>
							<c:otherwise>
								<fmt:parseNumber value="${(nowDays-oldDays) / (1000*60*60*24)}"
									integerOnly="true" var="dayDate" />
								<c:out value="${dayDate }" /> 일 전
                            </c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="product_all25">
					<img
						src="<c:url value="/resources/images/user/store/storeSell.png"/>"
						width="14" height="13" alt="상품판매 아이콘">&nbsp;&nbsp;상품판매
					<div class="product_all26">${fn:length(storeProductDispStVO)} 회</div>
				</div>
			</div>
			<div class="product_all29">${ storeVO.storeIntro }</div>
		</div>
	</div>
</div>