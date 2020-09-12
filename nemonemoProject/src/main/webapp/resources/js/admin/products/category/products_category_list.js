var contentData;

$(function() {
	initTable();
	initButtonEvent();
	getCategoryList()
	.then(initRegModal)
	.then(initUpdModal);
	initDelModal();
});

/* 삭제 모달  */
function initDelModal() {
	$('#productCategoryDelete').click(function() {
		$.ajax({
			url: 'deleteJson.mdo',
			method: 'post',
			data: {
				productsCateNo: $('#product_category_delete').data('no')
			}
		}).done(function(success) {
			alert('삭제에 성공하였습니다.');
			location.reload(true);
		}).fail(function(error) {
			alert('삭제에 실패하였습니다.');
		});
	});
}


/* 테이블 버튼 이벤트 */
function initButtonEvent() {
		// 수정 버튼
		function updateAction(e) {
			console.log(this);
			$.ajax({
				url: 'getCateJson.mdo',
				method: 'get',
				data: {
					productCateNo: $(this).closest('tr').data('no')
				},
				dataType: 'json'
			}).done(function(data) {
				const $radio = $('input[name=categoryUpdateType]');
				const $lgCate = $('#productUpdateLgCategory');
				const $mdCate = $('#productUpdateMdCategory');
				const $input = $('#productUpdateCategoryContent');
				const $cateNo = $('#updateCategoryNo');
				
				// 카테고리 번호
				$cateNo.val(data.productCateNo).prop('disabled', true);
				// 분류 타입
				$radio.each(function(i, e) {if(data.productCateType == e.value) {$(e).click(); return false;}});
				// 사용 여부
				const delFlagIndex = data.productCateDelFl == 'Y' ? 1 : 0;
				$('input[name=cateUseType]').eq(delFlagIndex).prop('checked', true);
				
				let prevText;
				// 대분류, 중, 소에 따른 값 뿌리기
				if(data.productCateType == 'L') {
					$input.val(data.productCateLarge);
				} else if(data.productCateType == 'M') {
					bindCate('productUpdateLgCategory', data.productCateLarge);
					$input.val(data.productCateMedium);
				} else {
					bindCate('productUpdateLgCategory', data.productCateLarge);
					bindCate('productUpdateMdCategory', data.productCateMedium);
					$input.val(data.productCateSmall);
				}
				prevText = $input.val();
				$input.on('keyup', function() {
					const $checkInput = $('#updateCheckInput');
					const $this = $(this);
					if($this.val() == prevText || !$this.val().length) {
						$('#productCategoryUpdate').prop('disabled', true);
						$checkInput.text('수정될 수 없는 제목입니다.').show();
					} else {
						$('#productCategoryUpdate').prop('disabled', false);
						$checkInput.hide();
					}
				});
			}).fail(function(err) {
				alert('데이터 불러오기에 실패하였습니다.');
			});
		}
		
		$('#product-category-list').click(function(e) {
			if(e.target.closest('.product-category-del-btn')) {
				console.log('삭제 기능');
				const $this = $(e.target);
				const no = $this.closest('tr').data('no');
				const title = $this.closest('tr').children('td:eq(4)').text();
				$('#productDeleteModal span').text(`${no}번 (${title})`);
				$('#product_category_delete')[0].dataset.no = no;
			} else if(e.target.closest('.product-category-upd-btn')) {
				console.log('수정 기능');
				updateAction.call(e.target);
			} else if(e.target.closest('#useFlagTd')) {
				updateStatus.call(e.target);
			}
		});
		
		// 삭제 버튼
		/*$('.product-category-del-btn').click(function() {
			const $this = $(this);
			console.log(this);
			const no = $this.closest('tr').data('no');
			console.log(no);
			const title = $this.closest('tr').children('td:eq(4)').text();
			console.log(title);
			$('#productDeleteModal span').text(`${no}번 (${title})`);
			$('#product_category_delete')[0].dataset.no = no;
		});	*/
		
		//미사용, 사용 누르면 바뀌는 토글 기능 
		function updateStatus() {
			const changeValue = this.textContent.trim() == '사용' ? 'Y' : 'N';
			console.log(this.textContent.trim());
			console.log(this.closest('tr').dataset.no);
			$.ajax({
				url: 'changeUseFl.mdo',
				method: 'post',
				data: {
					productCateNo: this.closest('tr').dataset.no,
					productCateDelFl: changeValue
				}
			}).done(function(success) {
				alert('상태 변경에 성공하였습니다.')
				location.reload(true);
			}).fail(function(error) {
				alert('상태 변경에 실패하였습니다.')
			});
		}
		
		//상품으로 돌아가기 버튼
		$('#productBtn').click(function() {
			window.location.href="../list.mdo";
		});
		
		function bindCate(selectID, data) {
			$(`#${selectID}`).children('option').each(function(i, e) {
				if(e.value == data) {
					$(e).prop('selected', true);
					return false;
				}	
			});
		}
}

