<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hey,earth</title>
<!-- CSS, JavaScript -->
<link rel="stylesheet" type="text/css" href="css/member/findid.css">
<script src="/jquery-3.6.0.min.js"></script>
<script src="/js/member/login.js"></script>

</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div id=findidform>
		<p id=findidtitle>닉네임 찾기</p>
			
		<form action="findid" method="post">
			<input id="phone" type="text" name="phone" placeholder=" 전화번호" autofocus>
				<div id=phoneerror></div>
			<input id="submit" type="submit" value="닉네임 찾기">
		</form>

	</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>

