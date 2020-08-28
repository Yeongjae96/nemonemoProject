
// 중복체크
/*function withdrawUser(){
	$('.withdrawbtn').click(function(e) { // 회원가입 버튼을 누르면
		if (confirm("정말 탈퇴 하시겠습니까??") == true) { // 확인
			document.withdrawbtn.submit();
			alert("안녕히 가세요");
		} else { // 취소
			return;
		}
	});
}
*/
$(document).on("click", "#withdrawbtn", function(){
	if (confirm("정말 탈퇴 하시겠습니까??") == true) { // 확인
		document.withdrawbtn.submit();
		alert("안녕히 가세요");
	} else { // 취소
		return;
	}
});