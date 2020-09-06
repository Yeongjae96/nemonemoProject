$(function() {
	initTopMenu();
	initUserMessage();
});

function initTopMenu() {
	
	HTMLElement.prototype.setStyle = function(styleName, style) {
		this.setAttribute('style', styleName + ':' + style + ';');
		console.log(styleName + ':' + style + ';');
	}
	
	// 메뉴 모달 영역
	const topMenuModal = document.querySelector('.top-menu-modal');
	const topMenuModalBg = document.querySelector('.modal-bg-area');
	const topMenuBtnArea = document.querySelector('.modal-menu-btn-area');
	const menuArea = document.querySelector('.talk-user-menu-area');
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
	}
}


function initUserMessage() {
	
	// productNo
	const url = window.location.href.substring(1);
	const userNo = url.slice(url.lastIndexOf('/')+1, url.lastIndexOf('.'));
	const parametersObj = getParamObj();
	
	const targetUrl = parametersObj.productNo ? 
			contextPath + 'talk/user/' + userNo + '/contact.do' : 
			contextPath + 'talk/user/' + userNo + '/list.do'
	
	function getUserData() {
		return new Promise(function(resolve, reject) {
			$.ajax({
				url: targetUrl,
				method: 'get',
				data: parametersObj,
				success: resolve,
				error: reject
			});
		});
	}
	
	
	getUserData().then(writeDocumentData)
				.catch(throwError);
	
	/* 화면 그리기 */
	function writeDocumentData(data) {
		
		const root = document.querySelector('.talk-user-area');

		
		if(!data) new Error();
		
		// 상단 내용 채우기
		writeHeader();
		
		
		
		// 내용물 채우기
		const msgList = data.msgList; // 메세지 리스트
		if(!msgList.length) {
			writeNothingMsgForm();
		} else {
			writeMsgList();
		}
		
		
		/* 상단 내용 채우기 */
		function writeHeader() {
			
			writeTitleArea();
			writePdArea();
			
			function writeTitleArea() {
				// 제목 영역
				const headerTitle = document.getElementById('headerTitle');
				// 제목 DOM 생성
				const frag = document.createDocumentFragment();
				const storeName = cT(data.storeName); // 텍스트 노드
				const bArrow = cE('i', {'class': 'fas fa-chevron-up'});
				
				frag.append(storeName, bArrow);
				
				// 상품 영역
				headerTitle.appendChild(frag);
			}
			
			function writePdArea() {
				// 기준 자식 찾기
				const msgListDiv = document.querySelector('.talk-user-msg-list');
				
				const frag = document.createDocumentFragment();
				const pdAreaDiv = cE('div', {class:'talk-user-pd-area'});
				const pdLinkA = cE('a', {class:'talk-user-pd-link'});
				const img = cE('img', {src: contextPath + 'image/product/' + data.productImgNo+'.img'});
				const pdInfoArea = cE('div', {class:'talk-user-pd-info'});
				const pdPriceDiv = cE('div', {class: 'talk-user-pd-price'});
				const pdPrice = cT(data.productPrice);
				const priceSmall = cE('small', '원');
				const infoTitleDiv = cE('div', {class: 'talk-user-pd-title'}, data.productName);
				const nemoPayBtn = cE('button', {class: 'talk-user-pd-btn'}, '네모페이');
				
				// 생성된 요소에 대한 이벤트
				pdLinkA.addEventListener('click', moveParentWindowPdItem);
				
				
				// 문서에 요소추가 하기 위한 메모리상에서 요소 추가
				frag.append(pdAreaDiv);
				pdAreaDiv.append(pdLinkA, nemoPayBtn);
				pdLinkA.append(img, pdInfoArea);
				pdInfoArea.append(pdPriceDiv, infoTitleDiv);
				pdPriceDiv.append(pdPrice, priceSmall);
				
				// 문서에 넣기
				root.insertBefore(frag, msgListDiv);
				
				console.log(data);
				
				function moveParentWindowPdItem(e) {
					e.preventDefault();
					opener.location.href = contextPath + 'products/' + data.productNo + '.do';
				}
			}
		}
		
		/* 불러온 메시지가 없을 때 기본 폼 */
		function writeNothingMsgForm() {
			
		}
		
		/* 불러온 메시지 리스트가 있을 때 기본 폼 */
		function writeMsgList() {
			
		}
		
		
	}
	/* 데이터가 없을 때 에러 처리 */
	function throwError(error) {
		console.log(error);
		alert('로그인이 되어야 사용 할 수 있는 서비스 입니다.');
	}
	
	/* 파라미터 가져와서 객체로 뿌려주는 것 */
	function getParamObj() {
		const param = {};
		const search = window.location.search.substring(1);
		if(!search.trim().length) return param;
		
		search.split('&').forEach(e => {
			const temp = e.split('=');
			param[decodeURI(temp[0])] = decodeURI(temp[1]);
		});
		
		return param;
	}
	
	/* document.createElement를 좀 더 쉽게 쓰기 위함 */
	
	function cE(tag, option, text) {
		console.log('요소 생성 : ', tag, option, text);
		if(!tag) return false;
		
		const result = document.createElement(tag)
		if(option.constructor != Object && option) {
			text = option;  
			option = undefined;
		}
		
		if(option) {
			Object.entries(option).forEach(([k,v]) => {
				result.setAttribute(k, v);
			});
		}
		
		if(text && typeof text == 'string') {
			const textNode = cT(text);
			if(result && textNode) {
				result.append(textNode);
			}
		}
		
		return result;
	}
	
	function cT(text) {
		const textType = typeof text;
		if(!text && (textType == 'string' || textType == 'number')) return null;
		return document.createTextNode(text);
	}
	
}













