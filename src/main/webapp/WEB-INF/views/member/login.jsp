<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hey,earth</title>
<!-- CSS, JavaScript -->
<link rel="stylesheet" type="text/css" href="css/member/login.css">
<script src="/jquery-3.6.0.min.js"></script>
<script src="/js/member/login.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div id=loginform>
		<p id=logintitle>로그인</p>
			<!-- 사용자 여부 체크 -->
			<c:if test="${msg != null}">
				<div>
					<span id= loginresult>${msg}</span>
				</div>
			</c:if>
		<form action="login" method="post">
			<input id="nickname" type="text" name="id" placeholder=" 닉네임" autofocus>
				<div id=nicknameerror></div>
			<input id="pw" type="password" name="pw" placeholder=" 비밀번호"><br>
				<div id=pwerror></div>
			<input id="submit" type="submit" value="로그인">
		</form>
		<a href=${pageContext.request.contextPath}/findid id=findid>닉네임 찾으러 가기</a> &nbsp | &nbsp
		<a href=${pageContext.request.contextPath}/findpw id=findpw>비밀번호 찾으러 가기</a>
	</div>
	<c:if test="${del != null}">
		<script>
		Swal.fire({ 
			icon: 'error', // Alert 타입
			title: '죄송합니다.', // Alert 제목 
			text: '${del}', // Alert 내용 
		}).then(function(){			
			location.reload();
		});
		</script>
		
	</c:if>
	
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>

