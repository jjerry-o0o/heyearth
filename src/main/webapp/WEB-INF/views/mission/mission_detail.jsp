<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/js/mission/mission_detail.js"></script>
<link rel="stylesheet" href="/css/mission/mission_detail.css" />

</head>
<body>

<!-- 그룹미션 참가하기 -->	
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
	
<!-- 상시미션 참가하기&인증하기 -->	
	<div id="modal2" class="modal-overlay2">
		<div class="modal-window2">
			<div class="close-area2" id="modalclose2">X</div>
			<h2 id="modalh22"></h2>
			<div id="register_contents2"></div>
			<form name="form2" method="post"
				action="${pageContext.request.contextPath}/register_complete"
				enctype="multipart/form-data">
				<input type="hidden" name="m_code" value="${group.m_code }">
				<input name="p_photo" type="hidden" id="p_photo"> <input
					name="id" type="hidden" id="id" value="${sessionScope.session_id}">
				<input type="hidden" name="p_complete" value=1> <input
					type="hidden" name="m_point" value="${group.m_point}"> <input
					type="hidden" name="m_carbon" value="${group.m_carbon}"> <input
					name="image" id="input-image" type="file" accept="image/*">
				<input type='submit' id='register_complete' value='참가하기'>
			</form>
		</div>
	</div>
	
<!-- 미션 상세 정보 -->	
	<div style="text-align: center; margin-top: 50px; margin-bottom: 50px;">
		<div>
			<jsp:useBean id="toDate" class="java.util.Date" />
			<fmt:parseDate var="regDate" value="${group.m_date }"
				pattern="yyyy-MM-dd" />
			<fmt:formatDate value="${regDate}" pattern="yyyy-MM-dd" />
			<fmt:parseNumber value="${toDate.time / (1000*60*60*24)}"
				integerOnly="true" var="toDate2" scope="request"></fmt:parseNumber>
			<fmt:parseNumber value="${regDate.time / (1000*60*60*24)}"
				integerOnly="true" var="regDate2" scope="request"></fmt:parseNumber>

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
							<li style="color: blue">정원이 다 찼습니다. 다른 참여자가 미션취소시 신청 수 있습니다.
							</li>
						</c:if>
						<c:if test="${group.m_personnel > 0}">
							<li>남은 모집 인원 : ${group.m_personnel }</li>
							<li><input type="button" value="신청하기" id="groupdetail"
								onclick="groupdetail(${group.m_code})"></li>
						</c:if>
					</c:if>
				</c:if>
				<c:if test="${(regDate2 - toDate2) < 1 }">
					<li style="color: blue"><strong>이미 마감된 미션입니다. 다음 모집 때
							함께해요!</strong></li>
				</c:if>

			</ul>
		</div>

	<!-- 리뷰 목록 -->
		<div
			style="display: inline-block; width: 80%; border: 3px dashed black; border-radius: 5px; background-color: white;">
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
 	인증 사진 : <br>
					<img width=100px height=100px
						src="<%=request.getContextPath()%>/img/${row.p_photo}">
					<br>
 	아직 리뷰가 없습니다.<br>
				</c:if>
				<c:if test="${row.p_review != null}"> 	
 	인증 사진 : <br>
					<img width=100px height=100px
						src="<%=request.getContextPath()%>/img/${row.p_photo}">
					<br>
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