/* 수정 모달 설정 */
function initUpdModal(data) {
	return new Promise(function(resolve, reject) {
		// 키 이벤트
		$('#productUpdateCategoryContent').on('keyup', function() {contentKeyEvent.call(this, 'productCategoryUpdate')});
		/*
		 * OBJ 속성값 obj.cateArr : 대중소분류 모든 카테고리 값(JSON) obj.lgID : 대분류 select ID
		 * obj.mdID : 중분류 select ID obj.radioName : radio버튼 NAME actionID: 모달
		 * 버튼ID, action: 버튼 누를시 CallBack함수
		 */
		/* 카테고리 박스 대분류 중분류 선택 시 이벤트 */
		const obj = {
				cateArr: data,
				lgID: 'productUpdateLgCategory',
				mdID: 'productUpdateMdCategory',
				inputID: 'productUpdateCategoryContent',
				radioName: 'categoryUpdateType',
				actionID: 'productCategoryUpdate',
				action: productUpdateAction
		}
		initCategoryBox(obj);
		function productUpdateAction() {
			
			$type = $('input[name=categoryUpdateType]:checked');
			$useFl = $('input[name=cateUseType]:checked');
			$lgCate = $('#productUpdateLgCategory');
			$mdCate = $('#productUpdateMdCategory');
			$input = $('#productUpdateCategoryContent');
			
			const param = {};
			
			param.productCateNo = $('#updateCategoryNo').val();
			param.productCateType = $type.val();
			param.productCateDelFl = $useFl.val();
			//param.productCateOrder 순서는 어떻게 정하지..?
			if(param.productCateType == 'L') {
				param.productCateLarge = $input.val();
			} else if(param.productCateType == 'M') {
				param.productCateLarge = $lgCate.text();
				param.productCateMedium = $input.val();
			} else {
				param.productCateLarge = $lgCate.text();
				param.productCateMedium = $mdCate.text();
				param.productCateSmall = $input.val();
			}
			// 업데이트 통신
			$.ajax({
				url: 'updateJson.mdo',
				method: 'post',
				data: param
			}).done(function(success) {
				alert('수정에 성공하였습니다.');
				location.reload(true);
				resolve(success);
			}).fail(function(error) {
				alert('수정에 실패하였습니다.');
				reject(error);
			});
		}
	});
}

/* 등록 모달 카테고리 설정 */
function initRegModal(data) {
	return new Promise(function(resolve, reject) {
		// 초기설정
		$('#productCategoryContent').on('keyup', function() {contentKeyEvent.call(this, 'productCategoryInsert')});
		
		 const obj = {
				 cateArr: data,
				 lgID: 'productLgCategory',
				 mdID: 'productMdCategory',
				 inputID: 'productCategoryContent',
				 radioName:'categoryType',
			     actionID: 'productCategoryInsert',
			     action: productCategoryInsertAction
		 };
		 initCategoryBox(obj);

		/* 등록 모달 이벤트 */
		function productCategoryInsertAction() {
			// 1. 카테고리 이름값 유효성 검사
			if(checkNull('productCategoryContent', '카테고리 명')) return;
			// 2. 분류값
			const categoryVal = $('input[name=categoryType]:checked').val();
			let param;
			const $input = $('#productCategoryContent');
			// 3. 대분류가 대 중 소에 따라 다른 파라미터 설정
			if(categoryVal == 'L') {
				param = {productCateType: 'L', productCateLarge:$input.val()};
			} else if(categoryVal == 'M') {
				param = {productCateType: 'M', productCateLarge: $('#productLgCategory option:selected').text(),
						productCateMedium: $input.val()};
			} else {
				param = {productCateType: 'S',
						productCateLarge: $('#productLgCategory option:selected').text(),
						productCateMedium: $('#productMdCategory option:selected').text(),
						productCateSmall: $input.val()};
			}
			// 4. ajax 전송
			$.ajax({
				url: 'newJson.mdo',
				method: 'post',
				data: param
			}).done(function(data) {
				if(data != 0) {	
					alert('추가에 성공하셨습니다.');
					location.reload(true);
				} else {
					alert('카테고리 추가에 실패하였니다');
				}
			}).fail(function(error) {
				alert('카테고리 추가에 실패하였습니다.');
			});
		}
		resolve(data);
	});
}

