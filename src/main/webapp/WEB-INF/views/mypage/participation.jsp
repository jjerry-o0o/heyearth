<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>
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

	<!-- Talk Talk Banner Script start -->
	<script type="text/javascript"
		src="https://partner.talk.naver.com/banners/script"></script>
	<div class="talk_banner_div" data-id="114553"
		style="position: fixed; right: 100px; bottom: 30px; z-index: 99;"></div>
	<!-- Talk Talk Banner Script end -->


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
					id="input-image" type="file" accept="image/*" required> <br>
				<br>
				<input type='submit' class="button" id='complete' value="인증완료!">
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
				<br>별점 <input type=hidden name=p_code id=p_code2> <input
					name=p_star type=number id=p_star min="1" max="5" step="1"
					value="5" required> <br>
				<br>
				<textarea name=p_review rows="10" cols="40"
					placeholder="자유롭게 후기를 적어주세요! 글자수는 200자로 제한됩니다." id=p_review
					required></textarea>
				<br> <br>
				<input type=submit class="button" id=review value=리뷰완료!>
			</form>

		</div>
	</div>
	<div style="text-align: center; margin-bottom: 50px;">
		<h2>나의 참가 미션</h2>
		<br> <br>


		<jsp:useBean id="toDate" class="java.util.Date" />
		<fmt:parseNumber value="${toDate.time / (1000*60*60*24)}"
			integerOnly="true" var="toDate2" scope="request"></fmt:parseNumber>

		<!-- 내가 신청한 미션 목록 -->
		<div class="complete">
			<c:forEach var="row" items="${map.list}">
				<fmt:parseDate var="regDate" value="${row.m_date }"
					pattern="yyyy-MM-dd" />
				<fmt:parseNumber value="${regDate.time / (1000*60*60*24)}"
					integerOnly="true" var="regDate2" scope="request"></fmt:parseNumber>
				<div class="my_mission"
					style="display: grid; grid-template-columns: 30% auto; margin-left: auto; margin-right: auto; margin-bottom: 10px; width: 60%; border: 3px solid #1A271D;">
					<div
						style="display: inline-block; padding-top: 10px; padding-left: 10px;">


						<c:if test="${row.p_photo == null }">
							<c:if test="${(regDate2 - toDate2) >=0 }">
								<img class="my_img"
									src="<%=request.getContextPath()%>/img/nophoto.jpg">
								<br>
								<a style="display: inline-block; text-decoration-line: none;"
									class="button"
									href="delete?p_code=${row.p_code}&m_code=${row.m_code}">미션취소</a>
					미션날짜를 기다려주세요!
					</c:if>
							<c:if test="${(regDate2 - toDate2) <0 }">
								<img class="my_img"
									src="<%=request.getContextPath()%>/img/nophoto.jpg">
								<br>
								<a style="display: inline-block; text-decoration-line: none;"
									class="button"
									href="delete?p_code=${row.p_code}&m_code=${row.m_code}">미션취소</a>
								<input type="button" class="button" value="인증하기"
									id="mymission_detail" onclick="mymissiondetail(${row.p_code})">
							</c:if>
						</c:if>
						<c:if test="${row.p_photo != null }">
							<input id="hiddenphoto${row.p_code }" type="hidden"
								value="img/${row.p_photo}">
							<canvas width="250px" height="250px" id="myCanvas${row.p_code }"></canvas>
							<br>
							<span style="font-size: large; font-weight: 700; color: green;">${row.m_point}p</span> 포인트를 획득했습니다.<br>
							<span style="font-size: large; font-weight: 700; color: green;">${row.m_carbon }g</span>의 탄소배출량을 줄였습니다.<br>
							<c:if test="${row.p_review == null }">
								<input type="button" class="button" value="리뷰작성"
									id="mymission_review" onclick="mymissiondetail2(${row.p_code})">
							</c:if>
						</c:if>

					</div>
					<div
						style="display: inline-block; padding-right: 10px; margin-left: 10px;">
						<h3>${row.m_name}</h3>
						<c:if test="${row.m_type == 'solo' }">
						</c:if>
						<c:if test="${row.m_type == 'group' }">
					미션 날짜 : ${row.m_date}<br>
					미션 장소 : ${row.m_location}<br>
							<br>
						</c:if>
						<div></div>
						<c:if test="${row.p_review != null }">
							<c:if test="${row.p_star == 1 }">
								<img width=35px height=22px
									src="<%=request.getContextPath()%>/img/star1.png">
								<br>
							</c:if>
							<c:if test="${row.p_star == 2 }">
								<img width=150px height=25px
									src="<%=request.getContextPath()%>/img/star2.png">
								<br>
							</c:if>
							<c:if test="${row.p_star == 3 }">
								<img width=150px height=25px
									src="<%=request.getContextPath()%>/img/star3.png">
								<br>
							</c:if>
							<c:if test="${row.p_star == 4 }">
								<img width=150px height=25px
									src="<%=request.getContextPath()%>/img/star4.png">
								<br>
							</c:if>
							<c:if test="${row.p_star == 5 }">
								<img width=150px height=25px
									src="<%=request.getContextPath()%>/img/star5.png">
								<br>
							</c:if>

						</c:if>
						<c:if test="${row.p_review != null }">
							<span style="font-size: large; font-weight: 700; color: black;">리뷰
								: </span> ${row.p_review}<br>
						</c:if>
						<c:if test="${row.p_review == null }">
							<br>
							<br>
							<span style="font-size: large; font-weight: 700; color: black;">리뷰를
								작성해주세요! </span>
							<br>
						</c:if>
					</div>
				</div>
			</c:forEach>
		</div>

	</div>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>