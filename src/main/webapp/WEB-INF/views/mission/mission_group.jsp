<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %> 
<%@ include file="/WEB-INF/views/include/header.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
li {
	list-style: none;
}
.p_img{
width:100px;
height:100px;
}
.modal-overlay, .modal-overlay2 {
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

.modal-window, .modal-window2 {
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

.close-area, .close-area2 {
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
function readImage(input){
	if(input.files && input.files[0]){
		// FileReader 인스턴스 생성
		const reader = new FileReader()
		
		// 이미지가 로드된 경우
		reader.onload = e =>{
			const previewImage = document.getElementById("previewimg")
			previewImage.src = e.target.result
		}
		
		// reader가 이미지 읽도록 하기
		reader.readAsDataURL(input.files[0])
	}
}
function solodetail(code){
	$.ajax({
		url : "/solodetail",
		type : "get",
		data : {"m_code" : code},
		success : function(solo){
			document.getElementById("modal2").style.display = "flex";
			$('html').scrollTop(0);
			$("#modalh22").text(solo.m_name);
			$("#register_contents2").html("사진을 찍고 미션을 완료해주세요.<br><br>");
			$("#register_contents2").append("포인트 획득: " + solo.m_point + "<br>");
			$("#register_contents2").append("탄소배출 감소량 : " + solo.m_carbon + "g<br>");
			$("#register_contents2").append("미션방법 : " + solo.m_inform + "<br>");
			$("#register_contents2").append("<span style='color:orange'>인증 사진을 올려주세요!</span><br>");
			$("#register_contents2").append("<img class=p_img id=previewimg><br>");
			$("#p_photo").val(solo.p_photo); 
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
$("#modalclose2").on("click",function(){
	document.getElementById("modal2").style.display = "none";
});

//모달창 외부클릭시 모달창 닫기
modal2.addEventListener("click", e => {
	const evTarget = e.target
	if(evTarget.classList.contains("modal-overlay2")) {
    	modal2.style.display = "none";
	}
});
}); // document ready end

$(document).ready(function(){

	const inputImage = document.getElementById("input-image")
	inputImage.addEventListener("change", e => {
    	readImage(e.target)
	})

	
$(".redcard").on("click",function(){
	var result = confirm('이 인증사진을 신고하시겠습니까?'); 
	if(result) { 
alert("신고되었습니다.");
	} else { 
			}
});
});//ready end


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
	<div id="modal2" class="modal-overlay2">
		<div class="modal-window2">
			<div class="close-area2" id="modalclose2">X</div>
			<h2 id="modalh22"></h2>
			<div id="register_contents2"></div>
		
			<form name="form2" method="post" action="${pageContext.request.contextPath}/register_complete" enctype="multipart/form-data"> 
 <input type="hidden" name="m_code" value="${group.m_code }">
		<input name="p_photo" type="hidden" id="p_photo">
		<input name="id" type="hidden" id="id" value="${sessionScope.session_id}">
		<input type="hidden" name="p_complete" value=1>
		<input type="hidden" name="m_point" value="${group.m_point}">
		<input type="hidden" name="m_carbon" value="${group.m_carbon}">
		<input name="image" id="input-image" type="file" accept="image/*">
		
		<input type='submit' id='register_complete' value='참가하기'>
		</form>
		</div>
	</div>
	<div style="text-align:center; margin-top: 50px; margin-bottom: 50px;">
	<div>
	<jsp:useBean id="toDate" class="java.util.Date" />
<fmt:parseDate var="regDate" value="${group.m_date }" pattern="yyyy-MM-dd" />
<fmt:formatDate value="${regDate}" pattern="yyyy-MM-dd" />
<fmt:parseNumber value="${toDate.time / (1000*60*60*24)}" integerOnly="true" var="toDate2" scope="request"></fmt:parseNumber>
<fmt:parseNumber value="${regDate.time / (1000*60*60*24)}" integerOnly="true" var="regDate2" scope="request"></fmt:parseNumber>

<c:if test="${group.m_type == 'group'}">
단체 미션은 활동일 하루 전까지 신청가능합니다!<br>
<c:if test="${regDate2 > toDate2}">
미션일까지 ${regDate2 - toDate2}일 남았습니다.<br>
    신청은 ${regDate2 - toDate2 -1}일 뒤 종료됩니다.
  </c:if>
<c:if test="${regDate2 == toDate2}">오늘 활동 예정인 미션입니다(어제 마감)</c:if>
<c:if test="${regDate2 < toDate2}"></c:if>
</c:if>

<c:if test="${group.m_type == 'solo'}">
상시미션은 언제든지 신청가능합니다!<br>
지금 당장 신청해보세요.
</c:if>
		<ul>
			<li><img width=200px height=200px
				src="<%=request.getContextPath()%>/img/${group.m_photo}"></li>
			<li>미션 이름 : ${group.m_name }</li>
			<li>장소 : ${group.m_location }</li>
			<li>정보 : ${group.m_inform }</li>
			<li>타입 : ${group.m_type }</li>
			<li>날짜 : ${group.m_date }</li>
			<li>포인트 : ${group.m_point }</li>
			<li>탄소 배출 감소량 : ${group.m_carbon }</li>
			<c:if test="${(regDate2 - toDate2) > 0 }">
				<c:if test="${group.m_type == 'solo'}">
			<li><input type="button" value="상시미션신청하기" id="solodetail"
				onclick="solodetail(${group.m_code})"></li>
				</c:if>
				<c:if test="${group.m_type == 'group'}">
			<c:if test="${group.m_personnel <= 0 }">
			<li style="color:blue">정원이 다 찼습니다. 다른 참여자가 미션취소시 신청 수 있습니다. </li>
			</c:if>
			<c:if test="${group.m_personnel > 0}">
			<li>남은 모집 인원 : ${group.m_personnel }</li>
			<li><input type="button" value="신청하기" id="groupdetail"
				onclick="groupdetail(${group.m_code})"></li>
			</c:if>
				</c:if>
				</c:if>
				<c:if test="${(regDate2 - toDate2) < 1 }">
				<li style="color:blue"><strong>이미 마감된 미션입니다. 다음 모집 때 함께해요!</strong></li>
				</c:if>

		</ul>
	</div>
	<div style="display:inline-block; width:80%; border:3px dashed black; border-radius: 5px; background-color: white;">
	<c:forEach items="${map.list }" var="star">
 	<div>별점 : ${star.p_star}</div>
 	</c:forEach>
 	별점 준 사람 수 : ${map.count }
	<h3>리뷰입니다.</h3>
		<c:forEach items="${review }" var="row">
 	<hr>
 	참가코드 : ${row.p_code }<br>
 	닉네임 : ${row.id }<br>
 	등급 : ${row.grade }<br>
 	<c:if test="${row.p_review == null}">
 	인증 사진 : <br><img width=100px height=100px src="<%=request.getContextPath()%>/img/${row.p_photo}"><br>
 	아직 리뷰가 없습니다.<br>
 	</c:if>
 	<c:if test="${row.p_review != null}"> 	
 	인증 사진 : <br><img width=100px height=100px src="<%=request.getContextPath()%>/img/${row.p_photo}"><br>
 	별점 : ${row.p_star }<br>
 	리뷰:${row.p_review }<br>
 	</c:if>
 	<input type=button value=신고하기 class="redcard">
		</c:forEach>
	</div>
	</div>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>