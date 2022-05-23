/*나의 정보 ajax*/
function profil_div() {
	var id = document.getElementById("profil_div").name;
	//alert(id);
	$.ajax({
		url: '/modifymypage',
		data: { "id": id },
		type: 'get',
		success: function(userdto) {
			//$("#mymenu_div").empty();
			//$("#updateDiv").empty();
			$("#myMissionDiv").empty();
			$("#myboardlist_div").empty();
			$("#myguidelist_div").empty();
			$("#couponDiv").empty();

			$("#updateDiv").html("<div id=gradeP><p>" + userdto.id + "님의 등급</p></div>");
			$("#updateDiv").append("<div id=grade>" + userdto.grade + " 등급" + "</div><br>");

			$("#updateDiv").append("<button type='button' id=couponbtn onclick=mycoupon() value='포인트사용'>포인트사용</button><div id=pointP><p>보유 포인트</p></div></div>");
			$("#myPoint").val(userdto.point);
			$("#updateDiv").append("<div id=point>" + userdto.point + " p<br>");
			$("#updateDiv").append("<div id=carbonP><p>탄소 배출량</p></div>");
			$("#updateDiv").append("<div id=carbon>" + userdto.carbon + " g</div><br>");
			$("#updateDiv").append("<div id='updateId'><p>닉네임</p><p id=userid>&nbsp" + userdto.id + "</p></div>");
			$("#updateDiv").append("<div><p>누적 레드카드&nbsp&nbsp<span class='name'>" + userdto.redcard + "회</span></p></div>");
			$("#updateDiv").append("<hr>");

			$("#updateDiv").append("<div id=hidden><input type='hidden' id='hiddenUserId' name='userId' value='" + userdto.id + "'></div>");
			$("#updateDiv").append("<div id=pw><p>현재 비밀번호 </p><input id=pw2 type='password' name='pw'>"
				+ "<input type='button' id='pwckbtn' name='pwck' value='비밀번호 확인'></div>");
			$("#updateDiv").append("<div id=pwerror></div>");

			$("#updateDiv").append("<div id=newpw><p>새 비밀번호 </p><input id=newpw2 type='password' name='newpw'></div>");
			$("#updateDiv").append("<div id=newpwerror></div>");

			$("#updateDiv").append("<div id=newpwck><p>새 비밀번호 확인</p><input id=newpwck2 type='password'' name='newpwck'></div>");
			$("#updateDiv").append("<div id=newpwckerror></div>");

			$("#updateDiv").append("<div id=phone><p>전화번호</p><input id=phone2 type='text' name='phone' value='" + userdto.phone + "'></div>");
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
		data: { "pw2": pw2 },
		type: "post",
		success: function(result) {
			if (pw2 == "" || !pwCheck) {
				$("#pwerror").html('4자 이상, 영문+숫자로 입력해주세요');
				document.getElementById("pw2").focus();
				return false;
			} else if (result >= 1) {
				$("#pwerror").html('비밀번호가 확인되었습니다.');
				//alert("비밀번호가 확인되었습니다.")
			} else {
				$("#pwerror").html('비밀번호가 다릅니다.')
			}

			document.getElementById("submit").onclick = pwUpdate;

		}//success
	});//ajax
}//function end

/*나의 정보 비밀번호 변경*/
function pwUpdate(userdto) {
	pwck();
	var pwPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,}$/;
	var newpw2 = document.getElementById("newpw2").value;
	let newpw2Check = pwPattern.test(newpw2);
	var newpwck2 = document.getElementById("newpwck2").value;
	let newpwck2Check = pwPattern.test(newpwck2);

	if (newpw2 == "" || !newpw2Check) {
		$("#newpwerror").html('4자 이상, 영문+숫자로 입력해주세요');
		document.getElementById("newpw2").focus();
		return false;
	} else {
		$("#newpwerror").html('');

		if (newpwck2 == "" || !newpwck2Check || newpwck2 != newpw2) {
			$("#newpwckerror").html('비밀번호가 일치하지 않습니다');
			document.getElementById("newpwck2").focus();
			return false;
		} else {
			$("#newpwckerror").html('');
		}
	}

	alert("개인정보가 정상적으로 수정되었습니다.");

	$.ajax({
		url: "/update",
		data: { "id": userdto.id, "newpw": newpw2, "newpwck": newpwck2 },
		type: "post",
		success: function() {
			//alert(result);
			//$("#updateDiv").html("<p id='successP'>회원가입이 정상적으로 수정되었습니다.</p>");
		}//success
	})//ajax



}

