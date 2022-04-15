<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hey,earth</title>
<link href="css/recycling/recycling.css" rel="stylesheet">
<script src="jquery-3.6.0.min.js"></script>
<script src="/js/recycling/recycling.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div id=recyclingbtn>
		<input id="search1" type="button" value="사진으로 검색" onclick="search(1)" checked="checked">
		<input id="search2" type="button" value="키워드로 검색" onclick="search(2)">
	</div>

	<div id=recyclingFile>
		<div class="filebox">
			<form action="recycling" method="post" enctype="multipart/form-data">
				<label id=filelabel for="file">이건 어떻게 버릴까?<br>사진 첨부하기</label>
				<input type="file" id="file" name=uploadFile onchange="preview(event);"><br>
				<div id=preview>
					<img src="c:\upload\cat1_0f9bedea.jpg" alt="preview" />
				</div>
				<input type=submit id="submit" value="방법 확인하기" >
			</form>
			

			
			
		</div>
		<div class="content">
			예시) 골판지 외 종이류<br>
			신문지<br>
			- 물기에 젖지 않도록 하고 반듯하게 펴서 차곡차곡 쌓은 후 묶어서 배출<br>
			- 비닐코팅된 광고지, 비닐류, 기타 오물이 섞이지 않도록 함
			
		</div>
	</div>
	
	<div id=recyclingKeyword style="display:none;">
		<div id="keywords">
			<input type="button" value="종이류">
			<input type="button" value="유리병">
			<input type="button" value="금속캔">
			<input type="button" value="플라스틱류">
			<input type="button" value="비닐류">
			<input type="button" value="스티로품류"><br>
			<input type="button" value="의류 및 원단류">
			<input type="button" value="전지류">
			<input type="button" value="형광등">
			<input type="button" value="고철류">
			<input type="button" value="기타">
			
		</div>
	</div>
	
	
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>

