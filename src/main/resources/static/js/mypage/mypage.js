/*나의 정보 ajax*/
function profil_div(){
	var id = document.getElementById("profil_div").name;
	//alert(id);
	$.ajax({
		url: '/modifymypage',
		data: {"id" : id},
		type: 'get',
		success: function(userdto){
			//$("#mymenu_div").empty();
			//$("#updateDiv").empty();
			$("#myMissionDiv").empty();
			$("#myboardlist_div").empty();
			
			$("#updateDiv").html("<div id=gradeP><p>"+userdto.id+"님의 등급</p></div>");
			$("#updateDiv").append("<div id=grade>"+userdto.grade+" 등급"+"</div><br>");
			
			$("#updateDiv").append("<div id=pointP><p>보유 포인트</p></div>");
			$("#updateDiv").append("<div id=point>"+userdto.point+" p"+"</div><br>");
			$("#updateDiv").append("<div id=carbonP><p>탄소 배출량</p></div>");
			$("#updateDiv").append("<div id=carbon>"+userdto.carbon+" g</div><br>");
			$("#updateDiv").append("<div id='updateId'><p>닉네임</p><p id=userid>&nbsp"+userdto.id+"</p></div>");
			$("#updateDiv").append("<hr>");
			
			$("#updateDiv").append("<div id=hidden><input type='hidden' id='hiddenUserId' name='userId' value='"+userdto.id+"'></div>");
			$("#updateDiv").append("<div id=pw><p>현재 비밀번호 </p><input id=pw2 type='password' name='pw'>"
								+"<input type='button' id='pwckbtn' name='pwck' value='비밀번호 확인'></div>");
			$("#updateDiv").append("<div id=pwerror></div>");
			
			$("#updateDiv").append("<div id=newpw><p>새 비밀번호 </p><input id=newpw2 type='password' name='newpw'></div>");
			$("#updateDiv").append("<div id=newpwerror></div>");
			
			$("#updateDiv").append("<div id=newpwck><p>새 비밀번호 확인</p><input id=newpwck2 type='password'' name='newpwck'></div>");
			$("#updateDiv").append("<div id=newpwckerror></div>");
			
			$("#updateDiv").append("<div id=phone><p>전화번호</p><input id=phone2 type='text' name='phone' value='"+userdto.phone+"'></div>");
			$("#updateDiv").append("<div id=update><input id='submit' type='submit' value='회원정보 수정'></div>");
			$("#updateDiv").append("<div id=withdraw><input type='button' id='withdrawbtn' value='회원탈퇴' onclick='withdraw()'></div>");
			
			document.getElementById("pwckbtn").onclick = pwck;
			document.getElementById("submit").onclick = pwUpdate(userdto);
			
		}//success end
	});//ajax end
}//profil_div end

/*나의 정보 - 비밀번호 확인*/
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
		if( pw2 == "" || !pwCheck){
		$("#pwerror").html('4자 이상, 영문+숫자로 입력해주세요');
		document.getElementById("pw2").focus();
		return false;
		}else if(result >= 1){
			$("#pwerror").html('비밀번호가 확인되었습니다.');
			//alert("비밀번호가 확인되었습니다.")
		}else{
			$("#pwerror").html('비밀번호가 다릅니다.')
		}
		
		document.getElementById("submit").onclick = pwUpdate;
		
	}//success
	});//ajax
}//function end

/*나의 정보 비밀번호 변경*/
function pwUpdate(userdto){
	pwck();
	var pwPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,}$/;
	var newpw2 = document.getElementById("newpw2").value;
	let newpw2Check = pwPattern.test(newpw2);
	var newpwck2 = document.getElementById("newpwck2").value;
	let newpwck2Check = pwPattern.test(newpwck2);
	
		if(newpw2 == "" || !newpw2Check){
			$("#newpwerror").html('4자 이상, 영문+숫자로 입력해주세요');
			document.getElementById("newpw2").focus();
			return false;		
		}else{
			$("#newpwerror").html('');
			
			if(newpwck2 == "" || !newpwck2Check || newpwck2 != newpw2){
				$("#newpwckerror").html('비밀번호가 일치하지 않습니다');
				document.getElementById("newpwck2").focus();
				return false;
			}else{
				$("#newpwckerror").html('');
			}
		}

		alert("개인정보가 정상적으로 수정되었습니다.");

	$.ajax({
		url: "/update",
		data: {"id" : userdto.id, "newpw" : newpw2, "newpwck" : newpwck2},
		type: "post",
		success: function(){
			//alert(result);
			//$("#updateDiv").html("<p id='successP'>회원가입이 정상적으로 수정되었습니다.</p>");
		}//success
	})//ajax
	
	
	
}

/*나의 정보 - 회원 탈퇴 기능*/
function withdraw(){
	//alert('정상적으로 탈퇴되었습니다');
	var id = document.getElementById("hiddenUserId").value;
	$.ajax({
		url: "/deletemember",
		data: {"id" : id},
		type: "get",
		success: function(){
			alert('정상적으로 탈퇴 되었습니다.');
			location.href = "main";
		}//success
	});//ajax
}

