<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<!-- header import -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<!-- end of header import -->
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org" xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout" layout:decorator="board/layout/basic">
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
		background-color: #1A271D;
		border-bottom: 1px solid gray;
		color : white;
	}
	td{
		padding: 20px;
		border-bottom: 1px solid gray;
	}
	tr:hover{
		background-color: #1A271D;
	}
	#content_td:hover{
		background-color: #1A271D;
		color : white;
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
	.titlea:hover{
		color : white;
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
		<div id="find_div">
			<select id="b_type" name="b_type">
				<option value="all"> 분류 </option>
				<option value="not"> 공지 </option>
				<option value="que"> 질문 </option>
				<option value="req"> 요청 </option>
			</select>
			검색 : <input type="text" id="find" name="find" autofocus="autofocus" placeholder="검색어를 입력해주세요">
			<input type="button" id="findbtn" name="findbtn" value="검색">
		</div>
		
		<c:if test="${sessionScope.session_id == null }">
		</c:if>
		
		<c:if test="${sessionScope.session_id != null }">
			<input type="button" id="inputbtn" name="inputbtn" value="글작성">
		</c:if>
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
			<c:forEach items="${boardlist }" var="board">
				<tr id="content_td">
					<td>
						<c:if test="${board.b_type =='not'}">공지사항</c:if> 
						<c:if test="${board.b_type =='que'}">질문</c:if> 
						<c:if test="${board.b_type =='req'}">요청</c:if> 
					</td>
					<td><a href="/boardview?b_no=${board.b_no }" class="titlea"> ${board.b_title } </a></td>
					<td>${board.id }</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH-mm-ss" value="${board.b_regdate }" /></td>
					<td>${board.b_view }</td>
				</tr>
			</c:forEach>
			
		</table>
	</div>
	
	<div id="pagination">
		<ul class="paging">
			<c:if test="${paging.prev}">
				<span><a href='<c:url value="/test?page=${paging.startPage-1}"/>'>이전</a></span>
			</c:if>
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
				<span><a href='<c:url value="/test?page=${num}"/>'>${num}</a></span>
			</c:forEach>
			<c:if test="${paging.next && paging.endPage>0}">
				<span><a href='<c:url value="/test?page=${paging.endPage+1}"/>'>다음</a></span>
			</c:if>
		</ul>
	</div>

</section>

	<!-- footer import -->
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	<!-- end of footer import -->

</body>
</html>