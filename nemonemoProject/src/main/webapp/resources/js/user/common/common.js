const initCommonFunction = function() {/* 공통 함수 */
	HTMLElement.prototype.makeDisplay = function(status) {
			const target = this;
			if(typeof status == 'boolean') {
				status = status ? 'block' : 'none';
			}
			this.style.display = status;
	}
		
		/* jquery의 closest ID버젼 */
	HTMLElement.prototype.closestOneByID = function(ID) {
			let target = this;
			while(!target.parentElement.querySelector('#'+ID)) {
				target = target.parentElement;
				if(!target.parentElement) {
					return new Error('not Found');
				}
		}
			return target;
	}
}



/* 상품 카테고리와 관련된 애들은 모두 이 함수가 선행이 되어야 함
 * initPdMenu
 * */
$(function() {
	initCommonFunction();
	initTopMenu();
	initSideNavbar();
	initSearchEvent();

});

/* 탑 메뉴 */
function initTopMenu() {
	/* top-nav 알림창 보여줌 */ 
    $('#alert').mouseenter(function() {
       $(".alert-content-box").css("visibility", "visible");
    });

    $('.alert-content-box').mouseleave(function() {
        $(".alert-content-box").css("visibility", "hidden");
       
     });

     /* top-nav 내상점 메뉴링크 보여줌 */
     $('.mystore').mouseover(function() {
        $(".mystore-box").css("visibility", "visible");
        
     });
     $('.mystore-box').mouseleave(function() {
         $(".mystore-box").css("visibility", "hidden");
      });

    /* top-nav 고객센터 메뉴링크 보여줌 */
     $('.cs').mouseover(function() {
        $('.cs-box').css("visibility", "visible");
     });
     $('.cs-box').mouseleave(function() {
         $('.cs-box').css("visibility", "hidden");
      });


      /* TOP 버튼 누를 시 페이지 상위로 이동 */
      $(".text-top").on("click", function(){  
        $(location).attr('href','#');
    }); 
      
      $('#logout').on('click', open_pop);
  	  $('#model-cancel').on('click', close_pop);
      
  	$('#loginBtn').click(function() {$('#myModal').show()});
  	  
  	  
      /* HEADER 로그아웃 팝업 */
      function open_pop() {
      	$('#logoutmodal').show();
      };
      // Header 로그아웃 팝업 Close 기능
      function close_pop() {
      	$('#logoutmodal').hide();
      };
      
      $('#logoutBtn').click(function() {
    		$('#logoutmodal').show()
    	});
      
      $('#loginBtn').click(function() {$('#myModal').show()});
      
 
      /* 즐겨찾기 알림 */
      $('.addFavorite').on('click', function(e){ 
    	  const url = document.location.href;
    	  const title = document.title; 
    	  
    	   // Chrome, FireFox, Opera
    	   if(window.chrome || window.sidebar){
    		   alert((navigator.userAgent.toLowerCase().indexOf('mac') != -1 ? 'Cmd' : 'Ctrl') 
    				  + '+D 키를 눌러 즐겨찾기에 등록하실 수 있습니다.');
    	   }
      });
}


/* 사이드 메뉴 바 */
function initSideNavbar() {
	/* side banner top click */
	$(window).scroll(function() {
		if ($(this).scrollTop() > 200) {
			$('.top').fadeIn();
		}
	});

	$('.top').click(function() {
		$('html, body').animate({ scrollTop: 0 }, 400);
		return false;
	});
	loadProduct();
}




/* 해당 상품 게시물을 side-navbar에 띄우기 */

