<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/adminheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hey,Earth | Admin Page</title>
<link href="css/admin/adminreview.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
<script src="jquery-3.6.0.min.js"></script>
<script src="/js/admin/adminreview.js"></script>

</head>
<body>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1 class='adminmain'>'리뷰 관리' 페이지입니다.</h1><br>

<div class='admincontext'>
	<c:forEach items="${reviewlist}" var="reviewlist">
		<c:if test="${reviewlist.m_name != 'none' }">		
			<div class='review'>
				<div class='reviewinfo'><img class='reviewimg' src="img/${reviewlist.p_photo }"></div>
				<div class='reviewinfo'>닉네임 : ${reviewlist.id }<br>
				받은 신고 수 : <span style="color:red;font-size:20px; font-weight:700;">${reviewlist.p_redcard }</span><br>
				<c:if test="${reviewlist.p_star != 0 }">
					별점 : ${reviewlist.p_star }<br>
				</c:if>
				<c:if test="${reviewlist.p_review != null }">
					<div class='reviewcontent'>${reviewlist.p_review }</div>
				</c:if>
				<c:if test="${reviewlist.p_review == null }">
					아직 리뷰가 없습니다.
				</c:if>
				</div><br>
				<input type="button" class="reviewbtn" value="수정하기" onclick='reviewmod(${reviewlist.p_code})'>
				<input type="button" class="reviewbtn" value="삭제하기" onclick='reviewdel(${reviewlist.p_code})'>
			</div>
		</c:if>
		<c:if test="${reviewlist.m_name == 'none' }">
			<div class='noreview'>
				미션에 참여한 사람이 없습니다.
				
			</div>
		</c:if>
	</c:forEach> 
	<br>
	<br>
	<br>
	<br>
	<input type="button" class="reviewbtn" value="목록으로" onclick='missionlist()'>
	<br>
	<br>
	<br>
	
</div>

</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>