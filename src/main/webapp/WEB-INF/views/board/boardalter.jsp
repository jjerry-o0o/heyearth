<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>게시물 수정 | heyEarth</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- CSS -->
<link rel="stylesheet" href="/css/board/boardalter.css" />

<script src="jquery-3.6.0.min.js"></script>

<script type="text/javascript">
	$(document).ready(function () {
		$("#listbtn").on("click", function(){
			location.href="/boardlist";
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

<!-- Talk Talk Banner Script start -->
	<script type="text/javascript" src="https://partner.talk.naver.com/banners/script"></script>
	<div class="talk_banner_div" data-id="114553" style="position: fixed; right: 100px; bottom: 30px; z-index: 99;"></div>
<!-- Talk Talk Banner Script end -->

	<!-- header import -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<!-- end of header import -->
	
<section class="viewSection">
	<form action="/boardalter" method="post" enctype="multipart/form-data">
		<table id="view_table">
			<tr>
				<th>분류</th>
				<td>
					<div class="type_radio">
						<c:if test="${dto.b_type == \"que\" }">
							<label for="que">
								<input type="radio" id="que" name="b_type" value="que" checked> 
								질문
							</label>
							<label for="req">
								<input type="radio" id="req" name="b_type" value="req"> 
								요청
							</label>
						</c:if>
						<c:if test="${dto.b_type == \"req\" }">
							<label for="que">
								<input type="radio" id="que" name="b_type" value="que"> 
								질문
							</label>
							<label for="req">
								<input type="radio" id="req" name="b_type" value="req" checked> 
								요청
							</label>
						</c:if>
					</div>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td id="title_td"><input type="text" id="title_input" name="b_title" value="${dto.b_title }"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="hidden" name="id" value="${sessionScope.session_id}">${sessionScope.session_id}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea id="view_textarea" name="b_content" rows="20">${dto.b_content }</textarea></td>
			</tr>
			<tr>
				<th>첨부 이미지</th>
				<td>
					<c:if test="${dto.b_img != null}">
						<input type="button" id="closeup" value="이미지확대">
						<input type="button" id="closeof" value="이미지축소"><br>
						<img src="/img/${dto.b_img }" id="upload_img"><br>
					</c:if>
					<input type="file" name="file" id="file">
					<input type="hidden" name="b_no" value="${dto.b_no}">
					<input type="hidden" name="b_img" value="${dto.b_img}">
				</td>
			</tr>
		</table>
		
		<div id="btn_div">
			<input type="submit" id="alterbtn" value="수정">
			<input type="button" id="listbtn" value="목록으로">
		</div>
	
	</form>

</section>

	<!-- footer import -->
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	<!-- end of footer import -->
	
</body>
</html>