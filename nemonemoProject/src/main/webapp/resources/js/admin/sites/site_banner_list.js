/**
 * 
 */

/* 모달 팝업 */
function open_pop(e) {
	$('.smallModal').show();
};
// 모달 팝업 클로즈
function close_pop(flag) {
	$('#myModal').hide();
};

var table = $('#banner-list');

// $(function () {
// $('#banner-list tbody').on('click', '.banner-del-btn', function(){
// var selected = this;
// $('#smallModal').modal("toggle");
// if($('#del-confirm').click(function(){
// $(selected).closest('tr').remove();
// }));
// });

$('#datePicker').datepicker({
	format : "yyyy-mm-dd", // 데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
	// startDate: '-10d', //달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달
	// y : 년 w : 주)
	// endDate: '+10d', //달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년
	// w : 주)
	autoclose : true, // 사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
	calendarWeeks : true, // 캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
	clearBtn : true, // 날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
	// datesDisabled : ['2019-06-24','2019-06-26'],//선택 불가능한 일 설정 하는 배열 위에 있는
	// format 과 형식이 같아야함.
	daysOfWeekDisabled : [ 0, 6 ], // 선택 불가능한 요일 설정 0 :W 일요일 ~ 6 : 토요일
	// daysOfWeekHighlighted : [3], //강조 되어야 하는 요일 설정
	disableTouchKeyboard : true, // 모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동
									// 안함.
	immediateUpdates : true, // 사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false
	multidate : false, // 여러 날짜 선택할 수 있게 하는 옵션 기본값 :false
	multidateSeparator : ",", // 여러 날짜를 선택했을 때 사이에 나타나는 글짜
								// 2019-05-01,2019-06-01
	templates : {
		leftArrow : '&laquo;',
		rightArrow : '&raquo;'
	}, // 다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징
	showWeekDays : true,// 위에 요일 보여주는 옵션 기본값 : true
	title : "등록일", // 캘린더 상단에 보여주는 타이틀
	todayHighlight : true, // 오늘 날짜에 하이라이팅 기능 기본값 :false
	toggleActive : true, // 이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜
							// 삭제
	weekStart : 0,// 달력 시작 요일 선택하는 것 기본값은 0인 일요일
	language : "ko" // 달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.

});// datepicker end

table.dataTable({
	language : {
		"decimal" : "",
		"emptyTable" : "표에서 사용할 수있는 데이터가 없습니다.",
		"info" : "총 _TOTAL_개",
		"infoEmpty" : "0 개 항목 중 0 ~ 0 개 표시",
		"infoFiltered" : "(_MAX_ 총 항목에서 필터링 됨)",
		"infoPostFix" : "",
		"thousands" : ",",
		"lengthMenu" : "_MENU_",
		"search" : "검색:",
		"zeroRecords" : "일치하는 레코드가 없습니다.",
		"paginate" : {
			"first" : "처음",
			"last" : "마지막",
			"next" : "다음",
			"previous" : "이전"
		},
		"aria" : {
			"sortAscending" : ": 오름차순으로 정렬",
			"sortDescending" : ": 내림차순으로 정렬",
		}
	}

});
// $("#change").change(function() {
// $(".content-div").hide();
// $("#" + $(this).val()).show();
// });

/* 삭제 모달 */
(function deleteModal() {

	let bannerNo;

	$('.banner-del-btn').click(function() {
		bannerNo = $(this).data('bannerno');
		const bannerOrder = $(this).closest('tr').children().eq(1).text();

		$('.modal-title > span').text(`${bannerNo}번  (${bannerOrder})`);
	});

	$('#bannerDelete').click(function() {
		$.ajax({
			url : 'delete.mdo',
			method : 'POST',
			data : {
				bannerNo : bannerNo
			},
			dataType : 'json'
		}).done(function(data) {
			window.location.reload(true);
		}).fail(function(error) {
			alert('삭제에 실패하였습니다. (ERROR CODE: ', error, ')');
		});
	});
}());

// 수정 리스트 수정 버튼

$('.banner-upd-btn').click(function() {
	
	const bannerNo = $(this).data('bannerno');
	console.log(bannerNo);

	// 제이쿼리를 이용해서 동적 dom 생성( document.createElement('form') )
	// attr(속성 부여) -> ('','') -> 단일속성, {} -> 다중속성
	$form = $('<form></form>').attr({
		action : "edit.mdo",
		method : "GET"
	});

	// attr(속성 부여) -> ('','') -> 단일속성, {} -> 다중속성
	// input의 name은 파라미터의 키값, value는 값
	$input = $('<input/>').attr({
		type : 'hidden',
		name : 'bannerNo',
		value : bannerNo,
	});

	$form.append($input);
	$('body').append($form);
	$form[0].submit();
	$form.remove();

});


// 이미지 업로드 부분 js

$(function(){
	initImageArea(); // 이미지 올렸을떄 화면에 미리 띄움
	initRegBtn();	// 이미지 업로드
	initPdMenu();	// 메인 카테고리를 띄울 수 있음
});


/* 이미지 영역 */
const fileBuffer = []; // 파일 저장용 전역변수

function initImageArea(){
	$('#inputFile').on('change', readURL); // 다른 파일을 올렸을 때 자동으로 실행이 됨
	
	/* 사진 미리보기 함수 */
	function readURL(){
		const maxSize = 10 * 1024 * 1024;
		
		const input = this;
		if(input.files && input.files[0]){ // 올린 파일 선택 파일이 있으면 실행
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
			console.log(fileBuffer);
		}
	
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

	
/* 게시물 등록 */
function initRegBtn() {
		$('#banneradd').click(function(){
			alert("배너 등록이 완료되었습니다.");
		regAction.call(this); }); // 클릭 이벤트 안에서 function을 열면 사라질 수 있으니.. this가
									// window로 안바뀌게 내가 가지고 있는 this를 명시해 부름
		
		function regAction(){
			alert("regAction!");
			$('#imageActionForm').ajaxForm({ // .ajaxSubmit???? 모든 태그를 다 읽음..
				url:'newBannerJson.do',
				type:'post',
				enctype: "multipart/form-data", // 필수
				dataType: 'json',
				beforeSubmit : function(data, form, option){ // data는 실질적으로
																// 보내는 데이터
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
					alert("성공했다!!!!");
					window.location.href="nemonemoProject/sites/banner/list.mdo";
				},
				error: function(error){
					alert('error : 에러', error)
				}
			});
		}
}// 사진등록 end
		



