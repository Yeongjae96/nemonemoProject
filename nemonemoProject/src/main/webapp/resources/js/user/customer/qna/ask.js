$(function(){
	$('.customer-nav-not-selected').eq(3).attr('class', 'customer-nav-selected');        
	initImageArea();
	initRegBtn();
	initPdMenu();
});

/* 이미지 영역 */
const fileBuffer = []; // 파일 저장용 전역변수

function initImageArea(){
	$('#inputFile').on('change', readURL); // 다른 파일을 올렸을 때 자동으로 실행이 됨
	
	/* 사진 미리보기 함수 */
	function readURL(){
		const maxSize = 10 * 1024 * 1024;
		
		const input = this;
		if(input.files && input.files[0]){ // 올린 파일 선택  파일이 있으면 실행
			var reader = new FileReader();
			if($('.addImgBtn').length + input.files.length > 5){
				alert("사진은 최대 5장까지 올릴 수 있습니다.");
				return false;
			}
			let index = 0;
			reader.onload = function(e){
				
				if(index >= input.files.length){ 
					return false;
				}
				
				const fileSize = input.files[index].size;
				if(fileSize > maxSize){
					alert("이미지파일 사이즈는  10MB 이내로 등록 가능합니다.");
					return false;
				}
					// 올리는 파일이 index 보다 많으면 false
				const image = input.files[index];
				const fileEx = image.name.slice(image.name.lastIndexOf(".")+1).toLowerCase();
				if(fileEx != "jpg" && fileEx != "png" && fileEx != "gif" && fileEx !="bmp" && fileEx != "jpeg"){
					alert("파일은 이미지파일(jpg, jpeg, png, gif, bmp)만 가능합니다.");
					return false;
				}
				fileBuffer.push(image); /* 동적으로 파일 push */
				const $div = $('<div></div>').addClass("img-box");
				const $imgBtn = $('<button></button>').addClass('addImgBtn');
				const $img = $('<img/>').attr({'src' : this.result, alt : '상품이미지'}).addClass('addImg');
				const $delImgBtn = $('<button>삭제</button>');				
				$delImgBtn.attr('type', 'button').addClass('delImgBtn').click(deleteImage);
				$imgBtn.append($img);
				$div.append($imgBtn, $delImgBtn);
				
				/* 선택한 사진들 모두 붙여주기 */
				$('.img-outline-box').append($div);
				
				// 전역변수 배열 데이터 추가
				
				reader.readAsDataURL(input.files[index++]);	
			}
			reader.readAsDataURL(input.files[index]);
		}
	
	}
	
	/* 사진 삭제 함수 */
function deleteImage() {
		/* 배열 내의 파일 제거 */
		 const fileIndex = $(this).closest('.img-box').index();
		 console.log(fileIndex);
	     fileBuffer.splice(fileIndex-1,1); // 원래 배열에서 삭제해 줄 수 있는 splice
		$(this).closest('.img-box').remove();
	};
}


/* 게시물 등록 */
function initRegBtn() {
	$('#qnaSubmit').click(function(){

	regAction.call(this); }); // 클릭 이벤트 안에서 function을 열면 사라질 수 있으니.. this가 window로 안바뀌게 내가 가지고 있는 this를 명시해 부름
	
	function regAction(){
		$('#newQuestionForm').ajaxForm({ // .ajaxSubmit???? 모든 태그를 다 읽음..
			url:'newQuestionJson.do',
			type:'post',
			enctype: "multipart/form-data", // 필수
			dataType: 'json',
			beforeSubmit : function(data, form, option){ // data는 실질적으로 보내는 데이터
				// 동적 사진 정보 동적 할당
				console.dir(fileBuffer);
				console.log(data, form);
				fileBuffer.forEach(function(e,i){ // 첫번째가 요소, 두번째가 인덱스
					const obj = { // 임의 객체이름 
							name: 'questionImages['+i+']', 
							type: 'file',
							value: e // 요소
					}
					data.push(obj);
					console.log("after data : ", data);
				});
			},
			success: function(data){
				//<c:url value="/customer/qna/list.do"/>
				window.location.href= contextPath + "customer/qna.do";
			},
			error: function(error){
				alert('error : 에러', error)
			}
		});
	}	// 사진등록 end 
	
	
	
}






