<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Zero Kit</title>

<!-- header import -->
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!-- end of header import -->
<script src="jquery-3.6.0.min.js"></script>
<link href="css/zerokit/zerokit.css" rel="stylesheet">
</head>
<body>

</body>


<div class=intro-text>

	<h1>지속가능한 제로웨이스트 키트</h1>
	<br>
	<p>
		일상에서 자주 쓰는 물건들을 보다 지속가능한 모습을 갖춘 <strong><span
			style="color: #FF8C00;">'제로키트'</span></strong> 를 제안합니다. <br>원하는 물품의 이미지클
		클릭해 보세요. <br>우리가 일상에서 무심코 쓰고 버리던 물건들을 <strong><span
			style="color: #FF8C00;">가치적으로 소비</span></strong> 할 수 있게 제안합니다. <br>그리고
		물건을 구매할 수 있는 사이트로 연결해드려요. <br> <br>
	</p>
</div>

<!-- 제로키트 사진 리스트업 -->
<div class="kit_section">
<div class="kit_grid grid">
	<c:forEach items="${zerokitlist }" var="zerokit" varStatus="status">
		<div class="kit_img" style="display: inline-block;">
			<img class="eachimg" id=${status.current } width=220px height=220px;
				src="<%=request.getContextPath()%>/img/${zerokit.k_photo}"
				onClick=detail(${zerokit.k_code}) />
			</div>
			<div class = "detail" id='detail_div${zerokit.k_code}' style="  display : none; margin-top:10px;  ">
				<div class='close-area' id='kit_close' style="display : none;">X</div>
				<div id ='kit_photo'></div>
				<div id = 'kit_t'>
				<h2 id ='kit-title'></h2><br>
				<p id='kit_text'></p><br>
				<a class ="kit_link" style="display : none;"></a><br></div>
				
			</div>
		
	</c:forEach>


</div>
</div>
<script>



function detail(k_code){
	
						
	for(var i =1; i<=16; i++ ){
		$("#detail_div" + i).empty();
	}
	
	for(var i =1; i<=16; i++ ){
		$("#detail_div" + i).hide();
	}
	$.ajax({
		url : "/zerokitdetail",
		type : "get",
		data : {"k_code" : k_code},
		success : function(list){
			var box;
			if(list.k_code >0 && list.k_code  <= 4){
				box = 4;
			}else if(list.k_code >4 && list.k_code  <= 8){
				box = 8;
			}else if(list.k_code >8 && list.k_code  <= 12){
				box = 12;
			}else if(list.k_code >12 && list.k_code  <= 16){
				box = 16;}
				
			$('#detail_div'+box).show();
			
			$("#detail_div" + box).append("<div class='close-area' id='kit_close' onClick='kitclose(" + box + ")'>X</div>"
			 + "<div id='all'><div id ='kit_photo'style='float : left; width : 50%; height : 50%; '>" 
			 + "<img src='img/"+list.k_photo + "'style='  width : 300px; height : 50%; display : block; margin:auto;'/></div>"
			 + "<div id='kit_t'style=' float : right; width : 50%; margin-bottom : 30px; '><h2 id='kit_title' >" + list.k_name + "</h2><br>"
			 + "<p id='kit_text' style='padding : 30px 30px 10px 30px;'>" + list.k_text + "</p><br>"  
			 + "<a id ='kit_link' href=" + list.k_url + " target='_blank' >" 
					+ list.k_name + "</a><br></div></div>");
			
			
			document.getElementById("kit_photo").style.backgroundColor = "#F6F5F0;";

		}
	});
	
	
};


function kitclose(i){
		document.getElementById("detail_div"+i).style.display = "none";
}





</script>


</html>

<!-- footer import -->
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<!-- end of footer import -->

