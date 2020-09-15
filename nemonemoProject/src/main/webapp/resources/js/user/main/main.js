

$(function() {
	initBanner();
	initPdMenu();
});



function initBanner() {
	$('.banner').slick({
		autoplay: true,
		arrows: true,
		autoplaySpeed: 3000, // 이미지가 다른 이미지로 넘어 갈때의 텀
		// dots: true, 		// 스크롤바 아래 점으로 페이지네이션 여부
		autoplay: true,			// 자동 스크롤 사용 여부
		autoplaySpeed: 10000, 		// 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
		pauseOnHover: true,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
		vertical: false,		// 세로 방향 슬라이드 옵션
		prevArrow: "<button type='button' class='slick-prev'>Previous</button>",		// 이전 화살표 모양 설정
		nextArrow: "<button type='button' class='slick-next'>Next</button>",		// 다음 화살표 모양 설정
		draggable: true, 	//드래그 가능 여부 
	});

	var swiper = new Swiper('.swiper-container', {
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		},
//		autoplay: true,
//		slidesPerView : 4, // 동시에 보여줄 슬라이드 갯수
////		spaceBetween : 30, // 슬라이드간 간격
//		slidesPerGroup : 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
//
//		// 그룹수가 맞지 않을 경우 빈칸으로 메우기
//		// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
//		loopFillGroupWithBlank : true,

//		loop : true, // 무한 반복
	});
	
	$(".items").not('.slick-initialized').slick({
		autoplay: true,
		arrows: true,
		autoplaySpeed: 3000 /* 이미지가 다른 이미지로 넘어 갈때의 텀 */,
	});

	/* 광고 배너, 메인 배너 끝 */
}
