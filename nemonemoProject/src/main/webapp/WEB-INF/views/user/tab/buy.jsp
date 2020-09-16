<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="kr">
<head>
<meta charset="utf-8">
<title>거래내역</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/tab/buy.css"/>">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
function submitCheck() {
 if (confirm("인수확인을 누르시겠습니까?") == true){    //확인
	 document.getElementById("purchasePaySt").value = 'Y';
     document.upPaySt.submit();
 }else{   //취소
     return false;
 }
}

function submitCancel() {
	if (confirm("거래를 취소 하시겠습니까?") == true){    //확인
		 document.getElementById("purchasePaySt").value = 'C';
	     document.upPaySt.submit();
	 }else{   //취소
	     return false;
	 }
}
var result = '${msg}';
if (result == 'success') {
	alert("인수확인이 되었습니다.");
}
</script>
</head>


<body>
	<div id="root">
		<div class="buy_1">
			<div class="buy_2 buy_3">
				<header class="buy_4">
					<h1>거래내역</h1>
				</header>

				<div class="buy_5">
					<nav class="History__Navigator-sc-13ngiq1-0 hxUAPV">
						<ul class="buy_6">
							<li class="selected"><button type="button" data-index="0"
									onclick="location.href='${pageContext.request.contextPath}/tab/purchases.do?user=${user.userNo}'">구매</button></li>
							<li class=""><button type="button" data-index="1"
									onclick="location.href='${pageContext.request.contextPath}/tab/orders.do?user=${user.userNo}'">판매</button></li>

						</ul>
						<c:choose>
							<c:when test="${empty boardList }">
								<div class="by_1">구매한 내역이 없습니다!</div>
							</c:when>
							<c:when test="${!empty boardList}">
								<div class="by_2">
									<c:forEach var="list" items="${boardList}">
										<div class="by_2 buy_div">
											<form name="upPaySt" id="buylist" method="POST" action="updateSt.do">
												<p>주문 번호 : <c:out value="${list.purchaseNo}" /></p>
												<p>상품 번호 : <c:out value="${list.productNo}" />&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;상품 이름 : <c:out value="${list.productName}" /></p>
												<p>상품 가격 : <c:out value="${list.purchasePrice}" /></p>
												<p>구매 일자 : <c:out value="${list.puchaseDt}" /></p>
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
												<p>ZIPCODE : <c:out value="${list.buyerZipcode}" /></p>
												<p>발송 주소 : <c:out value="${list.buyerAddress}" /></p>
												
												
												<input type="hidden" value="${list.purchaseNo}" name="purchaseNo">
												<input type="hidden" value="${list.purchasePaySt}" name="purchasePaySt" id="purchasePaySt">
												<input type="hidden" value="${list.productNo}" name="productNo">
												<input type="hidden" value="${list.productSeller}" name="productSeller">
												<input type="hidden" value="${list.buyerNo}" name="buyerNo">
												<input type="hidden" value="${user.userNo}" name="userNo">
												<div>
													<button type="submit" onclick="submitCheck()" id="okbutton">인수 인계 확인</button>
													<button type="submit" onclick="submitCancel()" id="cancelbutton">거래 취소</button>
												</div>
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