$(function() {
	
	let socket;
	let getData;
	
	initTalkList();
	initUserMenuModal();
	
	const talkListArea = document.querySelector('.talk-list-area');
	const contentList = document.querySelector('.talk-list-content');
	const talkItemElementList = document.getElementsByClassName('talk-item');
	
	let openWindow;
	
	/* 소켓 연결 */
	function openSocket() {
		
		/* 닫기 눌렀을 때 나간다는것을 전송하기 위한 메소드 */
		window.addEventListener('beforeunload', function (e) {
			e.preventDefault();
			exitTalkList();
			openWindow.window.opener = window.opener;
		});
		const wsUri = "ws://" + location.host +contextPath + "talk/open.do";
		socket = new WebSocket(wsUri);
		socket.onopen = onOpen;
		socket.onmessage = onMessage;
		socket.onerror = onError;
		
		/* 소켓이 열렸을 때 */
		function onOpen(evt) {
			enterTalkList();
		}

		/* 서버로 부터 수신 */
		function onMessage(evt) {
			console.dir(evt.data);
			const data = JSON.parse(evt.data);
			
			switch(data.response) {
			case "sendMsg":
				updateTalkList(data.data);
				break;
			case "refreshConfirmMark":
				refreshConfirmMark(data);
				break;
			case "deleteTalkRoom":
				deleteTalkRoom(data);
				break;
				default:
			}
		}

		/* 에러 발생 시 */
		function onError(evt) {
			alert('통신이 끊겼습니다 : ', evt);
			self.close();
		}
	}

	/* 서버로 보내는것  */
	function sendMessage(obj) {
		if(!socket) {
			alert('소켓 연결이 되어있지 않습니다.');
			return false;
		}
		socket.send(JSON.stringify(obj));
	}
	
	/* 방을 나갔을때 해당 룸 삭제하는 로직 */
	function deleteTalkRoom(data) {
		const li = document.querySelectorAll('li.talk-item');
		console.log(data);
 		
		Array.prototype.forEach.call(li, (e, i) => {
			console.log(i, '번째 : ', e);
			if(e.dataset.uid == data.receiver) {
				console.log('맞음');
				e.parentNode.removeChild(e);
				return false;
			}
		});
	}
	
	
	/* 소켓 연결 성공 시 에 들어 갔다는 함수 */
	function enterTalkList() {
		sendMessage({
			request: 'enterTalkList',
			sender: getData.currentUserNo
		});
	}

	/* 브라우저 종료시 에 나간다는 함수 */
	function exitTalkList() {
		sendMessage({
			request: 'exitTalkList',
			sender:  getData.currentUserNo,
		});
	}

	/* 메세지를 받았을때 화면 수정 */
	function updateTalkList(data) {
		console.log(data);
		
		let target;
		
		Array.from(talkItemElementList).forEach(e => {
			if(e.dataset.uid == data.msgReceiver) {
				target = e;
				return false;
			}
		});
		
		/* target이 있으면 */
		if(target) {
			const textDiv = target.querySelector('.talk-item-preview-content');
			const dateDiv = target.querySelector('.talk-item-date');
			
			textDiv.textContent = data.msgContent;
			dateDiv.textContent = timestampToString(data.msgRegDt);
		} else { // target이 없으면 새로 그려준다.
			getTalkList().then(writeContent);
		}
		
		
	}
	
	/* 안읽음 갯수 지우기 */
	function refreshConfirmMark(data) {
		let target;
		Array.from(talkItemElementList).forEach(e => {
			if(e.dataset.uid == data.receiver) {
				target = e;
				return false;
			}
		});
		
		if(target) {
			const unidDiv = target.querySelector('.talk-user-unid-div');
			if(unidDiv) {
				unidDiv.parentNode.removeChild(unidDiv);
				console.log('실행');
			}
		}
		
	}
	

	/* 사용자 메뉴 모달 */
	function initUserMenuModal() {
		
		/*talkListArea.appendChild(modal);*/
		
	}

	/* 데이터 가져와서 뿌리기 */
	function initTalkList() {
		
		
		getTalkList().then(writeDocument)
					.then(openSocket)
					.catch(catchError);
		
		/* 데이터를 바탕으로 화면에 뿌려주기 */
		function writeDocument() {
			
			dataValidation();
			
			writeHeader();
			writeContent();
			setModalEvent();
			
			
			/* 에러 체크 */
			function dataValidation() {
				const result = getData.result.split(':');
				const resultType = result[0];
				const resultMsg = result[1];
				if(resultType == 'fail') throw new Error(resultMsg);
			}
			
			/* writeHeader */
			function writeHeader() {
				const listTitle = document.querySelector('.list-header-title');
				
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
	
	/* writeContent */
	function writeContent() {
		contentList.innerHTML='';
		const dataArr = getData.data;
		const myUserNo = getData.currentUserNo;
		
		const frag = document.createDocumentFragment();
		if(!dataArr) return false;
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
			const dateDiv = DOMUtil.cE('div',{class:'talk-item-date'});
			const dateTextNode = DOMUtil.cT(dateData);
			const unidDiv = e.msgUnidCnt ? (DOMUtil.cE('div',{class:'talk-user-unid-div'}, e.msgUnidCnt)) : '';
			
			const menuArea = DOMUtil.cE('div',{class:'talk-item-menu-area'});
			const menuBtn = DOMUtil.cE('button',{class:'talk-item-menu-btn'});
			const iClass = DOMUtil.cE('i', {class: 'fas fa-ellipsis-v'});
			
			frag.append(li);
			li.append(div);
			div.append(imageLink, previewLink, dateDiv, menuArea);
			
			imageLink.append(image);
			
			previewLink.append(previewDiv);
			previewDiv.append(previewTitle, previewContent);
			
			dateDiv.append(dateTextNode);
			if(unidDiv) dateDiv.append(unidDiv);
			
			menuArea.append(menuBtn);
			menuBtn.append(iClass);
			
		});
		
		/* 클릭시 대화방 이동 */
		contentList.addEventListener('click', enterTalkRoom);
		
		contentList.append(frag)
		
		/* */
		function enterTalkRoom(e) {
			const tg = e.target.closest('li');
			if(!tg) return false;
			
			const targetUser = tg.dataset.uid;
			
			const setting = 'width=500px,height=667px,top='+(window.screen.height/2 - 375)+ ',left=' + (window.screen.width/2 - 250); 
			openWindow = window.open(contextPath + 'talk/user/' + targetUser + '.do',targetUser, setting);
		}
	}
	
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
		return DateUtil.format(temp, 'a/p hh:mm');
	}
	
	/* 프로미스 객체를 반환하는 함수.
	 * 데이터를 갖고온다.
	 * */
	function getTalkList() {
		return new Promise(function(resolve, reject) {
			$.ajax({
				url: contextPath + 'talk/list/data.do',
				method: 'get',
				dataType: 'json',
				success: function(data) {
					getData = data;
					resolve(data);
				},
				error: reject
			});
		});
	}
	
	/* 입장 시 읽음 처리 */
	function confirmMsgCnt() {
		
	}
	
});