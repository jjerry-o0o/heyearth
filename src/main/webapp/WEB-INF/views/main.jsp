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
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
<link rel="stylesheet"
	href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />


<meta name="viewport" content="width=device-width, initial-scale=1">
<script>
	$(document).ready(function() {
		$('.slider').slick({
			autoplay : true,
			autoplaySpeed : 3000,
			slidesToShow : 4,
			slidesToScroll : 1,
		});
		$('.slider').slick('setPosition');

		const swiper = new Swiper('.swiper', {
			autoplay : {
				delay : 2000,
			},
			loop : true,
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			},
			pagination : {
				el : '.swiper-pagination',
				type : 'bullets',
				clickable : true,
			},
			slidesPerView : 4,
			slidesPerGroup : 1,
		});
	});
</script>

</head>
<body>
<!-- Talk Talk Banner Script start -->
	<script type="text/javascript" src="https://partner.talk.naver.com/banners/script"></script>
	<div class="talk_banner_div" data-id="114553" style="position: fixed; right: 100px; bottom: 30px; z-index: 99;"></div>
<!-- Talk Talk Banner Script end -->

	<!-- 메인1 탄소 -->
	<div class="m-carbon-wrapper">
		<div class="m-carbon-title">
			<div class="child">탄소발자국을 아세요?</div>
		</div>

		<div class="m-carbon-text">
			<div class="child">
				헤이얼스와 함께하는 와썹러들이 환경보호 활동을 통해 함께 실천해나가는 탄소배출 줄이기.<br>
				<br>함께 확인해보실래요?
			</div>
		</div>


		<div id="data_div"></div>
		<div id="circle_div">
			<div>
				<div>
					<p class="data_info">
						감소시킨 탄소량
					</p>
				</div>
				<div class="circle">
					<p class="ourdata">${sum }</p>
					<br> / kg
				</div>
			</div>
			<div>
				<div>
					<p class="data_info">
						총 미션참여 횟수
					</p>
				</div>
				<div class="circle">
					<p class="ourdata">${totalPart  }</p>
					<br> / 회
				</div>

			</div>
			<div>
				<div>
					<p class="data_info">
						1인당 평균 미션 참여횟수
					</p>
				</div>
				<div class="circle">
					<p class="ourdata">${everPart}</p>
					<br> / 회
				</div>

			</div>
			
		</div>
	

	<button type="button" class="together"
		onclick="location.href='/carbon'">TOGETHER</button>
	<div class="m-img1">
		<img id="m-image" src="img/main-carbon.gif"
			style="width: 100%; height: 20%;">
	</div>
</div>



	<!-- 메인2 제휴사 연결 -->

	<div class="affiliates">

		<div id="aff-text">
			<h2>헤이얼스와 함께하는 제로웨이스트샵을 소개합니다.</h2>
		</div>
		<div id="aff-imges">
		<a href="https://thepicker.net/"><img src="img/main-aff1.png" id="main-aff" ></a>
		<a href="https://jigubyulstore.com/"><img src="img/main-aff8.png" id="main-aff" style="width: %; height: %;"></a>
		<a href="https://www.thanksto.co.kr/"><img src="img/main-aff4.png" id="main-aff" style="width: 20%; height: 20%;"></a>
		<a href="https://www.instagram.com/dam_a_store/"><img src="img/main-aff6.png" id="main-aff" style="width: 15%; height: 15%;"></a>
		<!-- <a href="https://www.instagram.com/b.green_official/"><img src="img/main-aff5.png" id="main-aff" style="width: %; height: %;"></a> -->
		<a href="https://zerothings.co.kr/"><img src="img/main-aff7.png" id="main-aff" style="width: 20%; height: 20%;"></a>
		<a href="https://almang.modoo.at/"><img src="img/main-aff2.png" id="main-aff" style="width: 10%; height: 10%;" ></a>
		<a href="https://www.jigushop.co.kr/"><img src="img/main-aff3.png" id="main-aff" style="width: 15%; height: 20%;"></a>
		<a href="https://www.atomos-store.kr/"><img src="img/main-aff9.png" id="main-aff" style="width: 20%; height: 20%;"></a>
		<a href="https://brunch.co.kr/magazine/organicpunk"><img src="img/main-aff10.png" id="main-aff" style="width: 10%; height: 10%;"></a>
		<a href="https://donggubat.com/"><img src="img/main-aff11.png" id="main-aff" style="width: 15%; height: 15%;"></a>
		</div>


	</div>


	<!-- 메인3 About 연결 -->
	


	<div class="m-about" style="background: #F3EADF;">
		<img src="img/main2.png" id="main-logo"
			style="width: 15%; height: 15%; ">
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

	<!-- 메인4 제로샵 연결 -->


	<div class="m-zeroshop">
		<div class="m-zeroshop-title">
			<h1>지구를 돕는 가게 찾기</h1>
		</div>
		<div class="m-zeroshop-text">
			<p>가장 인기 많은 제로웨이스트샵 살짝 맛보기!</p>
		</div>
		<div class="swiper">
			<div class="swiper-wrapper">
				<c:forEach items="${zeroshoplist}" var="row">
					<div class="swiper-slide" id="m-zeroshop-db">
						<div id="m-zeroshop-each">
							<div id="m-zeroshop-img">
								<a href="${row.s_url }" target='_blank'> <img width=270px
									height=270px
									src="<%=request.getContextPath()%>/img/${row.s_photo}">
								</a>
							</div>
							<div id="m-zeroshop-text">
								<div class="list">
									<h3 class="listcontent">${row.s_name }</h3>
									<p class="listcontent">
										${row.s_location }<br>☎ ${row.s_call }
									</p>

								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>


	<!-- 메인5 미션 연결 -->

	<hr>
	<div class="m-mission">
		<div class="m-mission-title">
			<h1>환경 지킴이 모집중</h1>
		</div>
		<div class="m-mission-text">
			<p>헤이얼스와 함께 해요! 내 손으로 지키는 우리의 지구</p>
		</div>
		<div class="swiper">
			<div class="swiper-wrapper">
				<c:forEach items="${gilist }" var="row">
					<div class="swiper-slide" id="m-zeroshop-db">
						<div id="m-mission-each">
							<div id="m-mission-img">
								<a href="mission_detail/${row.m_code}"> <img width=270px
									height=270px
									src="<%=request.getContextPath()%>/img/${row.m_photo}">
								</a>
							</div>
							<div id="m-mission-text">
								<div class="list">
									<h3 class="listcontent">${row.m_name }</h3>
									<p class="listcontent">
										함께 하길 기다리고 있어요!<br> <br> 장소 : ${row.m_location }<br>
										날짜 : ${row.m_date }
									</p>

								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<c:forEach items="${silist }" var="row">
					<div class="swiper-slide" id="m-zeroshop-db">
						<div id="m-mission-each">
							<div id="m-mission-img">
								<a href="mission_detail/${row.m_code}"><img width=270px
									height=270px
									src="<%=request.getContextPath()%>/img/${row.m_photo}"></a>
							</div>
							<div id="m-mission-text">
								<div class="list">
									<h3 class="listcontent">${row.m_name }</h3>
									<p class="listcontent">
										지금 당장 미션을 수행해보세요!<br> <br> 포인트 : ${row.m_point }<br>
										탄소배출감소량 : ${row.m_carbon }
									</p>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>

</html>
<!-- footer import -->
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<!-- end of footer import -->



