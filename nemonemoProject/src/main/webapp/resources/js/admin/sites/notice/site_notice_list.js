$(function () {
    const table = $('#notice-table').DataTable({
	    responsive: true,
	    "language": {
	        "decimal":        "",
	        "emptyTable":     "표에서 사용할 수있는 데이터가 없습니다.",
	        "info":           "총 _TOTAL_명  _START_ 개에서 _END_ 개까지 표시",
	        "infoEmpty":      "0 개 항목 중 0 ~ 0 개 표시",
	        "infoFiltered":   "(_MAX_ 총 항목에서 필터링 됨)",
	        "infoPostFix":    "",
	        "thousands":      ",",
	        "lengthMenu":     "페이지 수 : _MENU_개",
	        "search":         "검색: ",
	        "zeroRecords":    "일치하는 레코드가 없습니다.",
	        "paginate": {
	            "first":      "처음",
	            "last":       "마지막",
	            "next":       "다음",
	            "previous":   "이전"
	        },
	        "aria": {
	            "sortAscending":  ": 오름차순으로 정렬",
	            "sortDescending": ": 내림차순으로 정렬"
	        },
	    },
	});
    
    $('#regBtn').click(function() {window.location.href='new.mdo'});
    
    /* 사용 미사용 누르면 바뀌는 클릭 이벤트*/
    $('#result > tr > td > span').click(function() {
    	$.ajax({
    		url: 'flag.mdo',
    		method:'post',
    		data: {
    			noticeNo: $(this).closest('tr').data('no'),
    			noticeDelFl: $(this).text() == "사용" ? "Y" : "N"
    		}
    	}).done(function(data) {
    		alert('사용여부를 변경합니다.');
    		window.location.reload(true);
    	}).fail(function(error) {
    		alert('사용 여부 설정에 실패하였습니다.')
    	});
    });
    
    
    $('.notice-upd-btn').click(function() {
    	const noticeNo = $(this)[0].dataset.noticeno;
    	window.location.href="edit.mdo?noticeNo="+noticeNo;
    });
    
    
    
    $('#NoticeInsert').click(function() {
    	oEditors.getById["noticeContent"].exec("UPDATE_CONTENTS_FIELD", []);	
    	document.noticeForm.submit();
    });	
    
    /* 삭제 버튼 기능 */
    /* 삭제 버튼을 누르면 해당 익명 함수를 실행해라 */
    $('.notice-del-btn').click(function() {
    	// 누른 버튼의 dataset(data-*)에 속성값인 noticeno를 noticeNo 변수에 담아라.
    	const noticeNo = $(this)[0].dataset.noticeno;
    	console.log(noticeNo);
    	
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
    		name: 'noticeNo',
    		value: noticeNo,
    	});
    	
    	/* form안에 만든 input값을 넣어주겠다. */
    	$form.append($input);
    	$('body').append($form);
    	$form[0].submit();
    	$form.remove();
    });
    
    
    
});



var oEditors = [];
function initEditor() {
	   nhn.husky.EZCreator.createInIFrame({
	      oAppRef: oEditors,
	      elPlaceHolder: "noticeContent",
	      //SmartEditor2Skin.html 파일이 존재하는 경로
	      sSkinURI : (contextPath.length == 0 ? '/' : contextPath+"/") +"resources/vendor/smarteditor/SmartEditor2Skin.html", 
	      htParams : {
	          // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	          bUseToolbar : true,             
	          // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	          bUseVerticalResizer : false,     
	          // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	          bUseModeChanger : true,         
	          fOnBeforeUnload : function(){
	          },
	          fOnAppLoad : function(){
	        	  
	          }

	      }, 
	      fCreator: "createSEditor2" 
		});
};