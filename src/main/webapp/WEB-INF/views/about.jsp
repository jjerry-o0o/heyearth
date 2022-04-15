<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/about.css" rel="stylesheet">
<script src="/jquery-3.6.0.min.js"></script>
<script src="/js/about.js"></script>
<title>About | HeyEarth</title>

<!-- header import -->
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!-- end of header import -->


</head>
<body>

	<div class="about-main-section">

		<!-- 환경이야기 -->
		<div class=about-main-content>
			<img class="about-image-1" src="img/about-nat.png"/>
		</div>
		<div class="about-main">
			<h2 class="a-envir-title">나와 더불어 살아가는 모든 것들을 위해</h2>
			<p class="a-envir-text">멸종위기에 처한 바다거북의 코에 빨대가 꽂혀있거나, 해양생물의 뱃속에서
				플라스틱 생수병이 발견되는 모습은 우리나라를 포함한 전세계의 바다가 해양쓰레기로 심각하게 오염되었고, 해양생물의 목숨을
				위협하고 있음을 말해줍니다. 해양쓰레기 뿐만 아니라, 섬유에서 나오는 미세플라스틱, 무심코 일회용품이 자연과 생물을
				위협하는 상황에서 인류는 안전할 수 있을까요? 우리가 사용하고 버린 쓰레기는 땅과 바다, 공기, 다양한 생물체들의 몸을
				통해 부메랑처럼 다시 인간에게 돌아오고 있습니다. 이는 우리와 더불어 살아가는 모든 것들을 위협합니다.</p>
		</div>



		<!-- 브랜드 이야기 -->
		<div class=about-main-content>
			<img class="about-image-1" src="img/about-logo.png"/>
		</div>
		<div class="about-main">
			<h2 class="a-envir-title">건강한 자원의 순환과 지속가능한 환경문화 회복</h2>
			<p class="a-envir-text">헤이얼스는 환경보호를 위한 제로웨이스트 라이프스타일 플랫폼입니다. 자신도
				모르게 환경을 파괴하며 살아가는 우리들. 시장의 과도한 편의주의와 미숙한 분리배출 방식으로부터 오염과 파괴를 방지하기 위한
				역할을 합니다. 이를 위해 환경보호에 관심이 많은 사람들을 서로 연결하여 다양한 활동을 실시하고 정확한 정보를 제공하려
				합니다.</p>
		</div>

	</div>



	<!-- 헤이얼스 서비스 소개  -->
	<section class="page-section" id="ourservices">
		<div class="a-container">
			<h2 class="a-text-center">헤이얼스 알아가기</h2>
			<hr class="a-divider">
			<div class="a-service-div">
				<div class="col-lg-3 col-md-6 text-center">
					<div class="mt-5">
						<div class="mb-2">
							<img class="a-s-ic" src="img/about-ic1.png"></img>
						</div>
						<h3 class="col-title">제로웨이스트 샵 위치 정보</h3>
						<p class="text-muted mb-0">
							내가 지정한 위치를 기반으로 <br>가까운 제로웨이스트샵을 안내해줍니다.
						</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 text-center">
					<div class="mt-5">
						<div class="mb-2">
							<img class="a-s-ic" src="img/about-ic2.png"></img>
						</div>
						<h3 class="col-title">환경보호 프로그램</h3>
						<p class="text-muted mb-0">
							환경보호를 할 수 있는 <br>프로그램이 준비되어 있습니다.
						</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 text-center">
					<div class="mt-5">
						<div class="mb-2">
							<img class="a-s-ic" src="img/about-ic3.png"></img>
						</div>
						<h3 class="col-title">분리배출 가이드</h3>
						<p class="text-muted mb-0">
							다양한 방법으로 내가 버릴 물품의 <br>분리배출 방법을 안내해드립니다.
						</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 text-center">
					<div class="mt-5">
						<div class="mb-2">
							<img class="a-s-ic" src="img/about-ic4.png"></img>
						</div>
						<h3 class="col-title">함께 줄인 탄소배출량</h3>
						<p class="text-muted mb-0">
							헤이얼스와 함께 하는 와썹러들이 <br>줄인 탄소배출량을 나타냅니다.
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>

<!-- footer import -->
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<!-- end of footer import -->
</html>

