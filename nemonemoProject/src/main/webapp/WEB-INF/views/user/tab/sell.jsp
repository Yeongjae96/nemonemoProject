<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="kr">
<head>
<meta charset="utf-8">
<title>거래내역</title>
<link rel="stylesheet" href="<c:url value="/resources/css/user/tab/sell.css"/>">


</head>

<body>
 <div id="root">
        <div class="sell_1">
            <div class="sell_2 sell_3">
                <header class="sell_4">
                    <h1>거래내역</h1>
                </header>
                <div class="sell_5">
                    <nav class="History__Navigator-sc-13ngiq1-0 hxUAPV">
                        <ul class="sell_6">
                            <li class=""><button type="button" data-index="0" onclick="location.href='${pageContext.request.contextPath}/tab/purchases.do?user=${user.userNo}'">구매</button></li>
                            <li class="selected"><button type="button" data-index="1" onclick="location.href='${pageContext.request.contextPath}/tab/orders.do?user=${user.userNo}'">판매</button></li>

                        </ul>
                        
                        <c:choose>
							<c:when test="${empty boardList }">
								<div class="sl_1">판매한 내역이 없습니다</div>
							</c:when>
							<c:when test="${!empty boardList}">
								<div class="sl_2">
									<c:forEach var="list" items="${boardList}">
									<div class="sl_2 sell_div">
										<p>주문 번호 : <c:out value="${list.purchaseNo}" />
										<p>상품 번호 : <c:out value="${list.productNo}" />&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;상품 이름 : <c:out value="${list.productName}" /></p>
										<p>상품 가격 : <c:out value="${list.purchasePrice}" />
										<p>판매 일자 : <c:out value="${list.puchaseDt}" />
										<c:if test="${list.purchaseWay eq 'account'}">
											<p>구매 방법 : 계좌 이체</p>
										</c:if>
										<c:if test="${list.purchaseWay eq 'kakao'}">
											<p>구매 방법 : 카카오 페이</p>
										</c:if>
										<c:if test="${list.purchasePaySt eq 'N'}">
											<p>인수 상태 : <b style="color:blue;">물품 인수중</b></p>
										</c:if>
										<c:if test="${list.purchasePaySt eq 'Y'}">
											<p>인수 상태 : 물품 인수 확인</p>
										</c:if>
										<c:if test="${list.purchasePaySt eq 'C'}">
											<p>인수 상태 : <b style="color:red;">거래 취소</b></p>
										</c:if>
										<p>구매 자 : <c:out value="${list.buyerName}" />
										<p>구매자 핸드폰 번호 : <c:out value="${list.buyerPhone}" />
										<p>ZIPCODE : <c:out value="${list.buyerZipcode}" /></p>
										<p>발송 주소 : <c:out value="${list.buyerAddress}" /></p>
										</div>
									</c:forEach>
								</div>
							</c:when>
						</c:choose>
                    </nav> 
                </div>
            </div>
        </div>
    </div>
   
	
</body>

</html>