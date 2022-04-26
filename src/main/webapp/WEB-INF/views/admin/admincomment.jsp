<%@page import="zeroshop.ZeroshopDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/adminheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hey,Earth | Admin Page</title>
<link href="css/admin/admincomment.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
<script src="jquery-3.6.0.min.js"></script>
<script src="/js/admin/admincomment.js"></script>

</head>
<body>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1 class='adminmain'>댓글 작성&수정하기</h1><br>
<div class='admincontext'>
	<table class='adminmodinserttable'>
		<c:if test="${boardinfo.b_type == 'not' }">
			<tr><td>분류</td><td>공지</td></tr>
		</c:if>
		<c:if test="${boardinfo.b_type == 'req' }">
			<tr><td>분류</td><td>요청</td></tr>
		</c:if>
		<c:if test="${boardinfo.b_type == 'que' }">
			<tr><td>분류</td><td>질문</td></tr>
		</c:if>
		</td></tr>
		<tr><td>제목</td><td>${boardinfo.b_title }</td></tr>
		<tr><td>작성자</td><td>${boardinfo.id }</td></tr>
		<tr><td>작성일</td><td>${boardinfo.regdate }</td></tr>
		<tr><td>조회수</td><td>${boardinfo.b_view }</td></tr>
		<tr><td>내용</td><td><textarea class='textarea' readonly rows="20">${boardinfo.b_content }</textarea></td></tr>
		<c:if test="${boardinfo.b_img != null }">			
			<tr><td>사진</td>
			<td>
			<img id="previewimg" src="/img/${boardinfo.b_img }">
			<input value="${boardinfo.b_img }" id="b_img" type="hidden"></td></tr>
		</c:if>
	</table>
</div>
<h2 id="c_title">댓글</h2>
<div id="c_container">
	<input type="text" id="c_comment" placeholder="댓글을 입력해주세요" required="required">
	<input class="id" type="hidden" id="id" value="${sessionScope.session_id }">
	<input class="b_no" type="hidden" id="b_no" value="${boardinfo.b_no }">
	<input type="button" id="cinput_btn" value="작성">

</div>
<hr>
<div class="container" id="list_div">
	<table id="comment_tb" class="commentList">
		<tr class='tr2'> <th class='th2'>내용</th> <th class='th2'>작성자</th> <th class='th2'>작성일</th></tr>
	</table>
</div>
<div class='adminbtn'>
<input class="adminback" id="boardback" type="button" value="목록으로">
</div>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>