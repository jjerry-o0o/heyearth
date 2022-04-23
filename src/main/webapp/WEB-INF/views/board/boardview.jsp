<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>게시물 조회 | heyEarth</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- CSS -->
<link rel="stylesheet" href="/css/board/boardview.css" />

<script src="jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function () {
		$("#alterbtn").on("click", function(){
			location.href="/boardalter?b_no=${dto.b_no}";
		});
		$("#listbtn").on("click", function(){
			location.href="/boardlist";
		});
		$("#deletebtn").on("click", function(){
			location.href="/boarddelete?b_no=${dto.b_no}";
		});
		$("#closeup").on("click", function(){
			$("#upload_img").css("width", "400px");
		});
		$("#closeof").on("click", function(){
			$("#upload_img").css("width", "100px");
		});

	});

</script>
</head>
<body>

	<!-- header import -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<!-- end of header import -->
	
<section class="viewSection">
	<table id="view_table">
		<tr>
			<th>분류</th>
			<td>
				<c:if test="${dto.b_type == 'req' }">요청</c:if>
				<c:if test="${dto.b_type == 'que' }">질문</c:if>
				<c:if test="${dto.b_type == 'not' }">공지사항</c:if>
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.b_title }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${dto.id }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea id="view_textarea" rows="20" readonly="readonly">${dto.b_content }</textarea></td>
		</tr>
		<c:if test="${dto.b_img != null}">
			<tr>
				<th>첨부 이미지</th>
				<td>
					<input type="button" id="closeup" value="이미지확대">
					<input type="button" id="closeof" value="이미지축소"><br>
					<img src="/img/${dto.b_img }" id="upload_img">
				</td>
			</tr>
		</c:if>
	</table>
	
	<div id="btn_div">
	
		<input type="button" id="listbtn" value="목록으로">
		
		<c:if test="${sessionScope.session_id == dto.id }">
			<input type="button" id="alterbtn" value="수정">
			<input type="button" id="deletebtn" value="삭제">
		</c:if>
	</div>

	<c:if test="${sessionScope.session_id != null }">
		<div class="c_container">
			<form action="/insertcomment" method="post">
				<input type="text" id="comment" name="c_comment" placeholder="댓글을 입력해주세요" required="required">
				<input type="hidden" name="id" value="${sessionScope.session_id }">
				<input type="hidden" name="b_no" value="${dto.b_no }">
				<input type="submit" id="cinput_btn" value="등록">
			</form>
		</div>
	</c:if>
		<div class="container">
			<div class="commentList">
			</div>
		</div>

	</section>

	<!-- footer import -->
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	<!-- end of footer import -->

</body>
</html>