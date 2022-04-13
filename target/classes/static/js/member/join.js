window.onload = function() {
	
	const nickname = document.getElementById('nickname');
	const nicknamebtn = document.getElementById('nicknamebtn');
	const pw = document.getElementById('pw');
	const pwck = document.getElementById('pwck');
	const phone = document.getElementById('phone');
	const submit = document.getElementById('submit');
	
	//2자 이상 8자 이하, 영어 또는 숫자 또는 한글로 구성
	const nicknamePattern = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,8}$/;
	//최소 4자, 최소 하나 이상의 문자 및 하나의 숫자
	const pwPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,}$/;
	
	nicknamebtn.onclick = nicknameCheck;
	submit.onclick = phoneCheck;
	
	function nicknameCheck() {
		let nicknameInput = nickname.value;
		//test() : 찾는 문자열이 포함되어 있는지 확인해줌. boolean값 반환
		let nicknameCheck = nicknamePattern.test(nicknameInput); 
		 
		$.ajax({
			url : "/nicknameCheck",
			type : 'post',
			data : {"id" : nicknameInput},
			
			success : function(cnt){
				if(!nicknameCheck || nicknameInput == ""){
					$("#nicknameerror").html('2-8자 사이의 영문,한글,숫자로 입력해주세요');
					nickname.focus();
				}else if(cnt == 1){
					$("#nicknameerror").html('중복된 닉네임입니다');
					nickname.focus();
				}else {
					$("#nicknameerror").html('사용 가능한 닉네임입니다');
				}
			},
			error: function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	
	function pwCheck() {
		let pwInput = pw.value;
		let pwCheck = pwPattern.test(pwInput);
				
		if(!pwCheck || pwInput == ""){
			$("#pwerror").html('4자 이상, 영문 및 숫자로 입력해주세요');
			pw.focus();
			return false;
		}
		
	}
	
	function pwckCheck() {
		let pwInput = pw.value;
		let pwckInput = pw.value;		

		if(pwckInput == ""){
			$("#pwckerror").html('비밀번호를 입력해주세요');
			pw.focus();
			return false;
		}else if(!pwckInput == pwInput){
			$("#pwckerror").html('비밀번호가 일치하지 않습니다');
			pw.focus();
			return false;
		}
	}
	
	function phoneCheck() {
		nicknameCheck();
		pwCheck();
		pwckCheck();
		
		let phoneInput = phone.value;
		
		if(phoneInput == ""){
			$("#phoneerror").html('전화번호를 입력해주세요');
			phone.focus();
			return false;
		}
	}
	
	
}