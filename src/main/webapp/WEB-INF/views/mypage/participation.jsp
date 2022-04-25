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
<script type="text/javascript" src="/js/mypage/participation.js"></script>
<link rel="stylesheet" href="/css/mypage/participation.css" />

</head>
<body>

<!-- 미션 인증 -->
	<div id="modal" class="modal-overlay">
		<div class="modal-window">
			<div class="close-area" id="modalclose">X</div>
			<h2 id="modalh2"></h2>
			<div id="registerbtn"></div>
			<div id="register_contents"></div>
			<form name="form2" method="post"
				action="${pageContext.request.contextPath}/complete"
				enctype="multipart/form-data">
				<input type="hidden" name="p_code" id="p_code"> <input
					type="hidden" name="m_code" id="m_code"> <input
					type="hidden" name="id" id="id"> <input type="hidden"
					name="point" id="point"> <input type="hidden"
					name="m_point" id="m_point"> <input type="hidden"
					name="carbon" id="carbon"> <input type="hidden"
					name="m_carbon" id="m_carbon"> <input type="hidden"
					name="m_personnel" id="m_personnel"> <input type="hidden"
					name="p_friends" id="p_friends"> <input type="hidden"
					name="p_complete" id="p_complete"> <input name="p_photo"
					type="hidden" id="p_photo"> <input name="image"
					id="input-image" type="file" accept="image/*"> <input
					class="back" type="button" value="취소"> <input type='submit'
					id='complete' value="인증완료!">
			</form>
		</div>
	</div>

<!--  미션 리뷰 -->
	<div id="modal3" class="modal-overlay2">
		<div class="modal-window2">
			<div class="close-area2" id="modalclose2">X</div>
			<h2 id="modalh4"></h2>
			<div id="registerbtn"></div>
			<div id="register_contents2"></div>
			<form name=form3 method=post
				action='${pageContext.request.contextPath}/review'>
				<input type=hidden name=p_code id=p_code2> <input
					name=p_star type=number id=p_star><br> <input
					name=p_review type=text placeholder="자유롭게 후기를 적어주세요!" id=p_review>
				<input class=back type=button value=취소> <input type=submit
					id=review value=리뷰완료!>
			</form>

		</div>
	</div>
	<div style="text-align: center; margin-bottom: 50px;">
		<h2>나의 미션</h2>
		<h3>${map.count}개의미션 진행중</h3>
		<br>
		<br>

	<!-- 내가 신청한 미션 목록 -->
		<c:forEach var="row" items="${map.list}">
			<div class="my_mission"
				style="display: grid; grid-template-columns: 30% auto; margin-left: auto; margin-right: auto; margin-bottom: 10px; width: 60%; border: 3px solid #1A271D;">
				<div style="display: inline-block">
					<c:if test="${row.p_photo == null }">
						<img class="my_img"
							src="<%=request.getContextPath()%>/img/nophoto.jpg">
						<br>
						<a href="delete?p_code=${row.p_code}&m_code=${row.m_code}">미션
							취소</a>
						<br>
						<input type="button" value="인증하기" id="mymission_detail"
							onclick="mymissiondetail(${row.p_code})">
					</c:if>
					<c:if test="${row.p_photo != null }">
						<input id="hiddenphoto${row.p_code }" type="hidden"
							value="img/${row.p_photo}">
						<canvas width="250px" height="250px" id="myCanvas${row.p_code }"></canvas>
						<span style="font-size: large; font-weight: 700; color: green;">${row.m_point}p</span> 포인트를 획득했습니다.<br>
						<span style="font-size: large; font-weight: 700; color: green;">${row.m_carbon }g</span>의 탄소배출량을 줄였습니다.<br>
						<c:if test="${row.p_review == null }">
							<input type="button" value="리뷰작성" id="mymission_review"
								onclick="mymissiondetail2(${row.p_code})">
						</c:if>
						<c:if test="${row.p_review != null }">
							<span style="font-size: large; font-weight: 700; color: orange;">내
								별점은 ${row.p_star}점!</span>
							<br>
		     나의 리뷰는 : ${row.p_review}<br>
						</c:if>
					</c:if>
				</div>
				<div style="display: inline-block">
					<h3>${row.m_name}</h3>
					미션 참가 코드 : ${row.p_code}<br> 미션 완료? : ${row.p_complete}<br>
					미션 날짜 : ${row.m_date}<br>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>