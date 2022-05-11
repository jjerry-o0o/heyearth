window.onload = function() {
	
	const phone = document.getElementById('phone');
	const submit = document.getElementById('submit');
	
	//3자리-3~4자리-4자리
	const phonePattern = /^\d{3}-\d{3,4}-\d{4}$/;	

	submit.onclick = phoneCheck;
	
	function phoneCheck() {
		
		let phoneInput = phone.value;
		let phoneCheck = phonePattern.test(phoneInput);
		
		if(!phoneCheck || phoneInput == ""){
			$("#phoneerror").html('전화번호를 형식에 맞게 입력해주세요');
			phone.focus();
			return false;
		}
	}
}