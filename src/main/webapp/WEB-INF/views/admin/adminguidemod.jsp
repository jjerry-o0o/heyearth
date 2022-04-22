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
<script src="/js/admin/adminguidemod.js"></script>

</head>
<body>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1 class='adminmain'>'이건 어떻게 버릴까?' 수정하기</h1><br>
<form action='adminguidemodinfo' method='post' enctype="multipart/form-data">
<input name="r_code" type="hidden" value=${guideinfo.r_code}>
<div class='admincontext'>
	<table class='adminmodinserttable'>
		<tr><td>분류</td><td id="class">
		<select class="admintd" id="r_class" name="r_class" required>
		<option value="${guideinfo.r_class}" selected></option>
		</select>
		<input class="admintd" type="text" id="selboxDirect" name="selboxDirect" required></td></tr>
		<tr><td>재활용품이름</td><td><input id="r_name" name="r_name" class="admintd" type="text" value="${guideinfo.r_name}" required></td></tr>
		<tr><td>분리배출방법</td><td><input id="r_way" name="r_way" class="admintd" type="textarea" value="${guideinfo.r_way}" required></td></tr>
		<tr><td>사진</td>
		<td>
		<img id="previewimg" src="img/${guideinfo.r_photo}" onerror="this.src='/img/noimage.jpg'">
		<input name="r_photo" type="hidden" value=${guideinfo.r_photo }>
		<input name="image" id="input-image" class="admintd" type="file" accept="image/*"></td></tr>
	</table>
</div>
<div class='adminbtn'>
<input class="adminback" id="guideback" type="button" value="취소">
<input class="adminend" id="guideend" type="submit" value="수정완료하기">
</div>
</form>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>