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
<script src="/js/admin/adminmypage.js"></script>
</head>
<body>

<h1 class='adminmain'>관리자 마이페이지입니다.</h1><br>
<br>
<br>
<div class='admincontext'>
	<table class='adminmodinserttable'>
		<tr><td>닉네임(아이디)</td><td>${admininfo.id }</td></tr>
		<tr><td>전화번호</td><td>${admininfo.phone }</td></tr>
		<%-- <tr><td>사진</td>
		<td>
		<img id="previewimg" src="img/${admininfo.photo}" onerror="this.src='/img/noimage.jpg'"> --%>
	</table>
</div>

<div class='adminbtn'>
<input class="adminend" id="admininfoupdate" type="button" value="회원정보수정하기" onclick="infoupdate()">
</div>

</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>