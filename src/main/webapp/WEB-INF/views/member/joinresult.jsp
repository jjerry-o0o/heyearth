<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hey,earth</title>
<!-- CSS, JavaScript -->
<link rel="stylesheet" type="text/css" href="css/member/joinresult.css">
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<c:if test="${result == 1}">
<p id=joinresult>${userdto.id}님 회원가입 완료되었습니다.</p>
</c:if>

<div id=btn>
<button id=loginbtn type="button" onclick="location.href='login';">로그인하러가기</button>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>

