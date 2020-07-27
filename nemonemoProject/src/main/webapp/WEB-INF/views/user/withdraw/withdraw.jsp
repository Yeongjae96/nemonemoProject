<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>번개장터 | 탈퇴</title>
<!-- 공통 CSS -->



<!-- 페이지 CSS  -->

<link rel="stylesheet" type="text/css" href="<c:url value="https://assets.bunjang.co.kr/static/bundle/css/6b29cf2da9df.css"/>">

<!-- 라이브러리 -->
<script src="<c:url value="/resources/vendor/jquery/jquery-3.5.1.min.js"/>"></script>


<!-- 해당 페이지 JS파일 -->
<script src="<c:url value="/resources/js/user/common/common.js"/>"></script>



</head>
<body>

	<section>
		<div class="wrap">
			<div id="container" class="noheader withdraw">
				<div class="container_inner">
					<div class="loginwrap">
						<button type="button" onclick="goBack()" class="btn_close">닫기</button>

						<div class="warning">
							<p>회원 탈퇴시 3일 이내 재가입이 불가하며, 유로 구매한 아이템은 소멸됩니다.</p>
							<br>
							<p>
								[잠깐!]<br> <span> - 상점명 변경 및 휴대폰번호 변경은 내정보 수정에서
									가능합니다.<br> - 이용 중 불편사항이 있으셨다면 설정 &gt; 1:1상담하기로 문의주시기 바랍니다.<br>
									- 탈퇴 후 재가입시 신뢰유지를 위해 사용내역(리뷰, 팔로워/팔로잉 등)이 복구됩니다.<br>
								</span>
							</p>
							<div class="btnbox">
								<button type="button" class="btn_yw_02 submit">탈퇴</button>
							</div>
						</div>

						<div class="formarea">
							<p>
								서비스에 만족을 드리지 못해 대단히 죄송합니다.<br> 보다 좋은 서비스로 다음에 다시 뵐수 있도록 최선을
								다하겠습니다.
							</p>
							<form method="post">
								<fieldset>
									<legend>로그인</legend>
									<div class="inpbox first">
										<select class="reason">
											<option>복잡, 불편</option>
											<option>사생활 침해</option>
											<option>사기를 당함</option>
											<option>분쟁이 발생함</option>
											<option>판매가 부진</option>
											<option>교환 신청이 너무 많음</option>
											<option>판매가 완료됨</option>
											<option>찾는 물품이 없음</option>
											<option>번호이동, 재가입</option>
											<option>기타 (사유)</option>
										</select>
									</div>
									<div class="inpbox hide">
										<textarea class="reason"></textarea>
									</div>
									<div class="inpbox hide">
										<input type="password" name="userpw" id="userpw"
											placeholder="비밀번호를 입력해주세요.">
									</div>
								</fieldset>
								<div class="btnbox">
									<button type="submit" class="btn_yw_02 submit">탈퇴</button>
								</div>
							</form>
						</div>

					</div>
				</div>
			</div>
		</div>



		<footer>


			<div class="footerwrap">
				<div class="botmenu">

					<a
						href="http://www.ftc.go.kr/info/bizinfo/communicationView.jsp?apv_perm_no=2015316015930200589&amp;area1=&amp;area2=&amp;currpage=1&amp;searchKey=04&amp;searchVal=1138645836&amp;stdate=&amp;enddate=">사업자정보확인</a>
					<a href="http://fastly.bunjang.co.kr/terms/service/">이용약관</a> <a
						href="http://fastly.bunjang.co.kr/terms/privacy/">개인정보처리방침</a> <a
						href="http://fastly.bunjang.co.kr/terms/location/">위치기반서비스약관</a>
				</div>
				<address>
					<p class="mb_newline"></p>
					<p>
						<strong>번개장터(주) 대표이사</strong> 장원귀 <span><strong>개인정보보호담당자</strong>
							김철우</span>
					</p>
					<p>
						<strong>사업자등록번호</strong> 113-86-45836 <span><strong>통신판매업신고</strong>
							2019-서울서초-1126</span>
					</p>
					<p></p>
					<p class="mb_newline"></p>
					<p>
						<strong>주소</strong> 서울특별시 서초구 서초대로38길 12, 7층(서초동, 마제스타시티 타워2)
					</p>
					<p>
						<span><strong>TEL/FAX</strong> 02-598-8240/02-598-8241</span>
					</p>
					<p></p>
				</address>
				<div class="txtmsg">번개장터(주)는 통신판매중개자로서 중고거래마켓 번개장터의 거래 당사자가
					아니며, 입점판매자가 등록한 상품정보 및 거래에 대해 책임을 지지 않습니다.</div>
				<div class="copyright">Copyright ⓒ QUICKET Co, Ltd. All rights
					reserved</div>
			</div>
		</footer>
		<button type="button" class="btn_top">
			<span>TOP</span>
		</button>

		<script type="text/javascript"
			src="https://assets.bunjang.co.kr/static/bundle/js/0057861ff792.js"
			async=""></script>


		<div id="fb-root" class=" fb_reset">
        <div style="position: absolute; top: -10000px; width: 0px; height: 0px;">
            <div></div>
        </div>
    </div>
	</section>

</body>
</html>