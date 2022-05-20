<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/js/mission/zeromission.js"></script>
<link rel="stylesheet" href="/css/mission/zeromission.css" />
</head>

<!-- Talk Talk Banner Script start -->
<script type="text/javascript"
	src="https://partner.talk.naver.com/banners/script"></script>
<div class="talk_banner_div" data-id="114553"
	style="position: fixed; right: 100px; bottom: 30px; z-index: 99;"></div>
<!-- Talk Talk Banner Script end -->


<div style="text-align: center">

	<div style="display: grid; grid-template-columns: 50% auto; width: 80%; margin-left: auto; margin-right: auto;">

		<div style="display: inline-block; height: 800px">
			<img id=preview1 width=400 height=700 />
			<canvas style="display: none" id="canvas" width=400 height=700></canvas>
		</div>

		<div style="display: inline-block; height: 800px">
			
			<h2>제로웨이스트샵 이용하기 미션</h2>
			<label id=filelabel for="file">사진 첨부하기 </label> <input type="file"
				id="file" name=uploadFile><br> <input id="ocrreceipt"
				class="button" type=button value="영수증 인식하기">
			
			<div style="display: grid; grid-template-columns: 50% auto; width: 100%; margin-left: auto; margin-right: auto;">
				<div id="img" style="display:inline-block;"></div>
				<div id="store" style="display:inline-block;"></div>
				</div>
		<div id="nozero"></div>		
		<input style="display:none;" id="board" class="button" type=button value="제로샵 등록 요청" onclick="board()">
		
		<div id="a" style="display:none;">
		
		<form method="post" action="${pageContext.request.contextPath}/register_complete2">
		<input type="hidden" name="m_code" value="1">
				<input name="p_photo" type="hidden" id="p_photo">
				<input name="id" type="hidden" id="id" value="${sessionScope.session_id}">
				<input type="hidden" name="p_complete" value=1>
				<input type="hidden" name="p_point" id="p_point">
				<input type="hidden" name="m_carbon" value="200">
				<input type="hidden" name="p_location" id="p_location">		
				<br>			
				<input type='submit' id='register_complete' class="button" value='미션 완료하기'>
		</form>
		</div>
		</div>

	</div>
	</div>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
