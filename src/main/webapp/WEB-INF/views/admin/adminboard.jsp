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
<script src="/js/admin/adminboard.js"></script>
</head>
<body>

<h1 class='adminmain'>'게시판 관리' 페이지입니다.</h1><br>
<br>
<div class="board_choose">
		<input type="button" id="notice" name="notice" value = "공지사항" onclick="board(1)" checked="checked" autofocus>
		<input type="button" id="question" name="question" value = "질문" onclick="board(2)">
		<input type="button" id="request" name="request" value = "요청" onclick="board(3)">
</div>
<br>
<br>
<div class="board_body">
	<div id="noticepage">
		<div>
			<input class="addbtn" id='guideadd' type='button' value='등록하기' onclick='boardinsert()'>
		</div>
		<br>
		<br>
		<br>
		<div id="noticetable">
		<table class='adminlisttable' id='adminnoticetable'>
		<tr><th>게시물명</th><th>작성자</th><th>작성일</th><th> </th><th>   </th><th>   </th></tr>
		<c:forEach items="${boardlist}" var="boardlist">
			<tr><td class='tabname'>${boardlist.b_title}</td>
			<td class='tabname'>${boardlist.id }</td>
			<td class="tabname">${boardlist.regdate}</td>
			<td><input class='tabmodbtn' id='comment' type='button' value='댓글작성' onclick='comment(${boardlist.b_no})'></td>
			<td><input class='tabmodbtn' id='boardmod' type='button' value='수정' onclick='boardmod(${boardlist.b_no})'></td>
			<td><input class='tabdelbtn' id='boarddel' type='button' value='삭제' onclick='boarddel(${boardlist.b_no})'></td></tr>
		</c:forEach> 
		</table>
		</div>
	</div>
	
	<div id="questionpage" style="display:none;">
		<table class='adminlisttable' id='adminquestiontable'>
		
		</table>
	</div>
	
	<div id="requestpage" style="display:none;">
		<table class='adminlisttable' id='adminrequesttable'>
		
		</table>
	</div>
</div>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>