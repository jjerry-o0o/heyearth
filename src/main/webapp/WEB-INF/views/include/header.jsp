<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hey,earth</title>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&family=Righteous&family=Josefin+Sans:ital,wght@0,300;0,400;1,300;1,400;1,500;1,600;1,700&family=Noto+Sans+KR:wght@100;300&display=swap');
</style>
<link href="<%=request.getContextPath()%>/css/header.css" rel="stylesheet">
</head>
<body>

<!-- 헤더 시작 -->
<header>

<!-- 로그인 전 오른쪽 상단 메뉴-->
		<c:if test="${empty id }">
		<div class="JoinLogin"  style="font-size: 15px"><a href="join">회원가입</a>&nbsp;/
		<a href="${pageContext.request.contextPath}/login">로그인</a></div>
		</c:if>

<!-- 로그인 후 오른쪽 상단 메뉴-->
		<c:if test="${!empty id }">
		    <div align="right" class="JoinLogin"  style="font-size: 15px">
		    <a style="margin-right:30px;" href="${pageContext.request.contextPath}/mypagemain">What's Up, <span>${id}</span> !</a>
			<a href="${pageContext.request.contextPath}/mypagemain">마이페이지</a>&nbsp;/
			<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
			</div>
		 </c:if>	 

<!-- Hey, Earth 메인 로고 -->
		<h1 class="hey"><a style="font-family:Righteous" href="${pageContext.request.contextPath}/main"><ins>Hey, Earth</ins></a></h1>
		
<!-- 메뉴바 목록 -->
	<nav>
		<div style="background-color: white">
		 <HR>
			<ul class="list">

				<li><a href="${pageContext.request.contextPath}/about">헤이얼스란?</a></li>
	
				<li><a href="${pageContext.request.contextPath}/zeroshop">지구를 돕는 가게 찾기</a></li>
	
				<li><a href="${pageContext.request.contextPath}/mission">환경 지킴이 모집중</a></li>
				
				<li><a href="${pageContext.request.contextPath}/recycling">이건 어떻게 버릴까?</a></li>
				
				<li><a href="${pageContext.request.contextPath}/boardlist">게시판</a></li>
			
		   </ul>
		 <HR>
		</div>
	</nav>
</header>
</body>
</html>