/*나의 활동 ajax*/
function mymission(){

	//location.href = "participation";
	var id = document.getElementById("profil_div").name;
	$.ajax({
		url: "/participation2",
		data: {"id" : id},
		type: "get",
		
		success: function(list){
			//$("#mymenu_div").empty();
			$("#updateDiv").empty();
			//$("#myMissionDiv").empty();
			$("#myboardlist_div").empty();
			$("#myguidelist_div").empty();
			var complete = "";
			
			
			
			$("#myMissionDiv").html("<table id='missionlist_tb'><tbody id='mission_tbody'><tr class='mission_tr'>"
			+"<th class='mission_th'>활동 코드</th><th class='mission_th'>활동명</th><th class='mission_th'>포인트</th>"
			+ "<th class='mission_th'>탄소배출 감소량</th><th class='mission_th'>진행여부</th><th class='mission_th'>리뷰작성</th></tr>");
			
			for(var i = 0; i < list.length; i++){
				
				if(list[i].p_complete == 1){
					complete = "YES";
				}else{
					complete = "NO";
				}
				
				$("#mission_tbody").append("<tr class='mission_tr'><td class='mission_td'><a class='mission_a' href='/mission_detail/"+list[i].m_code+"'>"+list[i].m_code+"</td>"
				+ "<td class='mission_td' ><a class='mission_a' href='/mission_detail/"+list[i].m_code+"'>"+list[i].m_name+"</td>"
				+ "<td class='mission_td'><a class='mission_a' href='/mission_detail/"+list[i].m_code+"'>"+list[i].m_point+"</td>"
				+ "<td class='mission_td'><a class='mission_a' href='/mission_detail/"+list[i].m_code+"'>"+list[i].m_carbon+"</td>"
				+ "<td class='mission_td'><a class='mission_a' href='/mission_detail/"+list[i].m_code+"'>"+complete+"</td>"
				+ "<td class='mission_td'><input type='button' value='리뷰작성' id='reviewbtn' onclick='review()'></td></tr>");
			};
			$("#myMissionDiv").append("</table>");
			
		}//seccess
	});
	
	
}

/*나의 활동 - 리뷰작성*/
function review() {
	location.href = "participation";
}

/*작성 게시물 조회 기능*/
function boardlist(){
	var id = document.getElementById("profil_div").name;
	
	$.ajax({
		url : "/myboardlist",
		type : "post",
		data : {"id" : id},
		success: function(data){
			$("#updateDiv").empty();
			$("#myMissionDiv").empty();
			$("#myguidelist_div").empty();
			
			$("#myboardlist_div").html("<table id='guidelist_tb'><tbody id='board_tbody'><tr class='board_tr'><th class='board_th'>번호</th><th class='board_th'>분류</th>"
			+ "<th class='board_th'>제목</th><th class='board_th'>작성일</th><th class='board_th'>조회수</th></tr>");
			for(var i = 0; i < data.length; i++){
				$("#board_tbody").append("<tr class='board_tr'><td class='board_td'><a class='board_a' href='/boardview?b_no="+data[i].b_no+"'>"+data[i].b_no+"</td>"
				+ "<td class='board_td' ><a class='board_a' href='/boardview?b_no="+data[i].b_no+"'>"+data[i].b_type+"</td>"
				+ "<td class='board_td'><a class='board_a' href='/boardview?b_no="+data[i].b_no+"'>"+data[i].b_title+"</td>"
				+ "<td class='board_td'><a class='board_a' href='/boardview?b_no="+data[i].b_no+"'>"+data[i].regdate+"</td>"
				+ "<td class='board_td'><a class='board_a' href='/boardview?b_no="+data[i].b_no+"'>"+data[i].b_view+"</td></tr>");
			};
			$("#myboardlist_div").append("</table>");
		}
	}); //ajax end
}



/*자주보는 배출가이드 기능*/
function myguide(){
	var id = document.getElementById("profil_div").name;
	
	$.ajax({
		url : "/myguide",
		type : "post",
		data : {"id" : id},
		success: function(data){
			$("#updateDiv").empty();
			$("#myMissionDiv").empty();
			$("#myboardlist_div").empty();
			
			$("#myguidelist_div").html("<table cellspacing=0 cellpadding=0 id='boardlist_tb'><tbody id='board_tbody'>"
			+ "<th class='board_th'>사진</th><th class='board_th'>분류</th><th class='board_th' style=' width:50%;'>배출 방법</th><th class='board_th' style=' width:10%;'></th></tr>");
			for(var i = 0; i < data.length; i++){
				$("#board_tbody").append("<tr class='board_tr'><td class='board_td' style=' padding:20px 10px ;'><img width=100px; height=100px; id='modalimg' src='img/"+data[i].r_photo+"'></td>"
				+ "<td class='board_td' style='height=50; valign=top; padding:20px 10px ;'>"+data[i].r_class+"<br><hr>"+data[i].r_name+"</td>"
				+ "<td class='board_td'  style='height=50; valign=top; padding:20px 10px ;'><div style='overflow-y: scroll;'>"+data[i].r_way+"</div></td>"
				+ "<td class='board_td'  style='height=50; valign=top; padding:20px 10px ;'><a href='delete_guide?mg_code="+data[i].mg_code+"&r_code="+data[i].r_code+"'  class='board_a' style='text-decoration : underline;'>삭제</a></td></tr>");
			};
			$("#myguidelist_div").append("</table>");
		}
	}); //ajax end
}


