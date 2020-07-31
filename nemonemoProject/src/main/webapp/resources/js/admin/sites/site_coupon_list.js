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

$('#coupon_in').find('.modal-body tbody').append('<tr>').append('<td>new row<td>');

var table = $('#coupon-list');

$(function () {
    $('#coupon-list tbody').on('click','.coupon-del-btn', function(){
        var selected = this;
        $('#smallModal').modal("toggle");
        if($('#del-confirm').click(function(){
            $(selected).closest('tr').remove();
        }));
    });

    table.dataTable({
        language: {
            "decimal": "",
            "emptyTable": "표에서 사용할 수있는 데이터가 없습니다.",
            "info": "총 _TOTAL_개",
            "infoEmpty": "0 개 항목 중 0 ~ 0 개 표시",
            "infoFiltered": "(_MAX_ 총 항목에서 필터링 됨)",
            "infoPostFix": "",
            "thousands": ",",
            "lengthMenu": "_MENU_",
            "search": "검색:",
            "zeroRecords": "일치하는 레코드가 없습니다.",
            "paginate": {
                "first": "처음",
                "last": "마지막",
                "next": "다음",
                "previous": "이전"
            },
            "aria": {
                "sortAscending": ": 오름차순으로 정렬",
                "sortDescending": ": 내림차순으로 정렬",
            }
        }

    });
    
    $('.coupon-upd-btn').click(function() {
		const couponCd = $(this)[0].dataset.couponcd;
		window.location.href="edit.mdo?couponCd="+couponCd;
		alert('눌렸음');
	});
    
    /* 삭제 버튼 기능 */
	/* 삭제 버튼을 누르면 해당 익명 함수를 실행해라 */
	$('.coupon-del-btn').click(function() {
		// 누른 버튼의 dataset(data-*)에 속성값인 couponcd를 couponCd 변수에 담아라.
		const couponCd = $(this)[0].dataset.couponcd;
		console.log(couponCd);
		
		// 제이쿼리를 이용해서 동적 dom 생성( document.createElement('form') )
		// attr(속성 부여) -> ('','') -> 단일속성, {} -> 다중속성 
		$form = $('<form></form>').attr({
			action: "delete.mdo",
			method: "POST"
		});
		// attr(속성 부여) -> ('','') -> 단일속성, {} -> 다중속성 
		// input의 name은 파라미터의 키값, value는 값
		$input = $('<input/>').attr({
			type: 'hidden',
			name: 'couponCd',
			value: couponCd,
		});
		
		/* form안에 만든 input값을 넣어주겠다. */
		$form.append($input);
		$('body').append($form);
		$form[0].submit();
		$form.remove();
	});
    
     $('#couponSrtYmd').datepicker({
        format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
        // startDate: '-10d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
        // endDate: '+10d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
        autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
        calendarWeeks : true, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
        clearBtn : true, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
        // datesDisabled : ['2019-06-24','2019-06-26'],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
        daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
        // daysOfWeekHighlighted : [3], //강조 되어야 하는 요일 설정
        disableTouchKeyboard : true,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
        immediateUpdates: true,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
        multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
        multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
        templates : {
            leftArrow: '&laquo;',
            rightArrow: '&raquo;'
        }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
        showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
        title: "등록일",	//캘린더 상단에 보여주는 타이틀
        todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
        toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
        weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
        language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
        
    });//datepicker end

    $('#couponEndYmd').datepicker({
        format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
        // startDate: '-10d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
        // endDate: '+10d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
        autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
        calendarWeeks : true, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
        clearBtn : true, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
        // datesDisabled : ['2019-06-24','2019-06-26'],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
        daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
        // daysOfWeekHighlighted : [3], //강조 되어야 하는 요일 설정
        disableTouchKeyboard : true,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
        immediateUpdates: true,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
        multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
        multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
        templates : {
            leftArrow: '&laquo;',
            rightArrow: '&raquo;'
        }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
        showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
        title: "종료일",	//캘린더 상단에 보여주는 타이틀
        todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
        toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
        weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
        language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
        
    });//datepicker end
    
   


   
    
    $('#CouponInsert').click(function() {
    	insertCoupon();
    });
    
    
});


/* form data submit */
function insertCoupon() {
	couponForm.submit();
}

//function to_date1(){
//    var yyyyMMdd = String($("#couponSrtYmd").val());
//    var sYear = yyyyMMdd.substring(0,4);
//    var sMonth = yyyyMMdd.substring(5,7);
//    var sDate = yyyyMMdd.substring(8,10);
//
//    var ddd = new Date(Number(sYear), Number(sMonth)-1, Number(sDate));
////    alert("111111 : sYear :"+sYear +"   sMonth :"+sMonth + "   sDate :"+sDate);
//    alert (ddd);
////    element.setAttribute('couponSrtYmd',ddd);
//    document.getElementById('couponSrtYmd').setAttribute('value',ddd);
//}
//
//
//function to_date2(){
//    var yyyyMMdd = String($("#couponEndYmd").val());
//    var sYear = yyyyMMdd.substring(0,4);
//    var sMonth = yyyyMMdd.substring(5,7);
//    var sDate = yyyyMMdd.substring(8,10);
//
//    var dd = new Date(Number(sYear), Number(sMonth)-1, Number(sDate));
////    alert("111111 : sYear :"+sYear +"   sMonth :"+sMonth + "   sDate :"+sDate);
//    alert (dd);
//    document.getElementById('couponEndYmd').setAttribute('value',dd);
//}
//
//function to_d(){
//	var fromDate = new Date($("#couponSrtYmd").val());
//	var toDate = new Date($("#couponEndYmd").val());
//	var date = new Date(fromDate).format("yyyy-mm-dd");
//	var date2 = new Date(toDate).format("yyyy-mm-dd");
//	alert(date+" ~ " + date2);
//}

//var date  = new Date().format('yyyy-mm-dd');




//var StartDate = $.fullCalendar.formatDate(start, 'yyyy-MM-dd');
//var EndDate = $.fullCalendar.formatDate(end, 'yyyy-MM-dd');

