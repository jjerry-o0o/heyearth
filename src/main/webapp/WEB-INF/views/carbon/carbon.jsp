<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>탄소배출량 조회 | heyEarth</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- CSS -->
<link rel="stylesheet" href="/css/carbon/carbon.css"자연 />
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> -->

<!-- js -->
<script type="text/javascript" src="/js/carbon/carbon.js"></script>

<script src="jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function () {
		$("#go_btn").on("click", function(){
			location.href="/mission";
		});
	});
</script>
<style>
	#img_div{
		width : 500px;
		height : 350px;
		padding : 20px;
		margin : 20px auto;
	}
	#info_div{
		width : 80%;
		margin : 20px auto;
		text-align: center;
		padding : 20px;
	}
	#data_div{
		width : 80%;
		margin : 20px auto;
		text-align: center;
		padding : 20px;
	}
	#btn_div{
		width : 80%;
		margin : 20px auto;
		text-align: center;
		padding : 20px;
	}
	img{
		width : 100%;
		height : 100%;
	}
	#infotitle{
		font-size: 2.5em;
	}
	#datatitle{
		font-size: 2.5em;
	}
	#infocontent{
		width : 90%;
		padding : 20px;
		margin : 20 auto;
		text-align: center;
		align-items: center;
	}
	#circle_div{
		margin : 0 auto;
		padding : 0 20px;
		display : flex;
		justify-content: center;
	}
	.circle{
		border : 2px dotted black;
		border-radius: 50%;
		margin : 20px;
		display : flex;
		justify-content: center;
		align-items : center;
		width : calc(12em/0.7);
		height : calc(8em/0.7);
	}
	.ourdata{
		text-align: center;
		vertical-align : middle;
		font-size: 50px;
		font-weight: bold;
	}
	#go_btn{
		background-color: #FFDDD0;
		border: 2px solid pink;
		border-radius: 5px;
		padding : 15px 30px;
		margin : 10px auto;
		text-align: center;
		font-size: x-large;
		font-weight:400;
	}
	
	
</style>
</head>
<body>
	<!-- header import -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<!-- end of header import -->

<section class="boardSection">
	
	<div id="img_div">
		<img alt="탄소배출량 감소에 따른 자연의 변화 이미지1" src="https://thumb.zumst.com/530x0/https://static.news.zumst.com/images/56/2015/11/28/d30e328463af4e35943ca302e9af34d0.jpg">
		<!-- <img alt="탄소배출량 감소에 따른 자연의 변화 이미지2" src="https://thumb.zumst.com/530x0/https://static.news.zumst.com/images/4/2016/11/03/201611031120115857_t.jpg">
		<img alt="탄소배출량 감소에 따른 자연의 변화 이미지3" src="https://imgnn.seoul.co.kr/img/upload/2021/08/05/SSI_20210805152938.jpg">
		<img alt="탄소배출량 감소에 따른 자연의 변화 이미지4" src="https://img.freepik.com/free-photo/wild-polar-bear-ursus-maritimus-mother-and-cub-on-the-pack-ice_160321-5745.jpg?size=626&ext=jpg&ga=GA1.1.2112149269.1643241600">
		<img alt="탄소배출량 감소에 따른 자연의 변화 이미지5" src="https://cdn.famtimes.co.kr/news/photo/202101/502181_3290_5720.png"> -->
	</div>
	<div id="info_div">
		<h1 id="infotitle"> 탄소배출량이란 ? </h1>
		<hr>
		<p id="infocontent">탄소배출량에 대한 설명이 들어갈 공간 입니다.<p>
	</div>
	
	<div id="data_div">
		<h1 id="datatitle"> 헤이얼스 & 지구용사 </h1>
		<hr>
	</div>
	<div id="circle_div">
		<div class="circle">
			<p class="ourdata">100</p><br>
			/ kg
		</div>
		<div class="circle">
			<p class="ourdata">100</p><br>
			/ 회
		</div>
		<div class="circle">
			<p class="ourdata">100</p><br>
			/ 명
		</div>
	</div>
	<div id="btn_div">
		<input type="button" value="탄소배출량 줄이러 가기" id="go_btn">
	</div>
	
</section>

	<!-- footer import -->
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	<!-- end of footer import -->
</body>
</html>