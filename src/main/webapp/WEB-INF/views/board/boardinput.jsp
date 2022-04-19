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
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> -->

<!-- js -->
<script type="text/javascript" src="/js/board/boardinput.js"></script>

<script src="jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function () {
		$("#listbtn").on("click", function(){
			location.href="/boardlist";
		});
		$("#inputbtn").on("click", function(){
			
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
	tr:last-child{
		vertical-align: top;
	}
	#btn_div{
		text-align: center;
		margin : 30px auto;
	}
	#inputbtn{
		padding : 10px 20px;
		margin-right : 10px;
		border: 2px solid #1A271D;
		border-radius: 5px;
	}
	#inputbtn:hover{
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
	}
	.type_radio input{
		accent-color : black;
	}
	label{
		margin-right : 20px;
	}
	#title_input{
		border-style: none;
		height : 30px;
		width : 100%;
		font-size: medium;
		font-weight: bold;
	}
	
</style>

</head>
<body>

	<!-- header import -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<!-- end of header import -->
	
<section class="viewSection">
	<form id="wrap" method="post" action="/boardinput">
		<table id="view_table">
			<tr>
				<th>분류</th>
				<td>
					<div class="type_radio">
						<label for="que">
							<input type="radio" id="que" name="type" value="que" checked> 
							질문
						</label>
						<label for="req">
							<input type="radio" id="req" name="type" value="req"> 
							요청
						</label>
						<label for="not">
							<input type="radio" id="not" name="type" value="not"> 
							공지
						</label>
					</div>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td id="title_td"><input type="text" id="title_input" name="title" autofocus="autofocus" placeholder="제목을 입력해주세요" required="required"></td>
			</tr>
				<tr>
				<th>작성자</th>
				<td>${dto.id }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea id="view_textarea" name="content" rows="20" placeholder="게시물 내용을 입력해주세요." required="required"></textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td></td>
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