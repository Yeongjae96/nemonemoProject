<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- 공통 CSS -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/common/common.css"/>">

<!-- 페이지 CSS  -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/sign/signup.css"/>">


<!-- 라이브러리 -->
<script
	src="<c:url value="/resources/vendor/jquery/jquery-3.5.1.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/fontawesome/js/all.js"/>"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://www.gstatic.com/firebasejs/6.2.0/firebase-auth.js"></script>
<!-- 해당 페이지 JS파일 -->
<script>
	var contextPath = "${pageContext.request.contextPath}"
</script>
<script src="<c:url value="/resources/js/user/sign/signup.js"/>"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

</head>
<body>
	<div class="signin-all">
		<form id="signup" method="POST" action="signup.do">
			<div id="newa"></div>
			<div class="signin-form">
				<div class="signin-title">회원가입</div>
				<div class="signin-box">
					<div class="info-input-outline">
						<div class="signin-common-margin">
							<div class="input-box">
								<div class="signin-img">
									<img alt="이메일 Input 아이콘"
										src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAeCAYAAABE4bxTAAAAAXNSR0IArs4c6QAAAmNJREFUWAntlz9IG1Ecx3OXZFCSTUhLN0EoxTrUqYOgdOrYRZ2UTtmv2RIv/whZYvZMpVPRReriVKo4CKVmsB0KmYsG3C60kL9+v+m9xxnvvAvkzgz+4HHvfr/fe98Pv/e7u0TJ5XKD0BSZOkUsQ5SIAEKlFDF/iKs4qamrkASqVCpzD1EZalq1JVCr1fpqDQQFR01qCz0JBMdS0FAWmCU7oIsgoUZgqD00WaFYLPYGnkCgRmFM7dtAqVTqOggoOxhq/69PKCQrRIffUG4wZLgF5CeUFxhbID+gvMI4Ak0SahyYe4EcoE7K5fI8Y16MuXi3nSCX75kLPjTWBrbb404PjSZZGr2O2It2u/29UChsDQYDx7WMMYe5XINR9wJDbUV8Zd2+9tVqdcYwjI8Q2+BC2G+MfUVRjqPR6B86Op3OM8RXMV3HeI4RQnwvHo+/1zTtH++dTHDInx9OicJvbriZz+c/w1eE8EtcdVx1VEKkyStAfuJmJ5vNfpFODxPPQGIvCgDisFQqLfd6vbeYLyL2xIxfAeRXOBw+SqfT55iP/Wt0bCAKm0I/MOWwtUwmY+t3czo2pttCv+KPQG6VVdEPBpPQpE/dkv2KC22yqHhKGhTqdruv/BJ027ff7y8zhywq7MBc8AGOwP8KURNAGhnIoiYSiSpK1UBgrVgs7gQJRS1Tc40MQxaS4bvzGsFTjDAC3+DajUQidbzcLhmftLFnzBbhqRCmh7Gi6/qZPCIT6hMSFiYNcN9+AGlgbBOGeRKIN7VabbbZbGo403dIWgBcnP5JG/Y2sDcb+IDHlEwm/wqNGyY5cTR18XRcAAAAAElFTkSuQmCC"
										width="18" height="15">
								</div>
								<input type="text" placeholder="이메일" value="" name="userEmail" id="emailInput">
							</div>
						</div>
					</div>

					<div class="info-input-outline">
						<div class="signin-common-margin">
							<div class="input-box">
								<div class="signin-img">
									<img alt="비밀번호 Input 아이콘"
										src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAoCAYAAACfKfiZAAAAAXNSR0IArs4c6QAAAktJREFUWAntVk1IYlEU9j0fKi2GCINoEbOJGLdFthtdtGhhQZEQBTMQRBBEm8gJ/9ei4CIwoha1cBbNajZu1GhTMtN2ZtMmJKQg0DQURp3vhj7svVO8VGpzLxzuved85+d+790fQaehhUIhc6lUWgTUUa/XR9APQCSF6x3mWUhSFMW41+s9V9jJqUBqG0okE4PB4Cb6bag+vIQlbD9NJtOay+W6Imyy6tkCYrFYTy6XiyO5o4FOCoKwbzQaT61W67Xdbv8nR8EgHA73FYvF4VqtNo3pKqQPciNJ0ozb7T7DmGxkAUgqYOXf0c8j6T0o/erxeH6QEQhlJBLpLRQKO/BfgPlOr9ePw/+SgOr0lBIJl+H8DbYHjG34nkkK95wukUiU0+n0sc1mMwPzGbEmMN+j8KJSGY1GjXAIMj1Wv47kv5UYrXOLxbIBbAYyHggE5ig/VQH5fH4SwEEk/4PkB5STVp3T6ayC/q0G/gvlpyqgWq1OMSAKiENqlNNrdPgBT4DPgtXJVCql3Lo6VQEAf2QJ4NA29cy/2bCIOsYXEFMmk2Hnx5OmKgAO/QyB/uYJsrPJY6xKpfIYuzWUqgAYm7qO6W9J1IzVjC2bVArZ8kYDXgBngF06o63/G/b/IeQTtuES5G+rrd0xbkh2nc8qYxoMhlsJxl9UYBRxBKFMbeuUMcvl8q58NKK6rpx8WqpDIexAGmJYuQCfzzemxbkbGHz2FTAfY7H4LuAMcAY4A5wBzgBngDPAGZCfZH6/v7sv0BfebniOydZ3/wT/AfO7xyldFzaLAAAAAElFTkSuQmCC"
										width="16" height="20">
								</div>
								<input type="password" placeholder="비밀번호 *8~16자의 영문, 숫자사용"
									autocomplete="new-password" value="" id="passInput" name="userPw">
							</div>
						</div>
						<div class="signin-common-margin">
							<div class="input-box">
								<div class="signin-img">
									<img alt="비밀번호 확인 Input 아이콘"
										src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAoCAYAAACfKfiZAAAAAXNSR0IArs4c6QAAAktJREFUWAntVk1IYlEU9j0fKi2GCINoEbOJGLdFthtdtGhhQZEQBTMQRBBEm8gJ/9ei4CIwoha1cBbNajZu1GhTMtN2ZtMmJKQg0DQURp3vhj7svVO8VGpzLxzuved85+d+790fQaehhUIhc6lUWgTUUa/XR9APQCSF6x3mWUhSFMW41+s9V9jJqUBqG0okE4PB4Cb6bag+vIQlbD9NJtOay+W6Imyy6tkCYrFYTy6XiyO5o4FOCoKwbzQaT61W67Xdbv8nR8EgHA73FYvF4VqtNo3pKqQPciNJ0ozb7T7DmGxkAUgqYOXf0c8j6T0o/erxeH6QEQhlJBLpLRQKO/BfgPlOr9ePw/+SgOr0lBIJl+H8DbYHjG34nkkK95wukUiU0+n0sc1mMwPzGbEmMN+j8KJSGY1GjXAIMj1Wv47kv5UYrXOLxbIBbAYyHggE5ig/VQH5fH4SwEEk/4PkB5STVp3T6ayC/q0G/gvlpyqgWq1OMSAKiENqlNNrdPgBT4DPgtXJVCql3Lo6VQEAf2QJ4NA29cy/2bCIOsYXEFMmk2Hnx5OmKgAO/QyB/uYJsrPJY6xKpfIYuzWUqgAYm7qO6W9J1IzVjC2bVArZ8kYDXgBngF06o63/G/b/IeQTtuES5G+rrd0xbkh2nc8qYxoMhlsJxl9UYBRxBKFMbeuUMcvl8q58NKK6rpx8WqpDIexAGmJYuQCfzzemxbkbGHz2FTAfY7H4LuAMcAY4A5wBzgBngDPAGZCfZH6/v7sv0BfebniOydZ3/wT/AfO7xyldFzaLAAAAAElFTkSuQmCC"
										width="16" height="20">
								</div>
								<input type="password" placeholder="비밀번호 확인"
									autocomplete="new-password" value="" id="passInputCk" >
							</div>
						</div>
					</div>

					<div class="info-input-outline">
						<div class="signin-common-margin">
							<div class="input-box">
								<div class="signin-img">
									<img alt="이름 Input 아이콘"
										src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAAwCAYAAABuZUjcAAAAAXNSR0IArs4c6QAABCNJREFUaAXtWUtS20AQtWxXJSEbZ8XWuYH4rcEnwNzALg6Q5AQJy6yAE1icIOYEmDWf6AbRispSqwSqAOU91QwetUbWSAFjqpgq10z39OdNT89P9hqPVNbW1vowtY2fr36m5RAEf8cXFxdjs6Nu26urqPVWV1cHnud9Bd3VvJI6SpJk7/LyMiiRm9ldG/jGxoZ/f38/gnVGuE4Jm83m8OzsjDNRudQCrkCfwFunssesQgzwvTrgKwMvAR0jbQKkwinqmBjR7qC9iXoA0jbQWuArAfd9v9NqtX5ZAMQAxrw9QF9hwXr4jEFwPcgBxHd3dx/DMEwHW2jA6Gga7dImQO9DSDplrvbKQNM4ZSiLZkjaKAwIbTsX54gj2l0VbdN45UhRuWjmVNQj00FR2zniAM0pzhRM+06V6dXK1KGupnVt86H7ZO0MHIp9oRycn59PBM+ZVLqBUJA+RPeUdAK+vr6+BRWZ28dTM7Vb0kZH+So16AQcB40vLT3G0W2zYfMlfZN2Ao6dQEZ7YjNWk5exZfFlNdu2cisw/4ze7DeSise+1wiXhjdfKrjJif43cAV6K2d5FiOZ1enW55QqyLtYmJvmfNKQC0yIWsisztQWRC2+LAbcczwU2h3eWcjzmt4YVSz6Z5Gx0mkoGx1TGDkemnRR2ynitv0akflEo++G1xHSZa/IQY4P2VQHHdqGKWPzZfbrthNwJRxoJVUPdNSXdm8OksQrBU8ZylJf6Q6ULV0FulFWOwPHEX0kjSFiI947yH+/e/0NMj1EfyzlyGMfZdhHHepKOZsPKaNp50sWFfCu/IGqr5VVHeJy1JN3lr+jt93rxnX8YZjNf3XBOoGuL+yMcSDtCF4hWQk4nPKG+BPW0igbVmO0h7aT0JDhwDloRjqnj8GvYPCRKT+rXQk4DfEugUcDI2YrfAgfcme4vb2NKNBut7tICx9pwMXcJU8WppHrotS6lYFTUb3sczmqjVapMdBhnRd/LeAExl0BkWTOd0nXKBFmZqfOQ5m+WjUcpipXV1e/l5eXj5DzN2D4+L11tMVHxHfkNCMdOerkxGpH3LTEnQLR44ehTfC38MstPvAmSItTzFIgdyD0LU7hInZ9FCwO6lckxRGYmePMXezDXHhzLzgHsBSKPxBZgat9mgfGs4A2ohTyQLPt8xngam/mwfLcgA3saZNfyzJfdh+AK9A8yuVWJo08Fx0D/MOX3RR4CegYSMM5o+WM2wL4AD59LKu7sRTkhYlfYIM5g07dFfzToe/xK17Bhcl6x573AIru7ryYNXFMbwtA/AKbexgImbmQ3A6JBc5i0yEx8+nWF8zDWfunKTuPNrEA6KHw1be9OSdCaBHIHCYb8EUAmsGgX1Mm80UAR7pEJmi2XwRwCfoVuC0iT817TZWnjrC0/2Ij/g8RGqgJ9UrG3gAAAABJRU5ErkJggg=="
										width="18" height="15">
								</div>
								<input type="text" placeholder="이름" value="" id="nameInput" name="userName">
							</div>
						</div>
						<div class="signin-common-margin">
							<div class="input-box">
								<div class="signin-img">
									<img alt="휴대폰 번호 Input 아이콘"
										src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAoCAYAAACb3CikAAAAAXNSR0IArs4c6QAAAKJJREFUWAntmNEKgCAUQ7vRh/vnFcHtYbAUssuC9WLTl3m2QIvW2r4IPKuAh8vClkZOMpHvlWMmIkPERjD+uyO4kNnh/FvNuigTDSWSO2c7yPXRsUdYhoiNYKQmYiJIALU7YiJIALU7YiJIALU7YiJIAPXImbXkbixTVkpk1ukdI2BahoiMkadoPikpi/wXREp/3MgQkTESvVs6++5nz8sQOQDArxrcaIpJNgAAAABJRU5ErkJggg=="
										width="17" height="20">
								</div>
								<input type="text" placeholder="휴대폰 번호(숫자만 허용)"
									autocomplete="username" value="" id="phoneNumber" name="userPhone" required>
								<div class="signin-common-margin">
									<div class="input-box hide" id="verifyNumberDiv">
										<div class="signin-img">
											<img alt="인증번호 Input 아이콘"
												src="data:image/png;base64,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"
												width="19" height="20">
										</div>
										<input type="text" placeholder="인증번호" value="">
									</div>
								</div>
								<button id="verifyBtn" class="verify" type="button" disabled>인증번호 요청</button>
							</div>
						</div>
					</div>

					<div class="info-input-outline">
						<div class="signin-common-margin">
							<div class="input-box">
								<input class="form-control" style="width: 40%; display: inline;"
									placeholder="우편번호" name="userZipcode" id="zipcodeInput"
									type="text" readonly="readonly">
								<button type="button" class="btn zipcode-btn"
									onclick="execPostCode();">
									<i class="fa fa-search"></i>우편번호
								</button>
							</div>
						</div>

						<div class="signin-common-margin">
							<div class="input-box">
								<input type="text" placeholder="주소를 검색해주세요" name="userAddress1"
									id="address1Input" readonly="readonly">
							</div>
						</div>

						<div class="signin-common-margin">
							<div class="input-box">
								<input type="text" placeholder="상세주소를 입력해주세요"
									name="userAddress2" id="address2Input">
							</div>
						</div>
					</div>

					<div class="info-input-outline">
						<div class="signin-common-margin">
							<div class="signin-select">
								<div class="select-for-recommend">
									<div class="gender-check">
										<div class="signin-img">
											<img alt="추천인 코드 Input 아이콘"
												src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACwAAAAoCAYAAACFFRgXAAAAAXNSR0IArs4c6QAAA9tJREFUWAntmFtIFGEUx93dWVHoghChGBUFZhEG2ZVIBR+CKKSHjHqISMHCpygfvOyuupIp2YMkJOiDUc+hvVQIVttDhUWRlFAEklGLhCTlld3td5adZR1ml9nZbTfCDw7nfN+5/efM+WbmG0tGEkYgELC0trZWEqoK2gcprL212WwdDodjKAkpwiEsYcmk0N7enrO4uHgPgKV6ISwWyxWXy9WlpzOzZjXjpPp0d3evWVhYeBYCO2O1Wuuys7PzMzMz1wPUiZ0fXSfVP6T6JMqVRAJMT0/fwn8H9B2Q5Q0NDe8j4rlbWlrsAHb4/f7rrB+M0JkWTVcYMBWAOU0lfYqiVGjABgHl5ua6ESahA8mqsmnAgKgXVIDuampqeimydtTU1CxxQTdlnSqf0erNzE0BplqlAN0PmDlaoTNWYrvdPih6bE/EsjOqMwWYalWHEtyhFX7ESoZ+HLATXGCe2+3eFsvWiC5uwL29vXYAHJfg8AEjSQD7UOzgh43Yx7KJG7DX691D4rWA/VlYWPg8VnBVx+POIzJ3Zq+6ZpbHDRiwJaFkw5WVlT6DiT+E7HYatI9qFvdzGMC7Q9FGokbVKHiZjM/OzuIa2MmGLdaoo055tU82NjZ6Iw3iBoxzkQSgJd5EBool19XV/W5ubv6CzUbaYjSWbaQO2wz8nvKcP8ujc0J0cbUEFRL7LeLI42xMuNHBBV7DdhT+yihh/wsq8fl8g7LZJVf446ejo2PD/Px8NaCKCZgnSp0hr9oi9At80GTp6JO61NPTs2pqauodQTezccucTueTYIV5zZ4E7BhgXCiPCegoFGwHdEY3W0IXUFtbKxUeliDkLBCuyMOckt9GlooN0ej9KL+KUjvQ7VpaWuqnwrp6rX2S5n6JQ85gNyg0tlQ1i/kAt/mcKKMNdriqmlGFVHNpCTkhZPDOv5rq5GbyWbn9W8Wxvr7+o5kAqfYJbjpJSksEUp3cTL4wYDPO6fBZAfy3q75S4ZUKayqw0hKagiR9+v9UmE/OI0JJL1GCAXUrDFAX3xgPhEROMEdS3XUBA7RMzRIpq2vp5LqA+RDqg3wh6ksnQG1uXcB8yN/lpJovJLLWKZVzipYTyjcv3MrCNxHa2tryhatD/gdo/wmoulRx2lEKGjxgcAj9JHll4bUIHJWqhP9LgyPZZUBvAtPngoKCF4JNAfkNwB6FHHJmY97PT4tUHjKX1WhkZETxeDzbAXoRxQU6IACdV3+LBU+i/F1pYdGBUfg/xbIoaZqAaY7Ul9hHvSoEmwiPGeXl5R7EdRithgula8ix3guO+9ztU/w8eRQJ5A/ThXtUNuu8qQAAAABJRU5ErkJggg=="
												width="22" height="20" />
										</div>
										<label class="select-space-right">성별</label> <select
											name="userGender" id="genderInput">
											<option value="">선택</option>
											<option value="M">남성</option>
											<option value="F">여성</option>
											<option value="E">기타</option>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="terms-check-outline">
						<div class="all-check-outline">
							<div class="check-margin">
								<div class="terms-check-box">
									<div id="ch-all" class="terms-check"></div>
									<div class="checkbox-info">전체동의하기</div>
								</div>
							</div>
						</div>
						<div class="check-padding">
							<div class="check-margin">
								<div class="terms-check-box">
									<div id="ch-first" class="terms-check"></div>
									<div class="checkbox-info">
										<span class="mandatory">(필수)</span>번개장터 이용약관 동의
									</div>
									<button id="show1" class="show-btn show-bt1">
										<img
											src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAALRJREFUOBFjYBgFgzMEqqtb5Cl1GcwMxoaGdoVfv3+d+s/EGNreXHeQHINrapod/v3/t4qRgdmU+cCBvR9sHJxOMf77vxpEHzm0/yEphlbWNtkz/P+/GuSgtpbai8wgzSBDyDEUZBjIIci+AxtIjqHYDAOZAzeQFENxGYZhIDGG4jMMq4H4DCVkGEgvI4jABZANAKlBjwBs+vAaCNIAS2MgNnJsgvhkA5ChINeSbcCoRpJCAADCUaKHyL/YQQAAAABJRU5ErkJggg=="
											width="20" height="20" alt="회원가입 아이콘">
									</button>
								</div>
								<div class="hide-term hide1" id="term-1">
									<div class="terms-second-scroll">
										<iframe title="번개장터 위치기반서비스 이용약관"
											src="https://terms.bunjang.co.kr/terms/service.html"></iframe>
									</div>
								</div>
							</div>
							<div class="check-margin">
								<div class="terms-check-box">
									<div id="ch-second" class="terms-check"></div>
									<div class="checkbox-info">
										<span class="mandatory">(필수)</span>개인정보 처리 방침 동의
									</div>
									<button id="show2" class="show-btn show-bt2">
										<img
											src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAALRJREFUOBFjYBgFgzMEqqtb5Cl1GcwMxoaGdoVfv3+d+s/EGNreXHeQHINrapod/v3/t4qRgdmU+cCBvR9sHJxOMf77vxpEHzm0/yEphlbWNtkz/P+/GuSgtpbai8wgzSBDyDEUZBjIIci+AxtIjqHYDAOZAzeQFENxGYZhIDGG4jMMq4H4DCVkGEgvI4jABZANAKlBjwBs+vAaCNIAS2MgNnJsgvhkA5ChINeSbcCoRpJCAADCUaKHyL/YQQAAAABJRU5ErkJggg=="
											width="20" height="20" alt="회원가입 아이콘">
									</button>
								</div>
								<div class="hide-term hide2">
									<div class="terms-second-scroll">
										<iframe title="번개장터 위치기반서비스 이용약관"
											src="https://terms.bunjang.co.kr/terms/privacy.html"></iframe>
									</div>
								</div>
							</div>
							<div class="check-margin">
								<div class="terms-check-box">
									<div id="ch-third" class="terms-check"></div>
									<div class="checkbox-info">
										<span class="suggest">(선택)</span>위치기반서비스 동의
									</div>
									<button id="show3" class="show-btn show-bt3">
										<img
											src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAALRJREFUOBFjYBgFgzMEqqtb5Cl1GcwMxoaGdoVfv3+d+s/EGNreXHeQHINrapod/v3/t4qRgdmU+cCBvR9sHJxOMf77vxpEHzm0/yEphlbWNtkz/P+/GuSgtpbai8wgzSBDyDEUZBjIIci+AxtIjqHYDAOZAzeQFENxGYZhIDGG4jMMq4H4DCVkGEgvI4jABZANAKlBjwBs+vAaCNIAS2MgNnJsgvhkA5ChINeSbcCoRpJCAADCUaKHyL/YQQAAAABJRU5ErkJggg=="
											width="20" height="20" alt="회원가입 아이콘">
									</button>
								</div>
								<div class="hide-term hide3">
									<div class="terms-second-scroll">
										<iframe title="번개장터 위치기반서비스 이용약관"
											src="https://terms.bunjang.co.kr/terms/location.html"></iframe>
									</div>
								</div>
							</div>
							<div class="check-margin">
								<div class="terms-check-box">
									<div id="ch-fourth" class="terms-check"></div>
									<div class="checkbox-info">
										<span class="suggest">(선택)</span>이메일,SMS 광고 수신 동의
									</div>
								</div>
							</div>
							<div class="fyi">*선택항목은 동의하지 않아도 회원가입이 가능합니다</div>
						</div>
					</div>
					<button class="signup-btn" id="signupBtn">가입하기</button>
				</div>
			</div>
		</form>
		
	</div>
</body>
<!-- The core Firebase JS SDK is always required and must be listed first -->
<!-- <script src="https://www.gstatic.com/firebasejs/7.17.2/firebase-app.js"></script> -->

<!-- TODO: Add SDKs for Firebase products that you want to use
     https://firebase.google.com/docs/web/setup#available-libraries -->
<!-- <script src="https://www.gstatic.com/firebasejs/7.17.2/firebase-analytics.js"></script> -->
</html>