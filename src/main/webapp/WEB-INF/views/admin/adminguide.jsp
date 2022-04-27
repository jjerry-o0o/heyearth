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
<script src="/js/admin/adminguide.js"></script>
</head>
<body>

<h1 class='adminmain'>'이건 어떻게 버릴까?' 관리 페이지입니다.</h1><br>

<div>
<input class="addbtn" id='guideadd' type='button' value='등록하기' onclick='guideinsert()'>
</div>

<div class='admincontext'>
	<table class='adminlisttable'>
		<tr><th>분류</th><th>재활용품명</th><th> </th><th> </th></tr>
		<c:forEach items="${guidelist}" var="guidelist">
			<tr><td class='tabname'>${guidelist.r_class}</td><td class='tabname'>${guidelist.r_name }</td><td><input class="tabmodbtn" id='guidemod' type='button' value='수정' onclick='guidemod(${guidelist.r_code})'></td><td><input class="tabdelbtn" id='guidedel' type='button' value='삭제' onclick='guidedel(${guidelist.r_code})'></td></tr>
		</c:forEach> 
	</table>
</div>

</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>