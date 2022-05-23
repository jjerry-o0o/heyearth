<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function () {
		
	});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		<textarea id="c_comment2" name="c_comment" placeholder="댓글을 입력해주세요"></textarea>
		<input type="hidden" class="id" name="id" value="${sessionScope.session_id }">
		<input type="hidden" class="b_no" name="b_no" value="${dto.b_no }">
		<input type="hidden" class="c_order" value="${dto.c_index }">
	</form>

</body>
</html>