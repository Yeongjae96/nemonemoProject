$(function () {
	  // Your web app's Firebase configuration
	  var firebaseConfig = {
	    apiKey: "AIzaSyD5Z6iFhMhUqmiJhBBYmB05a29EPXRW058",
	    authDomain: "digital-shelter-284001.firebaseapp.com",
	    databaseURL: "https://digital-shelter-284001.firebaseio.com",
	    projectId: "digital-shelter-284001",
	    storageBucket: "digital-shelter-284001.appspot.com",
	    messagingSenderId: "609362409896",
	    appId: "1:609362409896:web:84532192a2a2375e48c59d",
	    measurementId: "G-S2HGJSF68B"
	  };
	  // Initialize Firebase
	  firebase.initializeApp(firebaseConfig);
	  firebase.analytics();
	  firebase.auth().languageCode = 'ko';
	// To apply the default browser preference instead of explicitly setting it.
	// firebase.auth().useDeviceLanguage();
  // Initialize Firebase
//  firebase.initializeApp(firebaseConfig);
//  firebase.auth().languageCode = 'ko';
	  
	 


  window.recaptchaVerifier = new firebase.auth.RecaptchaVerifier('newa', {
    'size': 'invisible',
    'callback': function (response) {
      console.log(response);
    }
  });

  var appVerifier = window.recaptchaVerifier;
  $('#verifyBtn').click(function () {

    $('#verifyNumberDiv').slideDown().css('display', 'flex').removeClass('hide');
    
    // const regExp = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
    // if (validation('phoneNumber', regExp)) {
    // 
    // return;
    // }  
    // console.log('메세지를 전송합니다.');

    // var phoneNumber = getPhoneNumberFromUserInput();
    // if (phoneNumber == null) {
    //   console.error('잘못된 숫자입니다.');
    //   return;
    // }

    // const $btn = $('#verifyBtn');
    // const $class = $(this).attr('class');
    // $btn.attr('class', $class.slice(-6) == 'active' ? $class.substring(0, $class.length - 8) : $class.concat('--active'));
    
    // var promise = firebase.auth().signInWithPhoneNumber(phoneNumber, appVerifier);
    // promise
    //   .then(function (confirmationResult) {
    //     console.log(confirmationResult);
    //     window.confirmationResult = confirmationResult;
    //   })
    //   .catch(function (error) {
    //     console.log(error);
    //     console.log('error');
    //   });
  });


});


$(function(){
	idcheck()
});

function checks(){ 
	var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	var getCheck= RegExp(/^[a-zA-Z0-9]{8,16}$/);
	var getName= RegExp(/^[ㄱ-ㅎ|가-힣|a-z|A-Z|\*]+$/);
	var getPhone = RegExp(/^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/);

	// 이메일 공백 확인
	if($("#emailInput").val() == ""){ 
		alert("이메일을 입력해주세요"); 
		$("#emailInput").focus(); 
		return false; 
		} 
	// 이메일 유효성 검사
	if(!getMail.test($("#emailInput").val())){ 
		alert("이메일형식에 맞게 입력해주세요") 
		$("#emailInput").val(""); 
		$("#emailInput").focus(); 
		return false; 
		}
	
	// 비밀번호 공백 확인
	if($("#passInput").val() == ""){ 
		alert("패스워드 입력바람"); 
		$("#passInput").focus(); 
		return false; 
		} 
	// 비밀번호 유효성검사
	if(!getCheck.test($("#passInput").val())){ 
		alert("형식에 맞게 입력해주세요"); 
		$("#passInput").val(""); 
		$("#passInput").focus(); 
		return false; 
		} 
	// 비밀번호 확인란 공백 확인
	if($("#passInputCk").val() == ""){ 
		alert("패스워드 확인란을 입력해주세요"); 
		$("#passInputCk").focus(); 
		return false; 
		} 
	// 비밀번호 서로확인
	if($("#passInput").val() != $("#passInputCk").val()){ 
		alert("비밀번호가 상이합니다"); 
		$("#passInput").val(""); 
		$("#passInputCk").val(""); 
		$("#passInput").focus(); 
		return false; 
		} 
	
	// 이름 공백 검사
	if($("#nameInput").val() == ""){
		alert("이름을 입력해주세요"); 
		$("#nameInput").focus(); 
		return false; 
		} 
	// 이름 유효성 검사
	if(!getName.test($("#nameInput").val())){ 
		alert("이름형식에 맞게 입력해주세요");
		$("#nameInput").val(""); 
		$("#nameInput").focus(); 
		return false;
	}
	
	// 핸드폰 공백 검사
	if($("#phoneNumber").val() == ""){
		alert("핸드폰 번호을 입력해주세요"); 
		$("#phoneNumber").focus(); 
		return false; 
		} 
	// 휴대폰 유효성 검사
	if(!getPhone.test($("#phoneNumber").val())){ 
		alert("핸드폰 번호 형식에 맞게 입력해주세요");
		$("#phoneNumber").val(""); 
		$("#phoneNumber").focus(); 
		return false;
	}
	
	// Zip코드 공백검사
	if($("#zipcodeInput").val() == ""){
		alert("집코드를 검색해주세요"); 
		$("#zipcodeInput").focus(); 
		return false; 
		} 
	
	// 주소1 공백 검사
	if($("#address1Input").val() == ""){
		alert("주소를 검색해주세요"); 
		$("#address1Input").focus(); 
		return false; 
		} 
	
	// 주소2 공백 검사
	if($("#address2Input").val() == ""){
		alert("상세주소를을 입력해주세요"); 
		$("#nameInput").focus(); 
		return false; 
		} 

	// 성별 공백 검사
	if ($("#genderInput").val() == "") {
		alert("성별을 선택해주세요");
		$("#genderInput").focus();
		return false;
	} 
	
}

