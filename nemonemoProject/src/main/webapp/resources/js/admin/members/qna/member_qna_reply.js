
/* 파일 다운로드 */
function fn_fileDown(fileNo, fileNm, fileType, fileNewName){	
	window.location.href="reply/filedown.mdo?qnaImgNo=" + fileNo 
	+ "&qnaImgOriginName=" + fileNm 
	+ "&qnaImgFileName=" + fileNewName
	+ "&qnaImgType=" + fileType;
							
};

$(function () {
$('.imgAnchor').click(function(){
		const fileNo = $(this).data("imgno");
		const fileNm = $(this).data("imgnm");
		const fileNewName = $(this).data("filenm")
		const fileType = $(this).data("imgtype");
		fn_fileDown(fileNo, fileNm, fileType,
				fileNewName);
	});
});


$(function () {
$('.replyCancelBtn').click(function() {window.location.href="qna/list.mdo"});
});