/*
 * OBJ 속성값 obj.cateArr : 대중소분류 모든 카테고리 값(JSON) 
 * obj.lgID : 대분류 select ID 
 * obj.mdID : 중분류 select ID 
 * obj.inputID : 입력칸
 * obj.radioName : radio버튼 NAME 
 * actionID: 모달 버튼ID, action: 버튼 누를시
 * CallBack함수
 */
/* 카테고리 박스 대분류 중분류 선택 시 이벤트 */
function initCategoryBox(obj){
	const lgCateArr = obj.cateArr.filter(e => e.productCateType == 'L');
	const mdCateArr = obj.cateArr.filter(e => e.productCateType == 'M');
	const smCateArr = obj.cateArr.filter(e => e.productCateType == 'S');
	const $lgCate = $(`#${obj.lgID}`);
	const $mdCate = $(`#${obj.mdID}`);
	const $radioName = $(`input[name=${obj.radioName}]`).change(radioChangeEvent);
	const $frag = $(document.createDocumentFragment());
	const $input = $(`#${obj.inputID}`);
	const $actionID = $(`#${obj.actionID}`);
	
	$actionID.click(obj.action);
	
	if(lgCateArr.length > 0) {
		$lgCate.empty();
		for(let e of lgCateArr) {
			const $option = $('<option></option)').attr('value', e.productCateNo).text(e.productCateLarge);
			$frag.append($option);
		}			
		$lgCate.append($frag);
	} else {
		$lgCate.append($('<option></option>').text('없음'));
		$mdCate.append($('<option></option>').text('없음'));
	}
	
	// lgCate 이벤트걸기
	$lgCate.on('change', function() {
		$this = $(this);
		$mdFrag = $(document.createDocumentFragment());
		$mdCate.empty();
		if(mdCateArr.length > 0 ) {
			mdCateArr.forEach(e => {
				if(e.productCateLarge == $this.children(':selected').text()) {
					const $option = $('<option></option>').attr('value', e.productCateNo).text(e.productCateMedium);
					$mdFrag.append($option);
				}
			});
			$mdCate.append($mdFrag);
			if(!$mdCate.children('option').length) 
				$mdCate.append($('<option></option>').text('없음'));
		} else {
			$mdCate.append($('<option></option>').text('없음'));
		}
	});
	// 라디오 change event
	function radioChangeEvent() {
		const $this = $(this);
		const $lgCateDiv = $lgCate.closest('div');
		const $mdCateDiv = $mdCate.closest('div');
		if($this.val() == 'L') {
			$lgCateDiv.hide();
			$mdCateDiv.hide();
		} else if($this.val() == 'M') {
			$lgCateDiv.show();
			$mdCateDiv.hide();
		} else {
			$lgCate.trigger('change');
			$lgCateDiv.show();
			$mdCateDiv.show();
		}
		$input.val('');
		$actionID.prop('disabled', true);
	}
	
	// 초기설정
	(function() {
		$radioName.eq(0).trigger('click');
	}());
}


/* NULL CHECK */
function checkNull(id, msg) {
	const $target = $(`#${id}`);
	if($target.val().length == 0) {
		alert(`${msg}을 입력해주세요`);
		$target.focus();
		return true;
	}
	return false;
}

/* 카테고리 인풋 공백 검사 */
function contentKeyEvent(btnId) {
	const $this = $(this);
	if($this.val().length) $(`#${btnId}`).prop('disabled', false);
	else $(`#${btnId}`).prop('disabled', true);
}

/* 카테고리 불러오기 */
function getCategoryList() {
	return new Promise(function(resolve, reject) {
		const list = [];
		$.ajax({
			url: 'listJson.mdo',
			method: 'get',
			dataType: 'json'
		}).done(function(data) {
			$.each(data, function(i, e) {
				list.push(e);
			});
			resolve(list);
		}).fail(function(err) {
			alert('카테고리를 불러오는데 실패하였습니다.');
			reject(err);
		});
	});
}


/* 테이블 초기화 */
function initTable() {
	const table = $('#product-category-list').DataTable({
	    responsive: true,
	    stateSave: true,
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
}
