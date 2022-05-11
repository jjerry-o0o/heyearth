<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hey,earth</title>
<!-- CSS, JavaScript -->
<link rel="stylesheet" type="text/css" href="css/member/findidresult.css">
<script src="/jquery-3.6.0.min.js"></script>
<script src="/js/member/findidresult.js"></script>

</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div id=findidform>
		<p id=findidtitle>닉네임 찾기</p>
		<c:if test="${userid == null}">
			닉네임을 찾지 못하였습니다.<br>
			<button id="joinbtn">회원가입 하러가기</button>
		</c:if>
		<c:if test="${userid.contains('탈퇴')}">
			탈퇴한 회원입니다.<br>
			<button id="joinbtn">회원가입 하러가기</button>
		</c:if>
		<c:if test="${userid != null and !userid.contains('탈퇴')}">
			닉네임 찾기 결과는 '${userid}' 입니다.<br>
			<button id="joinbtn" hidden=hidden>회원가입 하러가기</button>
			<button id="loginbtn">로그인 하러가기</button>
		</c:if>
	</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>

