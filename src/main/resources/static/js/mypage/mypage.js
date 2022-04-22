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
			
/*			var mymenu_div = document.getElementById("mymenu_div")
			var modifyProfileDiv = document.createElement("div");
			mymenu_div.appendChild(modifyProfileDiv);
			var profileImgP = document.createElement("p");
			modifyProfileDiv.appendChild(profileImgP);
			profileImgP.innerText = "프로필 사진";*/
			
			$("#mymenu_div").html("<p>프로필 사진<input type='file' id='profileImg' name=profileImg></p><br>");
			$("#mymenu_div").append("<div id='updateId'>닉네임</div><div id=userId >"+userdto.id+"</div>");
		}
	});//ajax end
}