/*나의 정보 - 회원 탈퇴 기능*/
function withdraw() {
	//alert('정상적으로 탈퇴되었습니다');
	var id = document.getElementById("hiddenUserId").value;
	$.ajax({
		url: "/deletemember",
		data: { "id": id },
		type: "get",
		success: function() {
			alert('정상적으로 탈퇴 되었습니다.');
			location.href = "main";
		}//success
	});//ajax
}

/*나의 활동 ajax*/
function mymission() {

	//location.href = "participation";
	var id = document.getElementById("profil_div").name;
	$.ajax({
		url: "/participation2",
		data: { "id": id },
		type: "get",

		success: function(list) {
			//$("#mymenu_div").empty();
			$("#updateDiv").empty();
			//$("#myMissionDiv").empty();
			$("#myboardlist_div").empty();
			$("#myguidelist_div").empty();
			$("#couponDiv").empty();
			var complete = "";

			$("#myMissionDiv").html("<table id='missionlist_tb'><tbody id='mission_tbody'><tr class='mission_tr'>"
				+ "<th class='mission_th'>활동 코드</th><th class='mission_th'>활동명</th><th class='mission_th'>포인트</th>"
				+ "<th class='mission_th'>탄소배출 감소량</th><th class='mission_th'>진행여부</th><th class='mission_th'>리뷰작성</th></tr>");

			for (var i = 0; i < list.length; i++) {

				if (list[i].p_complete == 1) {
					complete = "YES";
				} else {
					complete = "NO";
				}

				$("#mission_tbody").append("<tr class='mission_tr'><td class='mission_td'><a class='mission_a' href='/mission_detail/" + list[i].m_code + "'>" + list[i].m_code + "</td>"
					+ "<td class='mission_td' ><a class='mission_a' href='/mission_detail/" + list[i].m_code + "'>" + list[i].m_name + "</td>"
					+ "<td class='mission_td'><a class='mission_a' href='/mission_detail/" + list[i].m_code + "'>" + list[i].m_point + "</td>"
					+ "<td class='mission_td'><a class='mission_a' href='/mission_detail/" + list[i].m_code + "'>" + list[i].m_carbon + "</td>"
					+ "<td class='mission_td'><a class='mission_a' href='/mission_detail/" + list[i].m_code + "'>" + complete + "</td>"
					+ "<td class='mission_td'><input type='button' value='리뷰작성' id='reviewbtn' onclick='review()'></td></tr>");
			};
			$("#myMissionDiv").append("</table>");

		}//seccess
	});//ajax
}//function

/*나의 활동 - 리뷰작성*/
function review() {
	location.href = "participation";
}

/*작성 게시물 조회 기능*/
function boardlist() {
	var id = document.getElementById("profil_div").name;

	$.ajax({
		url: "/myboardlist",
		type: "post",
		data: { "id": id },
		success: function(data) {
			$("#updateDiv").empty();
			$("#myMissionDiv").empty();
			$("#myguidelist_div").empty();
			$("#couponDiv").empty();


			$("#myboardlist_div").html("<div id='mb_btn_div'><input type='button' id='board_btn' class='mb_btns' value='작성 게시물' onclick='boardlist()' checked='checked'>"
				+ "<input type='button' id='comment_btn' class='mb_btns' value='작성 댓글' onclick='commentlist()'></div> <br>");

				if(data.length == 0){
					$("#myboardlist_div").append("<div class='no_img_div'><img class='no_img' src='img/noboard.jpg' onclick=location.href='/boardlist'></div>");
				}
				else{
					$("#myboardlist_div").append("<div id='myboardlist_div1'><table id='boardlist_tb'><tbody id='board_tbody'><tr class='board_tr'><th class='board_th'>번호</th><th class='board_th'>분류</th>"
					+ "<th class='board_th'>제목</th><th class='board_th'>작성일</th><th class='board_th'>조회수</th></tr>");
					
					for (var i = 0; i < data.length; i++) {
						$("#board_tbody").append("<tr class='board_tr' onClick=location.href='/boardview?b_no=" + data[i].b_no + "'><td class='board_td'>" + data[i].b_no + "</td>"
							+ "<td class='board_td'>" + data[i].b_type + "</td>"
							+ "<td class='board_td'>" + data[i].b_title + "</td>"
							+ "<td class='board_td'>" + data[i].regdate + "</td>"
							+ "<td class='board_td'>" + data[i].b_view + "</td></tr>");
						};
				}
			
			$("#myboardlist_div").append("</table> </div>");

			document.getElementById("board_btn").style.backgroundColor = "#1A271D";
			document.getElementById("comment_btn").style.backgroundColor = "#f6f5f0";
			document.getElementById("board_btn").style.color = "#f6f5f0";
			document.getElementById("comment_btn").style.color = "#1A271D";
		}
	}); //ajax end


}

