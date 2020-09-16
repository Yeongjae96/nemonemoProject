<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 로그인 전 나브 시작 -->

<style>
/*로그인 팝업 모달 시작*/
.modal {
	display: none;
	position: fixed;
	z-index: 1500; /* 최상위 */
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

.login-wrap {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100%;
}

.login-modal-content {
	width: 420px;
	box-shadow: rgba(0, 0, 0, 0.1) 0px 6px 50px 0px;
	position: relative;
	background: rgb(247, 247, 247);
	border-radius: 4px;
	overflow: hidden;
	flex-direction: column;
}

.login-modal-close {
	position: absolute;
	top: 20px;
	right: 20px;
}

button {
	background-color: transparent;
	cursor: pointer;
	outline: none;
}

button, input {
	overflow: visible;
}

button, [type="button"], [type="reset"], [type="submit"] {
	appearance: button;
}

.login-form-content-box {
	padding: 40px 0px 0px 0px;
}

.bungae-img {
	display: block;
	margin: auto auto 10px;
}

img {
	vertical-align: bottom;
}

img {
	border-style: none;
}

.login-title {
	font-size: 20px;
	line-height: 1.5;
	margin-bottom: 15px;
	text-align: center;
	font-weight: bold;
}

.login-ad {
	line-height: 1.5;
	margin-bottom: 35px;
	text-align: center;
}

.sns-login-box {
	margin-bottom: 18px;
	padding: 0px 70px;
}

.sns-login-btn {
	width: 100%;
	height: 38px;
	box-shadow: rgba(0, 0, 0, 0.05) 0px 1px 7px 0px;
	text-align: center;
	margin-bottom: 12px;
	position: relative;
	background: rgb(255, 255, 255);
	border-radius: 4px;
}

.sns-login-btn .naver {
	background-image:
		url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAAXNSR0IArs4c6QAAAk1JREFUaAXtWD1LXEEUPbPZmM5CFiRB/MLYWFhkWS1tA2K3kG638CeIRarUdltE0D9g4S9IJxbBJSYQREih6EoghbAgKph11/GOecVkP97MvHl3I2a2mjf345xz5+6beQOEX6hAqECoQKjA/1wBYSN+ag8jtwJr5LsgJV7axCT1EQK/KHbnucTq0Tx+mvIYBSjyDeA7JRoyJUvZXh8AZk0iMibQqPL9Jq9oDUXYsRSNAih6ITYDr9GIbRTA3fNx+m2wjQLiAB6DLQj416uQ9SVwNo+OV3FR4lm1is+Uu6DnF1m8qeXxTZ+b3kfupolzfc5lzNJC2wKtTBYlUnbjQiaJL4sAReQ0jx+0q75PQsolhk2AIlEuoEINtutCyNWXVcAHgTtqozKRunIlZuvPKkCRqM3hJCOwYkvI1Y9dgCJ0OocNaqVPruRs/L1fo91A6Agg6A8sdduAxDI9v9Dn0hizrMDrr5gcrWJRJ6iOxUd5HOtzaYxZBEhBKwBszhzyf0OwCFCVVSfJq0t8TKPKcTnYBDyIAN5RKxXjCPjaWAVE5NYnDjDsS7RXPL8AiVzrGpu9CPjO8wv4w3BpvIqSL9lu8d77wNgXvG1P3GziVfscbQoVEnEhM/it2xp3GNSfXccdZ/n2BKN7f29I7Xbu527fGzpmv1pIx0x1HASkWs4EyYwrEN1VJkjtH2KDbRRANHb8qSTOYMQ2ClC3xARfT0wheWA9wo7NYBSgjsHqlpiWc8tmSWPRLIwKQ2HZ3ExbpAsuoQKhAqECoQJPvAL3SqhqvAnAWi4AAAAASUVORK5CYII=);
}

