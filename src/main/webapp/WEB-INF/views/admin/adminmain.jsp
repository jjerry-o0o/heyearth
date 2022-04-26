<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/adminheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hey,Earth | Admin Page</title>
<link href="css/admin/admin.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
<script src="jquery-3.6.0.min.js"></script>
<script src="/js/admin/admin.js"></script>
</head>
<body>

<h1 class='adminmain'>관리자 페이지입니다.</h1><br>
<div class='adminbtnall'>
<input type='button' class='adminbtn' id='adminzeroshopbtn' value='지구를 돕는 가게 찾기 관리'><br>
<input type='button' class='adminbtn' id='adminmissionbtn' value='환경 지킴이 모집중 관리'><br>
<input type='button' class='adminbtn' id='adminguidebtn' value='이건 어떻게 버릴까? 관리'><br>
<input type='button' class='adminbtn' id='adminboardbtn' value='게시판 관리'><br>
<input type='button' class='adminbtn' id='adminmemberbtn' value='회원 관리'><br>
</div>

</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>