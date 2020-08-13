
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
	});
	
	$(".items").not('.slick-initialized').slick({
		autoplay: true,
		arrows: true,
		autoplaySpeed: 3000 /* 이미지가 다른 이미지로 넘어 갈때의 텀 */,
	});

	/* 광고 배너 끝 */
}