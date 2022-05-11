<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hey,earth</title>
<!-- CSS, JavaScript -->
<link rel="stylesheet" type="text/css" href="css/member/findpwresult.css">
<script src="/jquery-3.6.0.min.js"></script>
<script src="/js/member/findpwresult.js"></script>

</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div id=findpwform>
		<p id=findpwtitle>비밀번호 찾기</p>
		<c:if test="${userpw == null}">
			존재하지 않는 계정입니다<br>
			<button id="joinbtn">회원가입 하러가기</button>
		</c:if>
		<c:if test="${userpw != null}">
			비밀번호 찾기 결과는 '${userpw}' 입니다.<br>
			<button id="joinbtn" hidden=hidden>회원가입 하러가기</button>
			<button id="loginbtn">로그인 하러가기</button>
		</c:if>
	</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>

