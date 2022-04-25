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
<script src="/js/admin/adminboardmod.js"></script>

</head>
<body>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1 class='adminmain'>'게시물' 수정하기</h1><br>
<form action='adminboardmodinfo' method='post' enctype="multipart/form-data">
<input name="b_no" type="hidden" value=${boardinfo.b_no}>
<div class='admincontext'>
	<table class='adminmodinserttable'>
		<tr><td>분류</td><td>
		<c:if test="${boardinfo.b_type == 'not' }">
			공지<input type="hidden" value="not" name="b_type">
		</c:if>
		<c:if test="${boardinfo.b_type != 'not' }">
			<select name="b_type" class="admintd" id="b_type">
				<option id='queopt' value='que'>질문</option>
				<option id='reqopt' value='req'>요청</option>
			</select>
		</c:if>
		<input id="curtype" type="hidden" value="${boardinfo.b_type }">
		</td></tr>
		<tr><td>제목</td><td><input type="text" name="b_title" class="admintd" value="${boardinfo.b_title }" required></td></tr>
		<tr><td>작성자</td><td>${boardinfo.id }<input type="hidden" name="id" value="${boardinfo.id }"></td></tr>
		<tr><td>작성일</td><td>${boardinfo.regdate }</td></tr>
		<tr><td>조회수</td><td>${boardinfo.b_view }<input type="hidden" name="b_view" value="${boardinfo.b_view }"></td></tr>
		<tr><td>내용</td><td><textarea name="b_content" class="admintd" id="b_content" required>${boardinfo.b_content }</textarea></td></tr>
		<tr><td>사진</td>
		<td>
		<img id="previewimg">
		<input id="b_img" type="hidden" name="b_img" value="${boardinfo.b_img }">
		<input id="imageremove" type="button" value="이미지 삭제">
		<input name="file" id="input-image" class="admintd" type="file" accept="image/*">
		</td></tr>
	</table>
</div>
<div class='adminbtn'>
<input class="adminback" id="boardback" type="button" value="취소">
<input class="adminend" id="boardend" type="submit" value="수정완료하기">
</div>
</form>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>