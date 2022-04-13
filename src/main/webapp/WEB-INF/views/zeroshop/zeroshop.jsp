<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/zeroshop/zeroshop.css" rel="stylesheet">
<script src="jquery-3.6.0.min.js"></script>
<script src="/js/zeroshop/zeroshop.js"></script>
</head>
<body>
<div class="zero_search">
		<input type="button" id="search1" name="findid" value = "지역으로 검색"onclick="search(1)" checked="checked">
		 | 
		<input type="button" id="search2" name="findid" value = "내 주변에서 검색" onclick="search(2)">
</div>
<br>
<br>
<div class="zero_body">
	<div id="searchLoc">
		<div id="Loc_menu">
			<label for="location" class="menu">지역 선택</label>
			<select name="bigloc" id="bigloc">
				<option value="none" selected disabled hidden>광역시/도</option>
			</select>
			<select name="smallloc" id="smallloc">
				<option value="none" selected disabled hidden>시/군/구</option>
			</select>
			<input type="button" value="검색" id="locbtn">
		</div>
	</div>
	
	<div id="searchMy" style="display:none;">
	</div>
</div>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>