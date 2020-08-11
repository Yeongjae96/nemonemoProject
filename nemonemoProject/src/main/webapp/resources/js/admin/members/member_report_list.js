/* 한국어 처리 */
$(function() {
	const table = $('#mem-report-list').DataTable({
		responsive : true,
		// ajax: "category_example.json",
		//   buttons: {              
		//     name: 'primary',
		//     buttons: [ 'copy', 'csv', 'excel', 'pdf'],
		// },
		"language" : {
			"decimal" : "",
			"emptyTable" : "표에서 사용할 수있는 데이터가 없습니다.",
			"info" : "총 _TOTAL_명  _START_에서 _END_까지 표시",
			"infoEmpty" : "0 개 항목 중 0 ~ 0 개 표시",
			"infoFiltered" : "(_MAX_ 총 항목에서 필터링 됨)",
			"infoPostFix" : "",
			"thousands" : ",",
			"lengthMenu" : "페이지 수 : _MENU_개",
			"search" : "검색: ",
			"zeroRecords" : "일치하는 레코드가 없습니다.",
			"paginate" : {
				"first" : "처음",
				"last" : "마지막",
				"next" : "다음",
				"previous" : "이전"
			},
			"aria" : {
				"sortAscending" : ": 오름차순으로 정렬",
				"sortDescending" : ": 내림차순으로 정렬"
			},
		},
	});
	$(".with-gap").on('change', setDisplay);
	

});

//신고리스트 -> 카테고리 등록 페이지 이동
$('#reportCategoryBtn').click(function() {window.location.href = 'category/list.mdo'});

//카테고리 등록 페이지 -> 신고리스트 이동
$('#reportCategoryBtnz').click(function() {window.location.href = 'http://localhost:8080/nemonemoProject/members/report/list.mdo'});





 

/* 삭제 버튼 기능 */
/* 삭제 버튼을 누르면 해당 익명 함수를 실행해라 */

/*
 $('.Category-del-btn').click(function() {
 // 누른 버튼의 dataset(data-*)에 속성값 인reportcategoryno 를 reportcategoryno 변수에 담아라.
 const reportCategoryNO = $(this).data('reportcategoryno');
 console.log(reportCategoryNO);

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
 name: 'reportCategoryNO',
 value: reportCategoryNO,
 });

 $form.append($input);
 $('body').append($form);
 $form[0].submit();
 $form.remove();
 });

 */


//신고 카테고리 삭제 모달
(function deleteModal() {

	let reportCategoryNO;

	$('.Category-del-btn').click(
			function() {
				reportCategoryNO = $(this).data('reportcategoryno');
				const reportCategoryName = $(this).closest('tr').children().eq(
						1).text();

				$('.modal-title > span').text(
						`${reportCategoryNO}번  (${reportCategoryName})`);
			});

	$('#CategoryDelete').click(function() {
		$.ajax({
			url : 'delete.mdo',
			method : 'POST',
			data : {
				reportCategoryNO : reportCategoryNO
			},
			dataType : 'json'
		}).done(function(data) {
			window.location.reload(true);
		}).fail(function(error) {
			alert('삭제에 실패하였습니다. (ERROR CODE: ', error, ')');
		});
	});
}());



//신고 카테고리 수정 버튼
$('.Category-upd-btn').click(function() {
	// 누른 버튼의 dataset(data-*)에 속성값 인reportcategoryno 를 reportcategoryno 변수에 담아라.
	const reportCategoryNO = $(this).data('reportcategoryno');
	console.log(reportCategoryNO);

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
		name : 'reportCategoryNO',
		value : reportCategoryNO,
	});

	$form.append($input);
	$('body').append($form);
	$form[0].submit();
	$form.remove();

});

//신고 리스트 수정 버튼

$('#listup').click(function() {
	// 누른 버튼의 dataset(data-*)에 속성값 인reportcategoryno 를 reportcategoryno 변수에 담아라.
	const reportNO = $(this).data('reportno');
	console.log(reportNO);

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
		name : 'reportNO',
		value : reportNO,
	});

	$form.append($input);
	$('body').append($form);
	$form[0].submit();
	$form.remove();

});






function setDisplay() {
	if ($('input:radio[id=top-category]').is(':checked')) {
		$('#hiden1').hide();
	} else {
		$('#hiden1').show();
	}
}

-


function on_click() {
	swal({
		title : "Good job!",
		text : "You clicked the button!",
		icon : "success",
	});
}