function loadProduct(){
	
	console.log('load 실행');
	
	const productList = document.querySelector('#rec-prd-list');
	const $recPrdList = $('#rec-prd-list');
	const count = document.getElementsByClassName('rec-prd-cnt')[0];
	
	let getItems = JSON.parse(sessionStorage.getItem('recentlyVisitedProducts'));
	if(!getItems) return false;

	//productList.innerHTML ='';
	
	
	writeDocumentFromSessionItem();
	
	
	function writeDocumentFromSessionItem() {
		$recPrdList.html('');
		getItems.forEach(function(e,i){	
			const html = 
			'<a class="rec-prd-img" data-prdno="'+
			getItems[i].productNo + '">'+ '<img class = "prodImg" src="' + contextPath + 'image/product/'+
			getItems[i].productImgNo + '.img"/>'+
			'<div class="prd-info">'+
			'<button class="delete-rec">'+
			'<img class ="delete-img" src= "'+ contextPath +'resources/images/user/common/delete_btn.png"/>'+
			' </button>'+
			'<div class="rec-prd-title">'+
			getItems[i].productName + '</div>'+
			'<div class="rec-prd-price"><span>'+
			getItems[i].productPrice + '원</span></div></div></a>';
			
			// html 태그 넣넣
			$('#rec-prd-list').append(html);
			
			const prdAnchor = document.getElementsByClassName('rec-prd-img');
			const delBtn = document.getElementsByClassName('delete-rec');
			
			/* a 태그 클릭시 해당 게시물로 이동 */
			for (var i = 0; i < prdAnchor.length; i++) {
				prdAnchor[i].addEventListener('click', function(){
					window.location.href = contextPath + 'products/' + $(this).data("prdno")+'.do';			
				});
			}
			
			/* 버튼 클릭시 해당 게시물 삭제 */
			for (var i = 0; i < delBtn.length; i++) {
				delBtn[i].addEventListener('click', function(e){
					e.stopPropagation();
					removeFromSession($(this).parent().parent().data("prdno"));
				});
			}
		});
		
		if(getItems.length) {
			count.innerHTML = '<span>'+getItems.length+'</span>';
		} else {
			count.innerHTML = ''
		}
	}
	
	function removeFromSession(datano){
		let getSelectArr = new Array();
		getSelectArr = JSON.parse(sessionStorage.getItem('recentlyVisitedProducts'));
		let removeProductNo = getSelectArr.findIndex(i => i.productNo == datano);
		console.dir("splice 전 : " + JSON.stringify(getSelectArr));
		getSelectArr.splice(removeProductNo, 1);
		console.dir("splice 후 : " + JSON.stringify(getSelectArr));
		
		// 새로운 변경된 arr를 덮어씌움
		sessionStorage.setItem('recentlyVisitedProducts', JSON.stringify(getSelectArr));
		getItems = getSelectArr;
//		const parentTag = $(this).parent().parent().html(""); // 화면에서 삭제
		//sessionStorage.removeItem();
		
		writeDocumentFromSessionItem();
	}
}

	





/**************************************** 아래는 무시하세요 ************************************/

///* 해당 상품 게시물을 side-navbar에 띄우기 */
//
//function loadProduct(){
//	const productList = document.querySelector('#rec-prd-list');
//	
//	const getItems = JSON.parse(sessionStorage.getItem('recentlyVisitedProducts'));
//	//if(!getItems) return false;
//
//	productList.innerHTML ='';
//	let html='';
//	
//	getItems.forEach(function(e,i){	
//		html += '<a class="rec-prd-img" data-prdno="';
//		html += getItems[i].productNo; // 1. 상품번호
//		html += '">';
//		html += '<img class = "prodImg" src="' + contextPath + 'image/product/'; 
//		html += getItems[i].productImgNo; // 2. 상품 이미지번호
//		html += '.img"/>';
//		html += '<div class="prd-info">';
//		html +=	'<button class="delete-rec">';
//		html += '<img class ="delete-img" src= "'+ contextPath +'resources/images/user/common/delete_btn.png"/>';
//		html += ' </button>';
//		html +=	'<div class="rec-prd-title">';
//		html += getItems[i].productName; // 3. 상품 이름
//		html += '</div>';
//		html += '<div class="rec-prd-price"><span>'
//		html += getItems[i].productPrice;// 4. 상품 가격
//		html += '원</span></div></div></a>';
//		
//		
//		productList.innerHTML += html; // html 태그 넣넣
//
//	});
//	
//
//	
//	const prdAnchor = document.getElementsByClassName('rec-prd-img');
//	const delBtn = document.getElementsByClassName('delete-rec');
//	
//	/* a 태그 클릭시 해당 게시물로 이동 */
//	for (var i = 0; i < prdAnchor.length; i++) {
//		prdAnchor[i].addEventListener('click', function(){
//			window.location.href = contextPath + 'products/' + $(this).data("prdno")+'.do';			
//		});
//	}
//	
//	/* 버튼 클릭시 해당 게시물 삭제 */
//	for (var i = 0; i < delBtn.length; i++) {
//		delBtn[i].addEventListener('click', function(e){
//			e.stopPropagation();
//			removeFromSession($(this).parent().parent().data("prdno"));
//		});
//	}		
//}
//
//	
//function removeFromSession(datano){
//	//e.stopPropagation(); // 삭제만 되고 상위 a 태그 이벤트를 막음
//	let getSelectArr = new Array();
//	getSelectArr = JSON.parse(sessionStorage.getItem('recentlyVisitedProducts'));
//	let removeProductNo = getSelectArr.findIndex(i => i.productNo == datano);
//	console.log("splice 전 : " + getSelectArr);
//	getSelectArr.splice(removeProductNo, 1);
//	console.log("splice 후 : " +getSelectArr);
//	
//	// 새로운 변경된 ARR를 덮어씌움
//	sessionStorage.setItem('recentlyVisitedProducts', JSON.stringify(getSelectArr));
//	
////	const parentTag = $(this).parent().parent().html(""); // 화면에서 삭제
//	//sessionStorage.removeItem();
//}
//




