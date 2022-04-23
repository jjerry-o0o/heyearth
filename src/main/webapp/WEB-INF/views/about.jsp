<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/about.css" rel="stylesheet">
<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

<script src="js/about.js"></script>

<script src="/jquery-3.6.0.min.js"></script>
<title>About | HeyEarth</title>

<script>
	$(document).ready(function() {
		const swiper = new Swiper( '.swiper', {
			autoplay: {
			      delay: 1000,
			    },
		    loop: true,
		    navigation: {
		      nextEl: '.swiper-button-next',
		      prevEl: '.swiper-button-prev',
		    },
		    pagination: {
		      el: '.swiper-pagination',
		      type: 'bullets',
		      clickable: true,
		    },
		    slidesPerView: 3,
		    slidesPerGroup : 1,
		  } );
	});
</script>

<!-- header import -->
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!-- end of header import -->


</head>
<body>

	<div class="a-m-section">
		<!-- 환경이야기 -->
		<div class="a-m-content">
			<div class="a-img1">
				<img class="a-i1" src="img/about1.png" />
			</div>
		</div>
		<div class="a-text">
			<div class="a-m-text1">
				<h2 class="a-envir-title">내일을 위한 오늘의 준비</h2>
				<p class="a-envir-text">멸종위기에 처한 바다거북의 코에 빨대가 꽂혀있거나, 해양생물의 뱃속에서
					플라스틱 생수병이 발견되는 모습은 우리나라를 포함한 전세계의 바다가 해양쓰레기로 심각하게 오염되었고, 해양생물의 목숨을
					위협하고 있음을 말해줍니다. 해양쓰레기 뿐만 아니라, 섬유에서 나오는 미세플라스틱, 무심코 일회용품이 자연과 생물을
					위협하는 상황에서 인류는 안전할 수 있을까요? 우리가 사용하고 버린 쓰레기는 땅과 바다, 공기, 다양한 생물체들의 몸을
					통해 부메랑처럼 다시 인간에게 돌아오고 있습니다. 이는 우리와 더불어 살아가는 모든 것들을 위협합니다.</p>
			</div>
		</div>
	</div>



	<!-- 헤이얼스란  -->
	<div class="a-brand">
		<div class="a-brand-title">
			<h1>헤이얼스란?</h1>
		</div>
		<p id="a-b">
			<strong>헤이얼스는 환경보호를 위한 제로웨이스트 라이프스타일 플랫폼입니다.<br></strong>
		</p>
		<p id="a-b">
			바쁘게 살아가는 일상 속, 자신도 모르게 환경을 파괴하며 살아가고 있지는 않나요?<br> 이를 위해 환경보호에
			관심이 많은 사람들을 서로 연결하여<br> 다양한 활동을 실시하고 정확한 정보를 제공하려 합니다. <br>
		</p>
		<button type="button" id="more" onclick="location.href='/about'">MORE</button>
	</div>





	<!-- 헤이얼스 서비스 소개  -->

	<div class="service-sec" id="ourservices">
		<div class="a-tit">
			<h1>헤이얼스 알아가기</h1>
		</div>

		<div class="all-divider">
			<div class="divider">
				<div class="ser-img">
					<img src="img/about-s1.png" style="width: 40%;"></img>
				</div>
				<div class="a-s-t">
					<button type="button" id="a-s-t"
						onclick="location.href='/zeroshop'">
						<strong>제로웨이스트샵 정보</strong>
					</button>

				</div>
				<div id="ser-text">
					<p>
						내가 지정한 위치를 기반으로 <br>가까운 제로웨이스트샵을 안내해줍니다.
					</p>
				</div>
			</div>


			<div class="divider">
				<div class="ser-img">
					<img src="img/about-s2.png" style="width: 40%;"></img>
				</div>
				<div class="a-s-t">
					<button type="button" id="a-s-t" onclick="location.href='/mission'">
						<strong>환경보호 프로그램</strong>
					</button>

				</div>
				<div id="ser-text">
					<p>
						환경보호를 할 수 있는<br>프로그램이 준비되어 있습니다.
					</p>
				</div>
			</div>

			<div class="divider">
				<div class="ser-img">
					<img src="img/about-s3.png" style="width: 40%;"></img>
				</div>
				<div class="a-s-t">
					<button type="button" id="a-s-t"
						onclick="location.href='/recycling'">
						<strong>분리배출 가이드</strong>
					</button>

				</div>
				<div id="ser-text">
					<p>
						다양한 방법으로 내가 버릴 물품의<br>분리배출 방법을 안내해드립니다.
					</p>
				</div>
			</div>

			<div class="divider">
				<div class="ser-img">
					<img src="img/about-s4.png" style="width: 40%;"></img>
				</div>
				<div class="a-s-t">
					<button type="button" id="a-s-t" onclick="location.href='/carbon'">
						<strong>함께 줄인 탄소배출량</strong>
					</button>
				</div>
				<div id="ser-text">
					<p>
						헤이얼스와 함께하는 분들이 줄인<br>탄소배출량을 나타냅니다.
					</p>
				</div>
			</div>
		</div>
	</div>

	<div class="teamintro">
		<div class="teamintro" id="intro-text">
			<h1 id="team-tit">헤이얼스 팀</h1>
			<h3 id="team-text">헤이얼스를 이끌어가는 용사들을 소개합니다.</h3>
		</div>
		<div class="swiper">
			<div class="swiper-wrapper">
				<div class="swiper-slide" id="member">
					<img id="mem" src="img/about-mi.png" alt="" />
					<div class="team-text">
						<h2 id="name">신미래</h2>
						<p>
							Team Leader <br><br> 지구용사 5인조의 팀 리더.<br>무슨 역할을 했다고 쓸까요 야호
						</p>
					</div>
				</div>
				<div class="swiper-slide" id="member">
					<img id="mem2" src="img/about-min.png" alt="" />
					<div class="team-text">
						<h2 id="name">이민아</h2>
						<p>
							A Reliable Helper <br>
							<br>지구용사 5인조의 든든한 조력자.<br>무슨 역할을 했다고 쓸까요 야호
						</p>
					</div>
				</div>
				<div class="swiper-slide" id="member">
					<img id="mem" src="img/about-so.png" alt="">
					<div class="team-text">
						<h2 id="name">문소영</h2>
						<p>
							Role Manager<br>
							<br> 지구용사 5인조의 든든한 조력자.<br>무슨 역할을 했다고 쓸까요 야호
						</p>
					</div>
				</div>
				<div class="swiper-slide" id="member">
					<img id="mem" src="img/about-yi.png" alt="">
					<div class="team-text">
						<h2 id="name">윤이나</h2>
						<p>
							Time Manager<br>
							<br> 지구용사 5인조의 든든한 조력자.<br>무슨 역할을 했다고 쓸까요 야호
						</p>
					</div>
				</div>
				<div class="swiper-slide" id="member">
					<img id="mem" src="img/about-hee.png" alt="">
					<div class="team-text">
						<h2 id="name">박희영</h2>
						<p>
							Passion Manager<br>
							<br> 지구용사 5인조의 든든한 조력자.<br>무슨 역할을 했다고 쓸까요 야호
						</p>
					</div>
				</div>
			</div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
			<div class="swiper-pagination"></div>
		</div>
	</div>
	
</body>
<script>
	$(document).ready(function() {
		$('#more').click(function() {
			var offset = $('#ourservices').offset(); //선택한 태그의 위치를 반환
			//animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 
			$('html').animate({
				scrollTop : offset.top
			}, 400);
		});
	});
</script>


<!-- footer import -->
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<!-- end of footer import -->
</html>

