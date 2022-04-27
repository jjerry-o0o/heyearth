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
<script src="/js/admin/adminmember.js"></script>
</head>
<body>

<h1 class='adminmain'>'회원 관리' 페이지입니다.</h1><br>

<div class='admincontext'>
	<table class='adminlisttable'>
		<tr><th>닉네임</th><th> </th><th>  </th><th> </th><th> </th></tr>
		<c:forEach items="${memberlist}" var="memberlist">
			<tr><td class='tabname'>${memberlist.id}</td>
			<td><input class="tabmodbtn" id='membermod' type='button' value='회원정보 수정' onclick="membermod('${memberlist.id}')"></td>
			<td><input class="tabmodbtn" id='memberboard' type='button' value='작성한 글 확인' onclick="memberboard('${memberlist.id}')"></td>
			<td><input class="tabdelbtn" id='membermission' type='button' value='참여 미션 확인' onclick="membermission('${memberlist.id}')"></td>
			<c:if test="${memberlist.del == 'N' }">
				<td><input class="tabdelbtn" id='memberdel' type='button' value='탈퇴' onclick="memberdel('${memberlist.id}')"></td>
			</c:if>
			</tr>
		</c:forEach> 
	</table>
</div>

</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>