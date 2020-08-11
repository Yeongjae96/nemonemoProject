var contentData;


$(function() {
	$.when(getArticle()).done(initEditor);
	sizeCheck('inputTitle', 'size', 30);
	$('#backBtn').click(function() {history.go(-1)});
	$('#newBtn').click(postUpdateAction);
});

/* 게시물 가져오기 */
function getArticle(data) {
	const paramName = getParam('noticeNo');
	var deferred = $.Deferred();
	$.ajax({
		url: 'getNoticeJson.mdo',
		method: 'GET',
		data: {noticeNo: paramName},
		dataType: 'json'
	}).done(function(data) {
		// 제목 불러오기
		const $inputTitle = $('#inputTitle').val(data.noticeTitle);
		// 제목 size 불러오기
		$('#size').text($inputTitle.val().length);
		// 사용여부 불러오기
		const $target = data.noticeDelFl == 'N' ? $('.radio-area label input').eq(0) : $('.radio-area label input').eq(1);
		$target.prop('checked', true);
		// 내용 불러오기
		deferred.resolve(data);
	});
	
	return deferred.promise();
}

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


/* Update 액션 */
function postUpdateAction() {
	oEditors.getById["faqContent"].exec("UPDATE_CONTENTS_FIELD", []);	
	if(checkNull('inputTitle', '제목') || checkNull('faqContent', '내용')) return false;
	
	const param = {
		noticeNo: getParam('noticeNo'),
		noticeTitle: $('#inputTitle').val(),
		noticeContent: $('#faqContent').val(),
		noticeFlag: $('.radio-area input[type="radio"]:checked').val()
	};
	
	$.ajax({
		url:'edit.mdo',
		method: 'post',
		data: param,
	})
	.done(function(data) {
		alert('수정에 성공하였습니다.');
		window.location.href=`${contextPath}/sites/notice/list.mdo`;
	}).fail(function(err) {
		alert('수정에 실패하였습니다.');
	});
}

/* 파라미터 값 리턴 */
function getParam(param) {
	const pageParam = decodeURIComponent(window.location.search.substring(1)),
	pageVariables = pageParam.split('&');
	let paramName;
	for(let i of pageVariables) {
		if(i.split('=')[0] == param)
			paramName = i.split('=')[1];
	}
	return paramName;
}

/* null값 체크 */
function checkNull(id, msg) {
	const $target = $(`#${id}`);
	if($target.val().length == 0) {
		alert(`${msg}을 입력해주세요`);
		$target.focus();
		return true;
	}
	return false;
}

/* 스마트 에디터 init (불러올때 값을 불러옴) */
var oEditors = [];
function initEditor(data2) {
	const contentData = data2.noticeContent;
	   nhn.husky.EZCreator.createInIFrame({
	      oAppRef: oEditors,
	      elPlaceHolder: "faqContent",
	      //SmartEditor2Skin.html 파일이 존재하는 경로
	      sSkinURI : (contextPath.length == 0 ? '/' : contextPath+"/") +"resources/vendor/smarteditor/SmartEditor2Skin.html", 
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
	       fOnAppLoad : function(){
	          oEditors.getById["faqContent"].exec("PASTE_HTML", [contentData]);
	      },
	      fCreator: "createSEditor2" 
		});
};

