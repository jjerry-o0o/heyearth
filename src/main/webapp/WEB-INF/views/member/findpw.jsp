<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hey,earth</title>
<!-- CSS, JavaScript -->
<link rel="stylesheet" type="text/css" href="css/member/findpw.css">
<script src="/jquery-3.6.0.min.js"></script>
<script src="/js/member/findpw.js"></script>

</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div id=findpwform>
		<p id=findpwtitle>비밀번호 찾기</p>
			
		<form action="findpw" method="post">
			<input id="nickname" type="text" name="id" placeholder=" 닉네임" autofocus>
				<div id=nicknameerror></div>
			<input id="phone" type="text" name="phone" placeholder=" 전화번호 (ex.010-1234-1234)" autofocus>
				<div id=phoneerror></div>
			<input id="submit" type="submit" value="비밀번호 찾기">
		</form>

	</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>

