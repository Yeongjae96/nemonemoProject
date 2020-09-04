$(function() {
	openSocket();
});

function openSocket() {
	const wsUri = "ws://localhost"+contextPath + "talk/open.do";
	const webSocket = new WebSocket(wsUri);
	webSocket.onopen = onOpen;
	webSocket.onmessage = onMessage;
	webSocket.onerror = onError;
	
	/* 소켓이 열렸을 때 */
	function onOpen(evt) {
		console.log(evt); 
		sendMessage({msgContent:'열렸습니다.'});
	}

	/* 서버로 부터 수신 */
	function onMessage(evt) {
		console.log(evt);
	}

	/* 에러 발생 시 */
	function onError(evt) {
		console.log(evt);
	}

	/* 내가 정의 하는 함수 : 서버로 보내는것  */
	function sendMessage(obj) {
		
		if(obj.constructor !== 'object') {
			obj = new Object();
			obj.msgContent = '';
		}
		webSocket.send(obj.msgContent);
	}
}



