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
	
	/*var returnValue = confirm(id +'님을 정말 탈퇴시키겠습니까?');
	if(returnValue == true){
		alert(id+"님이 탈퇴처리되었습니다.");
		location.href = "adminmemberdel?id="+id;
	}*/
	
	$("#delid").html("<input type='hidden' name='id' value='"+id+"'>")
	document.getElementById("modal").style.display = "flex";
	document.body.classList.add("stop-scroll");
	$('html').scrollTop(0);

}

$(document).ready(function(){
	// 모달창 닫기버튼
	$("#modalclose").on("click",function(){
		document.getElementById("modal").style.display = "none";
		document.body.classList.remove("stop-scroll");
	});
	
	// 모달창 외부클릭시 모달창 닫기
	modal.addEventListener("click", e => {
    	const evTarget = e.target
    	if(evTarget.classList.contains("modal-overlay")) {
        	modal.style.display = "none";
        	document.body.classList.remove("stop-scroll");
    	}
	});
})