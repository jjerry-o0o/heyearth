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
<script src="/js/admin/adminmembermod.js"></script>

</head>
<body>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1 class='adminmain'>'${memberinfo.id }'님의 회원정보 수정하기</h1><br>
<form action='adminmembermodinfo' method='post' enctype="multipart/form-data">
<div class='admincontext'>
	<table class='adminmodinserttable'>
		<tr><td>닉네임(아이디)</td><td>${memberinfo.id }<input type="hidden" name="id" value="${memberinfo.id }"></td></tr>
		<tr><td>전화번호</td><td>${memberinfo.phone }</td></tr>
		<tr><td>등급</td><td><input id="grade" name="grade" class="admintd" type="number" value="${memberinfo.grade}" min="1" max="5" required></td></tr>
		<tr><td>포인트</td><td><input id="point" name="point" class="admintd" type="number" value="${memberinfo.point}" min="0" required></td></tr>
		<tr><td>감소시킨 탄소배출량</td><td><input id="carbon" name="carbon" class="admintd" type="number" value="${memberinfo.carbon}" min="0" required></td></tr>
		<%-- <tr><td>사진</td>
		<td>
		<img id="previewimg">
		<input id="photo" name="photo" type="hidden" value=${memberinfo.photo }>
		<input id="imageremove" type="button" value="이미지 삭제">
		<input name="image" id="input-image" class="admintd" type="file" accept="image/*"></td></tr> --%>
	</table>
</div>
<div class='adminbtn'>
<input class="adminback" id="memberback" type="button" value="취소">
<input class="adminend" id="memberend" type="submit" value="수정완료하기">
</div>
</form>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>