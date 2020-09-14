

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


//window.onload = function() {
//    var bannerLeft=0;
//    var first=1;
//    var last;
//    var imgCnt=0;
//    var $img = $(".banner_wraper img");
//    var $first;
//    var $last;
//
//    $img.each(function(){   // 5px 간격으로 배너 처음 위치 시킴
//        $(this).css("left",bannerLeft);
//        bannerLeft += $(this).width()+5;
//        $(this).attr("id", "banner"+(++imgCnt));  // img에 id 속성 추가
//    });
//
//    
//    if( imgCnt > 9){                //배너 9개 이상이면 이동시킴
//
//
//
//        last = imgCnt;
//
//        setInterval(function() {
//            $img.each(function(){
//                $(this).css("left", $(this).position().left-1); // 1px씩 왼쪽으로 이동
//            });
//            $first = $("#banner"+first);
//            $last = $("#banner"+last);
//            if($first.position().left < -200) {    // 제일 앞에 배너 제일 뒤로 옮김
//                $first.css("left", $last.position().left + $last.width()+5 );
//                first++;
//                last++;
//                if(last > imgCnt) { last=1; }   
//                if(first > imgCnt) { first=1; }
//            }
//        }, 50);   //여기 값을 조정하면 속도를 조정할 수 있다.(위에 1px 이동하는 부분도 조정하면 
//
////깔끔하게 변경가능하다           
//
//}
//
//};



// 탭 메뉴
//$(function () {
//
//    $(".tab_content").hide();
//    $(".tab_content:first").show();
//
//    $("ul.tabs li").click(function () {
//        $("ul.tabs li").removeClass("active").css("color", "#333");
//        //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
//        $(this).addClass("active").css("color", "darkred");
//        $(".tab_content").hide()
//        var activeTab = $(this).attr("rel");
//        $("#" + activeTab).fadeIn()
//    });
//});