<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hey,earth</title>
<!-- CSS, JavaScript -->
<link rel="stylesheet" type="text/css" href="css/member/join.css">
<script src="/jquery-3.6.0.min.js"></script>
<script src="/js/member/join.js"></script>

</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div id=joinform>
		<p id=jointitle>회원가입</p>
		<form action="join" method="post">
			<input id="nickname" type="text" name="id" placeholder=" 닉네임" autofocus>
			<input id="nicknamebtn" type="button" value="중복확인"><br>
				<div id=nicknameerror></div>
			<input id="pw" type="password" name="pw" placeholder=" 비밀번호"><br>
				<div id=pwerror></div>
			<input id="pwck" type="password" name="pwck" placeholder=" 비밀번호 재확인"><br>
				<div id=pwckerror></div>
			<input id="phone" type="text" name="phone" placeholder=" 전화번호 (ex.010-1234-1234)"><br>
				<div id=phoneerror></div>
			<input id="submit" type="submit" value="회원가입">
		</form>
	</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>

