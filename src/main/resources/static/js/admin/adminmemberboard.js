function board(num){
	if(num =='1'){
		document.getElementById("questionpage").style.display = "";
		document.getElementById("requestpage").style.display = "none";
		document.getElementById("que").style.backgroundColor = "#1A271D";
		document.getElementById("req").style.backgroundColor = "#f6f5f0";
		document.getElementById("que").style.color = "#f6f5f0";
		document.getElementById("req").style.color = "#1A271D";
	}else{
		document.getElementById("requestpage").style.display = "";
		document.getElementById("questionpage").style.display = "none";
		document.getElementById("req").style.backgroundColor = "#1A271D";
		document.getElementById("que").style.backgroundColor = "#f6f5f0";
		document.getElementById("req").style.color = "#f6f5f0";
		document.getElementById("que").style.color = "#1A271D";
	}
}

function boardback(){
	location.href="adminmember";
}


function boardmod(code){   
	location.href = "adminmemberboardmod?code=" + code;
}

function boarddel(code){
	var returnValue = confirm('해당 게시물을 정말 지우시겠습니까?');
	if(returnValue == true){
		location.href = "adminmemberboarddel?code="+code;
	}
}


$(document).ready(function(){
	
	// 질문 버튼
	$("#que").on('click',function(){
		$.ajax({
			url : "/adminmemberboardlist",
			type : "get",
			data : {"b_type" : "que", "id" : $("#id").val()},
			success : function(result){
				$("#adminquestiontable").html("<tr><th>게시물명</th><th>작성일</th><th>  </th><th>  </th></tr>");
				for(var i=0;i<result.length;i++){
					$("#adminquestiontable").append("<tr><td class='tabname'>"+ result[i].b_title +"</td>" +
					"<td class='tabname'>" + result[i].regdate + "</td>" +
					"<td><input class='tabmodbtn' id='boardmod' type='button' value='수정' onclick='boardmod("+ result[i].b_no +")'></td>"+
					"<td><input class='tabdelbtn' id='boarddel' type='button' value='삭제' onclick='boarddel("+ result[i].b_no +")'></td></tr>");
				}
			}
		});
	}); // question button click end
	
	// 요청 버튼
	$("#req").on('click',function(){
		$.ajax({
			url : "/adminmemberboardlist",
			type : "get",
			data : {"b_type" : "req", "id" : $("#id").val()},
			success : function(result){
				$("#adminrequesttable").html("<tr><th>게시물명</th><th>작성일</th><th>  </th><th>  </th></tr>");
				for(var i=0;i<result.length;i++){
					$("#adminrequesttable").append("<tr><td class='tabname'>"+ result[i].b_title +"</td>" +
					"<td class='tabname'>" + result[i].regdate + "</td>" +
					"<td><input class='tabmodbtn' id='boardmod' type='button' value='수정' onclick='boardmod("+ result[i].b_no +")'></td>"+
					"<td><input class='tabdelbtn' id='boarddel' type='button' value='삭제' onclick='boarddel("+ result[i].b_no +")'></td></tr>");
				}
				
			}
		});
	}); // request button click end
})