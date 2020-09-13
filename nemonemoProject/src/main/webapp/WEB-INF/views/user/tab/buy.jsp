<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="kr">
<head>
<meta charset="utf-8">
<title>�ŷ�����</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/tab/buy.css"/>">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
function submitCheck() {
 if (confirm("�μ�Ȯ���� �����ðڽ��ϱ�?") == true){    //Ȯ��
     document.upPaySt.submit();
 }else{   //���
     return false;
 }
}
var result = '${msg}';
if (result == 'success') {
	alert("�μ�Ȯ���� �Ǿ����ϴ�.");
}
</script>
</head>


<body>
	<div id="root">
		<div class="buy_1">
			<div class="buy_2 buy_3">
				<header class="buy_4">
					<h1>�ŷ�����</h1>
				</header>

				<div class="buy_5">
					<nav class="History__Navigator-sc-13ngiq1-0 hxUAPV">
						<ul class="buy_6">
							<li class="selected"><button type="button" data-index="0"
									onclick="location.href='${pageContext.request.contextPath}/tab/purchases.do?user=${user.userNo}'">����</button></li>
							<li class=""><button type="button" data-index="1"
									onclick="location.href='${pageContext.request.contextPath}/tab/orders.do?user=${user.userNo}'">�Ǹ�</button></li>

						</ul>
						<c:choose>
							<c:when test="${empty boardList }">
								<div class="by_1">������ ������ �����ϴ�!</div>
							</c:when>
							<c:when test="${!empty boardList}">
								<div class="by_2">
									<c:forEach var="list" items="${boardList}">
										<div class="by_2 buy_div">
											<form name="upPaySt" id="buylist" method="POST" action="updateSt.do">
												<p>�ֹ� ��ȣ : <c:out value="${list.purchaseNo}" /></p>
												<p>��ǰ ��ȣ : <c:out value="${list.productNo}" />&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;��ǰ �̸� : <c:out value="${list.productName}" /></p>
												<p>��ǰ ���� : <c:out value="${list.purchasePrice}" /></p>
												<p>���� ���� : <c:out value="${list.puchaseDt}" /></p>
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
												<p>ZIPCODE : <c:out value="${list.buyerZipcode}" /></p>
												<p>�߼� �ּ� : <c:out value="${list.buyerAddress}" /></p>
												
												
												<input type="hidden" value="${list.purchaseNo}" name="purchaseNo">
												<input type="hidden" value="${list.purchasePaySt}" name="purchasePaySt">
												<input type="hidden" value="${list.productNo}" name="productNo">
												<input type="hidden" value="${list.productSeller}" name="productSeller">
												<input type="hidden" value="${list.buyerNo}" name="buyerNo">
												<input type="hidden" value="${user.userNo}" name="userNo">
												<button type="submit" onclick="submitCheck()">�μ� �ΰ� Ȯ��</button>
											</form>
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