.sns-login-btn .kakao {
	background-image:
		url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAAXNSR0IArs4c6QAABWhJREFUaAXtWFloXFUYvufMnaVJQybEpdo2mWliE2xdoKREk4ypobbS+uC+tNA+KFLFBS3igz4oik8VpFrNg7u+OCTFBQS1dcxSNQqGlKChdbaKKSaG7El7597jd6a9k5PLzL13MpMU4V4Yzn++8+//f5ZEkpzPyYCTAScDTgacDDgZuHQZIMUyfceWLSUTo6ONqiQ1QelNEmPrJEIuY5JUSRg7D3oM9BjWYqD7KGN9vvLyn78ZGJgpxIeCA2gKBBrh4MNw+AE4WJqPMzDOne9wEfJBJB6PEEKgIr9vyQE0B4M3MFU9DHMt+ZnMwU3Iby5Kn+6KxbpycGSF8w7g3k2bPGenpw8xxg4gXa6sWgsA4dBnZR7PI1+fPj1pR01eAbTV11fOz84eheLiZD2Hh3BqUKZ0N9oqnoMlA9sOgDt/bm7uBDK/MSO9nAQh/3gp3Xo8FkuYmaFmi/oanCZw/pMVc54bZuyKc6oa5i2r+5FttBVAKBA4COd3ZlOwzFjD8NTUy2Y2LFuoNRDwpRhLIoDLuSII/IVzPGlUig1diazVYW0Ia7+CfugCO2QIiYGOQkebIDcGPALsLh2D7jNgHgC2S8cwn6r0+dZ+MTQ0lcEEwrICCmN7dOe5HM7s+2RC2src7lt7EokmORi8hc/dhLTCmMLH3kRiL+hPdTsI7nXw8QrO6hjWOyF/N+ZzHEMwSY/Hs01yuR7L8HCCsbJ/5+f3LcKEiWUAyMpugV9CNU4omjY3qSj9HE/F4y/wOX7D4P0SJ8dZVK3e5XLx0sP3dNW0SCSSAjnP5/zD5aelR0nC5S396aE0lNI0ylKpYxwXP/DeJs5F2jIAZL9WFDCjYehIa03NZlTtUFc0egq835rx8zVE+HvJqlUhRZLK1VTqR0DZ7G3IpccyAAjmFF6klJA/upPJYylF4c+Kna21tesopUcW8WSZoGo7FFme9BKSQB9NZ2HhQQaz4RyzE0Cm7LmUcBzZfzu9TsgIHHmDKcr6NQ0NX/HeNpNDzzcr09MnOQ8eeHsQEG8p4zduBPS5nQD+1plzjTA645PlD3nW4XAPJeRzRqk7HA6rWGvPJZfGNe1jVCwwr6qvoYK9kHvVyA8dUSOmzy0DgEPdOrNhhN505ilKHP4uGp1QFKVd07QI/6mq+kNLVVUbTq33OBvn9Xo8W4ks1xFKG1GlEY7BefnCwB4NBYOh7fv3v4Q1vhcWPkLSFVoAFijLx1hVRYUKI3sXRC5ShJQH/H43nL8fQV5d5fcHwbdvER8ha3HU1AC7Z30FFKnqRvDUod2uZYRsh8wGrLXpGqFrV7S/n2G9AdiVF3Ee/YHkxMSwPhfHdGZEwEjjFCLN1dUDwDcb11ZkjmrgXrk5ly07LcSw0Z6BAiRohT9cjLLL9ZSZVcsW4sJnxsej1X4/79WQmbJir6E1n+uOxzvM9Fq2kCiMVnoLLbX4qhcZikjjJHuzKx5/EkGYVt6yhUSf8HZ5HApfEbFloBmy+nx3IvGElfPctq0WEp3EafA9To+TUL4DuE9cK5SG46ew3x7Epv3Irq68KqArhYFO2eu9Buf1YR0rZEQyRvB7EX8LX9cbi1m+n0Rbee0BUZDT2BN3Yk90GnE7czjMnyi9SMK7V5WWdoQHB8/bkTPypG9BI2h3jt21LRsvstIHx7oRXCXWKzCn+I3h8hrFfBgX1U9rVq/+ZalOizYLCgC36u2iMjg5g2fCQfxvpx0ZNj09RLlC6CXtAW6wJRi8HkNtxjghx2W3+0ac2++slPPc9tIroGnpv9SQ9VGcHM/2xGK2T45M0EUgllwB9Ad/Or/vLSmpv1TOFyF+R4WTAScDTgacDPzPM/AfB13X3M4rOGQAAAAASUVORK5CYII=);
}

.sns-img-align {
	position: absolute;
	top: calc(50% - 12px);
	left: 35px;
	width: 24px;
	height: 24px;
	background-size: cover;
	background-repeat: no-repeat;
}

