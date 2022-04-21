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
	});
</script>
<style>
	#comment_table{
		width : 80%;
		border: 1px solid gray;
		border-collapse: collapse;
		margin : 30px auto;
	}
	#comment{
		border-style: none;
		resize: none;
		width: 100%;
		overflow: auto;
		background-color: #F6F5F0;
	}
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
		background-color: #F6F5F0;
	}
	#upload_img{
		width : 100px;
	}
	#closeup{
		padding : 10px 20px;
		margin-right : 10px;
		margin-bottom : 10px;
		border: 2px solid #1A271D;
		border-radius: 5px;
	}
	#closeof{
		padding : 10px 20px;
		margin-right : 10px;
		margin-bottom : 10px;
		border: 2px solid #1A271D;
		border-radius: 5px;
	}
	.openBtn{
		padding : 10px 20px;
		margin-right : 10px;
		margin-bottom : 10px;
		border: 2px solid #1A271D;
		border-radius: 5px;
	}
	.openBtn:hover{
		background-color: #1A271D;
		color : white;
	}
	.closeBtn{
		padding : 5px 20px;
		border-radius: 5px;
		cursor : pointer;
		margin : 5 auto;
		float: right;
		text-align: center;
		border : none;
		background-color: #fff;
	}
	.closeBtn:hover{
		background-color: #1A271D;
		color : white;
	}
	.okBtn{
		padding : 5px 20px;
		border-radius: 5px;
		cursor : pointer;
		margin : 5 auto;
		border: 2px solid #1A271D;
		text-align: center;
		background-color: #fff;
	}
	.okBtn:hover{
		background-color: #1A271D;
		color : white;
	}
	.modal{
		position : fixed;
		top : 0;
		left : 0;
		width : 100%;
		height : 100%;
		display : flex;
		justify-content: center;
		align-items: center;
	}
	.modal .bg{
		width : 100%;
		height : 100%;
		background-color: rgba(0, 0, 0, 0.6);
	}
	.modalBox{
		position : absolute;
		background-color: #fff;
		width: 400px;
		height: 200px;
		padding : 15px;
	}
	.modalBox .openBtn .closeBtn .okBtn{
		display: block;
		width: 80px;
	}
	.hidden{
		display: none;
	}
	#comment_input{
		border-style: none;
		resize: none;
		width: 100%;
		overflow: auto;
		background-color: #fff;
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
		<c:if test="${dto.b_img != null}">
			<tr>
				<th>첨부 이미지</th>
				<td>
					<input type="button" id="closeup" value="이미지확대">
					<input type="button" id="closeof" value="이미지축소"><br>
					<img src="/img/${dto.b_img }" id="upload_img">
				</td>
			</tr>
		</c:if>
	</table>
	
	<div id="comment_div">
		<c:if test="${dto.b_type == 'que' && dto.b_no == comment.b_no }">
			<c:forEach items="${commentlist }" var="comment">
				<table id="comment_table">
					<tr>
						<th colspan="2">댓글 리스트</th>
					</tr>
					<tr>
						<th colspan="2">${comment.c_index }</th>
					</tr>
					<tr>
						<th>댓글 작성자</th>
						<td>${comment.id }</td>
					</tr>
					<tr>
						<th>댓글 내용</th>
						<td>
							<textarea id="comment" name="comment" rows="5" readonly="readonly">${comment.c_comment }</textarea>
						</td>
					</tr>
					<c:if test="${sessionScope.session_id == comment.id }">
						<tr>
							<td colspan="2"><input type="button" id="comment_btn" value="댓글 수정"></td>
						</tr>
					</c:if>
							
				</table>
			</c:forEach>
		</c:if>
	</div>
	<div class="modal hidden">
		<div class="bg"></div>
		<div class="modalBox">
			<form action="/comment" method="post">
				<button class="closeBtn">X</button>
				<textarea id="comment_input" name="c_comment" rows="6" placeholder="게시물 내용을 입력해주세요." required="required"></textarea>
				<input type="submit" class="okBtn">작성완료
			</form>
		</div>
	</div>
	
	<div id="btn_div">
		<c:if test="${sessionScope.session_id == null }">
			<input type="button" id="listbtn" value="목록으로">
			<input type="button" class="openBtn" value="댓글 작성하기">
		</c:if>
		
		<c:if test="${sessionScope.session_id == dto.id }">
			<input type="button" id="alterbtn" value="수정">
			<input type="button" id="deletebtn" value="삭제">
			<input type="button" id="listbtn" value="목록으로">
			<input type="button" class="openBtn" value="댓글 작성하기">
		</c:if>
	</div>

</section>

	<!-- footer import -->
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	<!-- end of footer import -->
	
	<script>
		const open = () => {
			document.querySelector(".modal").classList.remove("hidden");
		}
		const close = () => {
			document.querySelector(".modal").classList.add("hidden");
		}
		
		document.querySelector(".openBtn").addEventListener("click", open);
		document.querySelector(".closeBtn").addEventListener("click", close);
		document.querySelector(".bg").addEventListener("click", close);
	</script>
</body>
</html>