$(function() {
	openSocket();
	initTalkList();
	initUserMenuModal();
	window.addEventListener('beforeunload', function (e) {
			e.preventDefault();
			sendMessage(JSON.stringify({result: 'hi'}));
	});
});

/* 소켓 연결 */
function openSocket() {
	const wsUri = "ws://" + location.host +contextPath + "talk/open.do";
	socket = new WebSocket(wsUri);
	socket.onopen = onOpen;
	socket.onmessage = onMessage;
	socket.onerror = onError;
	
	/* 소켓이 열렸을 때 */
	function onOpen(evt) {
		console.log(evt);
	}

	/* 서버로 부터 수신 */
	function onMessage(evt) {
		
	}

	/* 에러 발생 시 */
	function onError(evt) {
		console.log(evt);
	}
}

/* 서버로 보내는것  */
function sendMessage(obj) {
	if(!socket) {
		alert('소켓 연결이 되어있지 않습니다.');
		return false;
	}
	
	if(obj.type !== 'SendMsg') {
		return false;
	}
	
	socket.send(JSON.stringify(obj.data));
}


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
				url: contextPath + 'talk/list/data.do',
				method: 'get',
				dataType: 'json',
				success: resolve,
				error: reject
			});
		});
	}
	
	getTalkList().then(writeDocument)
				.catch(catchError);
	
	/* 데이터를 바탕으로 화면에 뿌려주기 */
	function writeDocument(data) {
		console.log(data);
		dataValidation();
		writeHeader();
		writeContent();
		setModalEvent();
		
		
		/* 에러 체크 */
		function dataValidation() {
			const result = data.result.split(':');
			const resultType = result[0];
			const resultMsg = result[1];
			if(resultType == 'fail') throw new Error(resultMsg);
		}
		
		/* writeHeader */
		function writeHeader() {
			const listTitle = document.querySelector('.list-header-title');
			
		}
		
		/* writeContent */
		function writeContent() {
			const contentList = document.querySelector('.talk-list-content');
			
			const dataArr = data.data;
			const myUserNo = data.currentUserNo;
			
			const frag = document.createDocumentFragment();
			
			dataArr.forEach(e => {
				const msgVO = e.lastRecentlyMsgVO;
				/* 리스트를 document에 그려준다.  */
				
				const opponentUserNo = msgVO.msgSender == myUserNo ? msgVO.msgReceiver : msgVO.msgSender; 
				
				const li = DOMUtil.cE('li', {class: 'talk-item', 'data-uid': opponentUserNo});
				const div = DOMUtil.cE('div', {class: 'talk-item-area'});
				
				const imageLink = DOMUtil.cE('a', {class: 'talk-item-image-link'});
				const hasImage = e.storeImgNo != -1 ? true : false;
				const src = hasImage ? contextPath + 'image/store/' + e.storeImgNo + '.img' : contextPath + 'resources/images/user/talk/base.svg';
				const image = DOMUtil.cE('img', {src:src});
				
				const previewLink = DOMUtil.cE('a', {class:'talk-item-preview-link'});
				const previewDiv = DOMUtil.cE('div', {class: 'talk-item-preview-div'});
				const previewTitle = DOMUtil.cE('div', {class: 'talk-item-preview-title'}, e.storeName);
				const previewContent = DOMUtil.cE('div', {class: 'talk-item-preview-content'}, msgVO.msgContent);
				
				const dateData = timestampToString(msgVO.msgRegDt);
				const dateDiv = DOMUtil.cE('div',{class:'talk-item-date'}, dateData);
				
				const menuArea = DOMUtil.cE('div',{class:'talk-item-menu-area'});
				const menuBtn = DOMUtil.cE('button',{class:'talk-item-menu-btn'});
				const iClass = DOMUtil.cE('i', {class: 'fas fa-ellipsis-v'});
				
				frag.append(li);
				li.append(div);
				div.append(imageLink, previewLink, dateDiv, menuArea)
				
				imageLink.append(image);
				
				previewLink.append(previewDiv);
				previewDiv.append(previewTitle, previewContent);
				
				menuArea.append(menuBtn);
				menuBtn.append(iClass);
				
			});
			
			/* 클릭시 대화방 이동 */
			contentList.addEventListener('click', enterTalkRoom);
			
			contentList.append(frag)
			
			/*
			 * 하루 지나면 전체날짜 오늘 안이면 시간만
			 */
			function timestampToString(date) {
				const temp = new Date(date);
				const comparableDate = DateUtil.format(temp, 'yyyyMMdd');
				const today = DateUtil.format(new Date(), 'yyyyMMdd');
				if(today != comparableDate) {
					return DateUtil.format(temp, 'yyyy. m1. d1 KL');
				};
				return DateUtil.format(temp, 'a/p h1:mm');
			}
				
			/* */
			function enterTalkRoom(e) {
				const tg = e.target.closest('li');
				if(!tg) return false;
				
				const targetUser = tg.dataset.uid;
				
				const setting = 'width=500px,height=667px,top='+(window.screen.height/2 - 375)+ ',left=' + (window.screen.width/2 - 250); 
				window.open(contextPath + 'talk/user/' + targetUser + '.do',targetUser, setting);
			}
		}
		
		/* setModalEvent */
		function setModalEvent() {
			
		}
		
		
		 
	}
	
	/* 에러 처치! */
	function catchError(error) {
		if(error.message && error.message == 'login') {
			alert('로그인이 필요한 서비스입니다.');
			self.close();
		} else {
			console.dir(error);
		}
		
	}
	
	
	
	
}