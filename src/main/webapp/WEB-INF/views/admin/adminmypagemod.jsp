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
<script src="/js/admin/adminmypagemod.js"></script>

</head>
<body>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1 class='adminmain'>'관리자 정보' 수정하기</h1><br>
<form action='adminmypagemodinfo' method='post' enctype="multipart/form-data">
<div class='admincontext'>
	<table class='adminmodinserttable'>
		<tr><td>닉네임(아이디)</td>
		<td><div>${admininfo.id}<input type="hidden" name="id" value="${admininfo.id }"></div></td></tr>
		<tr><td>현재 비밀번호</td><td><input id="curpwd" class="admintd" type="password">
		<input id="curpwdck" type="hidden" value="${admininfo.pw }">
		<div id="curpwerror"></div>
		</td></tr>
		<tr><td>새로운 비밀번호</td><td><input id="newpwd" name="pw" class="admintd" type="password">
		<div id="pwerror"></div>
		</td></tr>
		<tr><td>새로운 비밀번호 다시입력하기</td><td><input id="newpwdck" class="admintd" type="password">
		<div id="pwckerror"></div>
		</td></tr>
		<tr><td>전화번호</td><td><input id="phone" name="phone" class="admintd" type="text" pattern="[0-9]{2,4}-[0-9]{3,4}-[0-9]{4}" maxlength="14" value="${admininfo.phone }" required></td></tr>
		<%-- <tr><td>사진</td>
		<td>
		<img id="previewimg" src="img/${admininfo.photo}" onerror="this.src='/img/noimage.jpg'">
		<input name="photo" type="hidden" value="${admininfo.photo }">
		<input name="image" id="input-image" class="admintd" type="file" accept="image/*">
		</td> --%></tr>
	</table>
</div>
<div class='adminbtn'>
<input class="adminback" id="admininfoback" type="button" value="취소" >
<input class="adminend" id="admininfoend" type="submit" value="수정완료하기" >
</div>
</form>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>