$(function () {
  var firebaseConfig = {
    apiKey: "AIzaSyD7eTQKpWZBifntHh1S-ybNprzrhD9LxkA",
    authDomain: "fluid-furnace-283109.firebaseapp.com",
    databaseURL: "https://fluid-furnace-283109.firebaseio.com",
    projectId: "fluid-furnace-283109",
    storageBucket: "fluid-furnace-283109.appspot.com",
    messagingSenderId: "313681418365",
    appId: "1:313681418365:web:b0a550b29cfad94802f914",
    measurementId: "G-LHYLQE5KT8",
  };

  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
  firebase.auth().languageCode = 'ko';


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


  //   var code = getCodeFromUserInput();
  //   onfirmationResult.confirm(code).then(function (result) {

  //     var user = result.user;
  //   // ...
  //   }).catch(function (error) {
  // // User couldn't sign in (bad verification code?)
  // // ...
  // });




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
});