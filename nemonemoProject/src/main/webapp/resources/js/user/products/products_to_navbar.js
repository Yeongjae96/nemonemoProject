	$(function() {
		getData();
	});
	
	/* UI */
	const productList = document.getElementById('rec-prd-list');
	
	/* 기능적인 부분 */
	
	/* ajax로 VO 불러오기 */
	function getData(){

		$.ajax({
			url : contextPath + 'products/data.do',
			method : 'GET',
			dataType : 'json',
			data:{ 
				productNo : $('#prodno').data('no')
			},
			success : function(data){
				initProductHistory(data);
			},
			error : function(err){
				alert("error!");
			}
		});
		
	}
	
	
	let recentlyVisitedProducts = [];
	
	/* sessionStorage에서 해당 recentProductHistory()를 호출*/
	function initProductHistory(e) {
		
		recentlyVisitedProducts.push(e.productImgNo);
		recentlyVisitedProducts.push(e.productNo);
		recentlyVisitedProducts.push(e.productName);
		recentlyVisitedProducts.push(e.productPrice);
		
		sessionStorage.setItem('recentlyVisitedProducts', recentlyVisitedProducts);
		
		
		alert(recentlyVisitedProducts);
		
	

		

/*		const getArr = sessionStorage.getItem(prodno);
		if(!getArr || !getArr[0]) {
			return false;
		}
		
		recentlyVisitedProducts = [];
		
		getArr.split(',').forEach(e => {
			productHistory.push(e);
		});*/
		
	}
		
	
	/* 해당 상품 게시물을 side-navbar에 넣기 */
	function addRecentProduct(){
/*		const imgno = e.productImgNo;
		const prodno = e.productNo;
		const prodname = e.productName;
		const prodprice = e.productPrice;
		
		alert(imgno + " " + prodno + " " + prodname + " " + prodprice);*/
		
		
	}
	
	

	
	
	
	/* 네비개이션에 상품 띄우기 */
	function loadProductHistory() {
		productList.innerHTML=''
		recentlyVisitedProducts.forEach(e => {
			let html='';
			html += '<a class="rec-prd-img" href="#">'; // 상품 링크
			html += '<img src=<c:url value="/resources/images/user/common/nike.jpeg"/> alt="상품 이미지">';
			html += '<div class="prd-info">';
			html +=	'<button class="delete-rec">';
			html += '<img src="<c:url value="/resources/images/user/common/delete_btn.png"/>';
			html += '"width="10" height="12" alt="삭제 버튼 이미지"></button>';
			html +=	'<div class="rec-prd-title"></div>';
			html += '<div class="rec-prd-price"><span>원</span></div></div></a>';
			
			productList.innerHTML += html; // html 태그 넣넣
			
		});
	}
	
	
