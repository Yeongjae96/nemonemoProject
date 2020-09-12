$(function() {
	sizeCheck('inputTitle', 'size', 30);
	$('#backBtn').click(function() {location.href='list.mdo'});
	initEditor();
});


/* 제목 size check */
function sizeCheck(textId, sizeId, size) {
	
	const $textId = $(`#${textId}`);
	const $sizeId = $(`#${sizeId}`);
	
	$textId.on('keyup', function() {
		const length = $textId.val().length;
		if(length > 30) {
			alert('30자를 초과할 수 없습니다.');
			$textId.val($textId.val().substring(0,30));
			return false;
		}
		
		$sizeId.text(length);
	});
}

function initEditor() {
	var oEditors = [];
	   nhn.husky.EZCreator.createInIFrame({
	      oAppRef: oEditors,
	      elPlaceHolder: "noticeContent",
	      //SmartEditor2Skin.html 파일이 존재하는 경로
	      sSkinURI : "../../resources/vendor/smarteditor/SmartEditor2SNotice.html", 
	      htParams : {
	          // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	          bUseToolbar : true,             
	          // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	          bUseVerticalResizer : true,     
	          // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	          bUseModeChanger : true,         
	          fOnBeforeUnload : function(){
	               
	          }
	      }, 
	      /* fOnAppLoad : function(){
	          //textarea 내용을 에디터상에 바로 뿌려주고자 할때 사용
	          oEditors.getById["termsContent"].exec("PASTE_HTML", ["약관을 입력해주세요."]);
	      }, */
	      fCreator: "createSEditor2"  
		});
	   $('#newBtn').click(function(e) {
		   e.preventDefault();
	    	oEditors.getById["noticeContent"].exec("UPDATE_CONTENTS_FIELD", []);	
	    	const noticeForm = document.getElementById('noticeNewForm');
	    	
	    	if(checkNull('inputTitle', '제목') || checkNull('noticeContent', '내용')) return false;
	    	
	    	console.log(document.getElementById('noticeContent').value);
	    	
	    	noticeForm.submit();
	    }); 
	   /* 빈칸 유효성 검사 */
 	function checkNull(id, idName) {
 		const target = document.getElementById(id);
 		
 		if(target.value.length == 0) {
 			alert(`${idName}을 입력해주세요`);
 			target.focus();
 			return true;
 		}
 		return false;
 	}
}

