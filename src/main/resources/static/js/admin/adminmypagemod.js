$(document).ready(function(){
	
	const curpw = document.getElementById("curpwd");
	const curpwck = document.getElementById("curpwdck");
	const pw = document.getElementById("newpwd");
	const pwck = document.getElementById("newpwdck");
	const submit = document.getElementById("admininfoend");
	
	//최소 4자, 최소 하나 이상의 문자 및 하나의 숫자
	const pwPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,}$/;
	
	submit.onclick = allCheck;
	
	
	function curpwdCheck(){
		let curpwInput = curpw.value;
		let curpwckInput = curpwck.value;
		let pwInput = pw.value;
		let pwckInput = pwck.value;
		if(curpwInput !="" && curpwInput!=curpwckInput){
			$("#curpwerror").html("비밀번호를 정확히 입력해주세요.");
			curpw.focus();
			return false;
		}else if(curpwInput == "" && pwInput != ""){
			$("#curpwerror").html("현재 비밀번호를 입력해주세요.");
			curpw.focus();
			return false;
		}else if(curpwInput == "" && pwckInput != ""){
			$("#curpwerror").html("현재 비밀번호를 입력해주세요.");
			curpw.focus();
			return false;
		}else{
			$("#curpwerror").html("");
		}
	}
	
	function pwCheck() {
		let curpwInput = curpw.value;
		let pwInput = pw.value;
		let pwckInput = pwck.value;
		let pwCheck = pwPattern.test(pwInput);
		
		if(curpwInput != "" && pwInput == ""){
			$("#pwerror").html('4자 이상, 영문 및 숫자로 입력해주세요');
			pw.focus();
			return false;
		}else if(pwckInput != "" && pwInput == ""){
			$("#pwerror").html('4자 이상, 영문 및 숫자로 입력해주세요');
			pw.focus();
			return false;
		}
		if(pwInput != "" && !pwCheck){
			$("#pwerror").html('4자 이상, 영문 및 숫자로 입력해주세요');
			pw.focus();
			return false;
		}else{
			$("#pwerror").html("");
		}
		
	}
	
	function pwckCheck() {
		let curpwInput = curpw.value;
		let pwInput = pw.value;
		let pwckInput = pwck.value;		

		if(curpwInput != "" && pwckInput == ""){
			$("#pwckerror").html('비밀번호를 입력해주세요');
			pw.focus();
			return false;
		}else if(pwInput != "" && pwckInput ==""){
			$("#pwckerror").html('비밀번호를 입력해주세요');
			pw.focus();
			return false;
		}else if(pwckInput != pwInput){
			$("#pwckerror").html('비밀번호가 일치하지 않습니다');
			pw.focus();
			return false;
		}else{
			$("#pwckerror").html("");
		}
	}
	
	function allCheck() {
		var result2 = curpwdCheck();
		var result3 = pwCheck();
		var result4 = pwckCheck();
		
		if(result2==false || result3==false || result4==false){
			return false;
		}
	}
	
	
	$("#admininfoback").on('click',function(){
		location.href = "adminmypage";
	});
	
	/*const inputImage = document.getElementById("input-image")
	inputImage.addEventListener("change", e => {
    	readImage(e.target)
	})*/
})

function readImage(input){
	if(input.files && input.files[0]){
		// FileReader 인스턴스 생성
		const reader = new FileReader()
		
		// 이미지가 로드된 경우
		reader.onload = e =>{
			const previewImage = document.getElementById("previewimg")
			previewImage.src = e.target.result
		}
		
		// reader가 이미지 읽도록 하기
		reader.readAsDataURL(input.files[0])
	}
}

