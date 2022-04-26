<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>탄소배출량 조회 | heyEarth</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- CSS -->
<link rel="stylesheet" href="/css/carbon/carbon.css" 자연 />
<link rel="stylesheet"
	href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> -->

<!-- js -->
<script type="text/javascript" src="/js/carbon/carbon.js"></script>
<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
<script src="jquery-3.6.0.min.js"></script>

<script>
	$(document).ready(
			function() {
				$("#go_btn").on("click", function() {
					location.href = "/mission";
				});

				$(function() {
					$(".fade-slide img:gt(0)").hide(); // 첫째 이미지외에 모두 가리고.
					setInterval(function() {
						$(".fade-slide :first-child").fadeOut(0).next("img")
								.fadeIn(1000).end().appendTo(".fade-slide");
					}, 3000);
				});
			});
</script>
<style>
section {
	color: #1A271D;
}

#info_div {
	width: 80%;
	margin: 20px auto;
	text-align: center;
	padding: 20px;
}

#data_div {
	width: 80%;
	margin: 20px auto;
	text-align: center;
	padding: 20px;
}

#btn_div {
	width: 80%;
	margin: 20px auto;
	text-align: center;
	padding: 20px;
}

.imgs {
	width: 100%;
	height: width*0.4;
	margin: auto;
	object-position: center;
}

.fade-slide {
	width: 100%;
	margin: auto;
	padding-top: 20px;
	padding-bottom: 20px;
	position: relative;
}

#other {
	
}

#infotitle {
	font-size: 2.5em;
}

#datatitle {
	font-size: 2.5em;
}

#infocontent {
	width: 90%;
	padding: 20px;
	margin: 20px auto;
	text-align: center;
	align-items: center;
}

#circle_div {
	margin: 0 auto;
	padding: 0 20px;
	display: flex;
	justify-content: center;
}

.circle {
	border: 2px dotted #1A271D;
	border-radius: 50%;
	margin: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	width: calc(12em/ 0.7);
	height: calc(8em/ 0.7);
}

.ourdata {
	text-align: center;
	vertical-align: middle;
	font-size: 50px;
	font-weight: bold;
}

#go_btn {
	border: 2px solid #1A271D;
	border-radius: 5px;
	padding: 15px 30px;
	margin: 10px auto;
	text-align: center;
	font-size: x-large;
	font-weight: 400;
	color: #1A271D
}

#go_btn:hover {
	background-color: #1A271D;
	color: white;
}

.data_info {
	text-align: center;
	padding-top: 20px;
	padding-bottom: 20px;
	margin: 10px auto;
	font-weight: bold;
	font-size: large;
}
</style>
</head>
<body>
	<!-- header import -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<!-- end of header import -->

	<section class="boardSection">
		<div class="fade-slide">
			<img class="imgs" src="./img/carbon001.jpg" alt="슬라이드 이미지" /> <img
				class="imgs" src="./img/carbon002.jpg" alt="슬라이드 이미지" /> <img
				class="imgs" src="./img/carbon003.jpg" alt="슬라이드 이미지" /> <img
				class="imgs" src="./img/carbon004.jpg" alt="슬라이드 이미지" /> <img
				class="imgs" src="./img/carbon005.jpg" alt="슬라이드 이미지" />
		</div>
		<div id="other">
			<div id="info_div">
				<h1 id="infotitle">탄소배출량이란 ?</h1>
				<hr>
				<p id="infocontent">
					탄소발자국이자 Carbon footprint로 불리며 개인 또는 단체가 직접 그리고 간접적으로 발생시키는 온실 기체의
					총량을 의미합니다.<br> 보통 일상생활에서 사용하는 연료, 전기, 용품 등 광범위하게 포함되죠.<br>
					대기로 방출된 이산화탄소 등 온실가스 물질이 지구의 기후변화에 미치는 영향을 알 수 있습니다.
				<p>
			</div>

			<div id="data_div">
				<h1 id="datatitle">헤이얼스 & 지구용사</h1>
				<hr>
			</div>
			<div id="circle_div">
				<div>
					<div class="circle">
						<p class="ourdata">${sum }</p>
						<br> / kg
					</div>
					<div>
						<p class="data_info">
							지구용사들이 모여<br>감소시킨 탄소배출량
						</p>
					</div>
				</div>
				<div>
					<div class="circle">
						<p class="ourdata">${totalPart }</p>
						<br> / 명
					</div>
					<div>
						<p class="data_info">
							헤이얼스와<br>함께한 지구용사들
						</p>
					</div>
				</div>
				<div>
					<div class="circle">
						<p class="ourdata">${everPart }</p>
						<br> / 회
					</div>
					<div>
						<p class="data_info">
							지구용사 1명의<br> 미션 실천 횟수 평균치
						</p>
					</div>
				</div>
			</div>
			<div id="btn_div">
				<input type="button" value="탄소배출량 줄이러 가기" id="go_btn">
			</div>
		</div>

	</section>

	<!-- footer import -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<!-- end of footer import -->
</body>
</html>