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

<!-- js -->
<script type="text/javascript" src="/js/board/comment.js"></script>

<script src="jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function () {
		
		selectlist();
		
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
			
		$("#comment_btn").on("click", function(){
			alert("댓글이 작성되었습니다.");
			
			insert();
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
	<table id="view_table">
		<tr class="tr1">
			<th class="th1">분류</th>
			<td class="td1">
				<c:if test="${dto.b_type == 'req' }">요청</c:if>
				<c:if test="${dto.b_type == 'que' }">질문</c:if>
				<c:if test="${dto.b_type == 'not' }">공지사항</c:if>
			</td>
		</tr>
		<tr class="tr1">
			<th class="th1">제목</th>
			<td class="td1">${dto.b_title }</td>
		</tr>
		<tr class="tr1">
			<th class="th1">작성자</th>
			<td class="td1">${dto.id }</td>
		</tr>
		<tr class="tr1">
			<th class="th1">내용</th>
			<td class="td1"><textarea id="view_textarea" rows="20" readonly="readonly">${dto.b_content }</textarea></td>
		</tr>
<c:if test="${dto.b_img != null}">			<tr class="tr1">
				<th class="th1">첨부 이미지</th>
				<td class="td1">
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
		<div class="cinput_div">
			<h3>댓글입력창</h3>
			<textarea id="c_comment" name="c_comment" placeholder="댓글을 입력해주세요"></textarea>
			<button id ="comment_btn" class="button">작성</button>
			<input type="hidden" class="id" name="id" value="${sessionScope.session_id }">
			<input type="hidden" class="b_no" name="b_no" value="${dto.b_no }">
		</div>
	</c:if>
	
	<div id="list_div">
		<div id='comment'>
			<input type="hidden" class="id" name="id" value="${sessionScope.session_id }">
			<input type="hidden" class="b_no" name="b_no" value="${dto.b_no }">
			<table id='comment_tb' class='comment'>
			</table>
		</div>
	</div>

	</section>

	<!-- footer import -->
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	<!-- end of footer import -->

</body>
</html>