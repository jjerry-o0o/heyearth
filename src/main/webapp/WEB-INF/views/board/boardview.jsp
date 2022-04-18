<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>게시물 조회 | heyEarth</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- CSS -->
<link rel="stylesheet" href="/css/board/boardview.css" />
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> -->

<!-- js -->
<script type="text/javascript" src="/js/board/boardview.js"></script>

<script src="jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function () {
		$("#alterbtn").on("click", function(){
			location.href="/boardalter";
		});
		$("#listbtn").on("click", function(){
			location.href="/boardlist";
		});
		$("#deletebtn").on("click", function(){
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
		padding : 20px;
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
	#deletebtn{
		padding : 10px 20px;
		margin-right : 10px;
		border: 2px solid #1A271D;
		border-radius: 5px;
	}
	#deletebtn:hover{
		background-color: #1A271D;
		color:white;
	}
	#listbtn{
		padding : 10px 20px;
		border: 2px solid #1A271D;
		border-radius: 5px;
	}
	#listbtn:hover{
		background-color: #1A271D;
		color:white;
	}
	#view_textarea{
		border-style: none;
		resize: none;
		width: 100%;
		overflow: auto;
	}
</style>
</head>
<body>

	<!-- header import -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<!-- end of header import -->
	
<section class="viewSection">
	<table id="view_table">
		<tr>
			<th>분류</th>
			<td>${dto.b_type }</td>
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
	</table>
	
	<div id="btn_div">
		<input type="button" id="alterbtn" value="수정">
		<input type="button" id="deletebtn" value="삭제">
		<input type="button" id="listbtn" value="목록으로">
	</div>

</section>

	<!-- footer import -->
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	<!-- end of footer import -->
	
</body>
</html>