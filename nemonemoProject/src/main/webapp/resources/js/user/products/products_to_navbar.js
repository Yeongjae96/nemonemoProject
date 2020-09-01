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
	
	
	const recentlyVisitedProducts = JSON.stringify(getProduct);
	let getArr = new Array();
	let setArr = new Array();

	
	if(sessionStorage.getItem('recentlyVisitedProducts') != null){

		let res = sessionStorage.getItem('recentlyVisitedProducts').split("},"); // getArr에 담아두며 초기화 될 것을 대비하여 잡음

		for (let i = 0; i < res.length; i++) {
			res[i].replace("}", "");
			res[i].replace("\{", "");
			getArr.push("{"+(res[i].replace("\{", "")).replace("}", "")+"}");
		}

		sessionStorage.clear();
			
		// 중복검사 
		for (var i = 0; i < getArr.length; i++) {
			if(getArr[i] == recentlyVisitedProducts){	
			} else
				setArr.push(getArr[i]); // 기존 것을 담음
		}	

	}
		setArr.push(recentlyVisitedProducts);
		
		/* ....그럴 필요 없지만 번장처럼 표기하기 .. */
/*		for (var i = 0; i < setArr.length; i++) {
			if(setArr.length = 1){
				str = "["+ str + setArr[i] + "]";
			}else {
				if(i=0){
					str = str + setArr[i];
				}
			}
			
			
		}*/
		
	sessionStorage.setItem('recentlyVisitedProducts', setArr);
	addRecentProduct(setArr);


}


/* 해당 상품 게시물을 side-navbar에 띄우기 */

function addRecentProduct(setArr){
	const productList = document.querySelector('#rec-prd-list');
	
//	for (var i = 0; i < setArr.length; i++) {
//		const product = "'" + setArr[i] + "'";
	
//		const objproduct = JSON.parse(product); 
//	}
//	



	productList.innerHTML ='';
	let html='';
	
	setArr.forEach(function(e,i){	
	
	html += '<a class="rec-prd-img" href="/nemonemoProject/products/';
	html += setArr['productNo'];
	html += '.do">'; // href 안에 프로덕트 넘버가 들어가야함
	html += '<img src="/image/product/';
	html += setArr['productImgNo'];// 2. img 넘버 넣는 곳 
	html += '" alt="상세 상품 이미지" />';
	html += '<div class="prd-info">';
	html +=	'<button class="delete-rec">';
	html += //닫기버튼 이미지 넣는 곳 
	html +=	'<div class="rec-prd-title">';
	html += setArr['productName'];// 3. 제목 넣는 곳
	html += '</div>';
	html += '<div class="rec-prd-price"><span>'
	html += setArr['productPrice'];// 4. 가격 넣는 곳
	html += '원</span></div></div></a>';

	productList.innerHTML += html; // html 태그 넣넣

	});
	
	
	}



