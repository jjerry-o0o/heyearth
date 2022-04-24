
function profil_div(){
	var id = document.getElementById("profil_div").name;
	//alert(id);
	$.ajax({
		url: '/modifymypage',
		data: {"id" : id},
		type: 'get',
		success: function(userdto){
			
			
			$("#updateDiv").html("<div id=pointP><p>보유 포인트</p></div>");
			$("#updateDiv").append("<div id=point>"+userdto.point+" p"+"</div><br>");
			$("#updateDiv").append("<div id=carbonP><p>탄소 배출량</p></div>");
			$("#updateDiv").append("<div id=carbon>"+userdto.carbon+"</div><br>");
			$("#updateDiv").append("<div id='updateId'><p>닉네임</p><p id=userid>&nbsp"+userdto.id+"</p></div>");
			$("#updateDiv").append("<hr>");
			
			$("#updateDiv").append("<div id=hidden><input type='hidden' id='userId' name='userId' value='"+userdto.id+"'></div>");
			$("#updateDiv").append("<div id=pw><p>현재 비밀번호 </p><input id=pw2 type='password' name='pw'>"
								+"<input type='button' id='pwckbtn' name='pwck' value='비밀번호 확인'></div>");
			$("#updateDiv").append("<div id=pwerror></div>");
			
			$("#updateDiv").append("<div id=newpw><p>새 비밀번호 </p><input id=newpw2 type='password' name='newpw'></div>");
			$("#updateDiv").append("<div id=newpwerror></div>");
			
			$("#updateDiv").append("<div id=newpwck><p>새 비밀번호 확인</p><input id=newpwck2 type='password'' name='newpwck'></div>");
			$("#updateDiv").append("<div id=newpwckerror></div>");
			
			$("#updateDiv").append("<div id=phone><p>전화번호</p><input id=phone2 type='text' name='phone' value='"+userdto.phone+"'></div>");
			$("#updateDiv").append("<div id=update><input id='submit' type='submit' value='회원정보 수정'></div>");
			$("#updateDiv").append("<div id=withdraw><input type='button' value='회원탈퇴'></div>");
			
			document.getElementById("pwckbtn").onclick = pwck;
			document.getElementById("submit").onclick = pwUpdate;
			
		}//success end
	});//ajax end
}//profil_div end

function pwck() {
	var pw2 = document.getElementById("pw2").value;
	/*var pw2 = $("#pw2").val();*/
	var pwPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,}$/;
	let pwCheck = pwPattern.test(pw2);
	
	$.ajax({
	url: "/pwck",
	data: {"pw2" : pw2},
	type: "post",
	success: function(result){
		if( pw2 == ""|| !pwCheck){
		$("#pwerror").html('4자 이상, 영문+숫자로 입력해주세요');
		document.getElementById("pw2").focus();
		return false;
		}else if(result == 1){
			$("#pwerror").html('비밀번호가 확인되었습니다.');
			//alert("비밀번호가 확인되었습니다.")
		}else{
			$("#pwerror").html('비밀번호가 다릅니다.')
		}
		
		document.getElementById("submit").onclick = pwUpdate;
		
	}//success
	});//ajax
}//function end

function pwUpdate(){
	pwck();
	
	var newpw2 = document.getElementById("newpw2").value;
	var pwPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,}$/;
	let newpw2Check = pwPattern.test(newpw2);
	let newpwck2Check = pwPattern.test(newpwck2);
	
	var newpwck2 = document.getElementById("newpwck2").value;
	
	if(newpw2 == "" || !newpw2Check){
		$("#newpwerror").html('4자 이상, 영문+숫자로 입력해주세요');
		document.getElementById("newpw2").focus();
		return false;		
	}else{
		$("#newpwerror").html('');
		
		if(newpwck2 == "" || !newpwck2Check || newpw2 != newpwck2){
			$("#newpwckerror").html('비밀번호가 일치하지 않습니다');
			document.getElementById("newpwck2").focus();
			return false;	
		}else{
			$("#newpwckerror").html('');
		}
	}
	
	$("#updateDiv").html("<p id='successP'>회원가입이 정상적으로 수정되었습니다.</p>");
}

function mymission(id){

	//location.href = "participation";
	var id = document.getElementById("profil").alt;
	$.ajax({
		url: "/participation2",
		type: "get",
		
		success: function(map){
			alert(map);
			
			$("#mymenu_div").html("<div id=profileP><p>"+map.count+"개의 미션 진행중</p></div>");
			$("#mymenu_div").append("<hr>");
		}
	})
	
	
}



