// 지역검색 & 현재위치 검색 변환
function mission(num){
	if(num =='1'){
		document.getElementById("groupmissionpage").style.display = "";
		document.getElementById("solomissionpage").style.display = "none";
		document.getElementById("groupmission").style.backgroundColor = "#1A271D";
		document.getElementById("solomission").style.backgroundColor = "#f6f5f0";
		document.getElementById("groupmission").style.color = "#f6f5f0";
		document.getElementById("solomission").style.color = "#1A271D";
		
	}else{
		document.getElementById("solomissionpage").style.display = "";
		document.getElementById("groupmissionpage").style.display = "none";
		document.getElementById("solomission").style.backgroundColor = "#1A271D";
		document.getElementById("groupmission").style.backgroundColor = "#f6f5f0";
		document.getElementById("solomission").style.color = "#f6f5f0";
		document.getElementById("groupmission").style.color = "#1A271D";
	}
}


function missionmod(code){
	location.href = "adminmissionmod?code=" + code;
}

function missioninsert(){
	location.href = "adminmissioninsert";
}

function missiondel(code){
	var returnValue = confirm('해당 미션정보를 정말 지우시겠습니까?');
	if(returnValue == true){
		location.href = "adminmissiondel?code="+code;
	}
}

function missionreview(code){
	location.href = "adminmissionreview?code="+code;
}

$(document).ready(function(){
	
	// 솔로미션 버튼 클릭
	$("#solomission").on('click',function(){
		$.ajax({
			url : "/adminmissionlist",
			type : "get",
			data : {"m_type" : "solo"},
			success : function(result){
				$("#adminsolomissiontable").html("<tr><th>미션명</th><th> </th><th> </th></tr>");
				for(var i=0;i<result.length;i++){
					$("#adminsolomissiontable").append("<tr><td class='tabname'>"+ result[i].m_name +"</td>" +
					"<td><input class='tabreviewbtn' id='missionreview' type='button' value='후기보러가기' onclick='missionreview("+result[i].m_code+")'></td>" +
					"<td><input class='tabmodbtn' id='missionmod' type='button' value='수정' onclick='missionmod("+ result[i].m_code +")'></td>"+
					"<td><input class='tabdelbtn' id='missiondel' type='button' value='삭제' onclick='missiondel("+ result[i].m_code +")'></td></tr>");
				}
			}
		});
	}); // solomission button click end
	
	// 단체미션 버튼 클릭
	$("#groupmission").on('click',function(){
		$.ajax({
			url : "/adminmissionlist",
			type : "get",
			data : {"m_type" : "group"},
			success : function(result){
				$("#admingroupmissiontable").html("<tr><th>미션명</th><th>날짜</th><th> </th><th> </th></tr>");
				for(var i=0;i<result.length;i++){
					$("#admingroupmissiontable").append("<tr><td class='tabname'>"+ result[i].m_name +"</td><td>" + result[i].m_date + "</td>" +
					"<td><input class='tabreviewbtn' id='missionreview' type='button' value='후기보러가기' onclick='missionreview("+result[i].m_code+")'></td>" +
					"<td><input class='tabmodbtn' id='missionmod' type='button' value='수정' onclick='missionmod("+ result[i].m_code +")'></td>"+
					"<td><input class='tabdelbtn' id='missiondel' type='button' value='삭제' onclick='missiondel("+ result[i].m_code +")'></td></tr>");
				}
			}
		});
	}); // bigloc button click end
})