<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="/jquery-3.6.0.min.js"></script>

</head>
<body>


<!-- Talk Talk Banner Script start -->
	<script type="text/javascript" src="https://partner.talk.naver.com/banners/script"></script>
	<div class="talk_banner_div" data-id="114553" style="position: fixed; right: 100px; bottom: 30px; z-index: 99;"></div>
<!-- Talk Talk Banner Script end -->


<div style="text-align: center; margin-bottom:50px;">
<h2>나의 가이드</h2>
<h3></h3><br><br>

<!-- 스크랩한 가이드 목록 -->
	<c:forEach var="row" items="${map.list}" >
		<div style="border: 2px solid black">
		가이드 코드 : ${row.mg_code }<br>
		재활용 코드 : ${row.r_code }<br>
		재활용 분류 : ${row.r_class }<br>
		 <img width=200px height=200px src="<%=request.getContextPath()%>/img/${row.r_photo }"><br>
		재활용 이름 : ${row.r_name }<br>
		재활용 방법 : ${row.r_way }<br>
		<a href="delete_guide?mg_code=${row.mg_code}&r_code=${row.r_code}">삭제하기</a><br>
</div>
	</c:forEach>
	</div>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>