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
<script src="/js/admin/adminmissioninsert.js"></script>

</head>
<body>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1 class='adminmain'>'환경 지킴이 모집중' 등록하기</h1><br>
<form action='adminmissioninsertinfo' method='post' enctype="multipart/form-data">
<div class='admincontext'>
	<table class='adminmodinserttable'>
		<tr><td>타입</td><td><input id="m_type1" name="m_type" type="radio" value="group" checked="checked" onclick="nameclick('none')">단체 <input id="m_type2" name="m_type" type="radio" value="solo" onclick="nameclick('none')">상시</td></tr>
		<tr><td>이름</td><td id="name"><select class="admintd" id="m_name" name="m_name" required>
		<option value="none" selected></option>
		</select><input class="admintd" type="text" id="selboxDirect" name="selboxDirect" required></td></tr>
		<tr><td>위치</td><td id="location"><input id="m_location" name="m_location" class="admintd" type="text" required></td></tr>
		<tr><td>날짜</td><td id="date"><input id="m_date" name="m_date" class="admintd" type="date" required></td></tr>
		<tr><td>간단한 소개</td><td><input id="m_inform" name="m_inform" class="admintd" type="textarea" maxlength=300 required></td></tr>
		<tr><td>감소시킨 탄소배출량</td><td><input id="m_carbon" name="m_carbon" class="admintd" type="number" min="0" required></td></tr>
		<tr><td>포인트</td><td><input id="m_point" name="m_point" class="admintd" type="number" min="0" required></td></tr>
		<tr><td>미션인원</td><td id="personnel"><input id="m_personnel" name="m_personnel" class="admintd" min="1" type="number" required></td></tr>
		<tr><td>사진</td>
		<td>
		<img id="previewimg">
		<input type="hidden" name="m_photo" id="m_photo">
		<input name="image" id="input-image" class="admintd" type="file" accept="image/*" required></td></tr>
	</table>
</div>
<div class='adminbtn'>
<input class="adminback" id="missionback" type="button" value="취소">
<input class="adminend" id="missionend" type="submit" value="등록하기">
</div>
</form>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>