.naver:hover {
	background-color: rgb(30, 200, 0);
	color: rgb(255, 255, 255);
	font-weight: bold;
}

.kakao:hover {
	background-color: rgb(59, 30, 30);
	color: rgb(255, 255, 255);
	font-weight: bold;
}

.input-div {
	margin-bottom: 20px;
	padding: 0px 70px;
}

.input-div input {
	width: 100%;
	height: 42px;
	box-shadow: rgba(0, 0, 0, 0.05) 0px 1px 7px 0px;
	padding: 0px 42px 0px 15px;
	border-radius: 4px;
	border-width: 1px;
	border-style: solid;
	border-color: transparent;
	border-image: initial;
}

.tel-input {
	margin-bottom: 10px;
	position: relative;
}

.pw-input {
	margin-bottom: 15px;
}

.login-submit-btn:disabled {
	opacity: 0.3;
}

.login-submit-btn {
	width: 100%;
	height: 38px;
	text-align: center;
	color: rgb(255, 255, 255);
	font-weight: bold;
	background: rgb(246, 68, 72);
	border-radius: 4px;
}

.login-info {
	text-align: center;
	font-size: 13px;
	margin-top: 12px;
	margin-bottom: 15px;
}

.sign-up-anchor {
	height: 50px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 13px;
	background: rgb(255, 255, 255);
}

.sign-up-anchor a {
	color: rgb(246, 68, 72);
	margin-left: 5px;
}

/* 로그인 모달 */
</style>
</head>
<body>
	<input type="hidden" value="${loginStatus}" id="loginStatus"/>
	<nav class="navbar nav-expand-sm navbar-light top-nav">
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
				<button class="btn-layout" onclick="location.href='${pageContext.request.contextPath}/sign/signup.do'">회원가입</button>
			</div>

			<!--오른쪽 네비 끝 -->
		</div>
	</nav>
	<!-- 로그인 전 나브 종료 -->

	<!--로그인 모달 창 -->
	<div id="loginModal" class="modal">
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
					<div class="login-title">네모내모로 중고거래 시작하기</div>
					<div class="login-ad">
						15초만에 간편하게 가입하고<br> 상품을 확인하세요!
					</div>
					

					<a id="kakao-login-btn"></a> <a
						href="http://developers.kakao.com/logout"></a>
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
					
					<div class="sns-login-box">
						<a id="login-form-btn" href="javascript:loginFormWithKakao()">
							<img
							src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
							width="100%" height="50px" />
						</a>
						<p id="login-form-result"></p>
						<script type="text/javascript">
						Kakao.init('febc31efd1b6f21901d27fb57cc55aa7');
							function loginFormWithKakao() {
								Kakao.Auth.loginForm({
									success : function(authObj) {
										showResult(JSON.stringify(authObj))
										Kakao.API.request({
											url : '/v2/user/me',
											success : function(res) {

												var userEmail = res.kakao_account.email;
												var userName = res.properties.nickname;
												document.getElementById('kakaoInfo').value = userEmail;
												document.getElementById('kakaoName').value = userName;
												
												console.log(userEmail);
												console.log(userName);
												
												document.kakaoSubmit.submit();
											}
										})
										console.log(authObj);
										var token = authObj.access_token;
									},
									fail : function(err) {
										showResult(JSON.stringify(err))
									},
								})
							}
							function showResult(result) {
								document.getElementById('login-form-result').innerText = result
							}
						</script>

						<form method="POST" action="sign/slogin.do" name="kakaoSubmit">
							<a href='javascript:void(0);' onclick="startKakaoLogin()"> <input
								type="hidden" id="kakaoInfo" name="userEmail"> <input
								type="hidden" id="kakaoName" name="userName"> <!-- <button class="sns-login-btn kakao">

									<div class="sc-eerKOB sns-img-align"></div>

									카카오로 이용하기
								</button> -->
								<button class="kakao" id="kakaoBt"></button>
							</a>
						</form>
					</div>
					
					<div class="login-info">
						<a href="https://docs.google.com/forms/d/e/1FAIpQLSdATbdzuUX8DmpeoMKK1Wfecih53sPmjh7-rVwhedegvAmz0w/viewform"
							target="_blank" rel="noopener noreferrer">고객센터</a>
					</div>
					<div class="sign-up-anchor">
						아직 계정이 없으세요? <a href="sign/signup.do">회원가입하기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--로그인 모달 창 -->
</body>
