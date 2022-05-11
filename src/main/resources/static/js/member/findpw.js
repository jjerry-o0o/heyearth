window.onload = function() {

	const nickname = document.getElementById('nickname');
	const nicknameerror = document.getElementById('nicknameerror');
	
	const phone = document.getElementById('phone');
	const submit = document.getElementById('submit');
	
	//3자리-3~4자리-4자리
	const phonePattern = /^\d{3}-\d{3,4}-\d{4}$/;	
	
	submit.onclick = allCheck;
	
	function pwCheck() {
		let nicknameInput = nickname.value;
		
		if(nicknameInput == "") {
			nicknameerror.innerHTML = "닉네임을 입력해주세요";
			nickname.focus();
			return false;
		}else{
			nicknameerror.innerHTML = "";
		}
		
	}
	
	function phoneCheck() {
		
		let phoneInput = phone.value;
		let phoneCheck = phonePattern.test(phoneInput);
		
		if(!phoneCheck || phoneInput == ""){
			$("#phoneerror").html('전화번호를 형식에 맞게 입력해주세요');
			phone.focus();
			return false;
		}
	}	
	
	function allCheck() {
		var result2 = pwCheck();
		var result3 = phoneCheck();
		
		if(result2==false || result3==false){
			return false;
		}
	}
	
	
	
}