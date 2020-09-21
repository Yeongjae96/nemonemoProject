<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<title>네모내모 | 회원 정보</title>
<!-- Favicon-->
<link rel="shortcut icon" href="<c:url value="/resources/images/common/logo/favicon.png"/>"> 

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" type="text/css">

<!-- Bootstrap Core Css -->
<link rel="stylesheet"
	href="<c:url value="/resources/vendor/plugins/bootstrap/css/bootstrap.css"/>">

<!-- Animation Css -->
<link rel="stylesheet"
	href="<c:url value="/resources/vendor/plugins/animate-css/animate.css"/>">

<!-- common CSS -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/admin/common/style.css"/>">

<!--  테마 색상  -->
<link rel="stylesheet"
	href="<c:url value="/resources/vendor/common/stylesheets/theme-red.css"/>">

<!-- 개인 CSS -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/admin/members/member/member_info.css"/>">

<!-- FontAwesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">


</head>
<body class="theme-red">

	<% 
		/* 공통 Header and Nav */
	%>
	<header>
		<jsp:include page="/WEB-INF/views/admin/include/header.jsp" />
		<jsp:include page="/WEB-INF/views/admin/include/side-nav.jsp" />
	</header>

	<% 
		/* 각 페이지의 SECTION */
	%>

	<!-------------------------------------------SECTION--------------------------------------------------->
	<section class="content">
		<div class="container-fluid">
			<div class="block-header"></div>
			<div class="card">
				<div class="header">

					<h1>회원정보</h1>
				</div>
				<div class="row clearfix">
					<div>
						<div class="body">
							<form id="form_validation" method="POST">
								<div class="table-responsive">
									<table class="table">
										<h2>
											<i class="fas fa-user-circle" style="margin-right: 10px;"></i>회원
											개인정보
										</h2>
										<tbody>

											<tr>
												<th>이름<i class="fas fa-angle-right"></i></th>
												<td class="col-md-4">${memberVO.userName}</td>
												<th>상점명<i class="fas fa-angle-right"></i></th>
												<td class="col-md-5">${memberVO.storeName}</td>
											</tr>
											<tr>
												<th>아이디<i class="fas fa-angle-right"></i></th>
												<td>${memberVO.userEmail}</td>
												<th>성별<i class="fas fa-angle-right"></i></th>
												<td><c:if test="${memberVO.userGender eq 'F'}">여성</c:if>
													<c:if test="${memberVO.userGender eq 'M'}">남성</c:if> <c:if
														test="${memberVO.userGender eq 'E'}">기타</c:if></td>

											</tr>
											<tr>
												<th>계좌번호<i class="fas fa-angle-right"></i></th>
												<td>${memberVO.userAccount}</td>
												<th>인증여부<i class="fas fa-angle-right"></i></th>
												<td><c:if test="${memberVO.userAuthCheck eq 'N'}">아니오</c:if>
													<c:if test="${memberVO.userGender eq 'Y'}">완료</c:if></td>

											</tr>
											<tr>
												<th>주문내역<i class="fas fa-angle-right"></i></th>
												<td>
													<button type="button" class="btn bg-teal waves-effect"
														data-toggle="modal" data-target="#registryModal">상세보기</button></td>
												<th>연락처<i class="fas fa-angle-right"></i></th>
												<td>${memberVO.userPhone}</td>
											</tr>
											<tr>
												<th>주소<i class="fas fa-angle-right"></i></th>
												<td class="addr-box" colspan="3">
													<div class="upd-addr">${memberVO.userAddress1}
														${memberVO.userAddress2}</div>
												</td>
											</tr>
											<tr>
												<th>약관 동의여부<i class="fas fa-angle-right"></i></th>
												<td colspan="4"><label for="term-service">이용약관</label>
													<c:forEach var="vo" items="${termsVO}">
														<c:if
															test="${vo.termsTitle eq 'S' and vo.termsAgreeFl eq 'Y'}">
															<i class="fas fa-check" style="color: red;"></i>
														</c:if>
														<c:if
															test="${vo.termsTitle eq 'S' and vo.termsAgreeFl eq 'N'}">
															<i class="fas fa-times" style="color: red;"></i>
														</c:if>
													</c:forEach> <br> <label for="location-service">위치서비스기반</label> <c:forEach
														var="vo" items="${termsVO}">
														<c:if
															test="${vo.termsTitle eq 'P' and vo.termsAgreeFl eq 'Y'}">
															<i class="fas fa-check" style="color: red;"></i>
														</c:if>
														<c:if
															test="${vo.termsTitle eq 'P' and vo.termsAgreeFl eq 'N'}">
															<i class="fas fa-times" style="color: red;"></i>
														</c:if>
													</c:forEach> 
														<br> 
														<label for="privacy-policy">개인정보보호</label> 
														<c:forEach var="vo" items="${termsVO}">
														<c:if
															test="${vo.termsTitle eq 'L' and vo.termsAgreeFl eq 'Y'}">
															<i class="fas fa-check" style="color: red;"></i>
														</c:if>
														<c:if
															test="${vo.termsTitle eq 'L' and vo.termsAgreeFl eq 'N'}">
															<i class="fas fa-times" style="color: red;"></i>
														</c:if>
													</c:forEach></td>
											</tr>
										</tbody>

									</table>
									<!-- 회원 수정 코드 -->
									<%-- <table class="table">
										<h2><i class="fas fa-user-check" style ="margin-right : 10px;"></i>회원 수정정보</h2>
										<tbody>
											<tr>
												<th>VIP<i class="fas fa-angle-right"></i></th>
												<td>
													<input type="radio" name="isVip" id="vip" value ="V" class="custom-control-input"
													<c:if test="${memberVO.userStatus eq 'V'}">checked</c:if>/>
													<label class="custom-control-label" for="vip">VIP</label>
													<input type="radio" name="isVip" value ="N" id="notvip" class="custom-control-input"
													<c:if test="${memberVO.userStatus eq 'N'}">checked</c:if>/>
													<label class="custom-control-label" for="notvip">일반</label>
												</td>
											</tr>
											<tr>
												<th>계정정지<i class="fas fa-angle-right"></i></th>
												<td>
													<input type="radio" name="is-black" id="y-blacklist" class="custom-control-input"
													<c:if test="${memberVO.userStatus eq 'P'}">checked</c:if>/> 
													<label class="custom-control-label" for="y-blacklist">설정함</label>
													<input type="radio" name="is-black" id="n-blacklist" class="custom-control-input">
													<label class="custom-control-label" for="n-blacklist">설정안함</label>
												</td>
											</tr>
											<tr>
												<th>참고사항<i class="fas fa-angle-right"></i></th>
												<td class="memo_black" colspan="3">
													<textarea cols="100" rows="10">
                                            	</textarea>
                                            	</td>
											</tr>
										</tbody>
									</table> --%>
									<div class="btn-layout">
										<!--<button type="button" class="btn bg-teal btn-lg waves-effect saveBtn">저장</button> -->
										<button type="button" class="btn bg-teal btn-lg waves-effect"
											id="backBtn">확인</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

		</div>

		<!-- -----------------------------------------------------------------------------------------거래내역 상세보기 -->
		<div class="modal fade" id="registryModal" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-body">
						<div class="header">
							<h2>
								<i class="fas fa-won-sign" style="margin-right: 20px;"></i>거래내역
							</h2>
						</div>
						<div class="body table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>#</th>
										<th>거래 날짜</th>
										<th>상품</th>
										<th>거래 금액</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="purchase" items="${purchaseList}">
									<tr>
										<th scope="row">${purchase.purchaseNo}</th>
										<td>${purchase.puchaseDt}</td>
										<td>${purchase.productName}</td>
										<td>${purchase.purchasePrice}</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="modal-footer">
						<div class="modal-flex--center">
							<button type="button"
								class="btn bg-teal btn-lg waves-effect doneBtn"
								data-dismiss="modal">확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>

	<!-------------------------------------------SECTION--------------------------------------------------->

	<!-- Jquery Core Js -->
	<script
		src="<c:url value ="/resources/vendor/plugins/jquery/jquery.js"/>"></script>

	<!-- Bootstrap Core Js -->
	<script
		src="<c:url value ="/resources/vendor/plugins/bootstrap/js/bootstrap.js"/>"></script>

	<!-- Slimscroll Plugin Js -->
	<script
		src="<c:url value ="/resources/vendor/plugins/jquery-slimscroll/jquery.slimscroll.js"/>"></script>

	<!-- Waves Effect Plugin Js -->
	<script
		src="<c:url value ="/resources/vendor/plugins/node-waves/waves.js"/>"></script>

	<!-- Custom Js -->
	<script
		src="<c:url value ="/resources/vendor/common/javascript/pages/admin.js"/>"></script>

	<!-- Dateppicker bootstrap -->
	<script
		src="<c:url value ="/resources/vendor/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"/>"></script>

	<!-- 개인 JS -->
	<script src="<c:url value ="/resources/js/admin/members/member/member_info.js"/>"></script>
	<script>var contextPath = "${pageContext.request.contextPath}";</script>

	<script>
	$('.saveBtn').click(function() {
	alert($('input[name=isVip]:checked').val());
		
		});

	</script>


</body>
</html>