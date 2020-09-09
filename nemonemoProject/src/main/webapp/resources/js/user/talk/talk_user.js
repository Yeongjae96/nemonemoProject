$(function() {
	
	window.addEventListener('beforeunload', function (e) {
		e.preventDefault();
		exitTalkRoom();
	});
	
	
	let socket;
	let prevDate = '';
	let getData;
	
	let isFirstMsg = false;
	const msgListDiv = document.querySelector('.talk-user-msg-list');
	
	initTopMenu();
	initUserMessage();

	/* 소켓 연결 */
	function openSocket() {
		const wsUri = "ws://" + location.host +contextPath + "talk/open.do";
		socket = new WebSocket(wsUri);
		socket.onopen = onOpen;
		socket.onmessage = onMessage;
		socket.onerror = onError;
		
		/* 소켓이 열렸을 때 */
		function onOpen(evt) {
			enterTalkRoom();
		}
	
		/* 서버로 부터 수신 */
		function onMessage(evt) {
			const data = evt.data
			switch(data.response) {
			case 'sendMsg':
				receiveMsg(data.data);
				break;
			default:
				break;
			}
		}
	
		/* 에러 발생 시 */
		function onError(evt) {
			console.log(evt);
		}
	}
	
	/* 서버로 보내는것  */
	function sendMessage(obj) {
		if(!(obj.request && obj.sender)) return;
		socket.send(JSON.stringify(obj));
	}
	
	/* 대화방 입장하기  */
	function enterTalkRoom() {
		sendMessage({
			request: 'enterTalkRoom',
			sender: getData.currentUserNo,
			receiver: getData.opponentUserNo
		});
	}
	
	/* 대화방 퇴장하기  */
	function exitTalkRoom() {
		sendMessage({
			request: 'exitTalkRoom',
			sender: getData.currentUserNo,
			receiver: getData.opponentUserNo
		});
	}
	
	/* 메세지 수신하기 */
	function receiveMsg(data) {
		
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
					.then(openSocket)
					.catch(throwError);
		
		/* 화면 그리기 */
		function writeDocumentData(data) {
			// 개발용 데이터 콘솔
			getData = data;
			
			const result = data.result.split(':');
			
			// 에러 핸들링
			if(result[0] == 'fail') throw new Error(result[1]);// 데이터가 없으면 error cat9ch 할 수 있게 에러 throw
			console.log(data);
			const root = document.querySelector('.talk-user-area');
			
			
			// 현재 사용자정보
			const currentUserNo = data.currentUserNo;
			
			// 상단 내용 채우기
			writeHeader();
			// 내용물 채우기
			writeBody();
			// 하단 이벤트 걸기 
			writeFooter();
			
			/* 상단 내용 채우기 */
			function writeHeader() {
				
				writeTitleArea();
				if(parametersObj.productNo) writePdArea();
				
				function writeTitleArea() {
					// 제목 영역
					const headerTitle = document.getElementById('headerTitle');
					// 제목 DOM 생성
					const frag = document.createDocumentFragment();
					const storeName = DOMUtil.cT(data.storeName); // 텍스트 노드
					const bArrow = DOMUtil.cE('i', {'class': 'fas fa-chevron-up'});
					
					frag.append(storeName, bArrow);
					
					// 상품 영역
					headerTitle.appendChild(frag);
				}
				
				/* 상품 내용 뿌리기 */
				function writePdArea() {
					// 상품 정보에 필요한 태그 만들기
					const frag = document.createDocumentFragment();
					const pdAreaDiv = DOMUtil.cE('div', {class:'talk-user-pd-area'});
					const pdLinkA = DOMUtil.cE('a', {class:'talk-user-pd-link'});
					const img = DOMUtil.cE('img', {src: contextPath + 'image/product/' + data.productImgNo+'.img'});
					const pdInfoArea = DOMUtil.cE('div', {class:'talk-user-pd-info'});
					const pdPriceDiv = DOMUtil.cE('div', {class: 'talk-user-pd-price'});
					const pdPrice = DOMUtil.cT(data.productPrice);
					const priceSmall = DOMUtil.cE('small', '원');
					const infoTitleDiv = DOMUtil.cE('div', {class: 'talk-user-pd-title'}, data.productName);
					const nemoPayBtn = DOMUtil.cE('button', {class: 'talk-user-pd-btn'}, '네모페이');
					
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
					msgListDiv.innerHTML = '';
					writeMsgList(data);
				}
				msgListDiv.scrollTop = msgListDiv.scrollHeight;
	
				/* 일반 userMsg */
				/*function userMsg(direction) {
					const frag = document.createDocumentFragment();
					const li = DOMUtil.cE('li', {class: 'talk-item'});
				}*/
				
				/* 불러온 메시지가 없을 때 기본 폼 */
				function writeNothingMsgForm() {
					// 기본 폼 가져오기
					isFirstMsg = true;
					
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
				function writeMsgList(obj) {
					
					const msgList = obj.msgList;
					const frag = document.createDocumentFragment();
					
					msgList.forEach(e => {
						writeSendMsg(frag, e);
					});
					
					msgListDiv.append(frag);
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
					const tempObj = {
							msgContent: userMsg,
							talkNo: data.talkNo,
							msgType: 'N',
							msgReceiver: userNo,
							msgRegDt: new Date(),
							msgSender: currentUserNo,
							msgConfirmSt: 'N'
					}
					const msg = new SendMsg(tempObj); // 객체 만들어서
					
					const obj = {request: 'sendMsg',sender: currentUserNo, receiver: userNo, data: msg};
					
					sendMessage(obj);
					msgInput.value = ''; // 입력칸 비워준다.
					
					if(isFirstMsg) {
						const templateArea = document.querySelector('.talk-user-template-area');
						const templateList = document.querySelector('.talk-user-template-list');
						
						templateArea.parentNode.removeChild(templateArea);
						templateList.parentNode.removeChild(templateList);
						isFirstMsg = false;
					}
					
					
					msgListDiv.append(writeSendMsg(tempObj));
					msgListDiv.scrollTop = msgListDiv.scrollHeight;
					
				}
			}
		}
		
		/* 데이터가 없을 때 에러 처리 */
		function throwError(error) {
			let errorMsg = '';
			switch (error.message) {
				case 'login': errorMsg = '로그인이 필요한 서비스 입니다.'; break;
				default: errorMsg = '알수없는 에러 입니다.'; break;
			}
			alert(errorMsg);
			if(error.message == 'login')  {
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
	}
	
	/* 내 메세지 그리기 */
	function writeSendMsg(frag, e) {
		/*
		 * date찍는것
		 */
		function timeStampToYYYYMMDD(date) {
			return DateUtil.format(new Date(date), 'yyyyMMdd');
		}
		
		if(frag && frag.constructor == Object) {
			e = frag;
			frag = document.createDocumentFragment();
		}
		
		const msgDiv = DOMUtil.cE('div', {class: 'talk-user-normal-msg'});
		
		if(!prevDate || prevDate != timeStampToYYYYMMDD(e.msgRegDt)) {
			prevDate = timeStampToYYYYMMDD(e.msgRegDt);
			const dateDiv = DOMUtil.cE('div', {class: 'talk-user-msg-date'}, DateUtil.format(new Date(e.msgRegDt), 'yyyy. m1. d1 KL '));
			msgDiv.append(dateDiv);
		}
		
		const msgArea = DOMUtil.cE('div', {class: 'normal-msg-area'});
		
		const msgFlex = DOMUtil.cE('div', {class: 'normal-msg-flex'});
		const msgContent = DOMUtil.cE('div', {class: 'normal-msg-content'}, e.msgContent);
		
		const msgTimeArea = DOMUtil.cE('div', {class: 'normal-msg-time-area'});
		
		const msgTimeStatus = (e.msgConfirmSt == 'N' && e.msgSender != getData.currentUserNo) ? DOMUtil.cE('div', {class: 'normal-msg-status'}, '안읽음') : '';
		const msgTimeText = DOMUtil.cE('div', {class: 'normal-msg-time-text'}, DateUtil.format(new Date(e.msgRegDt), 'a/p hh:mm'));
		
		frag.append(msgDiv);
		msgDiv.append(msgArea);
		
		msgArea.append(msgFlex, msgTimeArea);
		msgFlex.append(msgContent);
		if(msgTimeStatus) msgTimeArea.append(msgTimeStatus);
		msgTimeArea.append(msgTimeText);
		
		return frag;
	}
	
	/* 받은 메세지 그리기 */
	function writeReceiveMsg(frag, e) {
		/*
		 * date찍는것
		 */
		function timeStampToYYYYMMDD(date) {
			return DateUtil.format(new Date(date), 'yyyyMMdd');
		}
		
		if(frag && frag.constructor == Object) {
			e = frag;
			frag = document.createDocumentFragment();
		}
		
		const msgDiv = DOMUtil.cE('div', {class: 'talk-user-response-msg'});
		
		if(!prevDate || prevDate != timeStampToYYYYMMDD(e.msgRegDt)) {
			prevDate = timeStampToYYYYMMDD(e.msgRegDt);
			const dateDiv = DOMUtil.cE('div', {class: 'talk-user-msg-date'}, DateUtil.format(new Date(e.msgRegDt), 'yyyy. m1. d1 KL '));
			msgDiv.append(dateDiv);
		}
		
		const msgArea = DOMUtil.cE('div', {class: 'normal-msg-area'});
		
		const msgFlex = DOMUtil.cE('div', {class: 'normal-msg-flex'});
		const msgContent = DOMUtil.cE('div', {class: 'normal-msg-content'}, e.msgContent);
		
		const msgTimeArea = DOMUtil.cE('div', {class: 'normal-msg-time-area'});
		
		const msgTimeStatus = (e.msgConfirmSt == 'N' && e.msgSender != getData.currentUserNo) ? DOMUtil.cE('div', {class: 'normal-msg-status'}, '안읽음') : '';
		const msgTimeText = DOMUtil.cE('div', {class: 'normal-msg-time-text'}, DateUtil.format(new Date(e.msgRegDt), 'a/p hh:mm'));
		
		frag.append(msgDiv);
		msgDiv.append(msgArea);
		
		msgArea.append(msgFlex, msgTimeArea);
		msgFlex.append(msgContent);
		if(msgTimeStatus) msgTimeArea.append(msgTimeStatus);
		msgTimeArea.append(msgTimeText);
		
		return frag;
	}
	
	/* 소켓으로 보내줄 메시지 객체 구성 */
	
	/*
	 * obj.msgContent = 메세지 내용
	 * obj.talkNo = 대화방 방번호
	 * obj.msgType = 메시지 타입
	 * obj.msgReceiver = 받는사람
	 * obj.msgSender = 보내는 사람
	 * obj.ConfirmSt = 확인여부
	 */
	function SendMsg(obj) {
		this.msgContent = obj.msgContent;
		this.talkNo = obj.talkNo;
		this.msgType = obj.msgType;
		this.msgReceiver = obj.msgReceiver;
		this.msgRegDt = new Date(obj.msgRegDt).toJSON();
		this.msgSender = obj.msgSender;
		this.msgConfirmSt = 'N';
		return this;
	}

});







