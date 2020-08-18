<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 로그인 전 나브 시작 -->

<nav class="top navbar nav-expand-sm navbar-light top-nav">
	<div class="top-menus">
		<div class="nav-box">
			<button class="btn-layout">
				<img src="<c:url value="/resources/images/user/common/fav.png"/>"
					width="20" height="18" alt="즐겨찾기아이콘">&nbsp;&nbsp;즐겨찾기
			</button>
		</div>
		<div class="nav-box">
			<!-- 오른쪽 네비 -->
			<button class="btn-layout" id="loginBtn">로그인</button>
			<div class="login-btw-signin"></div>
			<button class="btn-layout" onclick="location.href='sign/signup.do'">회원가입</button>

		</div>

		<!--오른쪽 네비 끝 -->
	</div>
</nav>
<!-- 로그인 전 나브 종료 -->

<!--로그인 모달 창 -->
<div id="myModal" class="modal">
	<div class="login-wrap">
		<div class="login-modal-content">
			<button class="login-modal-close">
				<img
					src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAAXNSR0IArs4c6QAAAiBJREFUaAXtmM1xwjAQRrFvcE+aSJoIPaSI5MCNHmC4caCK1ECaCE0kBTBccPxl0MyO0C6r1drkIF/Q6Gf3vbU9kplM6lUrUCtQK/BvK7Bard622+3DvQCRGwxS/pYbvCzcHY/H/T0kkBO5e76dJMEKzGazj6Zpvrquex5bIsAjNxjAwhW64QbQHweaTqfzxWLxI60pHcvNKQqMLZELD76bAmNJWODVAkNLWOGzBIaSKIHPFvCWKIU3CXhJeMCbBUolvOCLBKwSnvDFAgmJQ7/ZvXCb3QX+s99hn7DDemyMqn0AoNIVgSUlNHOkHNyYiwCCS4DSGAem7XcT4CTQ3x8Gw2OTvDta2NQ8VwEkiKuNvssz7w6P2O4CCEol/pI0zSDwiM1+D2DQep1Op6vCpPqs8em6q0R00NLebDaP5/N5Hx4bxAjttm3ny+Xy2xKXW+MqEMMDGImpkLeEm0AKPlRbGuMqq+13EdAAauZooem8YoEcsJy5FFJqFwlYgCxrBhEoASlZG8uY7oAHgEcMyGQLeCVGco9YWQIeCQFOr9KY6qNEaSIKTdvYK7C59R84B+zY2PRwlqJzpLZKAAGH3E1jCRy/tRI3HyF6skSVvI8CtLrxXZY+T8M6USCG1wQMga2/uTlZgdxAVuDUupzc7DvQP4ev4Rg8RuWpCP7VQM7wYoOFjqvb6/X6HdVQL3CeiHcCDM5ha7hagVqBWgHHCvwCWAH5e5bAf84AAAAASUVORK5CYII="
					width="24" height="24" alt="로그인 모달 닫기 버튼 아이콘" id="closeImg">
			</button>
			<div class="login-form-content-box">
				<img
					src="data:image/png;base64,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"
					width="30" height="34" class="bungae-img" alt="번개로고">
				<div class="login-title">번개장터로 중고거래 시작하기</div>
				<div class="login-ad">
					15초만에 간편하게 가입하고<br> 상품을 확인하세요!
				</div>
				<div class="sns-login-box">
					<button class="sns-login-btn naver">
						<div class="sc-eerKOB sns-img-align"></div>
						네이버로 이용하기
					</button>
					<button class="sns-login-btn kakao">
						<div class="sc-eerKOB sns-img-align"></div>
						카카오로 이용하기
					</button>
				</div>
				<!-- sns 로그인 박스 -->
				<div class="login-btw-input"></div>
				<div class="input-div">
					<form action="<c:url value="/sign/signin.do"/>" method="POST">
						<div class="tel-input">
							<input type="text" placeholder="이메일 입력" autocomplete="userEmail"
								value="" name="userEmail">
						</div>
						<div class="pw-input">
							<input type="password" placeholder="비밀번호"
								autocomplete="current-password" value="" name="userPw">
						</div>
						<button type="submit" class="login-submit-btn">번개장터 이용하기</button>
					</form>
				</div>
				<div class="login-info">
					<a href="/password?rd_url=%2F">비밀번호 찾기</a> <a
						href="https://docs.google.com/forms/d/e/1FAIpQLSdATbdzuUX8DmpeoMKK1Wfecih53sPmjh7-rVwhedegvAmz0w/viewform"
						target="_blank" rel="noopener noreferrer">고객센터</a>
				</div>
				<div class="sign-up-anchor">
					아직 계정이 없으세요? <a href="signup.do">회원가입하기</a>
				</div>
			</div>
		</div>
	</div>
</div>