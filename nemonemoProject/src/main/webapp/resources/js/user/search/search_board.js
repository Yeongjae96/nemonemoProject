$(()=> {
	initPdMenu();
	initSortMenu();
});

function initSortMenu() {
	
	const sortList = Array.from(document.getElementsByClassName('search-sort__item'));
	
	
	
	displaySortMenu();
	
	
	function displaySortMenu() {
		const condition = getParam('order');
		
		const targetName = (condition == 'date' || !condition) ?
				'최신순' : condition == 'price_asc' ? '저가순' : '고가순';
		
		sortList.forEach(e => {
			
			e.addEventListener('click', orderAction);
			
			const targetHTML = e.innerText;
			if(targetHTML == targetName) {
				e.classList.add('sort--active');
				return false;
			}
		});
		
		function orderAction(e) {
			const thisText = e.target.innerText;
			const orderType = (thisText == '최신순') ? 'date' : (thisText == '저가순') ? 'price_asc' : 'price_desc';
			const qMessage= getParam('q');
			const pageNo = getParam('pageNo');
			const prevOrder = getParam('order');
			let formHTML = '';
			formHTML += `<form action="${contextPath}search/products.do" method="get" name="dynamicForm">`;
			formHTML += qMessage ? '<input type="hidden" name="q" value="'+qMessage+'"/>': '';
			formHTML += '<input type="hidden" name="order" value="'+orderType+'"/>';
			formHTML += pageNo ? '<input type="hidden" name="pageNo" value="'+pageNo+'"/>' : ''
			formHTML += '</form>';
			
			const body = document.getElementsByTagName('body')[0];
			const div = document.createElement('div');
			div.innerHTML = formHTML;
			body.appendChild(div);
			document.dynamicForm.submit();
		}
	}
	

	
	
}

/* 파라미터 값 리턴 */
function getParam(param) {
	const pageParam = decodeURIComponent(window.location.search.substring(1)),
	pageVariables = pageParam.split('&');
	let paramName;
	if(pageVariables) {
		for(let i of pageVariables) {
			if(i.split('=')[0] == param)
				paramName = i.split('=')[1];
		}
		return paramName;
	} else {
		return null;
	}
}