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

<!-- js -->
<script type="text/javascript" src="/js/board/boardalter.js"></script>

<script src="jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function () {
		$("#listbtn").on("click", function(){
			location.href="/boardlist";
		});
	});
</script>
<style>
	#view_table{
		width : 90%;
		border-top: 1px solid gray;
		border-bottom: 1px solid gray;
		border-collapse: collapse;
		margin : 30px auto;
	}
	tr{
		border-bottom: 1px dashed gray;
	}
	td{
		padding-left : 20px;
	}
	th{
		width : 20%;
		border-right: 1px solid gray;
		padding : 20px;
	}
	tr:nth-child(4){
		vertical-align: top;
	}
	#btn_div{
		text-align: center;
		margin : 30px auto;
	}
	#alterbtn{
		padding : 10px 20px;
		margin-right : 10px;
		border: 2px solid #1A271D;
		border-radius: 5px;
	}
	#alterbtn:hover{
		background-color: #1A271D;
		color : white;
	}
	#listbtn{
		padding : 10px 20px;
		border: 2px solid #1A271D;
		border-radius: 5px;
	}
	#listbtn:hover{
		background-color: #1A271D;
		color : white;
	}
	#view_textarea{
		border-style: none;
		resize: none;
		width: 100%;
		overflow: auto;
		margin : 20px auto;
		background-color: #F6F5F0
	}
	.type_radio input{
		accent-color : #1A271D;
	}
	label{
		margin-right : 20px;
	}
	#title_input{
		border-style: none;
		height : 30px;
		width : 90%;
		font-size: medium;
		font-weight: bold;
		background-color: #F6F5F0;
	}
	
</style>

</head>
<body>

	<!-- header import -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<!-- end of header import -->
	
<section class="viewSection">
	<form action="/boardalter" method="post">
		<table id="view_table">
			<tr>
				<th>분류</th>
				<td>
					<div class="type_radio">
						<c:if test="${dto.b_type == \"que\" }">
							<label for="que">
								<input type="radio" id="que" name="type" value="que" checked> 
								질문
							</label>
							<label for="req">
								<input type="radio" id="req" name="type" value="req"> 
								요청
							</label>
							<c:if test="${sessionScope.session_id == \"admin\" }">
								<label for="not">
									<input type="radio" id="not" name="type" value="not"> 
									공지
								</label>
							</c:if>
						</c:if>
						<c:if test="${dto.b_type == \"req\" }">
							<label for="que">
								<input type="radio" id="que" name="type" value="que"> 
								질문
							</label>
							<label for="req">
								<input type="radio" id="req" name="type" value="req" checked> 
								요청
							</label>
							<c:if test="${sessionScope.session_id == \"admin\" }">
								<label for="not">
									<input type="radio" id="not" name="type" value="not"> 
									공지
								</label>
							</c:if>
						</c:if>
						<c:if test="${dto.b_type == \"not\" }">
							<label for="que">
								<input type="radio" id="que" name="type" value="que" > 
								질문
							</label>
							<label for="req">
								<input type="radio" id="req" name="type" value="req"> 
								요청
							</label>
							<label for="not">
								<input type="radio" id="not" name="type" value="not" checked> 
								공지
							</label>
						</c:if>
					</div>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td id="title_td"><input type="text" id="title_input" name="title" autofocus="autofocus" placeholder="${dto.b_title }"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${dto.id }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea id="view_textarea" rows="20">${dto.b_content }</textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td></td>
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