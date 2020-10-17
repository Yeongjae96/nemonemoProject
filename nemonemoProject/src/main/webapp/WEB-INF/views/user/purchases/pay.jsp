<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//parameter로 넘겨주면 되는 값들
/*     String name = (String)request.getParameter("name");
    String email = (String)request.getParameter("email");
    String phone = (String)request.getParameter("phone");
    String address = (String)request.getParameter("address");
    int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
 */    
    String name = "네모네모 주식회사";
    String email = "partner@nemo.co.kr";
    String phone = "010-111-2222";
    String address = "서울특별시 네모구 네모동 지하1층";
    String zipCode ="01234";
    String productName= (String)request.getParameter("productName");
    int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 페이지</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/purchases/pay.css"/>">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	<script>
    var result = '${msg}';

	if(result=='buying'){
		$("#modal").attr("style", "display:none");
    	alert("거래중인 상품입니다.");
    	history.go(-2);
    } else if(result=='success'){
    	$("#modal").attr("style", "display:none");
    	alert("거래 완료 상품입니다.");
    	history.go(-2);
    } else if (result == 'account') {
    	$("#modal").attr("style", "display:block");
    } else  {
    $(function(){
    	$("#modal").attr("style", "display:none");
        var IMP = window.IMP; // 생략가능
        IMP.init('imp08686318'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '<%=productName%>',
            amount : <%=totalPrice%>,
            buyer_email : '<%=email%>',
            buyer_name : '<%=name%>',
            buyer_tel : '<%=phone%>',
            buyer_addr : '<%=address%>',
            buyer_postcode : '<%=zipCode%>',
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
                location.href='http://ec2-3-34-129-122.ap-northeast-2.compute.amazonaws.com/index.do';
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                <%-- location.href="<%=request.getContextPath()%>/purchase/payFail"; --%>
                alert(msg);
            }
        });
        
    });
    }
    </script>
	<div id="modal">

		<div class="modal_content">
			<h2>계좌 입금 안내</h2>

			<p>예금주 : 네모네모 주식회사</p>
			<p>계좌번호 : 030-05-044444-033</p>
			<p>연락처 : 010-111-2222</p>
			<p>상품 이름 : <%=productName%></p>
			<p>결제금액 : <%=totalPrice%>원</p>

			<button type="button" id="modal_close_btn" onclick="location.href='${pageContext.request.contextPath}/index.do'">메인으로 가기</button>
		</div>
		<div class="modal_layer"></div>
	</div>
</body>
</html>
