<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Main | Hey, Earth</title>
<!-- header import -->
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!-- end of header import -->
<link href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet">
<script src="/jquery-3.6.0.min.js"></script>
<!-- <script src="js/main.js"></script> -->

<meta name="viewport" content="width=device-width, initial-scale=1">




</head>
<body>
	<div class="m-carbon">
		<div class="m-carbon-title">
			<h1>탄소발자국을 아세요?</h1>
		</div>
		<div class="m-carbon-text">
			<p>
				약 81명의 와썹러들이 환경보호 활동을 통해 함께 실천해나가는 탄소배출 줄이기.<br>함께 확인해보실래요?
			</p>
		</div>

		<div class="m-container">
			<div class="carbon-text">
				<p>
					<strong>줄인 탄소량</strong>
				</p>
				<span class="carbon"></span>
			</div>
			<div class="carbon-text">
				<p>
					<strong>횟수</strong>
				</p>
				<span class="carbon"></span>
			</div>
			<div class="carbon-text">
				<p>
					<strong>함께한 와썹러</strong>
				</p>
				<span class="carbon"></span>
			</div>
		</div>


	</div>

	<button type="button" id="together" onclick="location.href='/carbon'">TOGETHER</button>
	<div class="m-img1">
		<img src="img/main1.png">
	</div>

	<hr>

	<div class="m-about">
		<img src="img/main2.png" id="main-logo"
			style="width: 15%; height: 15%;">
		<div class="m-about-text">
			<p id="m-a-t-b">
				<strong>헤이얼스는 환경보호를 위한 제로웨이스트 라이프스타일 플랫폼입니다.</strong>
			</p>
			<p id="m-a-t-b">
				바쁘게 살아가는 일상 속, 자신도 모르게 환경을 파괴하며 살아가고 있지는 않나요?<br> 이를 위해 환경보호에
				관심이 많은 사람들을 서로 연결하여 다양한 활동을 실시하고 정확한 정보를 제공하려 합니다. <br>
			</p>
			<button type="button" id="about" onclick="location.href='/about'">ABOUT→</button>
		</div>
	</div>

	<hr>
	<div class="m-zeroshop">
		<div class="m-zeroshop-title">
			<h1>지구를 돕는 가게 찾기</h1>
		</div>
		<div class="m-zeroshop-text">
			<p>가장 인기 많은 제로웨이스트샵 살짝 맛보기!
			</p>
		</div>
		<div class="m-mission-db">
			데이터 영역
			</div>
		</div>
		
		<hr>
	<div class="m-mission">
		<div class="m-mission-title">
			<h1>환경 지킴이 모집중</h1>
		</div>
		<div class="m-mission-text">
			<p>헤이얼스와 함께 해요! 내 손으로 지키는 우리의 지구
			</p>
			</div>
			<div class="m-mission-db">
			데이터 영역
		</div>
		</div>
</body>

</html>
<!-- footer import -->
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<!-- end of footer import -->
