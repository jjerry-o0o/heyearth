function reviewmod(code){
	location.href = "adminreviewmod?code=" + code;
}

function reviewdel(code){
	var returnValue = confirm('해당 인증(후기)를 정말 지우시겠습니까?');
	if(returnValue == true){
		location.href = "adminreviewdel?code="+code;
	}
}

function missionlist(){
	location.href="adminmission";
}