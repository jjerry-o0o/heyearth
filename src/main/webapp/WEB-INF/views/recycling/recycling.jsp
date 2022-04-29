<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hey,earth</title>
<!-- 웹 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap"
	rel="stylesheet">

<link href="css/recycling/recycling.css" rel="stylesheet">
<script src="jquery-3.6.0.min.js"></script>
<script src="/js/recycling/recycling.js"></script>

</head>
<body>
<!-- Talk Talk Banner Script start -->
	<script type="text/javascript" src="https://partner.talk.naver.com/banners/script"></script>
	<div class="talk_banner_div" data-id="114553" style="position: fixed; right: 100px; bottom: 30px; z-index: 99;"></div>
<!-- Talk Talk Banner Script end -->

	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	
	<div class=intro-text style="height : 70%;">
<!-- 		<img id =img1" src="img/recyle-1.png"> -->
		<h1>Welcome Guide!</h1>
		<br>
		<p>헤이얼스에서는 분리배출 가이드를 2가지 방법으로 제공합니다.
		<br>원하는 물품의 <strong><span style="color : 	#FF8C00;">사진을 업로드</span></strong> 해보세요. 
		<br>그리고 원하는
			물품의 <strong><span style="color : 	#FF8C00;">카테고리를 선택</span></strong>해서 상세 분리배출 가이드를 살펴볼 수 있습니다. 
			<br>손쉽게 분리배출 할 수 있도록 헤이얼스가 도와줄게요!<br><br>
		</p>
	</div>
	
	<div id=recyclingbtn>
		<input id="search1" type="button" value="사진으로 검색" onclick="search(1)"
			checked="checked"> <input id="search2" type="button"
			value="키워드로 검색" onclick="search(2)">
	</div>

	<div id=recyclingFile>
		<div class="filebox">
			<!-- <form id="form" action="extractLabels" method="post" enctype="multipart/form-data"> -->
			<div>
				<img id=preview1 width=300 height=300 />
			</div>
			<div>
				<label id=filelabel for="file">이건 어떻게 버릴까?<br>사진 첨부하기
				</label> <input type="file" id="file" name=uploadFile><br>
			</div>
			<input id="waycheck" type=button value="방법 확인하기">
			<div id=way>
				<div id=waynoti></div>
				<div id=wayradio></div>
				<br><br>
				<p id=wayp></p>
			</div>

		</div>

		<div class="content"></div>
	</div>

	<div id=recyclingKeyword style="display: none;">
		<div id="keywords">
			<input type="button" value="종이류" onclick=r_class(1)>
			<input type="button" value="유리병" onclick=r_class(2)>
			<input type="button" value="금속캔" onclick=r_class(3)>
			<input type="button" value="플라스틱류" onclick=r_class(4)>
			<input type="button" value="비닐류" onclick=r_class(5)>
			<input type="button" value="스티로품류" onclick=r_class(6)><br>
			<input type="button" value="의류 및 원단류" onclick=r_class(7)>
			<input type="button" value="전지류" onclick=r_class(8)>
			<input type="button" value="형광등" onclick=r_class(9)>
			<input type="button" value="고철류" onclick=r_class(10)>
			<input type="button" value="기타" onclick=r_class(11)>
		</div>
		<div id=previewbox></div>

		<div id="modal" class="modal-overlay" id="modal">
			<div class="modal-window">
				<div class="close-area" id="modalclose">X</div>
				<div class="modalupper" id="modalupper"></div>
				<div class="modaltitle">
				
			<!-- 로그인시 스크랩 하기 -->					
				<c:if test="${sessionScope.session_id != null }">									
					<form name="form" method="post" class="insert"
						action="${pageContext.request.contextPath}/guide_insert">
						<input type="hidden" id="r_code" name="r_code"> 
						<input class="scrap" type='submit' value='★'>
					</form>
			    </c:if>
						
					<h2 class="modalh2" id="modalh2"></h2>
				</div>
				<div class="modalcontent" id="modalcontent"></div>
				<div id="modalbtn"></div>
			</div>
		</div>

	</div>
	
	<div class="rec-img">
	<div id="img">
	<img src="img/main1.png" style="width : 100%; height : 50%;"/>
	</div>
	<div id="img">
	<img src="img/main1.png" style="width : 100%; height : 50%;"/>
	</div>

	
	</div>


	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>

