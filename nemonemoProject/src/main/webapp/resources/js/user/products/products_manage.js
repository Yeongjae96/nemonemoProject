$(function() {
	
	initPdMenu();
	initHeader();
	initProductSt();
});


/* 콤보 박스  */
function initHeader(obj) {
	
	
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
		
		$clickId.click(() => {
			const $arrow = $('#'+obj.arrow + ' svg');
			const displayValue = $listId.css('display') == 'none' ? 'flex' : 'none';
			$listId.css('display', displayValue);
	        $arrow.toggleClass('fa-rotate-180');
		});
		
		$cntListClass.click(callback);
	}
	
	var headerAction = function(st) {
		
		const prevParam = getPrevParam(st);
		const text = this.innerText.trim();
		
		let newParam;
		if(st == 'pageSize') {
			newParam = 'pageSize='+ text.replace(/[^0-9]+/g, '');
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
		let param = (prevParam + newParam);
		window.location.search = param;
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
	
	
	/* 파라미터 리스트 가져오기 (매개변수로 해당 키 값을 제외 시킬 수 있다. )*/
	function getPrevParam(exceptParam) {
		const winSearch = window.location.search;
		if(!winSearch) { console.log('파라미터가 없습니다.'); return ''; } 
		
		if(!exceptParam) exceptParam = '';
		
		let param = '';
		const currParamArr = winSearch.substring(1).split('&');
		
		if(currParamArr.length) param += '?';
		
		currParamArr.forEach(function(currParam, index) {
			if(currParam.split('=')[0] == exceptParam) {
				console.log(currParam, ' 통과');
				return true;
			}
			
			param += currParam;
			if(index+1 <= currParamArr.length) param += '&';
		});
	
		return param;
	}
} 

function initProductSt() {
	(function() {
		const $clickClass = $('.product-combo-box');
		const $pdStItem = $('.pd-status-item');
		
		
		$clickClass.click(function() {
			const $target = $(this);
			const $listClass = $target.find('.pd-status-list');
			const $arrow = $target.find('.fa-chevron-down');
			const displayValue = $listClass.css('display') == 'none' ? 'flex' : 'none';
			$listClass.css('display', displayValue);
	        $arrow.toggleClass('fa-rotate-180');
	    });
		
		$pdStItem.click(editPdSt);
		
		var editPdSt = function() {
			const $target = $(this);
			const prevSt = $target.closest('.product-combo-box').find('.products-manage__cbox--item').text().trim();
			console.log($target);
			console.log(prevSt);
			if(prevSt == $target.data('st')) {
				alert('같은 상태입니다.');
			}
			switch($target.data('st')) {
			case 'S':
				break;
			case 'R':
				break;
			case 'D':
				break;
			case 'F':
				break;
			}
		}
		
		
		
	}());
}

