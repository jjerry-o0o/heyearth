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


<div class="kit_grid grid"
	style="display: inline-block; width: 100%; text-align: center">
	<c:forEach items="${zerokitlist }" var="zerokit">
		<div class="kit_img" style="display: inline-block;" >
			<img class="eachimg" width=200px height=200px
				src="<%=request.getContextPath()%>/img/${zerokit.k_photo}"
				style="cursor: pointer;" />
		</div>
		<div class ="kit-section">
			<div class="kitdetails">
				
   					<p>${zerokit.k_name}</p><br>
   					<p>${zerokit.k_text}</p><br>
   					<a href ="${zerokit.k_url}" title="${zerokit.k_name}">
   				</a>
   				${zerokit.k_url}
   				
   				
   				
   				</div>
			</div>
		

	</c:forEach>
</div>

<script>
$(document).ready(function(){
	$("eachimg").show(); //기본값 보이기
	$(".kitdetails").hide(); //기본값 숨기기
	
	//이미지 클릭 시 보이기 및 숨기기
	$("div.kit_img").click(function(){
		$(".kitdetails").show('fast');
	});
	
	
});
</script>

</html>

<!-- footer import -->
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<!-- end of footer import -->

