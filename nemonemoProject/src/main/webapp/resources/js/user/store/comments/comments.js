/* 공백 검사 */
	function checkNull(id, msg) {
		const $target = $(`#${id}`);
		if (!$target.val().length) {
			alert(`${msg}을 입력해주세요`);
			$target.focus();
			return true;
		}
		return false;
	}

	/*
	 * 제목 size check sizeObj 속성값 sizeObj.textId : 검사할 해당 input sizeObj.sizeId :
	 * 길이를 나타내는 div의 id sizeObj.size : 길이
	 */
	function sizeCheck(sizeObj) {

		const $textId = $(`#${sizeObj.textId}`);
		const $sizeId = $(`#${sizeObj.sizeId}`);
		const size = sizeObj.size;

		if ($textId.val().length > size) {
			alert(`${size}자를 초과할 수 없습니다.`);
			$textId.val($textId.val().substring(0, size));
		}
		$sizeId.text($textId.val().length + '/100');
	}