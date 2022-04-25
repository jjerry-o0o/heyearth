// 지역검색 & 현재위치 검색 변환
function mission(num){
	if(num =='1'){
		document.getElementById("groupmissionpage").style.display = "";
		document.getElementById("solomissionpage").style.display = "none";
		document.getElementById("groupmission").style.backgroundColor = "#1A271D";
		document.getElementById("solomission").style.backgroundColor = "#f6f5f0";
		document.getElementById("groupmission").style.color = "#f6f5f0";
		document.getElementById("solomission").style.color = "#1A271D";
		
	}else{
		document.getElementById("solomissionpage").style.display = "";
		document.getElementById("groupmissionpage").style.display = "none";
		document.getElementById("solomission").style.backgroundColor = "#1A271D";
		document.getElementById("groupmission").style.backgroundColor = "#f6f5f0";
		document.getElementById("solomission").style.color = "#f6f5f0";
		document.getElementById("groupmission").style.color = "#1A271D";
	}
}

function missionmod(code){
	location.href = "adminmembermissionmod?code=" + code;
}

function missiondel(code){
	var returnValue = confirm('해당 인증(후기)를 정말 지우시겠습니까?');
	if(returnValue == true){
		location.href = "adminmembermissiondel?code="+code;
	}
}

function missionback(){
	location.href="adminmember";
}
