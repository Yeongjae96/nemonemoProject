
/* 파일 다운로드 */
function fn_fileDown(fileNo, fileNm, fileType){	
	window.location.href="reply/filedown.mdo?qnaImgNo=" + 
	fileNo + "&qnaImgOriginName=" + 
	fileNm + "&qnaImgType=" + fileType;
							
};

$(function () {
$('.imgAnchor').click(function(){
		const fileNo = $(this).data("imgno");
		const fileNm = $(this).data("imgnm");
		const fileType = $(this).data("imgtype");
		fn_fileDown(fileNo, fileNm, fileType);
	});
});


$(function () {
$('.replyCancelBtn').click(function() {window.location.href="qna/list.mdo"});
});
