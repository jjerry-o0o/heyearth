<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Main | Hey, Earth</title>
 <!-- header import -->
 <%@ include file="/WEB-INF/views/include/header.jsp" %>
   <!-- end of header import -->
<link href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet">
<script src="/jquery-3.6.0.min.js"></script>
<!-- <script src="js/main.js"></script> -->

<meta name="viewport" content="width=device-width, initial-scale=1">




</head>
<body>

<div class="m-carbon-title">
<h1>탄소발자국을 아세요?</h1>
<p id="m-carbon-text">약 81명의 와썹러들이 환경보호 활동을 통해 함께 실천해나가는 탄소배출 줄이기.<br>함께 확인해보실래요? </p>


<button type="button" class="btn btn-dark" onclick="location.href='/carbon'">TOGETHER</button>

			</div>


	
<!-- 			<img src="img/main-forest.jpg" style="width: 100%"> -->
			
	


<!-- 	<div class="m-about"> -->
<!-- 		<img src="img/main-about.png" style="width: 30%"> -->
<!-- 		<div class="m-about-text"> -->
<!-- 			<p id="m-a-t-b"><strong>헤이얼스는 환경보호를 위한 제로웨이스트 라이프스타일 플랫폼입니다.</strong></p> -->
<!-- 				<p>바쁘게 살아가는 일상 속, 자신도 모르게 환경을 파괴하며 살아가고 있지는 않나요? <br> 시장의 과도한 -->
<!-- 				편의주의와 미숙한 분리배출 방식으로부터 오염과 파괴를 방지하기 위한 역할을 합니다.<br> 이를 위해 환경보호에 -->
<!-- 				관심이 많은 사람들을 서로 연결하여 다양한 활동을 실시하고 정확한 정보를 제공하려 합니다. <br> -->
<!-- 			</p> -->
<!-- 			<button type="button" onclick="location.href='/about'">About→</button> -->

<!-- 		</div> -->
<!-- 	</div> -->


</body>

</html>
 <!-- footer import -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %> 
   <!-- end of footer import -->
