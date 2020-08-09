
$(function() {
	initImageArea();
	initTitleArea();
	initCategoryArea();
	initRecentModal();
	initPriceArea();
	initTagArea();
	initDealArea();
	
});

/* 이미지 영역 */
function initImageArea() {
	$('#fileName').on('change', function() {
		readURL(this);
	});
	
	var imgarr = [];
	var fileBuffer = [];
	/* 사진 미리 보기 함수 */
	function readURL(input) {
		if(input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				if($('.image-registry--user').length >= 8) {
					alert('사진은 최대 8장 까지 올릴 수 있습니다.');
					return;
				}
		        Array.prototype.push.apply(fileBuffer, input.files);
				const $div = $('<div></div>');
				
				if($('.image-registry--user').length == 0){
					index=0;
					$div.addClass('text-registry--representive').text('대표이미지');		
				}
				const $li = $('<li></li>').attr({draggable: 'false'}).addClass('image-registry--user');
				const $image = $('<img/>').attr({'src': e.target.result, alt: '상품이미지'});
				const $closeBtn = $('<button></button>');
				
				$closeBtn.attr('type', 'button').addClass('btn-image--cancle').click(deleteImage);
				$li.append($div, $image, $closeBtn);
				
				$('#imageList').append($li);
				
				//전역변수 배열 데이터 추가
				$('.products-title--div small').text(`(${$('.image-registry--user').length}/8)`);
				console.log("fileBuffer : ", fileBuffer);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	/* 사진 삭제 함수 */
	function deleteImage() {
		/* 배열 내의 파일 제거 */
		 const fileIndex = $(this).closest('li').index();
	     fileBuffer.splice(fileIndex-1,1);
	     
		if($(this).closest('li').children('div').hasClass('text-registry--representive')) {
			const $pre = $(this).closest('li').next().find('div').addClass('text-registry--representive').text('대표이미지');
		}
		$(this).closest('li').remove();
		$('.products-title--div small').text(`(${$('.image-registry--user').length}/8)`);
	};
}

/* 제목 영역 */
function initTitleArea() {
	const $title = $('#productsTitleInput')
	const sizeObj = {};
	sizeObj.textId = 'productsTitleInput';
	sizeObj.sizeId = 'products-title--size';
	sizeObj.size = 40;
	
	$title.on('keyup', function() { sizeCheck.call(this, sizeObj)});
}


/* 카테고리 영역 함수 */
function initCategoryArea() {
	// id lg|md|smCategory 안에 li 
	//(.products-category-item|.products-category-nothing)을 넣는것
	
	getCategoryList().then(categorySetting);
	
	function getCategoryList() {
		return new Promise(function(resolve, reject) {
			$.ajax({
				url: 'allCateList.do',
				method: 'get',
				dataType: 'json'
			}).done(function(data) {
				resolve(data);
			});
		});
	}
	
	function categorySetting(data) {
		return new Promise(function(resolve, reject) {
			
			const lgCateArr = data.filter(e => e.productCateType == 'L');
			const mdCateArr = data.filter(e => e.productCateType == 'M');
			const smCateArr = data.filter(e => e.productCateType == 'S');
			
			const $lgCate = $('#lgCategory');
			const $mdCate = $('#mdCategory');
			const $smCate = $('#smCategory');
			
			const cateLgObj = {
					arr: lgCateArr,
					cateType: 'l',
					cateID: 'lgCategory',
					buttonAction: lgAction,
					nothingText: '대분류 선택'
			}
			
			const cateMdObj = {
					cateType: 'm',
					cateID: 'mdCategory',
					buttonAction: mdAction,
					nothingText: '중분류 선택'
			}
			
			const cateSmObj = {
					cateType: 's',
					cateID: 'smCategory',
					buttonAction: smAction,
					nothingText: '소분류 선택'
			}
			
			// 라지 카테고리 실행
			initCategoryList(cateLgObj);

			// 이전에 눌렀던 버튼들 
			let prevLgClass;
			let prevMdClass;
			let prevSmClass;
			
			// 대 분류 눌렀을 때
			function lgAction(event) {
				// 기본 셋팅 
				event.preventDefault();
				const $this = $(this);
				// 필터 걸고 중분류 발생
				cateMdObj.arr = mdCateArr.filter(e => $this.text() == e.productCateLarge);
				initCategoryList(cateMdObj);
				
				// 소분류 비우기 
				listEmpty('smCategory', '소분류 선택');
				
				// 클릭된 거 selected 붙여주기 + 이전에 클릭했던거 토글해주기
				toggleSelect($this);
				if(prevLgClass) toggleSelect(prevLgClass);
				prevLgClass = $this;
				
				// 선택된 카테고리 이벤트 업데이트 시키기
				selectedCategoryUpdate('l', $(this).text());
			}
			
			// 중 분류 눌렀을 때
			function mdAction(event) {
				event.preventDefault();
				const $this = $(this);
				
				cateSmObj.arr = smCateArr.filter(e => $(this).text() == e.productCateMedium);
				initCategoryList(cateSmObj);
				toggleSelect($this);
				if(prevMdClass) toggleSelect(prevMdClass);
				prevMdClass = $this;
				
				// 선택된 카테고리 이벤트 업데이트 시키기
				selectedCategoryUpdate('m', $(this).text());
			}
			
			// 소 분류 눌렀을 때
			function smAction(evnet) {
				event.preventDefault();
				const $this = $(this);

				toggleSelect($this);
				if(prevSmClass) toggleSelect(prevSmClass);
				prevSmClass = $this;
				
				// 선택된 카테고리 이벤트 업데이트 시키기
				selectedCategoryUpdate('s', $(this).text());
			} 
			
			// 선택된 카테고리 Update
			function selectedCategoryUpdate(type, text) {
				const $b = $('#selectedCategory b');
				const bText = $b.text();
				
				if(type == 'l') {
					$b.text(text);
				} else if(type == 'm') {
					const prevText = bText.includes('>') ? bText.substring(0, bText.indexOf('>')) : bText;
					$b.text(prevText + ' > ' + text);
				} else {
					const prevText = (bText.match(/>/g) || []).length == 2 ? bText.substring(0, bText.lastIndexOf('>')) : bText;
					$b.text(prevText + ' > ' + text);
				}
			}
			
			// 카테고리가 비어있다면
			function listEmpty(listID, text) {
				const $listID = $(`#${listID}`);
				$listID.empty();
				$listID.append($('<li>').addClass('products-category-nothing').text(text));
			}
			
			// 선택된거 --select 붙이고 뺴는 toggle 이벤트
			function toggleSelect(id) {
				const $id = id;
				const targetClass = $id.attr('class');
				const value = targetClass.slice(-8) == 'selected' ? targetClass.substring(0, targetClass.length-10) : targetClass +'--selected';
				$id.attr('class', value);
			}
			
			
			/* 카테고리 리스트 공통적인 부분
			 * cateObj 속성
			 * cateObj.arr : 카테고리가 들어있는 배열
			 * cateObj.cateType : 대 중 소 구분 분류
			 * cateObj.cateID : list를 추가시킬 id
			 * cateObj.buttonAction: 버튼을 누르게 되면 실행할 콜백
			 * cateObj.nothingText: 없을때 텍스트
			 * */
			function initCategoryList(cateObj) {
				const cateArr = cateObj.arr;
				const $cate = $(`#${cateObj.cateID}`);
				const $frag = $(document.createDocumentFragment());
				const type = cateObj.cateType;
				$cate.empty();
				if(cateArr.length > 0) {
					cateArr.forEach(function(e) {
						const $li = $('<li>').addClass('products-category-item');
						const $button = $('<button>').attr({'class': 'products-category-btn'}).text(type == 'l' ? e.productCateLarge : type == 'm' ? e.productCateMedium : e.productCateSmall);
						$button.click(cateObj.buttonAction);
						$li.append($button);
						$frag.append($li);
					});
					$cate.append($frag);
				} else {
					listEmpty(cateObj.cateID,cateObj.nothingText);
				}
			}
		});
	}
	
}

/* 거래 지역 함수 */
function initDealArea() {
	$('#myLocationBtn').click(getPlaceFromCoords); // 내위치 클릭시 내위치구하는 함수
	/* 현재 내위치로부터 위도 경도 구하기 */
	function getPlaceFromCoords() {        
	    // Geolocation API에 액세스할 수 있는지를 확인
	    if (navigator.geolocation) {
	    	var geocoder = new kakao.maps.services.Geocoder();
	        // 위치 정보를 얻기
	        navigator.geolocation.getCurrentPosition (function(pos) {
	            const lat = pos.coords.latitude;     // 위도
	            const long = pos.coords.longitude; // 경도
	            geocoder.coord2Address(long, lat,function(result, status) {
	                if (status === kakao.maps.services.Status.OK) {
	                    var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
	                    
	                    const doName = result[0].address.region_1depth_name;
	                    const siName = result[0].address.region_2depth_name;
	                    const dongName = result[0].address.region_3depth_name;
	                    detailAddr += `${doName} ${siName} ${dongName}`;
	                    $('#myLocationInput').val(detailAddr);
	                }
	            });
	        });
	    } else {
	        alert("이 브라우저에서는 내 위치 기능이 지원되지 않습니다.");
	    }
	}
}




function initRecentModal() {
	
	$('#myRecentBtn').click(function() {openModal($('.products-modal__recent'))});
	$('#recentModalClose').click(function() {closeModal($('.products-modal__recent'))});
	
	/* 모달창 켜기 */
	function openModal($target) {
		$target.css('display','flex').hide().fadeIn();
	}

	/* 모달창 끄기 */
	function closeModal($target) {
		$target.fadeOut();
	}

}

function initPriceArea() {
	$('#priceInput').on('keyup', priceValidationKeyUpCheck);
	/* 가격 유효성 검사 체크 */
	function priceValidationKeyUpCheck(event) {
		const key = event.keyCode;
		const val = $(this).val();
		if(!(/^[0-9]*$/.test(val))) {
			$(this).val(val.replace(/[^0-9]/g, ''));
			alert('숫자만 입력해주세요');
		} else if(val < 100 && val.length > 0) {
			$('#price-validation-text').removeClass('invisible');
		} else {
			$('#price-validation-text').addClass('invisible');
		}
	}
	
}

function initTagArea() {
	$('#tagInput').on('keyup', hashTagEvent);
	$('#tagInput').on('keydown', function(event) {if(event.keyCode == 13) event.preventDefault();});
	
	/* 태그생성 */
	function hashTagEvent(event) {
		if(event.keyCode != 13) return false;
		
		let $ul; 
		
		if($('.products-tag-hash--div').length == 0) {
			const $div = $('<div></div>').addClass('products-tag-hash--div');
			$ul = $('<ul></ul>').addClass('products-tag-hash--ul');
			$div.append($ul);
			$('.products-tag--div2').before($div);
		} else {
			$ul = $('.products-tag-hash--ul');
		}
		
		const $li = $('<li></li>').addClass('products-tag-hash--li');
		const $btn = $('<button></button>').addClass('products-tag-hash--btn-text').text(`#${$(this).val()}`).click(editTag);
		const $closeBtn = $('<button></button>').addClass('products-tag-hash--btn-close').click(deleteTag);
		const $fas = $('<i></i>').addClass('fas fa-times');
		
		const $frag = $(document.createDocumentFragment());
		$frag.append($li);
		$closeBtn.append($fas);
		$li.append($btn, $closeBtn);
		
		$ul.append($frag);
		$(this).val('');
	}
	
	/* 태그 삭제 */
	function deleteTag(e) {
		e.preventDefault();
	}

	/* 태그 수정 */
	function editTag(e) {
		e.preventDefault();
	}
}


/* 표현식 + 공백 체크 */
function inputCheck(inputObj) {
	const exp = inputObj.exp;
	const $inputID = $(`#${inputObj.inputID}`);
	const $validationDiv = $(`#${inuptObj.validationDivID}`);
	
	if(!exp.test($inputID.val())) {
		$validationDiv.text('형식에 알맞지 않습니다.');
		validationDivID.show();
	} else if(!inputID.val().length){
		$validationDiv.text('값을 입력해주십시오');
		validationDivID.show();
	} else {
		validationDIvID.hide();
	}
}

/* 제목 size check 
 * sizeObj 속성값
 * sizeObj.textId : 검사할 해당 input
 * sizeObj.sizeId : 길이를 나타내는 div의 id
 * sizeObj.size : 길이
 * */
function sizeCheck(sizeObj) {
	const $textId = $(`#${sizeObj.textId}`);
	const $sizeId = $(`#${sizeObj.sizeId}`);
	const size = sizeObj.size;
	
	if($textId.val().length > size) {
		alert(`${size}자를 초과할 수 없습니다.`);
		$textId.val($textId.val().substring(0,size));
	}
	$sizeId.text($textId.val().length);
}


/* 공백 검사 */
function checkNull(id, msg) {
	const $target = $(`#${id}`);
	if(!$target.val().length) {
		alert(`${msg}을 입력해주세요`);
		$target.focus();
		return true;
	}
	return false;
}


