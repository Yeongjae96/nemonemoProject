$(function() {
	openSocket();
});

function openSocket() {
	const wsUri = contextPath + "talk/open.do";
	const webSocket = new WebSocket(wsUri);
	webSocket.onopen = onOpen;
	webSocket.onmessage = onMessage;
	webSocket.onerror = onError;
}

/* 소켓이 열렸을 때 */
function opOpen(evt) {
	alert('open : ', evt.data);
	sendMessage('열렸습니다.');
}

function onMessage(evt) {
	alert('수신 : ', evt.data);
	
}

function onError(evt) {
	alert('에러 발생  :', evt.data);
	
}


function sendMessage(text) {
	webSocket.send(text);
}

