<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hey,earth</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap');

.aheader_ul, .aheader_li {
	list-style: none;	
	padding : 0;
}
.aheader_a {
	text-decoration: none;
		font-weight: 500;
		font-size: 20px;
		color: #1A271D;
		text-align: center;
	
}
.aheader_a:hover{
		font-weight: 800;
		font-size:20px;
}
.nav {
	display:inline-block;
	margin-top: 15px;
	margin-left : auto;
	margin-right: auto;
	margin-bottom: 70px;
	text-align: center;
	width : 80%;
}
.aheader_ul> .aheader_li {
	display: inline-block;
	margin-left : 30px;
	margin-right : 30px;
	vertical-align: top;
	text-align: center;
}

</style>

<link href="/css/header.css" rel="stylesheet">


</head>
<body>
<!-- 헤더 시작 -->
<header style="background-color:#F6F5F0">

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
			<a class="header_j" href="${pageContext.request.contextPath}/adminmypage">마이페이지</a>&nbsp;/
			<a class="header_j" href="${pageContext.request.contextPath}/logout" onclick="alert('로그아웃 되었습니다.');">로그아웃</a>
			</div>
		 </c:if>	 
</div>
	<a href="${pageContext.request.contextPath}/adminmain"><img class="header_img" src="${pageContext.request.contextPath}/img/logo.png"></a>
	

<!-- 메뉴바 목록 -->
	<nav class='nav'>
			<ul class="aheader_ul">
				<li class="aheader_li"><a  class="aheader_a" href="${pageContext.request.contextPath}/adminzeroshop">지구를 돕는 가게 찾기 관리</a></li>
				<li class="aheader_li"><a class="aheader_a" href="${pageContext.request.contextPath}/adminmission">환경지킴이 모집중 관리</a></li>
				<li class="aheader_li"><a class="aheader_a" href="${pageContext.request.contextPath}/adminguide">이건 어떻게 버릴까? 관리</a></li>
				<li class="aheader_li"><a class="aheader_a" href="${pageContext.request.contextPath}/adminboard">게시판 관리</a></li>
				<li class="aheader_li"><a class="aheader_a" href="${pageContext.request.contextPath}/adminmember">회원 관리</a></li>
		   </ul>
	</nav>
</header>
</body>
</html>