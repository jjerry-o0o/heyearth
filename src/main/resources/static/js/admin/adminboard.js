// 지역검색 & 현재위치 검색 변환
function board(num){
	if(num =='1'){
		document.getElementById("noticepage").style.display = "";
		document.getElementById("questionpage").style.display = "none";
		document.getElementById("requestpage").style.display = "none";
		document.getElementById("notice").style.backgroundColor = "#1A271D";
		document.getElementById("question").style.backgroundColor = "#f6f5f0";
		document.getElementById("request").style.backgroundColor = "#f6f5f0";
		document.getElementById("notice").style.color = "#f6f5f0";
		document.getElementById("question").style.color = "#1A271D";
		document.getElementById("request").style.color = "#1A271D";
		
	}else if(num =='2'){
		document.getElementById("questionpage").style.display = "";
		document.getElementById("noticepage").style.display = "none";
		document.getElementById("requestpage").style.display = "none";
		document.getElementById("question").style.backgroundColor = "#1A271D";
		document.getElementById("notice").style.backgroundColor = "#f6f5f0";
		document.getElementById("request").style.backgroundColor = "#f6f5f0";
		document.getElementById("question").style.color = "#f6f5f0";
		document.getElementById("notice").style.color = "#1A271D";
		document.getElementById("request").style.color = "#1A271D";
	}else{
		document.getElementById("requestpage").style.display = "";
		document.getElementById("noticepage").style.display = "none";
		document.getElementById("questionpage").style.display = "none";
		document.getElementById("request").style.backgroundColor = "#1A271D";
		document.getElementById("notice").style.backgroundColor = "#f6f5f0";
		document.getElementById("question").style.backgroundColor = "#f6f5f0";
		document.getElementById("request").style.color = "#f6f5f0";
		document.getElementById("notice").style.color = "#1A271D";
		document.getElementById("question").style.color = "#1A271D";
	}
}


function boardmod(code){   // 공지사항 게시판 수정
	location.href = "adminboardmod?code=" + code;
}

function boardinsert(){   // 공지사항 게시판 등록
	location.href = "adminboardinsert";
}

function boarddel(code){
	var returnValue = confirm('해당 게시물을 정말 지우시겠습니까?');
	if(returnValue == true){
		location.href = "adminboarddel?code="+code;
	}
}

function comment(code){
	location.href = "admincomment?code=" + code;
}


$(document).ready(function(){
	
	// 공지사항 버튼
	$("#notice").on('click',function(){
		$.ajax({
			url : "/adminboardlist",
			type : "get",
			data : {"b_type" : "not"},
			success : function(result){				
				$("#adminnoticetable").html("<tr><th>게시물명</th><th>작성자</th><th>작성일</th><th> </th><th> </th></tr>");
				for(var i=0;i<result.length;i++){
					$("#adminnoticetable").append("<tr><td class='tabname'>"+ result[i].b_title +"</td>" +
					"<td class='tabname'>" +result[i].id + "</td>" +
					"<td class='tabname'>" + result[i].regdate + "</td>" +
					"<td><input class='tabmodbtn' id='comment' type='button' value='댓글작성' onclick='comment("+result[i].b_no + ")'></td>" +
					"<td><input class='tabmodbtn' id='boardmod' type='button' value='수정' onclick='boardmod("+ result[i].b_no +")'></td>"+
					"<td><input class='tabdelbtn' id='boarddel' type='button' value='삭제' onclick='boarddel("+ result[i].b_no +")'></td></tr>");
				}
					
			}
		});
	}); // notice button click end
	
	// 질문 버튼
	$("#question").on('click',function(){
		$.ajax({
			url : "/adminboardlist",
			type : "get",
			data : {"b_type" : "que"},
			success : function(result){
				$("#adminquestiontable").html("<tr><th>게시물명</th><th>작성자</th><th>작성일</th><th>  </th><th>  </th><th>  </th></tr>");
				for(var i=0;i<result.length;i++){
					$("#adminquestiontable").append("<tr><td class='tabname'>"+ result[i].b_title +"</td>" +
					"<td class='tabname'>" +result[i].id + "</td>" +
					"<td class='tabname'>" + result[i].regdate + "</td>" +
					"<td><input class='tabmodbtn' id='comment' type='button' value='댓글작성' onclick='comment("+result[i].b_no + ")'></td>" +
					"<td><input class='tabmodbtn' id='boardmod' type='button' value='수정' onclick='boardmod("+ result[i].b_no +")'></td>"+
					"<td><input class='tabdelbtn' id='boarddel' type='button' value='삭제' onclick='boarddel("+ result[i].b_no +")'></td></tr>");
				}
			}
		});
	}); // question button click end
	
	// 요청 버튼
	$("#request").on('click',function(){
		$.ajax({
			url : "/adminboardlist",
			type : "get",
			data : {"b_type" : "req"},
			success : function(result){
				$("#adminrequesttable").html("<tr><th>게시물명</th><th>작성자</th><th>작성일</th><th>  </th><th>  </th><th>  </th></tr>");
				for(var i=0;i<result.length;i++){
					$("#adminrequesttable").append("<tr><td class='tabname'>"+ result[i].b_title +"</td>" +
					"<td class='tabname'>" +result[i].id + "</td>" +
					"<td class='tabname'>" + result[i].regdate + "</td>" +
					"<td><input class='tabmodbtn' id='comment' type='button' value='댓글작성' onclick='comment("+result[i].b_no + ")'></td>" +
					"<td><input class='tabmodbtn' id='boardmod' type='button' value='수정' onclick='boardmod("+ result[i].b_no +")'></td>"+
					"<td><input class='tabdelbtn' id='boarddel' type='button' value='삭제' onclick='boarddel("+ result[i].b_no +")'></td></tr>");
				}
			}
		});
	}); // request button click end
})