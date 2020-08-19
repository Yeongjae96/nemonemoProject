$(function() {
	initPdMenu();
	initCategoryBox();
	initBtn();
    initCommentEvent();
    
    
    
    function initCategoryBox() {
    	$('.detail-menu-cbox__area').mouseenter(showCbox);
    	$('.detail-menu-cbox__area').mouseleave(hideCbox);
    	
    	function showCbox() {
    		$(this).find('.detail-menu-cbox__list').show();
    	}
    	
    	function hideCbox() {
    		$(this).find('.detail-menu-cbox__list').hide();
    	}
    }
    
    function initBtn() {
   	 $('#bottomCallBtn').click(function() {
   	        $('#callModal').css('display', 'flex');
   	    });
   	    $('#bottomBuyBtn').click(function() {
   	        $('#buyModal').css('display', 'flex');
   	    });
   	    $('#callBtn').click(function() {
   	        $('#callModal').css('display', 'flex');
   	    });

   	    $('#buyBtn').click(function(){
   	        $('#buyModal').css('display', 'flex');
   	    });

   	    $('#zzimBtn').click(function() {
   	        $zzimDiv = $('.detail-info__btn-zzim').toggleClass('detail--active');
   	    });
   	    
   	    $('#reportBtn').click(function() {
   	    	$('#productReportModal').css('display', 'flex');
   	    });
   }
    
    function initCommentEvent() {
    	
    	const $textArea = $('.detail-comment__textarea');
    	
    	sizeObj = {};
    	sizeObj.textId = 'commentTextArea';
    	sizeObj.sizeId = 'commentSize';
    	sizeObj.size = 100;
    	
    	$textArea.keyup(function() {sizeCheck.call(this, sizeObj)});
    	
    	$('.detail-comment__reg-btn').click(insertComment);
    	
    	/* 댓글 등록 */
    	function insertComment() {
    		
    		if(checkNull('commentTextArea', '메시지')) return false;
    		
    		const url = window.location.href;
        	const productNo = url.substring(url.lastIndexOf('/')+1, url.lastIndexOf('.'));
    		
    		const param = {
    	    		productNo: productNo,
    	    		productCommentContent: $textArea.val(),
    	    	};
    		
    		$.ajax({
    			url: productNo + '/new.do',
    			method: 'post',
    			data: param,
    		}).done(function(data) {
    			console.log(data);
    			if(data == -1) {
    				alert('로그인이 필요한 서비스입니다.');
    			} else if(data == 0) {
    				alert('댓글 등록에 실패하였습니다.');
    			} else if(data == 1){
    				alert('댓글 등록에 성공하였습니다.');
    			}
    			location.reload(true);
    		}).fail(function(err) {
    			alert('오류가 발생하였습니다.', err.type);
    		});
    	} 
    	
    	/* 공백 검사 */
    	function checkNull(id, msg) {
    		const $target = $(`#${id}`);
    		if(!$target.val().length) {
    			alert(`${msg}을 입력해주세요`);
    			$target.focus();
    			return true;
    		}
    		return false;
    	}
    	
    	/*
    	 * 제목 size check sizeObj 속성값 sizeObj.textId : 검사할 해당 input sizeObj.sizeId : 길이를
    	 * 나타내는 div의 id sizeObj.size : 길이
    	 */
    	function sizeCheck(sizeObj) {
    		
    		const $textId = $(`#${sizeObj.textId}`);
    		const $sizeId = $(`#${sizeObj.sizeId}`);
    		const size = sizeObj.size;
    		
    		if($textId.val().length > size) {
    			alert(`${size}자를 초과할 수 없습니다.`);
    			$textId.val($textId.val().substring(0,size));
    		}
    		$sizeId.text($textId.val().length + '/100');
    	}

    }
});