/* 검색창 이벤트!! */
function initSearchEvent() {
	/* UI적인 부분 */
	const searchInput = document.getElementById('searchInput');
	const searchArea = document.getElementById('searchArea');
	const recentlyArea = document.getElementById('recentlyArea');
	const searchBox = document.getElementById('searchBox');
	const allDeleteBtn = document.getElementById('allDeleteBtn');
	const searchAreaClose = document.getElementById('searchAreaClose');
	const storeSearchLink = document.querySelector('.store-search-link');
	
	/* 최근 검색어 목록 */
	const recentlyList = document.getElementById('recentlyList');
	const recentlyNothing = document.getElementById('nothingRecently');
	const recentlyMenu = document.querySelector('.recently-menu');
	const recentlyHeader = document.querySelector('.recently-header');
	
	recentlyHeader.addEventListener('click',searchMenuClickEvent);
	
	searchInput.addEventListener('click', searchInputClickEvent);
	searchInput.addEventListener('keyup', searchInputKeyupEvent);
	searchAreaClose.addEventListener('click', searchAreaCloseEvent);
	document.addEventListener('mouseup', documentMouseUpEvent);
	
	/* 기능적인 부분 */
	const searchIconBtn = document.getElementById('searchIconBtn');
	
	let searchHistory = [];
	initSearchHistory();
	
	recentlyMenu.classList.add('menu--selected');
	let selectedMenu = recentlyMenu;
	
	searchIconBtn.addEventListener('click', searchAction);
	searchInput.addEventListener('keyup', searchkeyupEvent);
	allDeleteBtn.addEventListener('click', allRemoveHistoryEvent);
	storeSearchLink.addEventListener('click', function() {searchInput.value = searchInput.value.slice(0,1) == "@" ? searchInput.value : "@" + searchInput.value; searchAction.call(this)});
	/* 최근 검색어 쌓기 */
	
	/* UI적인 부분 */
	function searchInputClickEvent() {
		toggleArea(!!this.value.length);
		searchInput.dispatchEvent(new Event('keyup'));
	}
	
	/* document에 이벤트를 걸어 영역밖을 클릭하면 없애는 키워드 */
	function documentMouseUpEvent(e) {
		if(e.target.tagName == 'svg' || e.target.tagName == 'path') return false;
		if(e.target.closestOneByID('searchArea') != searchArea) {
			searchAreaCloseEvent();
		}
	}
	/* 인기검색어 목록 불러와서 쏴주기  */
	(function () {
		
		// 인기검색어 목록
		const popularDiv = document.querySelector('.popular-div');
		
		const getTopList = function() {return new Promise(function(resolve, reject) {
			$.ajax({
				url: contextPath + 'search/toplist.do',
				method: 'get',
				dataType: 'json',
				success: resolve,
				fail: reject
			});
		})};
		
		getTopList()
			.then(function(data) {
				
				const frag = document.createDocumentFragment();
				let div;
				data.forEach((e, i) => {
					if(i == 0 || i == 10) {
						div = document.createElement('div');
						div.setAttribute('class', 'popular-list');
					}
					const a = document.createElement('a');
					a.setAttribute('class', 'popular-link');
					a.setAttribute('href', contextPath+'search/products.do?q='+e.topSearchedKeyword);
					const span = document.createElement('span');
					const textNode = document.createTextNode(e.topSearchedKeyword);
					span.setAttribute('class', 'popular-rank');
					span.textContent = Number(i+1);
					a.appendChild(span);
					a.appendChild(textNode);
					div.appendChild(a);
					if(i == data.length-1 || i == 9) {
						frag.appendChild(div);
					}
				});
				popularDiv.appendChild(frag);
			})
			.catch(function(err) {
				new Error(err.status);
			});
		
	}());
	
	
	/* 최근검색어, 인기검색어 선택 */
	function searchMenuClickEvent(e) {
		const target = e.target;
		const that = this;
		let status = false;
		
		const recentlyArea = document.querySelector('.recently-area');
		const popularArea = document.querySelector('.popular-area');
		
		
		Array.from(target.classList).forEach((e, i) => {
			if(e == 'menu--selected') {
				status = true;
				return false;
			}
		});
		
		if(!status) {
			e.target.classList.add('menu--selected');
			selectedMenu.classList.remove('menu--selected');
			toggleMenu(target);
		}
		selectedMenu = target;
		
		function toggleMenu(target) {
			const searchcloseArea = document.querySelector('.search-close__area');
			let status;
			Array.from(target.classList).forEach(e => {
				if(e == 'recently-menu') status = 1;
			});
						
			status = (status == 1) ? true : false;
			
			recentlyArea.makeDisplay(status);
			allDeleteBtn.makeDisplay(status);
			popularArea.makeDisplay(!status);
		}
	}
	
	
	/* input에 키를 입력하면 나타나는 이벤트 */
	function searchInputKeyupEvent() {
		
		const target = this;
		const searchKeywordSpan = document.querySelector('#searchKeyword');
		const resultList = document.getElementsByClassName('search-result-list')[0];
		const searchValue = target.value;
		searchKeywordSpan.innerText = searchValue.replace(/^@/,'');
		
		if(target.value) {
			toggleArea(true);
		} else {
			toggleArea(false);
		}
		if(!searchInput.value.trim().length) return false;
		
    	let event;
		if(event) {
			window.clearTimeout(event);
		}
		event = window.setTimeout(keywordEvent, 500);
		
		function keywordEvent() {
			$.ajax({
				url: contextPath + 'search/keyword.do',
				method: 'get',
				data: {keyword: searchInput.value},
			}).done(function(data) {
				
				if(!data || !data.length) return false;
				
				
				while(resultList.firstChild) {
					resultList.removeChild(resultList.firstChild);
				}
				
				const frag = document.createDocumentFragment();
				
				data.forEach((e, i)=> {
					let html = '';
					const a = document.createElement('a');
					const span = document.createElement('span');
					a.classList.add('search-result-item');
					a.href = contextPath + 'search/products.do?q='+e;
					span.classList.add('result-item');
					span.textContent = e;
					a.appendChild(span);
					frag.appendChild(a);
				});
				
				if(frag.firstElementChild) {
					resultList.appendChild(frag);
				}
					
 			});
		}
	}
	
	/* 닫기 버튼 눌렀을 시 */
	function searchAreaCloseEvent() {
		searchArea.makeDisplay(false);
	}
	
	/* 최근검색어 또는 검색창을 toggle로 나타내기 위한 함수 */
	function toggleArea(status) {
		const recentlyMenu = document.querySelector('.recently-menu');
		let temp = false;
		recentlyMenu.classList.forEach((e, i) => {
			if(e == 'recently-menu' && recentlyMenu.classList.length == 2) { temp = true; }
		});
		searchArea.style.display = 'block';
		if(status) {
			allDeleteBtn.style.display = 'none';
			recentlyArea.style.display = 'none';
			searchBox.style.display = 'block';
		} else {
			allDeleteBtn.style.display = temp ? 'block' : 'none';
			recentlyArea.style.display = 'block';
			searchBox.style.display = 'none';
		}
	}
	
	/* 기능적인 부분 */
	function searchkeyupEvent(e) {
		if(searchInput.value && e.keyCode == 13) {
			searchAction();
		}
	}
	
	/* */
	/* localStorage에서 해당 배열로 불러오는 작업 끝난 후엔 LoadSearchHistory()를 호출하여 돔으로 표현*/
	function initSearchHistory() {
		const getArr = localStorage.getItem('searchHistory');
		if(!getArr || !getArr[0]) {
			toggleRecentlyList(false);
			return false;
		}
		
		searchHistory = [];
		
		getArr.split(',').forEach(e => {
			searchHistory.push(e);
		});
		loadSearchHistory();
	}
	
	/* 배열갖고 최근 검색어 목록 띄우는 것 */
	function loadSearchHistory() {
		toggleRecentlyList(true);
		recentlyList.innerHTML=''
		searchHistory.forEach(e => {
			let html='';
			html += '<div class="recently-item">';
			html += '<button class="recently-item--title">'+ e + '</button>';
			html += '<button class="recently-item--delete" id="rmHistory">';
			html +=	'<i class="fas fa-times"></i>';
			html += '</button>';
			html += '</div>';
			recentlyList.innerHTML += html;
			const classArrTitle = Array.from(document.getElementsByClassName('recently-item--title'));
			classArrTitle.forEach(e => {
				e.addEventListener('click', function() {searchInput.value = e.innerText; searchAction();});
			});
			const classArr = Array.from(document.getElementsByClassName('recently-item--delete'));
			classArr.forEach(e => {
				e.addEventListener('click', removeHistoryEvent);
			});
		});
	}
	
	/* 화면에 보여주는 지우기 + 실제 Arr에 지우는 것 */
	function removeHistoryEvent(e) {
		const target = this;
		const targetRecentlyList = target.closestOneByID('recentlyList');
		console.log(targetRecentlyList);
		const child = targetRecentlyList.children;
		
		let index = 0;
		Array.from(child).forEach(e => {
			if(target.parentElement == e) {
				targetRecentlyList.removeChild(target.parentElement);
				searchHistory.splice(index, 1);
				return false;
			}
			index++;
		});
		localStorage.setItem('searchHistory', searchHistory);
		if(!targetRecentlyList.children.length) toggleRecentlyList(false);
	}
	
	function allRemoveHistoryEvent(e) {
		window.localStorage.clear();
		initSearchHistory();
	}
	
	function searchAction() {
		const form = document.createElement('form');
		const input = document.createElement('input');
		const frag = document.createDocumentFragment();
		
		if(!searchInput.value.trim().length) return false;
		const status = searchInput.value.slice(0, 1) == '@' ? 'store' : 'product';
		
		form.action = status == 'product' ? contextPath + 'search/products.do' : contextPath + 'search/shops.do'; 
		form.method = 'get';

		const searchValue = (status == 'product') ? searchInput.value : searchInput.value.substring(1);
		
		
		input.setAttribute('type', 'hidden');
		input.setAttribute('name', 'q');
		input.setAttribute('value', searchValue);
		
		form.appendChild(input);
		frag.appendChild(form);
		document.querySelector('body').appendChild(frag);
		
		searchHistory = searchHistory.filter(e => {
			return e != searchInput.value;
		});
		
		searchHistory.unshift(searchInput.value);
		localStorage.setItem('searchHistory', searchHistory);
		
		form.submit();
		form.parentElement.removeChild(form);
		initSearchHistory();
	}
	
	function toggleRecentlyList(status) {
		recentlyList.makeDisplay(status);
		recentlyNothing.makeDisplay(status == true ? false : 'flex');
	}
}