function commentlist() {
	var id = document.getElementById("profil_div").name;

	$.ajax({
		url: "/mycommentlist",
		type: "post",
		data: { "id": id },
		success: function(data) {
			$("#updateDiv").empty();
			$("#myMissionDiv").empty();
			$("#myguidelist_div").empty();
			$("#couponDiv").empty();

			$("#myboardlist_div").html("<div id='mb_btn_div'><input type='button' id='board_btn' class='mb_btns' value='작성 게시물' onclick='boardlist()'>"
				+ "<input type='button' id='comment_btn' class='mb_btns' value='작성 댓글' onclick='commentlist()' checked='checked'></div> <br>");
			
			if(data.length == 0){
				$("#myboardlist_div").append("<div class='no_img_div'><img class='no_img' src='img/nocomment.jpg' onclick=location.href='/boardlist'></div>");
			}
			else{
				$("#myboardlist_div").append("<div id='myboardlist_div1'><table id='commentlist_tb'><tbody id='comment_tbody'><tr class='comment_tr'><th class='comment_th'>게시물</th><th class='comment_th'>댓글번호</th>"
				+ "<th class='comment_th'>내용</th><th class='comment_th'>작성일</th><th class='comment_th'></th></tr>");
				
				for(var i = 0; i < data.length; i++) {
					$("#comment_tbody").append("<tr class='comment_tr' onClick=location.href='/boardview?b_no=" + data[i].b_no + "'><td class='comment_td'>" + data[i].b_no + "</td>"
					+ "<td class='comment_td'>" + data[i].c_index + "</td>"
					+ "<td class='comment_td'>" + data[i].c_comment + "</td>"
					+ "<td class='comment_td'>" + data[i].regdate + "</td>"
					+ "<td class='comment_td'><button class='button' id='alter_btn" + i + "' onclick='remove(" + i + ")'>수정/삭제</button></td></tr>");
				};
				$("#myboardlist_div").append("</table> </div>");
			}
			

			document.getElementById("comment_btn").style.backgroundColor = "#1A271D";
			document.getElementById("board_btn").style.backgroundColor = "#f6f5f0";
			document.getElementById("comment_btn").style.color = "#f6f5f0";
			document.getElementById("board_btn").style.color = "#1A271D";
		}
	}); //ajax end

}



/*자주보는 배출가이드 기능*/
function myguide() {
	var id = document.getElementById("profil_div").name;

	$.ajax({
		url: "/myguide",
		type: "post",
		data: { "id": id },
		success: function(data) {
			$("#updateDiv").empty();
			$("#myMissionDiv").empty();
			$("#myboardlist_div").empty();
			$("#couponDiv").empty();

			$("#myguidelist_div").html("<table cellspacing=0 cellpadding=0 id='boardlist_tb'><tbody id='board_tbody'>"
				+ "<th class='board_th'>사진</th><th class='board_th'>분류</th><th class='board_th' style=' width:50%;'>배출 방법</th><th class='board_th' style=' width:10%;'></th></tr>");
			for (var i = 0; i < data.length; i++) {
				$("#board_tbody").append("<tr class='board_tr'><td class='board_td' style=' padding:20px 10px ;'><img width=100px; height=100px; id='modalimg' src='img/" + data[i].r_photo + "'></td>"
					+ "<td class='board_td' style='height=50; valign=top; padding:20px 10px ;'>" + data[i].r_class + "<br><hr>" + data[i].r_name + "</td>"
					+ "<td class='board_td'  style='height=50; valign=top; padding:20px 10px ;'><div style='overflow-y: scroll;'>" + data[i].r_way + "</div></td>"
					+ "<td class='board_td'  style='height=50; valign=top; padding:20px 10px ;'><a href='delete_guide?mg_code=" + data[i].mg_code + "&r_code=" + data[i].r_code + "'  class='board_a' style='text-decoration : underline;'>삭제</a></td></tr>");
			};
			$("#myguidelist_div").append("</table>");
		}
	}); //ajax end
}

