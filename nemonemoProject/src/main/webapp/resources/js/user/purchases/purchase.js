$(function() {

	$('td').bind('mouseover mouseout', function(e) {

		if (e.type == 'mouseover') {
			$(this).css('border-color', 'red');
		} else if (e.type == 'mouseout') {
			$(this).css('border-color', 'gray');
		}
	});

});

function change1() {
	document.all("change_div").innerHTML = "<h3>카카오페이 안내</h3>\n<p>카카오페이로 간편하게 결제할 수 있는 간편 결제 서비스입니다.</p>\n<p>안전결제를 위해 네모네모에 입금 후 물건수령이 완료되면 돈을 보냅니다.</p>"
	document.getElementById("purchaseselect").value = "kakao";
}
function change2() {
	document.all("change_div").innerHTML = "<h3>계좌결제 안내</h3>\n<p>네모네모 계좌에 입금하고 안전하게 거래할 수 있는 서비스입니다.</p>"
	document.getElementById("purchaseselect").value = "account";
}

var num1 = 0;
var num2 = 0;
var num3 = 0;
var num4 = 0;

/*     function changeservice() {
 if (num1 == 0) {
 document.getElementById("service").style.backgroundColor = "#ff0000";
 num1 = 1;
 if(num3==1&&num2==1){
 enableBtn();
 }
 } else {
 document.getElementById("service").style.backgroundColor = "";
 num1 = 0;
 disableBtn();
 }
 } */

function changesales() {
	if (num1 == 0) {
		document.getElementById("sales").style.backgroundColor = "#ff0000";
		num1 = 1;
		if (num2 == 1) {
			enableBtn();
		}
	} else {
		document.getElementById("sales").style.backgroundColor = "";
		num1 = 0;
		disableBtn();
	}
}

function changepersonal() {
	if (num2 == 0) {
		document.getElementById("personal").style.backgroundColor = "#ff0000";
		num2 = 1;
		if (num1 == 1) {
			enableBtn();
		}
	} else {
		document.getElementById("personal").style.backgroundColor = "";
		num2 = 0;
		disableBtn();
	}
}

function changeall_argument() {
	if (num3 == 0) {
		/* document.getElementById("service").style.backgroundColor = "#ff0000"; */
		document.getElementById("personal").style.backgroundColor = "#ff0000";
		document.getElementById("sales").style.backgroundColor = "#ff0000";
		num1 = 1;
		num2 = 1;
		num3 = 1;

		enableBtn();
	} else {
		document.getElementById("personal").style.backgroundColor = "";
		document.getElementById("sales").style.backgroundColor = "";
		/* document.getElementById("service").style.backgroundColor = ""; */
		num1 = 0;
		num2 = 0;
		num3 = 0;
		disableBtn();
	}
}

function disableBtn() {
	document.getElementById("buybtn").disabled = true;
	document.getElementById("buybtn").style.backgroundColor = "#b9bbbc";
}

function enableBtn() {
	document.getElementById("buybtn").disabled = false;
	document.getElementById("buybtn").style.backgroundColor = "#FF5050";
}

window.onload = function() {
	var originPrice = document.querySelector('#productPrice').value;
	intorignPrice = parseInt(originPrice);
	var shippginFee = document.querySelector('#purchaseShFee').value;
	intShippginFee = parseInt(shippginFee);
	var discountRate = 3;
	if (!originPrice || !discountRate) {
		return false;
	} else {
		var discounted = Math.round(originPrice * (discountRate / 100));
		intdiscounted = parseInt(discounted);
		var newPrice = intorignPrice + intdiscounted + intShippginFee;
		intnewPrice = parseInt(newPrice);
		document.getElementById("pullPrice").value = intnewPrice;
		document.getElementById("plusPrice").value = intdiscounted;
		document.querySelector('#plusPricediv').innerText = '+' + intdiscounted
				+ '원.'
		document.querySelector('#buybtn').innerText = '+' + intnewPrice
				+ '원 결제하기'
		document.querySelector('#totalprice').innerHTML = "<strong>"
				+ intnewPrice + "</strong>원"
	}
}
/* document.querySelector('#testCalBtn').addEventListener('click', function() { */

