<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/adminheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hey,Earth | Admin Page</title>
<link href="css/admin/adminlist.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
<script src="jquery-3.6.0.min.js"></script>
<script src="/js/admin/adminzeroshop.js"></script>

</head>
<body>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1 class='adminmain'>'지구를 돕는 가게 찾기' 관리 페이지입니다.</h1><br>
<div>
<input class='addbtn' id='zeroshopadd' type='button' value='등록하기' onclick='zeroshopinsert()'>
</div>
<div class='admincontext'>
	<table class='adminlisttable'>
		<tr><th>가게명</th><th> </th><th> </th></tr>
		<c:forEach items="${zeroshoplist}" var="zeroshoplist">
			<tr><td class='tabname'>${zeroshoplist.s_name}</td><td><input class="tabmodbtn" id='zeroshopmod' type='button' value='수정' onclick='zeroshopmod(${zeroshoplist.s_code})'></td><td><input class="tabdelbtn" id='zeroshopdel' type='button' value='삭제' onclick='zeroshopdel(${zeroshoplist.s_code})'></td></tr>
		</c:forEach> 
	</table>
</div>

</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>