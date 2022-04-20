function zeroshopmod(code){
	location.href = "adminzeroshopmod?code=" + code;
}

function zeroshopinsert(){
	location.href = "adminzeroshopinsert";
}

function zeroshopdel(code){
	var returnValue = confirm('해당 가게정보를 정말 지우시겠습니까?');
	if(returnValue == true){
		location.href = "adminzeroshopdel?code="+code;
	}
}