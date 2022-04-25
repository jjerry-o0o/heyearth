
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
			
			$("#updateDiv").html("<div id=profileP><p>프로필 사진</p></div>");
			$("#updateDiv").append("<div id=profileImgDiv><img id='profile2' width=150px height=150px src='https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927'></div><br>");
			$("#updateDiv").append("<div id='updateId'><p>닉네임</p><p id=userid>&nbsp"+userdto.id+"</p></div>");
			$("#updateDiv").append("<hr>");
			
			$("#updateDiv").append("<div id=hidden><input type='hidden' id='userId' name='userId' value='"+userdto.id+"'></div>");
			$("#updateDiv").append("<div id=pw><p>현재 비밀번호 </p><input id=pw2 type='password' name='pw'>"
								+"<input type='button' id='pwckbtn' name='pwck' value='비밀번호 확인'></div>");
			
			$("#updateDiv").append("<div id=pwerror></div>");
			$("#updateDiv").append("<div id=newpw><p>새 비밀번호 </p><input id=newpw2 type='password' name='newpw'></div>");
			$("#updateDiv").append("<div id=newpwck><p>새 비밀번호 확인</p><input id=newpwck2 type='password'' name='newpwck'></div>");
			$("#updateDiv").append("<div id=phone><p>전화번호</p><input id=phone2 type='text' value='"+userdto.phone+"'></div>");
			$("#updateDiv").append("<div id=update><input type='submit' value='회원정보 수정'></div>");
			$("#updateDiv").append("<div id=withdraw><input type='button' value='회원탈퇴'></div>");
			
			document.getElementById("pwckbtn").onclick = pwck;
			
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
					alert(result);
					pw2.focus();
					return false;
					}else if(result == 1){
						$("#pwerror").html('');
						alert("비밀번호가 확인되었습니다.")
					}
				}//success
				});//ajax
			}//function end
			
		}//success end
	});//ajax end
}//profil_div end


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



