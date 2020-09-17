$(function() {
	getData();
});


/* UI */
const productList = document.getElementById('rec-prd-list');


/* VO 불러오기 */
function getData(){

	const url = window.location.href;
	const productNo = url.slice(url.lastIndexOf('/')+1, url.lastIndexOf('.'));
	
	$.ajax({
		url : contextPath + 'products/data.do',
		method : 'GET',
		dataType : 'json',
		async: false,
		data:{ 
			productNo : productNo
		},
		success : function(data){
			initSessionStorage(data);
		},
		error : function(err){
		}
	});	
}

/* 실제 sessionStorage에 상품 넣기*/
function initSessionStorage(e) { 
	
	const getProduct = new Object();
	getProduct.productImgNo = e.productImgNo;
	getProduct.productNo = e.productNo;
	getProduct.productName = e.productName;
	getProduct.productPrice = e.productPrice;
	
	
	let getArr = sessionStorage.getItem('recentlyVisitedProducts');
	const setArr = new Array();
	
	if(getArr != null){ // 최근 본 상품이 이미 존재할 때.
		getArr = JSON.parse(getArr); // 배열로  만들어서 foreach 시켜줌
		
		for (var i = 0; i < getArr.length; i++) {
			if(getArr[i].productNo == getProduct.productNo) continue;
			setArr.push(getArr[i]);
		}
	}	
	setArr.unshift(getProduct);
	sessionStorage.setItem('recentlyVisitedProducts', JSON.stringify(setArr));
}

