
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

var oEditors = [];
		   nhn.husky.EZCreator.createInIFrame({
		      oAppRef: oEditors,
		      elPlaceHolder: "qnaAdminContent",
		      sSkinURI : "../../resources/vendor/smarteditor/SmartEditor2Skin.html", 
		      htParams : {
		          bUseToolbar : true,             
		          bUseVerticalResizer : true,     
		          bUseModeChanger : true,         
		          fOnBeforeUnload : function(){
		          }
		      }, 
		       fOnAppLoad : function(){
		          oEditors.getById["qnaAdminContent"].exec("PASTE_HTML", [contentData]);
		      },
		      fCreator: "createSEditor2" 
			});
		   $('#replyBtn').click(function() {
				oEditors.getById["qnaAdminContent"].exec("UPDATE_CONTENTS_FIELD", []);	 	
		    	termsEditForm.submit();
		    });
		   $('.replyCancelBtn').click(function() {window.location.href="qna/list.mdo"});