/*쿠폰 목록 기능*/
function mycoupon() {
	var id = document.getElementById("profil_div").name;
	$.ajax({
		url: "/mycoupon",
		type: "post",
		data: { "id": id },
		success: function(data) {
			$("#updateDiv").empty();
			
			$("#couponDiv").css("display","");
			$("#couponDiv").html("<div style='text-align:center'><h2>포인트 사용하기</h2>");
			$("#couponDiv").append("나의 포인트 :<span class=name> "+$("#myPoint").val()+"</span><br>");
			$("#couponDiv").append("포인트는 1000점 부터 1000단위로 사용할 수 있습니다.</div><br>");
			if($("#myPoint").val() >= 1000){
			$("#couponDiv").append("제휴매장과 사용할 포인트를 선택해주세요.<br>");
			$("#couponDiv").append("<label for='c_shop'>제휴매장</label><select name='c_shop' id='c_shop'></select>");
            $("#c_shop").append($("<option value='ThePicker' selected>The Picker</option><option value='지구별가게'>지구별가게</option><option value='덕분애'>덕분애</option><option value='담아가게'>담아가게</option><option value='zerothings'>zerothings</option><option value='알맹상점'>알맹상점</option><option value='지구샵'>지구샵</option><option value='ATOMOS'>ATOMOS</option><option value='organicpunk'>organicpunk</option><option value='동구밭'>동구밭</option>"));
			$("#couponDiv").append("<input type=hidden name=c_number value='"+id + Math.floor((Math.random() * (10000 - 1) + 1) + 10000)+"'>");
			$("#couponDiv").append("<label for='c_point'>사용포인트</label><input type=number id='c_point' name=c_point step=1000 value=1000 min=1000 max="+$("#myPoint").val()+">");
			$("#couponDiv").append("<input type=hidden name=id value="+id+">");
			$("#couponDiv").append("<input id='couponsm' type=submit value='쿠폰발급'><br>");
			}
			
			$("#couponDiv").append("<hr>");
			$("#couponDiv").append("<div style='text-align:center;color:#1A271D;'><h3>매장의 로고를 클릭한 뒤 쿠폰번호를 입력해 포인트를 사용해보세요!</h3><div>");
			/*$("#couponDiv").append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;해당매장의 로고를 클릭한 뒤 쿠폰번호를 입력해 포인트를 사용해보세요!");*/
			$("#couponDiv").append("<div id='myboardlist_div1'><table id='boardlist_tb'><tbody id='board_tbody'><tr class='board_tr'><th class='board_th'>번호</th><th class='board_th'>쿠폰번호</th>"
					+ "<th class='board_th'>발급날짜</th><th class='board_th'>종료날짜</th><th class='board_th'>제로샵</th><th class='board_th'>포인트</th></tr>");
				for (var i = 0; i < data.length; i++) {
					$("#board_tbody").append("<tr><td class='board_td'>" + data[i].c_code + "</td>"
						+ "<td class='board_td'>" + data[i].c_number + "</td>"
						+ "<td class='board_td'>" + data[i].c_startdate + "</td>"
						+ "<td class='board_td'>" + data[i].c_enddate + "</td>"
						+ "<td class='board_td'>" + data[i].c_shop + "</td>"
						+ "<td class='board_td'>" + data[i].c_point + "</td></tr>");
				};
				$("#couponDiv").append("</table> </div>");
				
				$("#couponDiv").append("<div id='aff-imges'>"
		+ "<a target='_black' href='https://thepicker.net/'><img src='img/main-aff1.png' id='main-aff' ></a>"
		+"<a target='_black' href='https://jigubyulstore.com/'><img src='img/main-aff8.png' id='main-aff' style='width: %; height: %;'></a>"
		+"<a target='_black' href='https://www.thanksto.co.kr/'><img src='img/main-aff4.png' id='main-aff' style='width: 20%; height: 20%;'></a>"
		+"<a target='_black' href='https://www.instagram.com/dam_a_store/'><img src='img/main-aff6.png' id='main-aff' style='width: 15%; height: 15%;'></a>"
		+"<a target='_black' href='https://zerothings.co.kr/'><img src='img/main-aff7.png' id='main-aff' style='width: 20%; height: 20%;'></a>"
		+"<a target='_black' href='https://almang.modoo.at/'><img src='img/main-aff2.png' id='main-aff' style='width: 10%; height: 10%;' ></a>"
		+"<a target='_black' href='https://www.jigushop.co.kr/'><img src='img/main-aff3.png' id='main-aff' style='width: 15%; height: 20%;'></a>"
		+"<a target='_black' href='https://www.atomos-store.kr/'><img src='img/main-aff9.png' id='main-aff' style='width: 20%; height: 20%;'></a>"
		+"<a target='_black' href='https://brunch.co.kr/magazine/organicpunk'><img src='img/main-aff10.png' id='main-aff' style='width: 10%; height: 10%;'></a>"
		+"<a target='_black' href='https://donggubat.com/'><img src='img/main-aff11.png' id='main-aff' style='width: 15%; height: 15%;'></a>"
		+"</div>");
			
			}
	}); //ajax end
}
  
  // 레드카드 팝업 띄우기
  if($("#redcard").val() == 1){//레드카드 1회 누적
        // 쿠키 가져오기
        var getCookie = function (cname) {
            var name = cname + "=";
            var ca = document.cookie.split(';');
            for(var i=0; i<ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0)==' ') c = c.substring(1);
                if (c.indexOf(name) != -1) return c.substring(name.length,c.length);
            }
            return "";
        }
         }
        // 일주일 쿠키 설정  
        var setCookie = function (cname, cvalue, exdays) {
            var todayDate = new Date();
            todayDate.setTime(todayDate.getTime() + (exdays*24*60*60*1000));    
            var expires = "expires=" + todayDate.toUTCString();
            document.cookie = cname + "=" + cvalue + "; " + expires;
        }       
        var couponClose = function(){
            if($("input[name='chkbox']").is(":checked") == true){
                setCookie($("#profil_div").val()+1,"Y",7); //일주일
            }
            $("#pop").hide();
        }
        //쿠키 존재 하면 팝업 띄우지 않기
        $(document).ready(function(){
            var cookiedata = document.cookie;
            console.log(cookiedata);
            if(cookiedata.indexOf($("#profil_div").val()+1+"=Y")<0){
                $("#pop").show();
            }else{
                $("#pop").hide();
            }
            $("#close").click(function(){
                couponClose();
            });
        });
        
   if($("#redcard").val() == 2){ // 레드카드 2회
    	// 쿠키 가져오기
        var getCookie = function (cname) {
            var name2 = cname + "=";
            var ca2 = document.cookie.split(';');
            for(var i=0; i<ca2.length; i++) {
                var c2 = ca2[i];
                while (c2.charAt(0)==' ') c2 = c2.substring(1);
                if (c2.indexOf(name) != -1) return c2.substring(name.length,c2.length);
            }
            return "";
        }
     }
        // 일주일 쿠키 설정 
        var setCookie = function (cname, cvalue, exdays) {
            var todayDate2 = new Date();
            todayDate2.setTime(todayDate2.getTime() + (exdays*24*60*60*1000));    
            var expires2 = "expires=" + todayDate2.toUTCString();
            document.cookie = cname + "=" + cvalue + "; " + expires2;
        }

        
        var couponClose2 = function(){
            if($("input[name='chkbox2']").is(":checked") == true){
                setCookie($("#profil_div").val()+2,"Y",7); //일주일
            }
            $("#pop2").hide();
        }
        //쿠키 존재 하면 팝업 띄우지 않기
        $(document).ready(function(){
            var cookiedata2 = document.cookie;
            console.log(cookiedata2);
            if(cookiedata2.indexOf($("#profil_div").val()+2+"=Y")<0){
                $("#pop2").show();
            }else{
                $("#pop2").hide();
            }
            $("#close2").click(function(){
                couponClose2();
            });
        });

