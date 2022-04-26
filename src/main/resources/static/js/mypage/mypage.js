
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

function mymission(){

	//location.href = "participation";
	var id = document.getElementById("profil_div").name;
	$.ajax({
		url: "/participation2",
		data: {"id" : id},
		type: "get",
		
		success: function(list){
			
			$("#mymenu_div").html("<p>진행중인 환경 지킴이 활동</p>");
			$("#mymenu_div").append("<hr>");
			
			for(var i=0; i<list.length; i++){
				//
				if(list[i].p_complete == 0){
					$("#mymenu_div").append("<div><a href='mission_detail/"+list[i].m_code+"'><img src=img/"+list[i].m_photo+" width=100px height=100px>"+list[i].m_name+"</a></div>");
					$("#mymenu_div").append("<div><button class=mymissionbtn onclick='solodetail("+list[i].m_code+")'>신청내역 조회</button></div>");
					$("#mymenu_div").append("<div id=modal2><div id=modalh22></div></div>")
				}
			}//for
			
			$("#mymenu_div").append("<p>진행완료한 환경 지킴이 활동</p>");
			$("#mymenu_div").append("<hr>");
			
			for(var i=0; i<list.length; i++){
				if(list[i].p_complete == 1){
					$("#mymenu_div").append("<div><a href='mission_detail/"+list[i].m_code+"'><img src=img/"+list[i].m_photo+" width=100px height=100px>"+list[i].m_name+"</a></div>");
					$("#mymenu_div").append("<div><button class=mymissionbtn onclick='solodetail("+list[i].m_code+")'>신청내역 조회</button></div>");
				}
			}
		}//seccess
	});
	
	
}

function solodetail(code){
	alert(code);
	$.ajax({
		url : "/solodetail",
		type : "get",
		data : {"m_code" : code},
		success : function(solo){
			var modal = document.getElementById("modal");
			modal.style.display = "flex";
			
			$('html').scrollTop(0);
			$("#modalh2").text(solo.m_name);
			$("#modalcontent").html("사진을 찍고 미션을 완료해주세요.<br><br>");
			$("#modalcontent").append("포인트 획득: " + solo.m_point + "<br>");
			$("#modalcontent").append("탄소배출 감소량 : " + solo.m_carbon + "g<br>");
			$("#modalcontent").append("미션방법 : " + solo.m_inform + "<br>");
			$("#modalcontent").append("<span style='color:orange'>인증 사진을 올려주세요!</span><br>");
			$("#modalcontent").append("<img class=p_img id=previewimg><br>");
			$("#p_photo").val(solo.p_photo); 
		}
	});

}

/*작성 게시물 조회 기능*/

function boardlist(){
	var id = document.getElementById("profil_div").name;
	
	$.ajax({
		url : "/myboardlist",
		type : "post",
		data : {"id" : id},
		success: function(data){
			$("#mymenu_div").empty();
			
			$("#mymenu_div").html("<table id='boardlist_tb'><tbody id='board_tbody'><tr class='board_tr'><th class='board_th'>번호</th><th class='board_th'>분류</th>"
			+ "<th class='board_th'>제목</th><th class='board_th'>작성일</th><th class='board_th'>조회수</th></tr>");
			for(var i = 0; i < data.length; i++){
				$("#board_tbody").append("<tr class='board_tr'><td class='board_td'><a class='board_a' href='/boardview?b_no="+data[i].b_no+"'>"+data[i].b_no+"</td>"
				+ "<td class='board_td' ><a class='board_a' href='/boardview?b_no="+data[i].b_no+"'>"+data[i].b_type+"</td>"
				+ "<td class='board_td'><a class='board_a' href='/boardview?b_no="+data[i].b_no+"'>"+data[i].b_title+"</td>"
				+ "<td class='board_td'><a class='board_a' href='/boardview?b_no="+data[i].b_no+"'>"+data[i].b_regdate+"</td>"
				+ "<td class='board_td'><a class='board_a' href='/boardview?b_no="+data[i].b_no+"'>"+data[i].b_view+"</td></tr>");
			};
			$("#mymenu_div").append("</table>");
		}
	}); //ajax end
}



function myboard(){
	alert('myboard hi');
}

function myguide(){
	alert('myguide hi');
}

$(document).ready(function (){
	
//모달창 닫기
	$("#modal").on("click",function(){
		document.getElementById("modal").style.display = "none";
	});
	
	modal.addEventListener("click", e => {
		const evTarget = e.target
		if(evTarget.classList.contains("modal-overlay")) {
			modal.style.display = "none";
		}
	});
});