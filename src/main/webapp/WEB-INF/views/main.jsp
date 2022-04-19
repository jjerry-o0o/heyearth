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
<!-- <link href="main.css" rel="stylesheet"> -->
<script src="/jquery-3.6.0.min.js"></script>
<!-- <script src="js/main.js"></script> -->

<meta name="viewport" content="width=device-width, initial-scale=1">
<style>

/* body {
	font-family: Verdana, sans-serif;
	margin: 0
}
 */
.mySlides {
	display: none
}

img {
	vertical-align: middle;
}

/* Slideshow container */
.slideshow-container {
	max-width: 1000px;
	position: relative;
	margin: auto;
}

/*main-about*/
.m-about{
width : 100%;
text-align: center;
margin :0px about;
 font-family: '양진체';
}

#m-a-t-b{
color : green;
 font-family: '양진체';
}

@font-face {
    font-family: '양진체';
    src: url('https://cdn.jsdelivr.net/gh/supernovice-lab/font@0.9/yangjin.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

.mySlides fade {
	position: relative;
}
/* Next & previous buttons */
.prev, .next {
	cursor: pointer;
	position: absolute;
	top: 50%;
	width: auto;
	padding: 16px;
	margin-top: -22px;
	color: white;
	font-weight: bold;
	font-size: 18px;
	transition: 0.6s ease;
	border-radius: 0 3px 3px 0;
	user-select: none;
}

/* Position the "next button" to the right */
.next {
	right: 0;
	border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
	background-color: rgba(0, 0, 0, 0.8);
}

/* Caption text */
.slide-text {
	color: #f2f2f2;
	font-size: 40px;
	padding: 200px;
	position: absolute;
	bottom: 8px;
	width: 100%;
	text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
	color: #f2f2f2;
	font-size: 12px;
	padding: 8px 12px;
	position: absolute;
	top: 0;
}

/* The dots/bullets/indicators */
.dot {
	cursor: pointer;
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}

.active, .dot:hover {
	background-color: #717171;
}

/* Fading animation */
.fade {
	animation-name: fade;
	animation-duration: 1.5s;
}

@keyframes fade {
	from {opacity: 0.4;
}

to {
	opacity: 1
}

}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
	.prev, .next, .text {
		font-size: 11px
	}
}
</style>
</head>
<body>
	<!-- header import -->
	<!-- end of header import -->

	<div class="slideshow-container">

		<div class="mySlides fade">
			<img src="img/main-polarbear.jpg" style="width: 100%">
			<div class="slide-text">
<!-- 				<p>Let's Together</p> -->
<!-- 				헤이얼스와 줄인 탄소배출량 -->
<!-- 				<p>The amount of carbon emissions we've reduced</p> -->
				<button type="button" onclick="location.href='/carbon'">자세히보기</button>

			</div>
		</div>

		<div class="mySlides fade">
			<img src="img/main-forest.jpg" style="width: 100%">
			<div class="slide-text">
				<p>헤이얼스가 줄인 탄소배출량</p>
			</div>
		</div>

		<a class="prev" onclick="plusSlides(-1)">❮</a> 
		<a class="next" onclick="plusSlides(1)">❯</a>
			

	</div>
	<br>

	<div style="text-align: center">
		<span class="dot" onclick="currentSlide(1)"></span> <span class="dot"
			onclick="currentSlide(2)"></span>

	</div>

	<div class="m-about">
		<img src="img/main-about.png" style="width: 30%">
		<div class="m-about-text">
			<p id="m-a-t-b"><strong>헤이얼스는 환경보호를 위한 제로웨이스트 라이프스타일 플랫폼입니다.</strong></p>
				<p>바쁘게 살아가는 일상 속, 자신도 모르게 환경을 파괴하며 살아가고 있지는 않나요? <br> 시장의 과도한
				편의주의와 미숙한 분리배출 방식으로부터 오염과 파괴를 방지하기 위한 역할을 합니다.<br> 이를 위해 환경보호에
				관심이 많은 사람들을 서로 연결하여 다양한 활동을 실시하고 정확한 정보를 제공하려 합니다. <br>
			</p>
			<button type="button" onclick="location.href='/about'">About→</button>

		</div>
	</div>

	<script>
		let slideIndex = 1;
		showSlides(slideIndex);

		function plusSlides(n) {
			showSlides(slideIndex += n);
		}

		function currentSlide(n) {
			showSlides(slideIndex = n);
		}

		function showSlides(n) {
			let i;
			let slides = document.getElementsByClassName("mySlides");
			let dots = document.getElementsByClassName("dot");
			if (n > slides.length) {
				slideIndex = 1
			}
			if (n < 1) {
				slideIndex = slides.length
			}
			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(" active", "");
			}
			slides[slideIndex - 1].style.display = "block";
			dots[slideIndex - 1].className += " active";
		}
	</script>

</body>

</html>
 <!-- footer import -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %> 
   <!-- end of footer import -->
