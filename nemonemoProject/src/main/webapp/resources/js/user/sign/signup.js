$(function () {

	// 우편번호 버튼
	const searchPostBtn = document.getElementById('searchPostBtn');
	searchPostBtn.addEventListener('click', execPostCode);

	// 회원가입 버튼
	const signupBtn = document.getElementById('signupBtn');
	signupBtn.addEventListener('click', idCheck);

	// 약관 1
	const show1 = document.getElementById('show1');
	show1.addEventListener('click', function (e) {
		toggleClass('term-1');
	});

	// 중복체크
	function idCheck(e) { // 회원가입 버튼을 누르면
		e.preventDefault();
		if (checks() === false) return;
		const query = {userEmail: $("#emailInput").val()}; // adminId 값을 query에 저장

		$.ajax({
			url: contextPath + "/sign/signup/idUsercheck.do",
			type: "post",
			data: query, // 쿼리의 저장 타입은 일반 변수가 아닌 JSON, 저기 url로 보내는 데이터..!
			success: function (data) { // data -> ajax의 결과값이 저장되는 변수
				if (data > 0) {
					alert("아이디가 중복되어 사용할 수 없습니다.");
					document.getElementById('emailInput').focus();
				} else {
					alert("회원가입을 축하합니다.");
					document.getElementById('signup').submit();
				}
			}
		}); // ajax 시작
	}

	function checks() {
		const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		const getCheck = RegExp(/^[a-zA-Z0-9]{8,16}$/);
		const getName = RegExp(/^[ㄱ-ㅎ|가-힣|a-z|A-Z|\*]+$/);
		const getPhone = RegExp(/^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/);

		// 이메일 공백 확인
		if ($("#emailInput").val() == "") {
			alert("이메일을 입력해주세요");
			$("#emailInput").focus();
			return false;
		}

		// 이메일 유효성 검사
		if (!getMail.test($("#emailInput").val())) {
			alert("이메일형식에 맞게 입력해주세요")
			$("#emailInput").val("");
			$("#emailInput").focus();
			return false;
		}

		// 비밀번호 공백 확인
		if ($("#passInput").val() == "") {
			alert("패스워드 입력바람");
			$("#passInput").focus();
			return false;
		}
		// 비밀번호 유효성검사
		if (!getCheck.test($("#passInput").val())) {
			alert("형식에 맞게 입력해주세요");
			$("#passInput").val("");
			$("#passInput").focus();
			return false;
		}
		// 비밀번호 확인란 공백 확인
		if ($("#passInputCk").val() == "") {
			alert("패스워드 확인란을 입력해주세요");
			$("#passInputCk").focus();
			return false;
		}
		// 비밀번호 서로확인
		if ($("#passInput").val() != $("#passInputCk").val()) {
			alert("비밀번호가 상이합니다");
			$("#passInput").val("");
			$("#passInputCk").val("");
			$("#passInput").focus();
			return false;
		}

		// 이름 공백 검사
		if ($("#nameInput").val() == "") {
			alert("이름을 입력해주세요");
			$("#nameInput").focus();
			return false;
		}
		// 이름 유효성 검사
		if (!getName.test($("#nameInput").val())) {
			alert("이름형식에 맞게 입력해주세요");
			$("#nameInput").val("");
			$("#nameInput").focus();
			return false;
		}

		// 핸드폰 공백 검사
		if ($("#phoneNumber").val() == "") {
			alert("핸드폰 번호을 입력해주세요");
			$("#phoneNumber").focus();
			return false;
		}
		// 휴대폰 유효성 검사
		if (!getPhone.test($("#phoneNumber").val())) {
			alert("핸드폰 번호 형식에 맞게 입력해주세요");
			$("#phoneNumber").val("");
			$("#phoneNumber").focus();
			return false;
		}

		// Zip코드 공백검사
		if ($("#zipcodeInput").val() == "") {
			alert("우편번호를 검색해주세요");
			$("#zipcodeInput").focus();
			return false;
		}

		// 주소1 공백 검사
		if ($("#address1Input").val() == "") {
			alert("주소를 검색해주세요");
			$("#address1Input").focus();
			return false;
		}

		// 주소2 공백 검사
		if ($("#address2Input").val() == "") {
			alert("상세주소를 입력해주세요");
			$("#address2Input").focus();
			return false;
		}

		// 성별 공백 검사
		if ($("#genderInput").val() == "") {
			alert("성별을 선택해주세요");
			$("#genderInput").focus();
			return false;
		}

		// 필수 약관1 검사
		if ($("#ch-first").is(":checked") == false) {
			alert("필수 약관을 동의해주세요");
			$("#ch-first").focus();
			return false;
		}

		// 필수 약관2 검사
		if ($("#ch-second").is(":checked") == false) {
			alert("필수 약관을 동의해주세요");
			$("#ch-second").focus();
			return false;
		}

		// 상점명 공백 검사
		if ($("#storeName").val() == "") {
			alert("상점명을 입력해주세요");
			$("#storeName").val("");
			$("#storeName").focus();
			return false;
		}

		//선택 약관 체크 검사
		const check = $('input:checkbox[id="ch-third"]').is(':checked');
		if (check == true) {
			$("#ch-thirdHidden").val('Y');
		} else {
			$("#ch-thirdHidden").val('N');
		}
	}

	function execPostCode() {
		new daum.Postcode({
			oncomplete: function (data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
						+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				$("[name=userZipcode]").val(data.zonecode);
				$("[name=userAddress1]").val(fullRoadAddr);
			}
		}).open();
	}

	/* 전체 버튼 All or nothing */
	$("#ch-all").click(function () {
		if (!$(this).hasClass('term-checked')) {
			$(".terms-check").addClass('term-checked')
		} else {
			$(".terms-check").removeClass('term-checked')
		}
	});

	chkClick('ch-first', 'ch-all');
	chkClick('ch-second', 'ch-all');
	chkClick('ch-third', 'ch-all');
	chkClick('ch-fourth', 'ch-all');

	/* hasClass -> is(':checked')로 바꾸면서 조금씩 바꿔 ^-^ ~ */

	function chkClick(id, allChkId) {
		$(`#${id}`).on('click', function () {
			const $this = $(this);
			if ($this.hasClass('term-checked')) {
				$this.removeClass('term-checked');
			} else {
				$this.addClass('term-checked');
			}
			if ($('.terms-check').not(":first").filter(
				'.term-checked').length == 4) {
				$(`#${allChkId}`).addClass('term-checked');
			} else {
				$(`#${allChkId}`).removeClass('term-checked');
			}
		});
	}

	/* jquery의 closest ID버젼 */
	HTMLElement.prototype.closestOneByClassName = function (className) {
		let target = this;
		while (!target.parentElement.querySelector('.' + className)) {
			target = target.parentElement;
			if (!target.parentElement) {
				return null;
			}
		}
		return target;
	}

	const btnList = document.getElementsByClassName('show-btn');
	Array.from(btnList).forEach(e => {
		e.addEventListener('click', toggleClass);
	});

	function toggleClass() {
		let target = this.closestOneByClassName('check-margin').querySelector('.hide-term	');
		if (!target) {
			target = this.closestOneByClassName('check-margin').querySelector('.show-term');
		}
		const currentClass = target.classList[0];
		const toBeClass = currentClass == 'hide-term' ? 'show-term' : 'hide-term';
		target.classList.remove(currentClass);
		target.classList.add(toBeClass);

	}
});
