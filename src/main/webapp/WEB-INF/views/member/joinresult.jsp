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
<p id=joinresult><span id=spanid>${userdto.id}</span>님 회원가입 완료되었습니다.</p>
</c:if>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>

