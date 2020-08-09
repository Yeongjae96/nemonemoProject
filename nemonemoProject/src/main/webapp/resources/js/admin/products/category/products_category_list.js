var contentData;

$(function() {
	initTable();
	initButtonEvent();
	getCategoryList()
	.then(initButtonEvent)
	.then(initRegModal)
	.then(initUpdModal);
});

/* 테이블 버튼 이벤트 */
function initButtonEvent(data) {
	return new Promise(function(resolve, reject) {
		$('.product-category-upd-btn').click(function() {
			$.ajax({
				url: '',
				method: 'post',
				data: {
					
				}
			}).done(function(data) {
				
			});
		});
		resolve(data);
	});
}

/* 수정 모달 설정 */
function initUpdModal(data) {
	return new Promise(function(resovle, reject) {
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
				radioName: 'categoryUpdateType',
				actionID: 'productCategoryUpdate',
				action: productUpdateAction
		}
		initCategoryBox(obj);
		function productUpdateAction() {
			
		}
		
		resolve(data);
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
	
	$(`#${obj.actionID}`).click(obj.action);
	
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
	}
	
	// 초기설정
	(function() {
		console.log($radioName);
		console.log($radioName.eq(0));
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
	    "language": {
	        "decimal":        "",
	        "emptyTable":     "표에서 사용할 수있는 데이터가 없습니다.",
	        "info":           "총 _TOTAL_명  _START_에서 _END_까지 표시",
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
