/*카카오 로그인 코드*/
document.addEventListener('DOMContentLoaded', function() {
	var startKakaoLogin = function() {
		Kakao.init('febc31efd1b6f21901d27fb57cc55aa7');
		Kakao.Auth.createLoginButton({
			success : function(authObj) {

				Kakao.API.request({
					url : '/v2/user/me',
					success : function(res) {

						var userEmail = res.kakao_account.email;
						var userName = res.properties.nickname;
						document.getElementById('kakaoInfo').value = userEmail;
						document.getElementById('kakaoName').value = userName;

						document.kakaoSubmit.submit();
					}
				})
				console.log(authObj);
				var token = authObj.access_token;
			},
			fail : function(err) {
				alert(JSON.stringify(err));
			}
		});
	}
});
