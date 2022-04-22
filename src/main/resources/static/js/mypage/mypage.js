function profil_div(){
	var id = document.getElementById("profil").alt;
	//alert(id);
	$.ajax({
		url: '/modifymypage',
		data: {"id" : id},
		type: 'get',
		success: function(userdto){
			var point = document.getElementById("point");
			point.innerHTML = userdto.point+" p";
			
			$("#mymenu_div").html("<div id=profileP><p>프로필 사진</p></div>");
			$("#mymenu_div").append("<div id=profileImgDiv><img id='profile2' width=150px height=150px src='https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927'></div><br>");
			$("#mymenu_div").append("<div id='updateId'><p>닉네임</p><p id=userid>&nbsp"+userdto.id+"</p></div>");
			$("#mymenu_div").append("<hr>");
			$("#mymenu_div").append("<div id=pw><p>현재 비밀번호 </p><input type='password'></div>");
			$("#mymenu_div").append("<div id=newpw><p>새 비밀번호 </p><input type='password'></div>");
			$("#mymenu_div").append("<div id=newpwck><p>새 비밀번호 확인</p><input type='password'></div>");
			$("#mymenu_div").append("<div id=phone><p>전화번호</p><input type='text' value='"+userdto.phone+"'></div>");
			$("#mymenu_div").append("<div id=update><input type='button' value='회원정보 수정'></div>");
			$("#mymenu_div").append("<div id=withdraw><input type='button' value='회원탈퇴'></div>");
			
		}
	});//ajax end
}

function mymission(){
	alert('hi');
}