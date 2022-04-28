window.onload = function() {
	
	const nickname = document.getElementById('nickname');
	const nicknameerror = document.getElementById('nicknameerror');
	const pw = document.getElementById('pw');
	const pwerror = document.getElementById('pwerror');
	const submit = document.getElementById('submit');
	
	submit.onclick = loginCheck;
	
	function loginCheck(){
		let nicknameInput = nickname.value;
		
		if(nicknameInput == "") {
			nicknameerror.innerHTML = "닉네임을 입력해주세요";
			nickname.focus();
			return false;
		}else if(nicknameInput.indexOf('(탈퇴한 회원)') > 0){
			nicknameerror.innerHTML = "이미 탈퇴한 회원입니다";
			nickname.focus();
			return false;			
		}else{
			nicknameerror.innerHTML = "";
		}
		
		let pwInput = pw.value;
		
		if(pwInput == "") {
			pwerror.innerHTML = "비밀번호를 입력해주세요";
			pw.focus();
			return false;
		}
		

		
	}
	

}