function membermod(id){
	location.href = "adminmembermod?id=" + id;
}

function memberboard(id){
	location.href = "adminmemberboard?id=" + id;
}

function membermission(id){
	location.href = "adminmembermission?id=" + id;
}

function memberdel(id){
	
	var returnValue = confirm(id +'님을 정말 탈퇴시키겠습니까?');
	if(returnValue == true){
		alert(id+"님이 탈퇴처리되었습니다.");
		location.href = "adminmemberdel?id="+id;
	}
}