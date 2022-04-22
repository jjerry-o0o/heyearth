<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ page import="java.util.Date" %> 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
li {
	list-style: none;
}

.modal-overlay {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background: rgba(0, 0, 0, 0.5);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(1.5px);
	-webkit-backdrop-filter: blur(1.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	display: none;
}

.modal-window {
	background-color: #F6F5F0;
	color: #1A271D box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(13.5px);
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 5px solid #1A271D;
	width: 400px;
	height: 500px;
	position: relative;
	padding: 10px;
}

.close-area {
	display: inline;
	float: right;
	padding-right: 10px;
	cursor: pointer;
}
</style>
<script src="/jquery-3.6.0.min.js"></script>
<script>
//미션 참가 모달창
function groupdetail(code){
	$.ajax({
		url : "/groupdetail",
		type : "get",
		data : {"m_code" : code},
		success : function(group){
			document.getElementById("modal").style.display = "flex";
			$('html').scrollTop(0);
			$("#modalh2").text(group.m_name);
			$("#register_contents").html("날짜 : " + group.m_date + "<br>");
			$("#register_contents").append("모집중인 인원 : " + group.m_personnel + "명<br>");
		}
	});
}
//모달창 닫기버튼
$(document).ready(function(){
$("#modalclose").on("click",function(){
	document.getElementById("modal").style.display = "none";
});

//모달창 외부클릭시 모달창 닫기
modal.addEventListener("click", e => {
	const evTarget = e.target
	if(evTarget.classList.contains("modal-overlay")) {
    	modal.style.display = "none";
	}
});
}); // document ready end
</script>
</head>
<body>


	<div id="modal" class="modal-overlay">
		<div class="modal-window">
			<div class="close-area" id="modalclose">X</div>
			<h2 id="modalh2"></h2>
			<div id="registerbtn"></div>
			<div id="register_contents"></div>
			<form name="form1" method="post"
				action="${pageContext.request.contextPath}/register">
				<input type="hidden" name="m_code" value="${group.m_code }">
				<input type="hidden" name="p_friends" value=1>
				<div>
					<input type='submit' id='participation' value='참가하기'>
				</div>
			</form>
		</div>
	</div>
	<div style="margin-bottom: 50px">
	<jsp:useBean id="toDate" class="java.util.Date" />
<fmt:parseDate var="regDate" value="${group.m_date }" pattern="yyyy-MM-dd" />
<fmt:formatDate value="${regDate}" pattern="yyyy-MM-dd" />
<fmt:parseNumber value="${toDate.time / (1000*60*60*24)}" integerOnly="true" var="toDate2" scope="request"></fmt:parseNumber>
<fmt:parseNumber value="${regDate.time / (1000*60*60*24)}" integerOnly="true" var="regDate2" scope="request"></fmt:parseNumber>

	미션일까지 ${regDate2 - toDate2}일 남았습니다.
    신청은 ${regDate2 - toDate2 -1}일 뒤 종료됩니다.
<c:if test="${regDate2 > toDate2}">여유롭게 신청해주세요</c:if>
<c:if test="${regDate2 == toDate2}">마감임박</c:if>
<c:if test="${regDate2 < toDate2}">마감된 미션</c:if>
		<ul>
			<li><img width=200px height=200px
				src="<%=request.getContextPath()%>/img/${group.m_photo}"></li>
			<li>미션 이름 : ${group.m_name }</li>
			<li>장소 : ${group.m_location }</li>
			<li>정보 : ${group.m_inform }</li>
			<li>타입 : ${group.m_type }</li>
			<li>날짜 : ${group.m_date }</li>
			<li>포인트 : ${group.m_point }</li>
			<li>탄소배출감소량 : ${group.m_carbon }</li>
			<li>최대 인원 : ${group.m_personnel }</li>
			<li><input type="button" value="신청하기" id="groupdetail"
				onclick="groupdetail(${group.m_code})"></li>

		</ul>
	</div>
	<div>
	<h3>리뷰입니다.</h3>
		<c:forEach items="${review }" var="row">
 	<hr>
 	참가코드 : ${row.p_code }<br>
 	닉네임 : ${row.id }<br>
 	<c:if test="${row.p_review == null}">
 	인증 사진 : <br><img width=100px height=100px src="<%=request.getContextPath()%>/img/${row.p_photo}"><br>
 	아직 리뷰가 없습니다.<br>
 	</c:if>
 	<c:if test="${row.p_review != null}"> 	
 	인증 사진 : <br><img width=100px height=100px src="<%=request.getContextPath()%>/img/${row.p_photo}"><br>
 	별점 : ${row.p_star }<br>
 	<%-- <c:forEach items="${review }" var="star">
 	star.p.complete
 	star.p_star
 	</c:forEach> --%>
 	리뷰:${row.p_review }<br>
 	</c:if>
 	<input type=button value=신고하기>
		</c:forEach>
	</div>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>