<%@page import="zeroshop.ZeroshopDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/adminheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hey,Earth | Admin Page</title>
<link href="css/admin/adminmodinsert.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
<script src="jquery-3.6.0.min.js"></script>
<script src="/js/admin/adminmissionmod.js"></script>

</head>
<body>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1 class='adminmain'>'환경 지킴이 모집중' 수정하기</h1><br>
<form action='adminmissionmodinfo' method='post' enctype="multipart/form-data">
<input name="m_code" type="hidden" value=${missioninfo.m_code}>
<input id="m_type" name="m_type" type="hidden" value="${missioninfo.m_type }">
<input id="m_name" name="m_name" type="hidden" value="${missioninfo.m_name }">
<div class='admincontext'>
	<table class='adminmodinserttable'>
		<c:if test="${missioninfo.m_type == 'group' }">		
			<tr><td>타입</td><td>단체</td></tr>
		</c:if>
		<c:if test="${missioninfo.m_type == 'solo' }">
			<tr><td>타입</td><td>상시</td></tr>
		</c:if>
		<tr><td>이름</td><td>${missioninfo.m_name }</td></tr>		
		<tr><td>위치</td><td id="location"><input id="m_location" name="m_location" class="admintd" type="text" value="${missioninfo.m_location}" required></td></tr>
		<tr><td>날짜</td><td id="date"><input id="m_date" name="m_date" class="admintd" type="date" value="${missioninfo.m_date}" required></td></tr>
		<tr><td>간단한 소개</td><td><input id="m_inform" name="m_inform" class="admintd" type="textarea" maxlength=300 value="${missioninfo.m_inform}" required></td></tr>
		<tr><td>감소시킨 탄소배출량</td><td><input id="m_carbon" name="m_carbon" class="admintd" type="number" value="${missioninfo.m_carbon}" min="0" required></td></tr>
		<tr><td>포인트</td><td><input id="m_point" name="m_point" class="admintd" type="number" value="${missioninfo.m_point}" min="0" required></td></tr>
		<tr><td>미션인원</td><td id="personnel"><input id="m_personnel" name="m_personnel" class="admintd" type="number"  value="${missioninfo.m_personnel}" min="0" required></td></tr>
		<tr><td>사진</td>
		<td>
		<img id="previewimg" src="img/${missioninfo.m_photo}" onerror="this.src='/img/noimage.jpg'">
		<input name="m_photo" type="hidden" value=${missioninfo.m_photo }>
		<input name="image" id="input-image" class="admintd" type="file" accept="image/*"></td></tr>
	</table>
</div>
<div class='adminbtn'>
<input class="adminback" id="missionback" type="button" value="취소">
<input class="adminend" id="missionend" type="submit" value="수정완료하기">
</div>
</form>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>