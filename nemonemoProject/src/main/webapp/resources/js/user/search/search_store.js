$(()=> {
	initPdMenu();
	initSearchStorePage();
	initPaging();
});
function initSearchStorePage() {
	const searchInput = document.getElementById('searchInput');
	const storeGoBtn = document.querySelector('.store-go-btn');
	storeGoBtn.addEventListener('click', function() {window.location.href=this.dataset.location});
	searchInput.value = getParam('q');
	
	function getParam(name) {
		const url = window.location.search.substring(1);
		const arr = url.split('&');
		
		arr.forEach(e => {
			const temp = e.split('=');
			console.log('decode:',decodeURL(temp[0]), '\n normal:', temp[0]);
			if(decodeURL(temp[0]) == name) {
				return temp[1];
			}
		});
		return null;
	}
	
}