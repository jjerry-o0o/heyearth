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
<script src="/js/admin/adminboardinsert.js"></script>

</head>
<body>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1 class='adminmain'>'공지사항' 등록하기</h1><br>
<form action='adminboardinsertinfo' method='post' enctype="multipart/form-data">
<div class='admincontext'>
	<table class='adminmodinserttable'>
		<tr><td>분류</td><td>공지사항<input type="hidden" name="b_type" value="not"></td></tr>
		<tr><td>제목</td><td><input type="text" name="b_title" class="admintd" required></td></tr>
		<tr><td>내용</td><td><textarea name="b_content" class="admintd" id="b_content" required></textarea></td></tr>
		<tr><td>사진</td>
		<td>
		<img id="previewimg">
		<input id="imageremove" type="button" value="이미지 삭제">
		<input name="file" id="input-image" class="admintd" type="file" accept="image/*">
		</td></tr>
	</table>
</div>
<div class='adminbtn'>
<input class="adminback" id="boardback" type="button" value="취소">
<input class="adminend" id="boardend" type="submit" value="등록하기">
</div>
</form>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>