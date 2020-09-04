$(function() {
	initTopMenu();
});

function initTopMenu() {
	
	HTMLElement.prototype.setStyle = function(styleName, style) {
		this.setAttribute('style', styleName + ':' + style + ';');
		console.log(styleName + ':' + style + ';');
	}
	
	
	// 모달 영역
	const topMenuModal = document.querySelector('.top-menu-modal');
	// 모달안의 배경
	const topMenuModalBg = document.querySelector('.modal-bg-area');
	// 
	const topMenuBtnArea = document.querySelector('.modal-menu-btn-area');
	// 메뉴 버튼 영역
	const menuArea = document.querySelector('.talk-user-menu-area');
	// 메뉴 버튼
	const topMenuBtn = document.querySelector('.fa-ellipsis-v');
	
	// 메뉴 클릭하면 topMenuModal 띄우기
	menuArea.addEventListener('click', function() {
		topMenuModalChange(true);});
	// 메뉴 외의 topMenuModal 감추기
	topMenuModalBg.addEventListener('click', function() {
		topMenuModalChange(false);
	});
	
	
	/* 탑 메뉴 모달 display 바꾸기 */
	function topMenuModalChange(status) {
		console.log(status);
		topMenuModal.setStyle('visibility', (status ? 'visible' : 'hidden'));
		topMenuModalBg.setStyle('opacity', (status ? 1 : 0));
		topMenuBtnArea.setStyle('transform', (status ? 'translate3d(0px, 0px, 0px)' : 'translate3d(0px, -100%, 0px)'));
		topMenuBtn.style.color = (status ? 'rgb(21,25,29)' : '#CCCCCC');
		
		/*topMenuModal.style.visibility = status ? 'visible' : 'hidden';
		topMenuModalBg.style.opacity = status ? 1 : 0;
		topMenuBtnArea.style.transform = status ? 'translate3d(0px, 0px, 0px)' : 'translate3d(0px, -100%, 0px)';*/
	}
}
	
	
/*transform: translate3d(0px, 0px, 0px);*/