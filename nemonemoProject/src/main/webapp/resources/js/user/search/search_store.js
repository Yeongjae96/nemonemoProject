$(()=> {
	initPdMenu();
	initSearchStorePage();
	/*initPaging();*/
});
function initSearchStorePage() {
	
	const searchInput = document.getElementById('searchInput');
	const storeGoBtn = document.querySelector('.store-go-btn');

	(function initSearchTitle(searchInput) {
		searchInput.value = '@'+getParam('q');
	}(searchInput));
	
	(function initStoreBtn(storeGoBtn) {
		if(!storeGoBtn) return false;
		storeGoBtn.addEventListener('click', function() {window.location.href=this.dataset.location});
	}(storeGoBtn));
	
}

function getParam(name) {
	const url = window.location.search.substring(1);
	const arr = url.split('&');
	
	let result = null;
	
	arr.forEach(e => {
		const temp = e.split('=');
		if(decodeURI(temp[0]).trim() == name) {
			result = decodeURI(temp[1]);
			return false;
		}
	});
	
	return result;
}