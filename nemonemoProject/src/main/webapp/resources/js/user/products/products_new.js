let index = 0;
let countIndex = 0;
$(function() {
	$('#fileName').on('change', function() {
		readURL(this);
	});
	
	$('#myLocationBtn').click(getPlaceFromCoords); // 내위치 클릭시 내위치구하는 함수
	$('#priceInput').on('keyup', priceValidationKeyUpCheck);
	$('#tagInput').on('keyup', hashTagEvent);
	$('#tagInput').on('keydown', function(event) {if(event.keyCode == 13)event.preventDefault();});
	
});



const data = {
		categories : [
			{
				id: '400',
				title: '패션잡화',
				url: 'aa',
				categories : [{
					id: '400010',
					title: '여성가방',
					categories: [{
						id: '400010100',
						title: '숄더백'
					}, {
						id: '400010200',
						title: '가방'
					}]
				}]
			}
		],
}
/* 카테고리 클릭 시 이벤트 */
function categoryInit(categories) {
	
// $.each(categories, function(k, v) {
// console.log('key : ', k, 'value : ', v );
// if(v.constructor == Array) {
// $.each(v, function(k2, v2) {
// console.log('key : ', k2, 'value : ', v2 );
//				AZXXX 
// }
// });
}

/* */
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
	const $btn = $('<button></button>').addClass('products-tag-hash--btn-text').text(`#${$(this).val()}`);
	const $closeBtn = $('<button></button>').addClass('products-tag-hash--btn-close');
	const $fas = $('<i></i>').addClass('fas fa-times');
	
	
	$closeBtn.append($fas);
	$li.append($btn, $closeBtn);
	
	
	$ul.append($li);
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


/* 사진 미리 보기 함수 */
function readURL(input) {
	if(input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			
			if($('.image-registry--user').length >= 8) {
				alert('사진은 최대 8장 까지 올릴 수 있습니다.');
				return;
			}
			
			const $li = $('<li></li>');
			$li.attr({
				draggable: 'false',
			});
			$li.addClass('image-registry--user');
			
			const $image = $('<img/>');
			$image.attr({
				'src': e.target.result,
				alt: '상품이미지'
			});
			const $div = $('<div></div>');
			if($('.image-registry--user').length == 0){
				$div.addClass('text-registry--representive').text('대표이미지');		
			}
// const $input = $('<input type="hidden" name="fileN"'+`
// id="input_file_${index++}" `+'/>');
// $li.append($input);
			const $closeBtn = $('<button></button>');
			
			$closeBtn.attr('type', 'button');
			$closeBtn.addClass('btn-image--cancle');
			$closeBtn.click(deleteImage);
			
			
			$li.append($div);
			$li.append($image);
			$li.append($closeBtn);
			
			$('#imageList').append($li);
			console.log(input.files[0]);
			
			$('.products-title--div small').text(`(${$('.image-registry--user').length}/8)`);
		}
		reader.readAsDataURL(input.files[0]);
	}
}

/* 사진 삭제 함수 */
function deleteImage() {
// console.log('index : ' + index);
	console.log($(this).closest('li').data('index') + "aaaa");
	
	if($(this).closest('li').children('div').hasClass('text-registry--representive')) {
		const $pre = $(this).closest('li').next().find('div');
		console.log($(this).closest('li'));
		console.log($(this).closest('li').next());
		console.log($pre);
		$($pre).addClass('text-registry--representive').text('대표이미지');
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