const fileBuffer = []; // 파일저장용 전역변수
let lastClickCategoryNo;

$(function() {
	initImageArea();
});

/* 이미지 영역 */
function initImageArea() {
	$('#inputFile').on('change', readURL);
	
	
	/* 사진 미리 보기 함수 */
	function readURL() {
		const maxSize = 10 * 1024 * 1024;//10MB

		const input = this;
		if(input.files && input.files[0]) {
			var reader = new FileReader();

			if($('.image-registry--user').length + input.files.length > 8) {
				alert('사진은 최대 8장 까지 올릴 수 있습니다.');
				return false;
			}
			let index = 0;
			reader.onload = function(e) {
				
				const fileSize = input.files[index].size;
				if(fileSize > maxSize) {
					alert('이미지파일 사이즈는 10MB 이내로 등록 가능합니다. ');
					return false;
				}
				
				
				if(index >= input.files.length) {
					return false;
				}
				const image = input.files[index];
				// 파일 유효성 검사
				const fileEx = image.name.slice(image.name.lastIndexOf(".")+1).toLowerCase();
				if(fileEx != "jpg" && fileEx != "png" && fileEx != "gif" && fileEx != "bmp" && fileEx != "jpeg") {
					alert('파일은 이미지파일(jpg, jpeg, png, gif, bmp)만 가능합니다.');
					return false;
				}
				fileBuffer.push(image);
				const $div = $('<div></div>');
				
				if($('.image-registry--user').length == 0){
					index=0;
					$div.addClass('text-registry--representive').text('대표이미지');		
				}
				const $li = $('<li></li>').attr({draggable: 'false'}).addClass('image-registry--user');
				const $image = $('<img/>').attr({'src': this.result, alt: '상품이미지'});
				const $closeBtn = $('<button></button>');
				
				$closeBtn.attr('type', 'button').addClass('btn-image--cancle').click(deleteImage);
				$li.append($div, $image, $closeBtn);
				
				$('#imageList').append($li);
				
				// 전역변수 배열 데이터 추가
				$('.products-title--div small').text(`(${$('.image-registry--user').length}/8)`);
				
				reader.readAsDataURL(input.files[index++]);
			}
			reader.readAsDataURL(input.files[index]);
			console.log(fileBuffer);
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


function checks(){ 

	// 상점명 공백 확인
	if($("#storeName").val() == ""){ 
		alert("상점명을 입력해주세요"); 
		$("#storeName").focus(); 
		return false; 
	}

	// 상점소개 공백 확인
	if($("#storeIntro").val() == ""){ 
		alert("상점소개를 입력해주세요"); 
		$("#storeIntro").focus(); 
		return false; 
	}
	
	updateCheck();
	
}


function updateCheck() {
	if (confirm("정말 수정하시겠습니까??") == true) { // 확인
		document.updateStore.submit();
		//alert("다시 로그인 해주세요");
	} else { // 취소
		return;
	}

}
