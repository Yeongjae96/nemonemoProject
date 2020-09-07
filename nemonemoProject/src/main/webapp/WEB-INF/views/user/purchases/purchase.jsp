<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//parameter로 넘겨주면 되는 값들
	
	int productNo = Integer.parseInt(request.getParameter("productNo"));
	int productSeller = Integer.parseInt(request.getParameter("productSeller"));
    String productName = (String)request.getParameter("productName");
    int purchaseShFee = Integer.parseInt(request.getParameter("productFreeShippingSt"));
    int productPrice = Integer.parseInt(request.getParameter("productPrice"));

%>

<c:if test="${user == null}">
<script>
	alert('로그인 해주십시오');
	/* window.location.href = '${pageContext.request.contextPath}'; */
	histroy.go(-1);
</script>
</c:if>
<c:if test="${user != null}">
	
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>결제페이지</title>
<!-- 공통 CSS -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/purchases/purchase.css"/>">

<!-- 페이지 CSS  -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/sign/signup.css"/>">

</head>
<!-- 라이브러리 -->
<script
	src="<c:url value="/resources/vendor/jquery/jquery-3.5.1.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/fontawesome/js/all.js"/>"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- <script src="https://www.gstatic.com/firebasejs/6.2.0/firebase-auth.js"></script> -->
<!-- 해당 페이지 JS파일 -->
<script>
	var contextPath = "${pageContext.request.contextPath}"
</script>
<script src="<c:url value="/resources/js/user/purchases/purchase.js"/>"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>


