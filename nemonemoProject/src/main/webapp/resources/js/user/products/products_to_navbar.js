$(function() {
	getData();
});


/* UI */
const productList = document.getElementById('rec-prd-list');


/* VO 불러오기 */
function getData(){

	$.ajax({
		url : contextPath + 'products/data.do',
		method : 'GET',
		dataType : 'json',
		data:{ 
			productNo : $('#prodno').data('no')
		},
		success : function(data){
			initSessionStorage(data);
		},
		error : function(err){
			alert("error!");
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
	let setArr = new Array();

	if(getArr != null){
		getArr = JSON.parse(getArr); // 배열로 만들어야 foreach 가능하니까.
		let res = sessionStorage.getItem('recentlyVisitedProducts'); // getArr에 담아두며 초기화 될 것을 대비하여 잡음
		
		// 중복검사 		
		getArr.forEach((e, i) => {
			if(getProduct.productNo == e.productNo) return true; // continue와 동일한 역할
			setArr.unshift(e);
		});
	}
		setArr.unshift(getProduct);
			
	sessionStorage.setItem('recentlyVisitedProducts', JSON.stringify(setArr));
	addRecentProduct();


}





