<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="kr">
<head>
<meta charset="utf-8">
<title>�ŷ�����</title>
<link rel="stylesheet" href="<c:url value="/resources/css/user/tab/sell.css"/>">


</head>

<body>
 <div id="root">
        <div class="sell_1">
            <div class="sell_2 sell_3">
                <header class="sell_4">
                    <h1>�ŷ�����</h1>
                </header>
                <div class="sell_5">
                    <nav class="History__Navigator-sc-13ngiq1-0 hxUAPV">
                        <ul class="sell_6">
                            <li class=""><button type="button" data-index="0" onclick="location.href='${pageContext.request.contextPath}/tab/purchases.do?user=${user.userNo}'">����</button></li>
                            <li class="selected"><button type="button" data-index="1" onclick="location.href='${pageContext.request.contextPath}/tab/orders.do?user=${user.userNo}'">�Ǹ�</button></li>

                        </ul>
                        
                        <c:choose>
							<c:when test="${empty boardList }">
								<div class="sl_1">�Ǹ��� ������ �����ϴ�!</div>
							</c:when>
							<c:when test="${!empty boardList}">
								<div class="sl_2">
									<c:forEach var="list" items="${boardList}">
									<div class="sl_2 sell_div">
										<p>�ֹ� ��ȣ : <c:out value="${list.purchaseNo}" />
										<p>��ǰ ��ȣ : <c:out value="${list.productNo}" />&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;��ǰ �̸� : <c:out value="${list.productName}" /></p>
										<p>��ǰ ���� : <c:out value="${list.purchasePrice}" />
										<p>�Ǹ� ���� : <c:out value="${list.puchaseDt}" />
										<c:if test="${list.purchaseWay eq 'account'}">
											<p>���� ��� : ���� ��ü</p>
										</c:if>
										<c:if test="${list.purchaseWay eq 'kakao'}">
											<p>���� ��� : īī�� ����</p>
										</c:if>
										<c:if test="${list.purchasePaySt eq 'N'}">
											<p>�μ� ���� : ��ǰ �μ���</p>
										</c:if>
										<c:if test="${list.purchasePaySt eq 'Y'}">
											<p>�μ� ���� : ��ǰ �μ� Ȯ��</p>
										</c:if>
										<p>���� �� : <c:out value="${list.buyerName}" />
										<p>������ �ڵ��� ��ȣ : <c:out value="${list.buyerPhone}" />
										<p>ZIPCODE : <c:out value="${list.buyerZipcode}" /></p>
										<p>�߼� �ּ� : <c:out value="${list.buyerAddress}" /></p>
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