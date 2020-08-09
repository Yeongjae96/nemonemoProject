
$(function() {
	$('#fileName').on('change', function() {
		readURL(this);
	});
	
	$('#priceInput').on('keyup', priceValidationKeyUpCheck);
	$('#tagInput').on('keyup', hashTagEvent);
	$('#tagInput').on('keydown', function(event) {if(event.keyCode == 13)event.preventDefault();});
	$('#myLocationBtn').click(getPlaceFromCoords); // 내위치 클릭시 내위치구하는 함수
	$('#recentModalClose').click(function() {closeModal($('.products-modal__recent'))});
	$('#myRecentBtn').click(function() {openModal($('.products-modal__recent'))});
});


/* 모달창 켜기 */
function openModal($target) {
	$target.css('display','flex').hide().fadeIn();
}

/* 모달창 끄기 */
function closeModal($target) {
	$target.fadeOut();
}


/* 카테고리 클릭 시 이벤트 */
function categoryInit(categories) {
	
// $.each(categories, function(k, v) {
// console.log('key : ', k, 'value : ', v );
// if(v.constructor == Array) {
// $.each(v, function(k2, v2) {
// console.log('key : ', k2, 'value : ', v2 );
// AZXXX
// }
// });
}

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

/* 카테고리 동적 삽입 함수 (미완성) */
function insertCategory(id, obj) {
	const $ul = $('<ul></ul>').addClass('products-category-list');
	$.each(obj, function(key, value) {
		$li = $('<li></li>').addClass('products-category-item');
		$btn = $('<button></button>').addClass('products-category-btn').text(obj[a]);
		
		$li.append($btn);
		$ul.append($li);
	});
	$(`#${id}`).append($ul);
}

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

var imgarr = [];

/* 태그 삭제 */
function deleteTag(e) {
	e.preventDefault();
}


/* 태그 수정 */
function editTag(e) {
	e.preventDefault();
}

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
                    console.log(result);
                    
                    const doName = result[0].address.region_1depth_name;
                    const siName = result[0].address.region_2depth_name;
                    const dongName = result[0].address.region_3depth_name;
                    
                    detailAddr += `${doName} ${siName} ${dongName}`;
                    $('#myLocationInput').val(detailAddr);
                    console.log(detailAddr);
                }
            });
        });
    } else {
        alert("이 브라우저에서는 내 위치 기능이 지원되지 않습니다.");
    }
}