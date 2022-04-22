<%@page import="zeroshop.ZeroshopDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/adminheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hey,Earth | Admin Page</title>
<link href="css/admin/adminmodinsert.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
<script src="jquery-3.6.0.min.js"></script>
<script src="/js/admin/adminguideinsert.js"></script>

</head>
<body>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1 class='adminmain'>'이건 어떻게 버릴까?' 등록하기</h1><br>
<form action='adminguideinsertinfo' method='post' enctype="multipart/form-data">
<div class='admincontext'>
	<table class='adminmodinserttable'>
		<tr><td>분류</td><td id="class">
		<select class="admintd" id="r_class" name="r_class" required></select>
		<input class="admintd" type="text" id="selboxDirect" name="selboxDirect" required></td></tr>
		<tr><td>재활용품이름</td><td><input id="r_name" name="r_name" class="admintd" type="text" required></td></tr>
		<tr><td>분리배출방법</td><td><input id="r_way" name="r_way" class="admintd" type="textarea" required></td></tr>
		<tr><td>사진</td>
		<td>
		<img id="previewimg">
		<input name="image" id="input-image" class="admintd" type="file" accept="image/*" required></td></tr>
	</table>
</div>
<div class='adminbtn'>
<input class="adminback" id="guideback" type="button" value="취소">
<input class="adminend" id="guideend" type="submit" value="등록하기">
</div>
</form>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>