window.onload = function() {
	
	const homeBtn = document.getElementById('homeBtn');
	homeBtn.addEventListener('click', goHome);
	prevBtn.addEventListener('click', goBack);
}


function goHome() {
	window.location.href = `${contextPath}/index.do`;
}

function goBack() {
	history.go(-1);
}