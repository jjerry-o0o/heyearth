<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css 모두 정리후 분리할 예정 -->
<style>
.my_img{
width:200px; 
height:200px; 
}
.my_mission{
margin-left:10px; 
width:80%; 
border:3px solid #1A271D;
}
</style>

</head>
<body>
<h2>나의 미션</h2><br>
<h3>${map.count}개의 미션 진행중</h3><br><br>

<!-- 내가 신청한 미션 목록 -->
	<c:forEach var="row" items="${map.list}">
		<div class="my_mission">
     	      <img class="my_img" src="<%=request.getContextPath()%>/img/${row.m_photo}">
        	  <h3>${row.m_name}</h3>
          	  미션 날짜 : ${row.m_date}<br>
          	  신청인원 : ${row.p_friends }명<br>
		      <a href="delete?p_code=${row.p_code}">미션 취소</a>
	    </div>	
	</c:forEach>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>