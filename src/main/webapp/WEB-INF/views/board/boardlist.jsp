<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!-- header import -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<!-- end of header import -->
<!DOCTYPE html>
<html>
<head>
<script src="jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function () {
		
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
		width : 50px;
		height : 25px;
		background-color: #FFDDD0;
		border: 2px solid pink;
		border-radius: 5px;
	}
	#inputbtn{
		text-align : center;
		float: right;
		width : 100px;
		height : 25px;
		background-color: #FFDDD0;
		border: 2px solid pink;
		border-radius: 5px;
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
	a{
		text-decoration: none;
	}
	a:link{
		color : black;
	}
	a:visited{
		color : black;
	}
	#b_type{
		margin-right:20px;
	}
	#pagination{
		padding : 20px;
	}
	
	
	
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시판 메인 | heyEarth</title>

<!-- CSS -->
<link rel="stylesheet" href="/css/board.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<!-- js -->
<script type="text/javascript" src="/js/boardlist.js"></script>

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
		검색 : <input type="text" id="find" name="find" placeholder="검색어를 입력해주세요">
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
			<tr id="not_td">
				<td>공지</td>
				<td><a href="/boardview">이거는 내가 뭔말을 하고 싶어서 이렇게 적었나면 그게 말야</a></td>
				<td>매점아줌마</td>
				<td>2022/04/01</td>
				<td>123</td>
			</tr>
			<!-- 공지사항외 게시물 -->
			<tr id="td">
				<td>질문</td>
				<td><a href="/boardview">오늘 매점에 신상 있나요 ?</a></td>
				<td>황상철</td>
				<td>2022/04/02</td>
				<td>12</td>
			</tr>
			
		</table>
	</div>
	
	<!-- 페이징처리 bootstrap -->
	<div id="pagination">
		<ul class="pagination pagination-sm justify-content-center">
			<li class="page-item"><a class="page-link" href="#">이전</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">다음</a></li>
		</ul>
	</div>

</section>

	<!-- footer import -->
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	<!-- end of footer import -->

</body>
</html>