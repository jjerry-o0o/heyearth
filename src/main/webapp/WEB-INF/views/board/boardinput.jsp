<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>게시물 작성 | heyEarth</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- CSS -->
<link rel="stylesheet" href="/css/board/boardinput.css" />

<script src="jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function () {
		$("#listbtn").on("click", function(){
			location.href="/boardlist";
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
	<form id="wrap" method="post" action="/boardinput" enctype="multipart/form-data">
		<table id="view_table">
			<tr>
				<th>분류</th>
				<td>
					<div class="type_radio">
						<label for="que">
							<input type="radio" id="que" name="b_type" value="que" checked> 
							질문
						</label>
						<label for="req">
							<input type="radio" id="req" name="b_type" value="req"> 
							요청
						</label>
						
					</div>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td id="title_td"><input type="text" id="title_input" name="b_title" autofocus="autofocus" placeholder="제목을 입력해주세요" required="required"></td>
			</tr>
				<tr>
				<th>작성자</th>
				<td><input type="hidden" name="id" value="${sessionScope.session_id}">${sessionScope.session_id}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea id="view_textarea" name="b_content" rows="20" placeholder="게시물 내용을 입력해주세요." required="required"></textarea></td>
			</tr>
			<tr>
				<th>첨부 이미지</th>
				<td><input type="file" name="file" id="file"></td>
			</tr>
		</table>
		
		<div id="btn_div">
			<input type="submit" id="inputbtn" value="등록">
			<input type="button" id="listbtn" value="목록으로">
		</div>
	</form>
</section>

	<!-- footer import -->
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	<!-- end of footer import -->
	
</body>
</html>