// 중복체크
function idcheck(){
	$('.signup-btn').click(function(e) { // 회원가입 버튼을 누르면
		var idchecks = checks()
		console.log(idchecks)
		if(idchecks==false) return
		e.preventDefault();
		alert("회원가입 버튼 눌렀다!");
		var query = {userEmail : $("#emailInput").val()}; // adminId 값을 query에
															// 저장
		$.ajax({
			url : contextPath + "/sign/signup/idUsercheck.do",
			type : "post",
			data : query, // 쿼리의 저장 타입은 일반 변수가 아닌 JSON, 저기 url로 보내는 데이터..!
			success : function(data){ // data -> ajax의 결과값이 저장되는 변수
				if(data > 0){
					alert("아이디가 중복되어 사용할 수 없습니다.");
					document.getElementById('emailInput').focus();
				}else{
					alert("회원가입을 축하합니다.");
					document.getElementById('signup').submit();
					
				}
			}
		}); // ajax 시작
	});
}


function execPostCode() {
	new daum.Postcode({
		oncomplete : function(data) {
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
			console.log(data.zonecode);
			console.log(fullRoadAddr);

			$("[name=userZipcode]").val(data.zonecode);
			$("[name=userAddress1]").val(fullRoadAddr);

			/*
			 * document.getElementById('signUpUserPostNo').value =
			 * data.zonecode; //5자리 새우편번호 사용
			 * document.getElementById('signUpUserCompanyAddress').value =
			 * fullRoadAddr;
			 * document.getElementById('signUpUserCompanyAddressDetail').value =
			 * data.jibunAddress;
			 */
		}
	}).open();
}