/*
 * 상품 카테고리와 관련된 애들은 모두 이 함수가 선행이 되어야 함
 * 
 * ex ) initPdMenu()
 * 
 * 
 */

/* 카테고리 리스트 */
function initPdMenu(callback) {
	return new Promise(function (resolve, reject) {
	
	let that = this;
	let categoryList;	
		
	getCategoryList()
	.then(categorySetting);
	
	/* */
	function categorySetting(data) {
			categoryList = data;
			
			const $cateMenu = $('.cate-menu--area');
			
			let outDelayTimer;
			
			$('.cate-icon--div').mouseenter(function() {
				let delayTimer;
				if(delayTimer) window.clearTimeout(delayTimer);
				if(outDelayTimer) window.clearTimeout(outDelayTimer);
				delayTimer = window.setTimeout(function() {$cateMenu.show();});
			});
			
			$('.cate-icon--div').mouseleave(function() {
				if(outDelayTimer) window.clearTimeout(outDelayTimer);
				outDelayTimer = window.setTimeout(function() {$cateMenu.hide();}, 200);	
			});
			
			// 대중소 분류 배열
			const lgCateArr = data.filter(e => e.productCateType == 'L');
			const mdCateArr = data.filter(e => e.productCateType == 'M');
			const smCateArr = data.filter(e => e.productCateType == 'S');
			
			const lgCateObj = {
					arr: lgCateArr,
					cateType: 'l',
					parentID: 'lgCateList',
					mouseOverAction: initMeCategoryList,
			}
			
			initCategoryList(lgCateObj);
			resolve(categoryList);
			/*
			 * 카테고리 리스트 공통적인 부분 cateObj 속성 cateObj.arr : 카테고리가 들어있는 배열
			 * cateObj.cateType : 대 중 소 구분 분류 cateObj.parentID : list를 추가시킬 id
			 * cateObj.mouseOverAction: 마우스 올리면 자동으로 cateObj.nothingText: 없을때
			 * cateObj.mdTitle: 미디움 카테고리 cateObj.smTitle: 스몰 카테고리 텍스트
			 */
			function initCategoryList(cateObj) {
				const cateArr = cateObj.arr;
				const $parent = $(`#${cateObj.parentID}`);
				const $frag = $(document.createDocumentFragment());
				const type = cateObj.cateType;
				const $titleText = type == 'l' ? '전체 카테고리' : type == 'm' ? cateObj.mdTitle : cateObj.smTitle;
				const initMeCategoryListFn = cateObj.mouseOverAction;
				// 내용 담기
				
					$parent.empty();
					// title 담기
					const $titleDiv = $('<div>').attr({'class': 'cate-menu-list--title'}).text($titleText);
					const $icon = $('<i>').attr('class', 'fas fa-chevron-right');
					$titleDiv.append($icon);
					$frag.append($titleDiv);
					if(cateArr.length > 0) {
					// body 담기
					const $bodyDiv = $('<div>').addClass('cate-menu-list--body');
					cateArr.forEach(function(e) {
						const textValue = type == 'l' ? e.productCateLarge : type == 'm' ? e.productCateMedium : e.productCateSmall;
						const $a = $('<a>').attr({'class': 'cate-menu--link', 'href': contextPath+'categories/'+e.productCateNo+'.do'}).text(textValue);
						$a.mouseenter(initMeCategoryListFn);
						$bodyDiv.append($a);
					});
					$frag.append($bodyDiv);
				} else {
					listEmpty($parent, '비어 있음');
				}
					$parent.append($frag);
			}
			
			/* 중분류 불러오기 */
			function initMeCategoryList() {
				allRemoveSelect.call(this, 'lg');
				addSelect.call(this);
				
				// 소분류 비우기
				removeSmList();
				meList.call(this);
				
			}
			 
			/* 중분류 값 뿌려주기 */
			function meList() {
				const $this = $(this); 
				const $parent = $('#mdCateList');
				const $frag = $(document.createDocumentFragment());
				
				const filteredMdCateArr = mdCateArr.filter(e => e.productCateLarge == $this.text());
				
				// title 담기
				const $titleDiv = $('<div>').attr({'class': 'cate-menu-list-md--title'}).text($this.text());
				const $icon = $('<i>').attr('class', 'fas fa-chevron-right');
				$titleDiv.append($icon);
				$frag.append($titleDiv);

				if(filteredMdCateArr.length) {
					$parent.empty();
					
					
					const $bodyDiv = $('<div>').addClass('cate-menu-list--body');
					filteredMdCateArr.forEach(e => {
						const textValue = e.productCateMedium;
						const $a = $('<a>').attr({'class': 'cate-menu-sub-link', 'href': contextPath+'categories/'+e.productCateNo+'.do'});
						const $textDiv = $('<div>').attr('class', 'sub-link-text').text(textValue);
						$a.append($textDiv);
						$a.mouseenter(initSmCategoryList);
						$bodyDiv.append($a);
					});
					$frag.append($bodyDiv);
				} else {
					listEmpty($parent, '비어 있음');
				}
				// 최종 합치기
				$parent.append($frag);
			}
			
			function removeSmList() {
				// title 담기
				const $frag = $(document.createDocumentFragment());
				const $parent = $('#smCateList'); 
				const $titleDiv = $('<div>').attr({'class': 'cate-menu-list-sm--title'}).text('중분류 선택');
				const $icon = $('<i>').attr('class', 'fas fa-chevron-right');
				$titleDiv.append($icon);
				$frag.append($titleDiv);
				// 비어있는 값 담기
				listEmpty($parent, '비어 있음');
				$parent.append($frag);
			}
			
			
			function initSmCategoryList() {
				allRemoveSelect.call(this, 'md');
				toggleChildSelect.call(this, 'div');
				smList.call(this);
			}
			
			function smList() {
				const $this = $(this);
				const $parent = $('#smCateList');
				const $frag = $(document.createDocumentFragment());
				
				const filteredSmCateArr = smCateArr.filter(e => e.productCateMedium == $this.text());
				const $titleDiv = $('<div>').attr({'class': 'cate-menu-list-sm--title'}).text($this.text());
				const $icon = $('<i>').attr('class', 'fas fa-chevron-right');
				$titleDiv.append($icon);
				$frag.append($titleDiv);
				$parent.empty();
				
				if(filteredSmCateArr.length) {
				// title 담기
				const $bodyDiv = $('<div>').addClass('cate-menu-list--body');
				filteredSmCateArr.forEach(e => {
					const textValue = e.productCateSmall;
					const $a = $('<a>').attr({'class': 'cate-menu-sub-link', 'href': contextPath+'categories/'+e.productCateNo+'.do'});
					const $textDiv = $('<div>').attr('class', 'sub-link-text').text(textValue);
					$a.mouseenter(mouseEvent);
					$a.append($textDiv);
					$bodyDiv.append($a);
				});
				$frag.append($bodyDiv);
				} else {
					listEmpty($parent, '비어 있음');
				}
				$parent.append($frag);

			}
			
			function mouseEvent() {
				allRemoveSelect.call(this, 'sm');
				toggleChildSelect.call(this, 'div');
			}
			
			/* 흐엉어엉 */
			function listEmpty(jqueryFn, text) {
				jqueryFn.empty();
				const $div = $('<div>').addClass('item--nothing').text(text);
				jqueryFn.append($div);
			}
			
			function toggleChildSelect(tagName) {
				const $id = $(this).find(tagName);
				const targetClass = $id.attr('class');
				const value = targetClass.slice(-8) == 'selected' ? targetClass.substring(0, targetClass.length-10) : targetClass +'--selected';
				$id.attr('class', value);
			}
			
			function addSelect() {
				const $id = $(this);
				const targetClass = $id.attr('class');
				const value = targetClass.slice(-8) == 'selected' ? targetClass : targetClass +'--selected';
				$id.attr('class', value);
			}
			
			function allRemoveSelect(type) {
				const $id = type == 'lg' ? $('.cate-menu--link--selected') : type == 'md' ? $('#mdCateList .sub-link-text--selected') : $('#smCateList .sub-link-text--selected');
				if(!$id.length) return false;
				const targetClass = $id.attr('class');
				const value = targetClass.slice(-8) == 'selected' ? targetClass.substring(0, targetClass.length-10) : targetClass;
				$id.attr('class', value);
			}
		}
	
	/* 리스트 불러 오기 */
	function getCategoryList() {
		return new Promise(function(resolve, reject) {
			$.ajax({
				url: contextPath+'products/allCateList.do',
				method: 'get',
				dataType: 'json',
				success: resolve	
			});
		});
	}
	
	});
	
}



