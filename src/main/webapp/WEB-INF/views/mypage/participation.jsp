<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&family=Righteous&family=Josefin+Sans:ital,wght@0,300;0,400;1,300;1,400;1,500;1,600;1,700&family=Noto+Sans+KR:wght@100;300&display=swap');

body{
font-family: 'Noto Sans KR';
}
li{
list-style: none;
}
</style>
</head>
<body>
<h3><마이 페이지></h3>
<h2>내 미션</h2><br>
								${map.count}개의 미션 진행중<br> <br>
					<c:forEach var="row" items="${map.list}">
				<div style="border:3px solid pink">
<img width=200px height=200px src="<%=request.getContextPath()%>/img/${row.m_photo}">
${row.m_name}
					</div>	
					</c:forEach>

				
  
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>