$(function() {
	console.log('문서로드 완료');
	/* 전체 버튼 All or nothing */
	$("#ch-all").click(function() {
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
});

/* hasClass -> is(':checked')로 바꾸면서 조금씩 바꿔 ^-^ ~ */

function chkClick(id, allChkId) {
	$(`#${id}`).on('click',	function() {
						if ($(this).hasClass('term-checked')) {
							$(this).removeClass('term-checked');
						} else {
							$(this).addClass('term-checked');
						}
						if ($('.terms-check').not(":first").filter(
								'.term-checked').length == 4) {
							console.log($('.terms-check').not(":first").filter(
									'.term-checked'));
							$(`#${allChkId}`).addClass('term-checked');
						} else {
							$(`#${allChkId}`).removeClass('term-checked');
						}
					});
}

/* phoneNumber id에 해당하는 값을 가져와서 realNumber로 바꿔준다. */
function getPhoneNumberFromUserInput() {
  const number = $('#phoneNumber').val();
  let realNumber;
  if (number.length == 10) {
  } else if (number.length == 11) {
    realNumber = `+82-${number.substring(1, 3)}-${number.substring(3, 7)}-${number.substring(7)}`;
  } else {
    realNumber = null;
  }
  console.log(`${number} -> ${realNumber}`);
  return realNumber;
}

function validation(id, regExp) {
  const phone = $(`#${id}`).val();
  console.log(phone);

  if (regExp.test(phone)) {
    console.log('정상적인 번호입니다.');
    return false;
  }
  return true;
}


// =================이전코드=====================

// var code = getCodeFromUserInput();
// onfirmationResult.confirm(code).then(function (result) {

// var user = result.user;
// // ...
// }).catch(function (error) {
// // User couldn't sign in (bad verification code?)
// // ...
// });


// $('#signupBtn').click(function() {
// console.log('contextPath : ', contextPath);
// const $form = $('<form></form>').attr({
// method : 'POST',
// action : contextPath + '/sign/signup.do'
// onsubmit= return checks()
// });
//
// const emailvalue = $('#emailInput').val()
// const passvalue = $('#passInput').val()
// const namevalue = $('#nameInput').val()
// const phonevalue = $('#phoneNumber').val()
// const zipcodevalue = $('#zipcodeInput').val()
// const address1value = $('#address1Input').val()
// const address2value = $('#address2Input').val()
// const gendervalue = $('#genderInput').val()
//		
// const $emailInput = $('<input/>').attr({
// type : 'hidden',
// value : emailvalue,
// name : 'userEmail'
// });
//		
// const $passwordInput = $('<input/>').attr({
// type : 'hidden',
// value : passvalue,
// name : 'userPw'
// });
//		
// const $nameInput = $('<input/>').attr({
// type : 'hidden',
// value : namevalue,
// name : 'userName'
// });
//		
// const $phoneInput = $('<input/>').attr({
// type : 'hidden',
// value : phonevalue,
// name : 'userPhone'
// });
//		
// const $zipcodeInput = $('<input/>').attr({
// type : 'hidden',
// value : zipcodevalue,
// name : 'userZipcode'
// });
//
// const $address1Input = $('<input/>').attr({
// type : 'hidden',
// value : address1value,
// name : 'userAddress1'
// });
//
// const $address2Input = $('<input/>').attr({
// type : 'hidden',
// value : address2value,
// name : 'userAddress2'
// });
//
// const $genderInput = $('<input/>').attr({
// type : 'hidden',
// value : gendervalue,
// name : 'userGender'
// });
//
//
// console.log('form : ', $form);
// console.log('input : ', $phoneInput);
// console.log('input : ', $passwordInput);
// console.log('input : ', $zipcodeInput);
// console.log('input : ', $address1Input);
// console.log('input : ', $address2Input);
// console.log('input : ', $genderInput);
// console.log('input : ', $nameInput);
// console.log('input : ', $emailInput);
//		 
// console.log('value : ', phonevalue);
// console.log('value : ', passvalue);
// console.log('value : ', emailvalue);
// console.log('value : ', zipcodevalue);
// console.log('value : ', address1value);
// console.log('value : ', address2value);
// console.log('value : ', gendervalue);
// console.log('value : ', namevalue);
//		
// $form.append($emailInput);
// $form.append($passwordInput);
// $form.append($nameInput);
// $form.append($phoneInput);
// $form.append($zipcodeInput);
// $form.append($address1Input);
// $form.append($address2Input);
// $form.append($genderInput);
// $('body').append($form);
// $form[0].submit();
//
// });
//

/* jquery의 closest ID버젼 */
HTMLElement.prototype.closestOneByClassName = function(className) {
      let target = this;
      while(!target.parentElement.querySelector('.'+className)) {
         target = target.parentElement;
         if(!target.parentElement) {
            return new Error('not Found');
         }
   }
      return target;
}

document.addEventListener('DOMContentLoaded', function() {
	const btnList = document.getElementsByClassName('show-btn');
	Array.from(btnList).forEach(e => {
		e.addEventListener('click', toggleClass);
		console.log(e);
	});
});

var yy;
function zzz() {
	
	  var x = document.getElementById("term-1");
	  toggleClass('term-1');
	  
	  document.getElementsClassName('')

	
}

function toggleClass() {
	let target = this.closestOneByClassName('check-margin').querySelector('.hide-term');
	console.log(this);
	if(!target) {
		console.log(this);
		target = this.closestOneByClassName('check-margin').querySelector('.show-term');
	}
	const currentClass = target.classList[0];
	const toBeClass = currentClass == 'hide-term' ? 'show-term' : 'hide-term';
	console.log(currentClass);
	console.log(toBeClass);
	target.classList.remove(currentClass);
	target.classList.add(toBeClass);
<<<<<<< HEAD
}
=======
}
>>>>>>> product+store+login
