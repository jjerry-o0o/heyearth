function guidemod(code){
	location.href = "adminguidemod?code=" + code;
}

function guideinsert(){
	location.href = "adminguideinsert";
}

function guidedel(code){
	var returnValue = confirm('해당 재활용방법정보를 정말 지우시겠습니까?');
	if(returnValue == true){
		location.href = "adminguidedel?code="+code;
	}
}