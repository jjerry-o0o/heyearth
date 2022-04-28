<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hey,earth</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap');
</style>

<link href="<%=request.getContextPath()%>/css/header.css" rel="stylesheet">

</head>
<body>

<!-- 헤더 시작 -->
<header style="background-color:#F6F5F0; ">

<div class="JoinLoginAll">

<!-- 로그인 전 오른쪽 상단 메뉴-->
		<c:if test="${sessionScope.session_id == null }">
		<div class="JoinLogin" ><a class="header_j" href="/join">회원가입</a>&nbsp;<span>/</span>
		<a class="header_j" href="${pageContext.request.contextPath}/login">로그인</a></div>
		</c:if>
		
<!-- 로그인 후 오른쪽 상단 메뉴-->
		<c:if test="${sessionScope.session_id != null }">
			<div class="JoinLogin">
			
		    <a class="header_j" style="margin-right:30px;" href="${pageContext.request.contextPath}/mypage">What's Up, <span class="whatsup_id">${sessionScope.session_id}</span> !</a>
			<a class="header_j" href="${pageContext.request.contextPath}/mypage">마이페이지</a>&nbsp;/
			<a class="header_j" href="${pageContext.request.contextPath}/logout" onclick="alert('로그아웃 되었습니다.');">로그아웃</a>
			</div>
		 </c:if>	 
</div>

<!-- Hey, Earth 메인 로고 -->
		<a href="${pageContext.request.contextPath}/"><img class="header_img" src="${pageContext.request.contextPath}/img/logo.png"></a>

		
<!-- 메뉴바 목록 -->
	<nav>
			<ul class="header_ul">
				<li class="header_li"><a class="header_a" href="${pageContext.request.contextPath}/about">헤이얼스란?</a></li>
				<li class="header_li"><a class="header_a" href="${pageContext.request.contextPath}/zeroshop">지구를 돕는 가게 찾기</a></li>
				<li class="header_li"><a class="header_a" href="${pageContext.request.contextPath}/mission">환경 지킴이 모집중</a></li>
				<li class="header_li"><a class="header_a" href="${pageContext.request.contextPath}/recycling">이건 어떻게 버릴까?</a></li>
				<li class="header_lib"><a  class="header_b" href="${pageContext.request.contextPath}/boardlist">게시판</a></li>
		   </ul>
	</nav>
</header>
</body>
</html>