// 폼 유효성 검사
$(function () {
    $('#ad_sign_up').validate({
        rules: {
            'adminPwConfirm': {
                equalTo: '[name="adminPw"]'
            }
        },
        highlight: function (input) {
            console.log(input);
            $(input).parents('.form-line').addClass('error');
        },
        unhighlight: function (input) {
            $(input).parents('.form-line').removeClass('error');
        },
        errorPlacement: function (error, element) {
            $(element).parents('.input-group').append(error);
            $(element).parents('.form-group').append(error);
        }
    });
});

// 버튼 알림창
//$(function(){
//    $('#ad_signup_submit').click(function() {
//        if(!($('#ad_sign_up').hasClass.error)){
//            alert("관리자 등록 완료");
//        }
//    });
//});