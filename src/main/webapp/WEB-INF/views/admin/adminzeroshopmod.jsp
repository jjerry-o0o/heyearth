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
<script src="/js/admin/adminzeroshopmod.js"></script>

</head>
<body>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1 class='adminmain'>'지구를 돕는 가게 찾기' 수정하기</h1><br>
<form action='adminzeroshopmodinfo' method='post' enctype="multipart/form-data">
<input name="s_code" type="hidden" value=${zeroshopinfo.s_code}>
<div class='admincontext'>
	<table class='adminmodinserttable'>
		<tr><td>이름</td><td><input id="s_name" name="s_name" class="admintd" type="text" value="${zeroshopinfo.s_name}" required></td></tr>
		<tr><td>웹사이트</td><td><input id="s_url" name="s_url" class="admintd" type="url" value="${zeroshopinfo.s_url}" required></td></tr>
		<tr><td>분류</td><td><input id="s_inform" name="s_inform" class="admintd" type="text" value="${zeroshopinfo.s_inform}" required></td></tr>
		<tr><td>위치</td><td><input id="s_location" class="admintd" type="text" value="${zeroshopinfo.s_location}" readonly><input id="s_locnotview" name="s_location" class="admintd" value="${zeroshopinfo.s_location}" type="text" required><input type="button" onClick="goPopup();" value="주소 검색하기"/></td></tr>
		<tr><td>전화번호</td><td><input id="s_call" name="s_call" class="admintd" type="text" pattern="[0-9]{2,4}-[0-9]{3,4}-[0-9]{4}" maxlength="14" value="${zeroshopinfo.s_call}"></td></tr>
		<tr><td>휴무일</td><td><input id="s_close" name="s_close" class="admintd" type="text" value="${zeroshopinfo.s_close}"></td></tr>
		<tr><td>영업시간</td><td><input id="s_hour" name="s_hour" class="admintd" type="text" value="${zeroshopinfo.s_hour}"></td></tr>
		<tr><td>사진</td>
		<td>
		<img id="previewimg" src="img/${zeroshopinfo.s_photo}" onerror="this.src='/img/noimage.jpg'">
		<input name="s_photo" type="hidden" value=${zeroshopinfo.s_photo }>
		<input name="image" id="input-image" class="admintd" type="file" accept="image/*"></td></tr>
	</table>
</div>
<div class='adminbtn'>
<input class="adminback" id="zeroshopback" type="button" value="취소">
<input class="adminend" id="zeroshopend" type="submit" value="수정완료하기">
</div>
</form>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>