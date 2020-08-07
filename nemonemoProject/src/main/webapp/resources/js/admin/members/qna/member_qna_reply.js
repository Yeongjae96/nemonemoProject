var oEditors = [];
		   nhn.husky.EZCreator.createInIFrame({
		      oAppRef: oEditors,
		      elPlaceHolder: "qnaReplyContent",
		      							//SmartEditor2Skin.html 파일이 존재하는 경로
		      sSkinURI : (contextPath.length == 0 ? '/' : contextPath) +"resources/vendor/smarteditor/SmartEditor2Skin.html",
		      htParams : {
		          bUseToolbar : true,             
		          bUseVerticalResizer : true,     
		          // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		          bUseModeChanger : true,         
		          fOnBeforeUnload : function(){
		               
		          }
		      }, 
		       fOnAppLoad : function(){
		          //textarea 내용을 에디터상에 바로 뿌려주고자 할때 사용
		          //oEditors.getById["termsContent"].exec("PASTE_HTML", ["약관을 입력해주세요."]);
		      }, 
		      fCreator: "createSEditor2"  
			});
		   
		   $('#termsInsert').click(function() {
				oEditors.getById["qnaReplyContent"].exec("UPDATE_CONTENTS_FIELD", []);	 	
		    	termsEditForm.submit();
		    });
		   