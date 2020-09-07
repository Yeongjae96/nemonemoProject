$(function() {
	initTalkList();
	initUserMenuModal();
});

/* 사용자 메뉴 모달 */
function initUserMenuModal() {
	
	const talkListArea = document.querySelector('.talk-list-area');
	
	/*talkListArea.appendChild(modal);*/
	
}

/* 데이터 가져와서 뿌리기 */
function initTalkList() {
	var getTalkList = function() {
		return new Promise(function(resolve, reject) {
			$.ajax({
				url:''
			});
		});
	}
}