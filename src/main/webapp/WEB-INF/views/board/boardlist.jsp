<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!-- header import -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<!-- end of header import -->
<!DOCTYPE html>
<html>
<head>
<title>게시판 메인 | heyEarth</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- CSS -->
<link rel="stylesheet" href="/css/board/boardlist.css" />
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> -->

<!-- js -->
<script type="text/javascript" src="/js/board/boardlist.js"></script>

<script src="jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function () {
		$("#inputbtn").on("click", function(){
			location.href="/boardinput";
		});
		$("#findbtn").on("click", function(){
			
		});
	});
</script>
<style>
	#b_title{
		margin-top : 50px;
		margin-bottom : 50px;
		margin-left : auto;
		margin-right : auto;
		width: 90%;
	}
	#b_content{
		overflow: auto;
	}
	#findbtn{
		border: 2px solid #1A271D;
		border-radius: 5px;
		padding : 2px 10px;
	}
	#findbtn:hover{
		background-color: #1A271D;
		color:white;
	}
	#inputbtn{
		text-align : center;
		float: right;
		border: 2px solid #1A271D;
		border-radius: 5px;
		padding : 2px 20px;
	}
	#inputbtn:hover{
		background-color: #1A271D;
		color:white;
	}
	#con_table{
		width: 90%;
		text-align: center;
		margin : auto;
		border-top : 1px solid gray;
		border-collapse: collapse;
		min-width : 500px;
	}
	th{
		background-color: #FFDDD0;
		border-bottom: 1px solid gray;
	}
	td{
		padding: 20px;
		border-bottom: 1px solid gray;
	}
	#not_td{
		background-color: #DAE6FE;
	}
	#not_td:hover{
		background-color: #1A271D;
	}
	tr:hover{
		background-color: #1A271D;
	}
	.titlea{
		text-decoration: none;
	}
	.titlea:link{
		color : black;
	}
	.titlea:visited{
		color : black;
	}
	#b_type{
		margin-right:20px;
	}
	#pagination{
		padding : 20px;
		color : #1A271D;
		text-align: center;
		
	}
	.page-item{
		display: inline-block;
		padding : 10px;
		font-family: "Noto Sans KR";
	}
	.page-link{
		color : #1A271D;
		text-decoration: none;
		font-weight: bold;
	}
	.page-link:visited{
		color : #1A271D;
		
	}
	.page-link:hover{
		color : #1A271D;
		
	}
	.pagination{
		padding : 0;
	}
	
	
	
</style>
</head>
<body>

<section class="boardSection">
	<div id="b_title">
		<select id="b_type" name="b_type">
			<option value="all"> 분류 </option>
			<option value="not"> 공지 </option>
			<option value="que"> 질문 </option>
			<option value="req"> 요청 </option>
		</select>
		검색 : <input type="text" id="find" name="find" autofocus="autofocus" placeholder="검색어를 입력해주세요">
		<input type="button" id="findbtn" name="findbtn" value="검색">
		
		<input type="button" id="inputbtn" name="inputbtn" value="글작성">
	</div>
	
	<div id="b_content">
		<table class="contents" id="con_table">
			<tr id="th">
				<th>type</th>
				<th>title</th>
				<th>writer</th>
				<th>date</th>
				<th>views</th>
			</tr>
			<!-- 공지사항은 맨위에 -->
			<c:forEach items="${notList }" var="notice">
				<tr id="not_td">
					<td>공지</td>
					<td><a class="titlea" href="/boardview?b_no=${notice.b_no }">${notice.b_title }</a></td>
					<td>${notice.id }</td>
					<td>${notice.b_regdate }</td>
					<td>${notice.b_view }</td>
				</tr>
			</c:forEach>
			<!-- 공지사항외 게시물 -->
			<c:forEach items="${boardList }" var="board">
				<tr id="td">
					<td>${board.b_type }</td>
					<td><a class="titlea" href="/boardview?b_no=${board.b_no }">${board.b_title }</a></td>
					<td>${board.id }</td>
					<td>${board.b_regdate }</td>
					<td>${board.b_view }</td>
				</tr>
			</c:forEach>
			
		</table>
	</div>
	
	<div id="pagination">
		<!-- 페이징처리 js -->
	</div>

</section>

	<!-- footer import -->
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	<!-- end of footer import -->

</body>
</html>