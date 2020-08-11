<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>번개장터 | 1:1상담</title>
<!-- 공통 CSS -->
<link rel="stylesheet" href="<c:url value="/resources/css/user/common/common.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/user/qna/qna.css"/>">

<!-- 페이지 CSS  -->
<link rel="stylesheet" href="<c:url value="/resources/css/user/sign/signin.css"/>">


<!-- 라이브러리 -->
<script src="<c:url value="/resources/vendor/jquery/jquery-3.5.1.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/fontawsome/js/all.js"/>"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 해당 페이지 JS파일 -->
<script src="<c:url value="/resources/js/user/common/common.js"/>"></script>



</head>
<body>
	<% 
		/* 공통 Header */
	%>
	<jsp:include page="/WEB-INF/views/user/include/top-menu.jsp"/>
	<% 
		/* 공통 Header */
	%>
	<header class="sticky-top">
		<jsp:include page="/WEB-INF/views/user/include/header.jsp" />
		<jsp:include page="/WEB-INF/views/user/include/side-nav.jsp"/>		
	</header>
	<% 
		/* 각 페이지의 특성! */
	%>
	<section>
		<div class="qna-body">
			<div class="qna-body2">
				<main class="qna-main">
					<nav class="total-nav">
						<a class="total-nav-not-selected" href="#">공지사항</a>
						<a class="total-nav-not-selected" href="#">운영정책</a>
						<a class="total-nav-not-selected" href="#">자주묻는 질문</a>
						<a class="total-nav-selected" href="#">1:1문의</a>
					</nav>
					<hr style="border:1px;">
					<nav class="qna-nav">
						<a class="qna-nav-selected" href="qna_.html">1:1 상담하기</a>
						<a class="qna-nav-not-selected" href="qna_list_em.html">상담내역</a>
					</nav>
					
					<div class="qna-contents">
						<div class="qna-contents-selbox">
							<div class=" css-2b097c-container">
								<div class="qna-contents-selbox-box">
									<div class="css-1hwfws3">
										<select class="reason">
											<option value="">문의선택</option>
											<option value="계정문의">계정문의</option>
											<option value="차단제제">차단(제재)</option>
											<option value="거래신고">거래신고</option>
											<option value="서비스기능">서비스 기능</option>
											<option value="광고전문상점">광고/전문상점</option>
											<option value="서비스장애">서비스장애</option>
											<option value="제안">제안</option>
											<option value="기타신고">기타신고</option>
											<option value="중고차">중고차</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="qna-contents-selbox">
							<div class=" css-2b097c-container">
								<div class="qna-contents-selbox-box">
									<div class=" css-1hwfws3">
										<select class="reason">
											<option value="">문의선택</option>
											<option value="계정문의">계정문의</option>
											<option value="차단제제">차단(제재)</option>
											<option value="거래신고">거래신고</option>
											<option value="서비스기능">서비스 기능</option>
											<option value="광고전문상점">광고/전문상점</option>
											<option value="서비스장애">서비스장애</option>
											<option value="제안">제안</option>
											<option value="기타신고">기타신고</option>
											<option value="중고차">중고차</option>
										</select>
									</div>

								</div>
							</div>
						</div>
						<textarea rows="20" class="qna-contents-textarea">★★★  번개페이/ 빠른송금 ★★★ 문의는 ★★★서비스기능★★★으로 문의해 주세요 !!  

            * 번개페이/빠른송금 은 *서비스 기능*으로만 문의 접수해 주세요
            - 계정문의로 문의 접수 시 확인 및 처리기간이 지연 될 수 있습니다. 
            
            
            ★문의에 맞는 상담유형을 선택해 주시면 더욱 빠른처리가 가능합니다. :)★
            
            &lt;연락처 중복양식&gt;
            1) 최근 3개월이내 휴대폰번호를 변경하셨나요? (Y/N) 
            2) 휴대폰번호 변경일자 :
            
            본인확인을 위해 다음 정보가 필요합니다.
            
            1) 이전 연락처 :
            2) 현재 사용중인 연락처 :
            3) 이메일주소 :
            4) 추가로 첨부하실 자료가 있으시다면 스크린샷으로 첨부 
            
            TIP.
            회원가입시 "이미 등록된 연락처(번호)"로 확인되시나요?
            이전 사용자께서 번개장터를 해당 연락처로 가입하여 사용하셨을 수 있습니다.
            
            휴대폰 번호를 변경 하신적이 없다면 친구 등 지인에게 휴대폰 번호를 빌려주어 따로 가입하신 적이 있으신지 확인 부탁드립니다.
            
            번개장터는 건전한 거래 문화를 위해 휴대폰 번호당 
            1개의 계정을 운영원칙으로 하여 한 번호로 여러 계정 생성을 제한하고 있어 
            번개장터 회원 가입을 중복으로 하실 수 없습니다.</textarea>
						<div class="qna-btn-group">
							<input type="file" accept="image/jpg, image/jpeg, image/png" multiple="" class="qna-btn-add-file">
							<button class="qna-btn-submit">상담신청</button>
						</div>
					</div>
				</main>
			</div>
		</div>
	</section>
	<% 
		/* 공통 푸터 */
	%>
	<jsp:include page="/WEB-INF/views/user/include/footer.jsp"/>
</body>
</html>