<body>
	<div id="purchases_root">
		<form id="purchases" method="POST" action="purchases.do">
			<div class="purchases_block">
				<div class="purchases_body">
					<header class="purchases_header">
						<h1>결제하기</h1>
						<span color class="purchases_header_close"></span>
					</header>

					<div class="purchases_body_main">
						<!-- 결제 상품 간단 설명 -->
						<mark class="purchases_goods_body">
							<!-- <img
								src="https://seoul-p-studio.bunjang.net/product/131192989_1_1597693969_w100.jpg"
								class="purchases_goods_imgbox"> -->
							<div class="purchases_goods_content">
								<div class="purchases_goods_pricebody">
									<div class="purchases_goods_price">
										<%=productPrice %><span>원</span>
									</div>
								</div>
								<div class="purchases_goods_title"><%=productName %></div>
							</div>
						</mark>

						<!--결제수단-->
						<section class="purchases_tools_section">
							<header>결제수단</header>
							<div class="purchases_tools_body">
								<table class="purchases_tools_table" id="data">
									<tr>
										<td data-method="kakopay" class="purchases_tools_selectView"
											onclick="change1()">
											<div>
												<svg width="16" height="16" viewBox="0 0 16 16">
                                                <defs>
                                                    <filter
														id="x4q18wtwra">
                                                        <feColorMatrix
														in="SourceGraphic"
														values="0 0 0 0 0.860941 0 0 0 0 0.859573 0 0 0 0 0.893965 0 0 0 1.000000 0">
                                                        </feColorMatrix>
                                                    </filter>
                                                </defs>
                                                <g fill="none"
														fill-rule="evenodd" filter="url(#x4q18wtwra)"
														transform="translate(-40 -483)">
                                                    <path fill="#1E1D29"
														d="M55.2 483c.442 0 .8.358.8.8v14.4c0 .442-.358.8-.8.8H40.8c-.442 0-.8-.358-.8-.8v-14.4c0-.442.358-.8.8-.8h14.4zm-.8 6.4H41.6v8h12.8v-8zm-7.2 4.8c.442 0 .8.358.8.8 0 .442-.358.8-.8.8H44c-.442 0-.8-.358-.8-.8 0-.442.358-.8.8-.8h3.2zm7.2-9.6H41.6v1.6h12.8v-1.6z">
                                                    </path>
                                                </g>
                                            </svg>
												<aside>
													<span class="kakaoPaylabel">카카오페이</span>
												</aside>
											</div>
										</td>

										<td data-method="payment_account"
											class="purchases_tools_selectView" onclick="change2()">
											<div>
												<svg width="16" height="16" viewBox="0 0 16 16">
                                                <defs>
                                                    <filter
														id="zkaqk9quza">
                                                        <feColorMatrix
														in="SourceGraphic"
														values="0 0 0 0 0.117647 0 0 0 0 0.113725 0 0 0 0 0.160784 0 0 0 1.000000 0">
                                                        </feColorMatrix>
                                                    </filter>
                                                </defs>
                                                <g fill="none"
														fill-rule="evenodd" filter="url(#zkaqk9quza)"
														transform="translate(-204 -571)">
                                                    <path fill="#1E1D29"
														d="M219.2 571.8c.442 0 .8.358.8.8v12.8c0 .442-.358.8-.8.8h-14.4c-.442 0-.8-.358-.8-.8v-12.8c0-.442.358-.8.8-.8h14.4zm-.8 1.6h-12.8v11.2h12.8v-11.2zm-2.4 6.4c.442 0 .8.358.8.8 0 .442-.358.8-.8.8h-3.2c-.442 0-.8-.358-.8-.8 0-.442.358-.8.8-.8h3.2zm-6.4-3.2c.442 0 .8.358.8.8v3.2c0 .442-.358.8-.8.8H208c-.442 0-.8-.358-.8-.8v-3.2c0-.442.358-.8.8-.8h1.6zm6.4 0c.442 0 .8.358.8.8 0 .442-.358.8-.8.8h-3.2c-.442 0-.8-.358-.8-.8 0-.442.358-.8.8-.8h3.2z">
                                                    </path>
                                                </g>
                                            </svg>
												<aside>
													<span class="paymentaccountlabel">간편계좌결제</span>
												</aside>
											</div>
										</td>
									</tr>
								</table>
								<div class="purchases_tools_table_View" id="change_div">
									<h3>카카오페이 안내</h3>
									<div>
										<p>카카오페이로 간편하게 결제할 수 있는 간편 결제 서비스입니다.</p>
										<p>안전결제를 위해 네모네모에 입금 후 물건수령이 완료되면 돈을 보냅니다.</p>
									</div>
								</div>
							</div>
						</section>
						<input onclick="changevalue()" type="hidden" value="kakao" name="purchaseWay" id="purchaseselect"></input>
						<!-- 쿠폰-->
						<!-- <section class="DefaultPanel__Panel-sc-1aguack-0 gtzuKj">
                        <header>번개포인트</header>
                        <div class="DefaultPanel__Content-sc-1aguack-1 iwOJBt">
                            <div class="PointPanel__ItemWrapper-sc-1oi4jkj-0 sbLNC"><input inputmode="numeric"
                                    placeholder="포인트 입력" class="PointPanel__CustomNumberFormat-sc-1oi4jkj-1 jhKNCf"
                                    type="text" value=""><button class="DeleteButton-dvbt9f-0 cKaIjL"></button><button
                                    class="PointPanel__SetMaxPointButton-sc-1oi4jkj-2 cwFTmw">전액사용</button></div>
                            <p class="PointPanel__EnablePoint-sc-1oi4jkj-3 eAqPdU">사용 가능한 포인트 <b>0P</b></p>
                            <p class="PointWarningMessage__WarningMessage-ij96h0-0 bdoOpY">번개포인트는 1회 사용 시 최대 5만원까지 100원 단위로
                                상품금액에서 차감됩니다.</p>
                        </div>
                    </section>
                    <div class="View__Margin-hv4joa-0 bggehq"></div> -->

						<!--결제 금액-->
						<section class="purchases_price_section">
							<header>결제금액</header>
							<div class="purchases_price_body">
								<p class="totalprice" id="totalprice"></p>
								<div class="purchases_price_content">
									<div class="purchases_price_explain">
										<div class="purchases_price_column">상품금액</div>
										<div class="purchases_price_column"><%=productPrice%></div>
										<input type="hidden" value=<%=productPrice%> name="productPrice"
											id="productPrice">
									</div>
									<div class="purchases_price_explain">
										<div class="purchases_price_column">
											수수료<img
												src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxMiIgdmlld0JveD0iMCAwIDEyIDEyIj4KICAgIDxwYXRoIGZpbGw9IiMxRTFEMjkiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTEyIDZjMCAzLjMwOC0yLjY5MiA2LTYgNlMwIDkuMzA4IDAgNnMyLjY5Mi02IDYtNiA2IDIuNjkyIDYgNnptLTEuMiAwYzAtMi42NDctMi4xNTMtNC44LTQuOC00LjhTMS4yIDMuMzUzIDEuMiA2czIuMTUzIDQuOCA0LjggNC44IDQuOC0yLjE1MyA0LjgtNC44ek02LjY2IDljMCAuMzY1LS4yOTUuNjYtLjY2LjY2LS4yMzUgMC0uNDUzLS4xMjUtLjU3MS0uMzMtLjExOC0uMjA0LS4xMTktLjQ1NSAwLS42Ni4xMTctLjIwNC4zMzUtLjMzLjU3MS0uMzMuMzY1IDAgLjY2LjI5NS42Ni42NnpNNy44IDQuMmMtLjAwMS41NzMtLjI3NCAxLjExMi0uNzM2IDEuNDUyLS4xNzQuMTI3LS40NjQuMzk4LS40NjQuNzlWNi42YzAgLjMzMS0uMjY5LjYtLjYuNi0uMzMxIDAtLjYtLjI2OS0uNi0uNnYtLjE1OGMwLS42NzIuMzQ4LTEuMzEzLjk1NS0xLjc1Ny4yMDktLjE1NC4yOTYtLjQyNC4yMTUtLjY3MUM2LjQ5IDMuNzY3IDYuMjYgMy42IDYgMy42Yy0uMjM1IDAtLjYwMy4yNTQtLjc3OC40MjYtLjIzNy4yMTUtLjYwMi4yMDYtLjgyOC0uMDIyLS4yMjYtLjIyNy0uMjM0LS41OTEtLjAxOC0uODI4LjA3OS0uMDguNzk5LS43NzYgMS42MjQtLjc3Ni45OTIgMCAxLjguODA4IDEuOCAxLjh6IiBvcGFjaXR5PSIuMyIvPgo8L3N2Zz4K"
												class="purchases_price_column_img">
										</div>

										<div class="purchases_price_column" id="plusPricediv"></div>
										<input type="hidden" value=0 id="plusPrice">
									</div>
									<div class="purchases_price_explain">
										<div class="purchases_price_column">배송비</div>
										<div class="purchases_price_column">배송비별도</div>
										<input type="hidden" name="purchaseShFee" value=<%=purchaseShFee %> id="purchaseShFee">
									</div>
								</div>
							</div>
							<!-- 테스트 -->
							<input type="hidden" value="${user.userName}" name="buyerName">
							<input type="hidden" value="${user.userPhone }" name="buyerPhone">
							<input type="hidden" value="${user.userEmail }" name="buyerEmail">
							<input type="hidden" value="${user.userZipcode }" name="buyerZipcode">
							<input type="hidden" value="${user.userAddress1} ${user.userAddress2}" name="buyerAddress">
							<input type="hidden" value="<%=productName%>" name="productName">
							<input type="hidden" value=<%=productSeller %> name="productSeller">
						</section>
						<!--이용동의-->
						<section class="purchases_terms_section">
							<header>이용 동의</header>
							<div class="purchases_terms_body">
								<div class="purchases_terms_totalagreement">
									<input type="checkbox" id="agreement"
										class="totalagreement_check"> <label for="agreement"
										class="Purchases_total_agreementlabel"
										onclick="changeall_argument()">주문 정보 및 서비스 이용약관 모두 동의
									</label>
								</div>

								<ul class="purchases_terms_contents">
									<!-- <li class="purchases_terms_column">
									<div class="Terms_CheckBoxWrapper">
										<input type="checkbox" name="service" class="service_check">
										<label for="service" class="purchases_terms_label"><i
											id="service" onclick="changeservice()"></i> <u
											class="purchases_terms_link"> <a
												href="https://pay2.bunjang.co.kr/terms/service?orderId=8826748">번개페이
													서비스 이용약관</a></u> 동의 <br> </label>
									</div>
								</li> -->

									<li class="purchases_terms_column">
										<div class="Terms_CheckBoxWrapper">
											<!-- <input type="checkbox" name="personal" class="personal_check"> -->
											<label for="personal" class="purchases_terms_label"><i
												id="personal" onclick="changepersonal()"></i> <u
												class="purchases_terms_link"> <a
													href="https://pay2.bunjang.co.kr/terms/personal?orderId=8826748">개인정보
														수집 및 이용</a></u> 동의 </label>
										</div>
									</li>

									<li class="purchases_terms_column">
										<div class="Terms_CheckBoxWrapper">
											<!-- <input type="checkbox" name="sales" class="sales_check"> -->
											<label for="sales" class="purchases_terms_label"><i
												id="sales" onclick="changesales()"></i> <u
												class="purchases_terms_link"> <a
													href="https://pay2.bunjang.co.kr/terms/sales?orderId=8826748">개인정보
														판매자 제공</a></u> 동의 </label>
										</div>
									</li>
								</ul>
							</div>
						</section>

						<section class="purchases_buy_section">
							<button class="purchases_buy" type="submit" id="buybtn" disabled></button>
						</section>
						<input type="hidden" value=0 id="pullPrice" name="purchasePrice">
						<section class="purchases_footer">"번개장터_컨시어지" 상점의 판매상품을
							제외한 모든 상품들에 대하여, 번개장터㈜는 통신판매중개자로서 중고거래마켓 번개장터의 거래 당사자가 아니며,
							입점판매자가 등록한 상품정보 및 거래에 대해 책임을 지지 않습니다.</section>
					</div>
					<div class="Overlay__OverlayDiv-zwvsg4-0 zTKwr"></div>
				</div>
			</div>
		</form>
	</div>
</body>

</html>
</c:if>