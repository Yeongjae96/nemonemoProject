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
		sessionStorage.setItem('recentlyVisitedProducts', recentlyVisitedProducts);
		
		addRecentProduct(recentlyVisitedProducts);
	

	}
		
	
	/* 해당 상품 게시물을 side-navbar에 띄우기 */
	function addRecentProduct(recentlyVisitedProducts){
		alert(recentlyVisitedProducts);
		
		productList.innerHTML ='';
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
	

	
	/* 네비개이션에 상품 띄우기 */
	function loadProductHistory() {
		productList.innerHTML='';
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
	
	
