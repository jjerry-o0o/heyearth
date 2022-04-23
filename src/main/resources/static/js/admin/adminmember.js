function membermod(id){
	location.href = "adminmembermod?id=" + id;
}

function memberboard(id){
	location.href = "adminmemberboard?id=" + id;
}

function membercomment(id){
	location.href = "adminmembercomment?id=" + id;
}

function membermission(id){
	location.href = "adminmembermission?id=" + id;
}

function memberdel(id){
	var returnValue = confirm(id +'님을 정말 탈퇴시키겠습니까?');
	if(returnValue == true){
		location.href = "adminmemberdel?id="+id;
	}
}