/**
 * 
 */

$(function () {
    initDatePicker('sales_product_prev');
    initDatePicker('sales_product_next');
}); 

function initDatePicker(btnId) {
    $(`#${btnId}`).datepicker({
        autoclose: true,
        format: "yyyy-mm-dd",
        container: '#sales_product_prev',
        showWeekDays : true,
        title: "날짜선택",
    });
    
   
}

// $('#datePicker').datepicker({
    // format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
    // startDate: '-10d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
    // ... //생략
    //         language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
        
    // })//여기까지가 기본 사용 방법
    //     .on("changeDate", function(e) {
    //          //이벤트의 종류
    //          //show : datePicker가 보이는 순간 호출
    //          //hide : datePicker가 숨겨지는 순간 호출
    //          //clearDate: clear 버튼 누르면 호출
    //          //changeDate : 사용자가 클릭해서 날짜가 변경되면 호출 (개인적으로 가장 많이 사용함)
    //          //changeMonth : 월이 변경되면 호출
    //          //changeYear : 년이 변경되는 호출
    //          //changeCentury : 한 세기가 변경되면 호출 ex) 20세기에서 21세기가 되는 순간
             
    //          console.log(e);// 찍어보면 event 객체가 나온다.
    //          //간혹 e 객체에서 date 를 추출해야 하는 경우가 있는데 
    //          // e.date를 찍어보면 Thu Jun 27 2019 00:00:00 GMT+0900 (한국 표준시)
    //          // 위와 같은 형태로 보인다. 
    //          // 추후에 yyyy-mm-dd 형태로 변경하는 코드를 업로드 하겠습니다. 
    //     }