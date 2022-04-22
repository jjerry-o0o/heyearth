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
		font-size: 15px;
		color: #1A271D;
		text-align: center;
	
}
.aheader_a:hover{
		font-weight: 800;
		font-size:15px;
}
.nav {/* 메뉴바 */
	display:inline-block;
	margin-top: 15px;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 15px;
	text-align: center;
	width : 80%;
}
.aheader_ul> .aheader_li {
	display: inline-block;
	width: 200px;
	vertical-align: top;
	text-align: center;
}
</style>


</head>
<body>
<!-- 헤더 시작 -->
<div style="background-color:#F6F5F0;text-align: center;">

<!-- 메뉴바 목록 -->
	<div class="nav">
			<ul class="aheader_ul">
				<li class="aheader_li"><a  class="aheader_a" href="${pageContext.request.contextPath}/adminzeroshop">지구를 돕는 가게 찾기 관리</a></li>
				<li class="aheader_li"><a class="aheader_a" href="${pageContext.request.contextPath}/adminmission">환경지킴이 모집중 관리</a></li>
				<li class="aheader_li"><a class="aheader_a" href="${pageContext.request.contextPath}/adminguide">이건 어떻게 버릴까? 관리</a></li>
				<li class="aheader_li"><a class="aheader_a" href="${pageContext.request.contextPath}/adminboard">게시판 관리</a></li>
				<li class="aheader_li"><a class="aheader_a" href="${pageContext.request.contextPath}/adminmember">회원 관리</a></li>
		   </ul>
	</div>
</div>
</body>
</html>