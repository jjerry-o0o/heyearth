<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>
<body>

<section class="boardSection">
	<div id="b_title">
		<div id="find_div">
			<select id="contentnum" name="contentnum" onchange="page(1)">
				<option value="5" <c:if test="${page.getContentnum() ==5 }">selected="selected"</c:if>> 5개 </option>
				<option value="10" <c:if test="${page.getContentnum() ==10 }">selected="selected"</c:if>> 10개 </option>
				<option value="15" <c:if test="${page.getContentnum() ==15 }">selected="selected"</c:if>> 15개 </option>
			</select>
			<select id="b_type" name="b_type">
				<option value="all"> 검색유형 </option>
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
			<thead>
				<tr id="th">
					<th>type</th>
					<th>title</th>
					<th>writer</th>
					<th>date</th>
					<th>views</th>
				</tr>
			</thead>
			<tbody>
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
				<c:forEach items="${test }" var="board">
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
			</tbody>
			<tfoot>
				<tr id="pagination">
					<td colspan="5">
						<!-- paging -->
						<c:if test="${page.prev }">
							<a href="javascript:page(${page.getStartPage()-1});">&laquo;</a>
						</c:if>
						<c:forEach begin="${page.getStartPage() }" end="${page.getEndPage() }" var="idx">
								<a href="javascript:page(${idx });" class="pagination">${idx }</a>
						</c:forEach>
						<c:if test="$page.next">
							<a href="javascript:page(${page.getEndPage()+1 });">&raquo;</a>
						</c:if>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>

</section>

	<!-- footer import -->
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	<!-- end of footer import -->

</body>
</html>