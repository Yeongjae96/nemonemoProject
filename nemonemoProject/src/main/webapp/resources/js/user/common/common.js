/* 상품 카테고리와 관련된 애들은 모두 이 함수가 선행이 되어야 함
 * 
 * ex ) getCategoryList().then(initMenuCategoryList).(원하는 콜백함수)
 * 
 * 
 * */
$(function() {
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
     $('.mystore').mouseenter(function() {
        $(".mystore-box").css("visibility", "visible");
        
     });
     $('.mystore-box').mouseleave(function() {
         $(".mystore-box").css("visibility", "hidden");
      });

    /* top-nav 고객센터 메뉴링크 보여줌 */
     $('.cs').mouseenter(function() {
        $(".cs-box").css("visibility", "visible");
     });
     $('.cs-box').mouseleave(function() {
         $(".cs-box").css("visibility", "hidden");
      });

      /* 사이드 네비게이션 상품 자세히보기 */
      $('.rec-prd-img').mouseenter(function() {
        $(".prd-info").css("visibility", "visible");
     });
     $('.rec-prd-img-group').mouseleave(function() {
         $(".prd-info").css("visibility", "hidden");
      });

      /* TOP 버튼 누를 시 페이지 상위로 이동 */
      $(".text-top").on("click", function(){  
        $(location).attr('href','#');
    }); 
      
      $('#logout').on('click', open_pop);
  	  $('#model-cancel').on('click', close_pop);
      
      /* HEADER 로그아웃 팝업 */
      function open_pop() {
      	$('#myModal').show();
      };
      // Header 로그아웃 팝업 Close 기능
      function close_pop() {
      	$('#myModal').hide();
      };
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
}

/* 검색창 이벤트!! */
function initSearchEvent() {
	const $inputSearching = $('#searching');
	const $recommendBox = $('#recommend-box');
	const $searchedBox = $('#searched-box');	
	const $searchClose = $('.search-close');
	$inputSearching.on('focus keyup', function() {
		if($(this).val().length > 0) {
			$recommendBox.addClass('invisible');
			$searchedBox.removeClass('invisible');
			$('#searched-box-content').text($inputSearching.val());
		} else {
			$recommendBox.removeClass('invisible');
			$searchedBox.addClass('invisible');
		}
		
	});
	$searchClose.on('click', function() {
			$searchedBox.addClass('invisible');
			$recommendBox.addClass('invisible');		
	});
	
	
	function closeSearch() {
		const rec = document.querySelector("#recommend");
		rec.classList.add("invisible");
	}
}

/*
 * 상품 카테고리와 관련된 애들은 모두 이 함수가 선행이 되어야 함
 * 
 * ex ) getCategoryList().then(initMenuCategoryList).(원하는 콜백함수)
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


