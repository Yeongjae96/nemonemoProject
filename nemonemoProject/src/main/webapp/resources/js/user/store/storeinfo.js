function updateCheck() {
	if (confirm("정말 수정하시겠습니까??") == true) { // 확인
		document.updatestore.submit();
		alert("다시 로그인 해주세요");
	} else { // 취소
		return;
	}

}

$('.terms-upd-btn').click(function() {
	const termsno = $(this)[0].dataset.termsno;
	window.location.href="edit.mdo?termsNo="+termsno;
});



function checks(){ 
	var getCheck= RegExp(/^[a-zA-Z0-9]{8,16}$/);
	
	// 상점명 공백 확인
	if($("#storeName").val() == ""){ 
		alert("상점명을 입력해주세요"); 
		$("#storeName").focus(); 
		return false; 
		} 

	// 상점소개 공백 확인
	if($("#storeIntro").val() == ""){ 
		alert("상점소개를 입력해주세요"); 
		$("#storeIntro").focus(); 
		return false; 
		} 
	
	updateCheck();
	
}

