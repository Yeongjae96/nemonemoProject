$(function() {
	const socket = openSocket();
	initTopMenu();
	initUserMessage(socket);
});

/* 소켓 연결 */
function openSocket() {
	const wsUri = "ws://" + location.host +contextPath + "talk/open.do";
	const webSocket = new WebSocket(wsUri);
	webSocket.onopen = onOpen;
	webSocket.onmessage = onMessage;
	webSocket.onerror = onError;
	
	/* 소켓이 열렸을 때 */
	function onOpen(evt) {
		console.log(evt);
	}

	/* 서버로 부터 수신 */
	function onMessage(evt) {
		console.log(evt);
		console.log(evt.data);
	}

	/* 에러 발생 시 */
	function onError(evt) {
		console.log(evt);
	}
	
	return webSocket;
}

/* 서버로 보내는것  */
function sendMessage(obj) {
	const webSocket = obj.data.webSocket;
	if(!webSocket) {
		alert('소켓 연결이 되어있지 않습니다.');
		return false;
	}
	
	console.log(obj);
	
	
	if(obj.type !== 'SendMsg') {
		return false;
	}
	delete obj.data['webSocket'];
	
	console.log(obj);
	console.log(JSON.stringify(obj.data));
	
	webSocket.send(JSON.stringify(obj.data));
}

/* 상위 메뉴 이벤트 걸어 주기 */
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


function initUserMessage(socket) {
	
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
		// 개발용 데이터 콘솔
		console.log(data);
		
		const root = document.querySelector('.talk-user-area');
		const msgListDiv = document.querySelector('.talk-user-msg-list');
		
		// 에러 핸들링
		if(data.result == 'notFoundUserSession') throw new Error("notFoundUserSession");// 데이터가 없으면 error cat9ch 할 수 있게 에러 throw
		else if(data.result != 'success') throw new Error('exception');
		
		
		// 상단 내용 채우기
		writeHeader();
		// 내용물 채우기
		writeBody();
		// 하단 이벤트 걸기 
		writeFooter();
		
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
			
			/* 상품 내용 뿌리기 */
			function writePdArea() {
				// 상품 정보에 필요한 태그 만들기
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

				/* 부모 페이지 상품으로 이동시키기 */
				function moveParentWindowPdItem(e) {
					e.preventDefault();
					opener.location.href = contextPath + 'products/' + data.productNo + '.do';
				}
			}
		}
		
		/* 내용 채우기 */
		function writeBody() {
			
			if(!data.msgList.length) {
				writeNothingMsgForm();
			} else {
				writeMsgList(data.myUserNo, data.msgList);
			}
			
			/* 불러온 메시지가 없을 때 기본 폼 */
			function writeNothingMsgForm() {
				// 기본 폼 가져오기
				let inputHTML = '';
				inputHTML += '<article class="talk-user-template-area">';
				inputHTML += '<img src="'+ contextPath +'resources/images/common/logo/favicon.png">'
				inputHTML += '<h2>네모톡, 간편하게 시작해요!</h2>';
				inputHTML += '<p>판매자에게 메시지 바로 보내기</p>';
				inputHTML += '</article>'
				inputHTML += '<ul class="talk-user-template-list">'
				inputHTML += '<li class="talk-user-template-item">'
				inputHTML += '이 상품에 관심있어요!'
				inputHTML += '<img src="'+ contextPath +'resources/images/user/talk/up-arrow.svg">'
				inputHTML += '</li>'
				inputHTML += '<li class="talk-user-template-item">'
				inputHTML += '안녕하세요. 네모페이 되나요?'
				inputHTML += '<img src="'+ contextPath +'resources/images/user/talk/up-arrow.svg">'
				inputHTML += '</li>'
				inputHTML += '<li class="talk-user-template-item">'
				inputHTML += '안녕하세요. 직거래 되나요?'
				inputHTML += '<img src="'+ contextPath +'resources/images/user/talk/up-arrow.svg">'
				inputHTML += '</li>'
				inputHTML += '</ul>'
					
				msgListDiv.innerHTML = inputHTML;
			}
			
			/* 불러온 메시지 리스트가 있을 때 기본 폼 */
			function writeMsgList(myUserNo, msgList) {
				
			}
		}
		
		/* 아래부분 이벤트 걸어주기 */
		function writeFooter() {
			
			const msgInput = document.getElementById('msgInput');
			
			msgInput.addEventListener('keydown', send);
			
			
			/* 메시지 보내기 */
			function send(e) {
				if(!(e.keyCode == 13 && !e.shiftKey) || !msgInput.value.trim().length) return false;
				e.preventDefault();
				const userMsg = msgInput.value; // 텍스트
				const msg = new SendMsg(userMsg, 'N'); // 객체 만들어서
				
				const obj = {type: 'SendMsg',data: msg};
				
				sendMessage(obj);
				
				msgInput.value = ''; // 입력칸 비워준다.
				/* 소켓으로 보내줄 메시지 객체 구성 */
				function SendMsg(text, msgType) {
					this.webSocket = socket;
					this.msgContent = text;
					this.talkNo = data.talkNo;
					this.msgType = msgType;
					this.msgReceiver = userNo;
					this.msgRegDt = new Date().toJSON();
					this.msgSender = data.myUserNo;
					return this;
				}
			}
			
			
		}
	}
	
	/* 데이터가 없을 때 에러 처리 */
	function throwError(error) {
		let errorMsg = '';
		switch (error.message) {
			case 'notFoundUserSession': errorMsg = '로그인이 필요한 서비스 입니다.'; break;
			default: errorMsg = '알수없는 에러 입니다.'; break;
		}
		alert(errorMsg);
		if(error.message == 'notFoundUserSession')  {
			self.close();
		}
		
		console.dir(error);
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
	/* document.createTextNode를 좀 더 쉽게 쓰기 위함 */
	function cT(text) {
		const textType = typeof text;
		if(!text && (textType == 'string' || textType == 'number')) return null;
		return document.createTextNode(text);
	}
	
}













