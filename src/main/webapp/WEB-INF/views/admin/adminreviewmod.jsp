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
<script src="/js/admin/adminreviewmod.js"></script>

</head>
<body>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1 class='adminmain'>'리뷰' 수정하기</h1><br>
<form action='adminreviewmodinfo' method='post' enctype="multipart/form-data">
<input id="p_code" name="p_code" type="hidden" value=${reviewinfo.p_code}>
<input id="m_code" name="m_code" type="hidden" value=${reviewinfo.m_code }>
<div class='admincontext'>
	<table class='adminmodinserttable'>
		<tr><td>이름</td><td>${reviewinfo.id }</td></tr>
		<tr><td>미션명</td><td>${reviewinfo.m_name }</td></tr>
		<tr><td>신고 횟수</td><td><input id="p_redcard" name="p_redcard" class="admintd" type="number" value="${reviewinfo.p_redcard }" min="0" max="5"></td></tr>
		<tr><td>별점</td><td><input id="star" name="star" class="admintd" type="number" value="${reviewinfo.p_star}" min="1" max="5"></td></tr>
		<tr><td>리뷰</td><td><textarea id="p_review" name="p_review" class="admintd">${reviewinfo.p_review}</textarea></td></tr>
		<tr><td>인증사진</td>
		<td>
		<img id="previewimg" src="img/${reviewinfo.p_photo}" onerror="this.src='/img/noimage.jpg'">
		<input name="p_photo" type="hidden" value=${reviewinfo.p_photo }>
		<input name="image" id="input-image" class="admintd" type="file" accept="image/*"></td></tr>
	</table>
</div>
<div class='adminbtn'>
<input class="adminback" id="reviewback" type="button" value="취소">
<input class="adminend" id="reviewend" type="submit" value="수정완료하기">
</div>
</form>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>