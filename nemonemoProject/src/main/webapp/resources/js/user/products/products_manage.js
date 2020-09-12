$(function() {
	initPdMenu();
	initHeader();
	initProductSt();
	initDisplayEvent();
});


/* 콤보 박스  */
function initHeader() {
	
	/*
	 * OBJ.clickId =  클릭 아이디
	 * OBJ.listId =  display조작할 리스트 id
	 * OBJ.arrow = 회전되는 화살표
	 */
	var initComboBox = function(obj) {
		
		const $clickId = $('#'+obj.clickId);
		const $listId = $('#'+obj.listId);
		
		const $cntListClass = $('.' + obj.itemClass);
		
		const callback = obj.callback;
		
		$clickId.click((e) => {
			e.stopPropagation();
			const $arrow = $('#'+obj.arrow + ' svg');
			const displayValue = $listId.css('display') == 'none' ? 'flex' : 'none';
			$listId.css('display', displayValue);
	        $arrow.toggleClass('fa-rotate-180');
		});
		
		$cntListClass.click(callback);
	}
	
	/* 콤보박스 이벤트 2개  */
	var headerAction = function(st) {
		
		const text = this.innerText.trim();
		
		let newParam;
		if(st == 'pageSize') {
			newParam = 'pageNo=1&pageSize='+ text.replace(/[^0-9]+/g, '');
		} else if(st == 'status') {
			switch(text) {
				case '전체':
					newParam = 'status=all'
				break;
				case '판매중':
					newParam = 'status=selling'
				break;
				case '예약중':
					newParam = 'status=reserved'	
				break;
				case '판매완료':
					newParam = 'status=soldout'
				break;
			}
		} else {
			console.log('잘못된 상태값!!');
			return false;
		}
		
		st = st == 'pageSize' ? ['pageNo', 'pageSize'] : st;
		const prevParam = getPrevParam(st);
		console.log(prevParam);
		let param = (prevParam + newParam);
		window.location.search = param;
	}
	 
	/* 검색기능 */
	var searchTitle = function() {
		const titleSearchBtn = document.getElementById('titleSearchBtn');
		const titleSearchInput = document.getElementById('titleSearchInput');
		const titleSearchForm = document.titleSearchForm;

		titleSearchForm.addEventListener('submit', beforeSubmitEvent);
		
		function beforeSubmitEvent(event) {
			event.preventDefault();
			
			const prevParam = getPrevParam('q').substring(1);
			const frag = document.createDocumentFragment();
			
			if(prevParam.trim().length) {
				prevParam.split('&').forEach(e => {
					const entity = e.split('=');
					const tempInput = document.createElement('input');
					tempInput.setAttribute('type', 'hidden');
					tempInput.setAttribute('name', entity[0]);
					tempInput.setAttribute('value', decodeURIComponent(entity[1]));
					frag.appendChild(tempInput);
				});
			}
			
			if(frag.children.length) {
				titleSearchForm.appendChild(frag);
			}
			
			titleSearchForm.submit();
		}
	}
	
	
	initComboBox({
		clickId: 'countComBox',
		listId: 'countList',
		arrow: 'countArrow',
		itemClass: 'products-manage__count--item',
		callback: function() {headerAction.call(this, 'pageSize');}
	});

	initComboBox({
		clickId: 'statusComBox',
		listId: 'statusList',
		arrow: 'statusArrow',
		itemClass: 'products-manage__st--item',
		callback: function() {headerAction.call(this, 'status');}
	});
	
	searchTitle();
	
	
	/* 파라미터 리스트 가져오기 (매개변수로 해당 키 값을 제외 시킬 수 있다. )*/
	function getPrevParam(exceptParam) {
		const winSearch = window.location.search;
		if(!winSearch) { console.log('파라미터가 없습니다.'); return ''; } 
		
		if(!exceptParam) exceptParam = '';
		console.log(exceptParam.constructor);
		if((exceptParam.constructor != Array) && (exceptParam.constructor == String)) {
			exceptParam = [exceptParam];
		}
		
		let param = '';
		const currParamArr = winSearch.substring(1).split('&');
		if(currParamArr.length) param += '?';
		
		currParamArr.forEach(function(currParam, index) {
			let status = false;
			
			console.log('currParam : ', currParam);
			
			exceptParam.forEach((e, i) => {
				if(currParam.split('=')[0] == e) {
					console.log('exceptParam : ', e);
					status = true;
					return false;
				}
			});
			if(status) return true;
			param += currParam;
			console.log('resultParam : ', param);
			
			if(param == '?' && index+1 == currParamArr.length) { alert('파라미터가 없어'); return '';}
			if(index+1 <= currParamArr.length) param += '&';
		});
	
		return param;
	}
} 

function initProductSt() {
	
	const $clickClass = $('.product-combo-box');
	const $pdStItem = $('.pd-status-list');
	
	$clickClass.click(function(e) {
		e.stopPropagation();
		const $target = $(this);
		const $listClass = $target.find('.pd-status-list');
		const $arrow = $target.find('.fa-chevron-down');
		const displayValue = $listClass.css('display') == 'none' ? 'flex' : 'none';
		$listClass.css('display', displayValue);
        $arrow.toggleClass('fa-rotate-180');
    });
	
	var editPdSt = function(e) {
		
		const $target = $(e.target);
		const prevSt = $target.closest('.product-combo-box').find('.products-manage__cbox--item').text().trim();
		const productNo = this.dataset.no;
		
		if(prevSt == $target.data('st')) {
			alert('같은 상태입니다.');
		}
		const url = window.location.href;
		$.ajax({
			url: contextPath + 'products/' + productNo + '/disp.do',
			method: 'post',
			data: {
				productNo: productNo,
				productDispSt: $target.data('st')
			}
		}).done(function(data) {
			if(data >= 1) {
				alert('상태를 성공적으로 변경하였습니다.');
				window.location.reload(true);
			} else {
				alert('찾으시는 상품을 찾을 수 없습니다.');
			}
		}).fail(function(err) {
			alert(err.status);
		});
	}
	
	$pdStItem.click(editPdSt);
}

function initDisplayEvent() {
	const $pdList = $('.pd-status-list');
	const $cntList = $('#countList');
	const $stList = $('#statusList');
	
	$(document).click(function(e) {
		$pdList.hide();
		$cntList.hide();
		$stList.hide();
	});
	
	
	
}

