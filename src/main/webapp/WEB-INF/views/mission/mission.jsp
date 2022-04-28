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
<script type="text/javascript" src="/js/mission/mission.js"></script>
<link rel="stylesheet" href="/css/mission/mission.css" />
</head>

<body>

<!-- Talk Talk Banner Script start -->
	<script type="text/javascript" src="https://partner.talk.naver.com/banners/script"></script>
	<div class="talk_banner_div" data-id="114553" style="position: fixed; right: 100px; bottom: 30px; z-index: 99;"></div>
<!-- Talk Talk Banner Script end -->


<!--  오늘 날짜 -->
	<jsp:useBean id="toDate" class="java.util.Date" />
	<fmt:parseNumber value="${toDate.time / (1000*60*60*24)}"
		integerOnly="true" var="toDate2" scope="request"></fmt:parseNumber>

<!-- 진행/종료, 단체/상시 버튼 -->
	<div style="text-align: center; margin-top: 50px;">
		<input type=button id=ing name="_ing" checked="checked" autofocus
			value="모집중" onclick="register(1)"> <input type=button id=end
			name="_ing" value="종료" onclick="register(2)">
	</div>
	<div style="text-align: left; margin-top: 30px; margin-left: 10%;">
		<input type=button id=group name="mission" checked="checked" autofocus
			value="단체미션" onclick="group(1)"> <input type=button id=solo
			name="mission" value="상시미션" onclick="group(2)">
	</div>

<!--  미션 목록 -->
	<div class="mission_box">
	
	<!-- 모집중 미션 -->
		<div id=ing_div>
		
		<!-- 단체 미션 -->
			<div id=group_div>
				<h3>모집중인 단체미션</h3>
				<c:forEach items="${gilist }" var="row">
					<div class="missionlist">
						<div class="submissionlist">
							<a href="mission_detail/${row.m_code}"><img class="img_list"
								src="<%=request.getContextPath()%>/img/${row.m_photo}"></a>
						</div>
						
						<div style="display: inline-block">
							<br>
							<ul class="list">
							
							<!-- 단체 미션 남은 날짜별 문구 -->
								<fmt:parseDate var="regDate" value="${row.m_date }"
									pattern="yyyy-MM-dd" />
								<fmt:formatDate value="${regDate}" pattern="yyyy-MM-dd" />
								/
								<fmt:parseNumber value="${regDate.time / (1000*60*60*24)}"
									integerOnly="true" var="regDate2" scope="request"></fmt:parseNumber>
								<c:if test="${(regDate2 - toDate2) > 1}">
									<strong style="color: orange">미션일까지 ${regDate2 - toDate2}일 남았습니다</strong>
								</c:if>
								<c:if test="${(regDate2 - toDate2) == 1}">
									<strong style="color: orange">내일 미션이 진행됩니다! 오늘 안으로 신청해주세요</strong>
								</c:if>
								<c:if test="${(regDate2 - toDate2) < 1}">
									<strong style="color: orange">내일 미션이 진행됩니다! 오늘 안으로 신청해주세요</strong>
								</c:if>
								
							<!--  미션 간략 정보 -->	
								<li><a href="mission_detail/${row.m_code}"><h3>${row.m_name }</h3></a></li>
								<li>장소 : ${row.m_location }</li>
								<li>포인트 : ${row.m_point }p</li>
								<li>탄소배출감소량 : ${row.m_carbon }g</li>
							
							<!--  단체 미션 남은 인원별 문구 -->	
								<c:if test="${row.m_personnel > 5}">
									<li>모집인원이 ${row.m_personnel }명 남았습니다</li>
								</c:if>
								<c:if test="${row.m_personnel < 5 && row.m_personnel > 0}">
									<li>모집인원이 ${row.m_personnel }명 남았습니다 <strong
										style="color: red">서둘러 신청해주세요!</strong></li>
								</c:if>
								<c:if test="${row.m_personnel == 0}">
									<li><strong style="color: green">정원이 다 찼습니다. 다른
											참여자가 취소시 신청할 수 있습니다.</strong></li>
								</c:if>
							</ul>
						</div>
					</div>
				</c:forEach>
			</div>
			
		<!-- 상시 미션 -->
			<div id=solo_div style="display: none">
				<h3>모집중인 상시미션</h3>
				<c:forEach items="${silist }" var="row">
					<div class="missionlist">
						<div class="submissionlist">
							<a href="mission_detail/${row.m_code}"><img class="img_list"
								src="<%=request.getContextPath()%>/img/${row.m_photo}"></a>
						</div>
						<div style="display: inline-block">
							<br><br>
							
						<!--  미션 간략 정보 -->	
							<ul class="list">
								<li style="color: green"><strong>지금 당장 미션을 수행해보세요!</strong></li>
								<li><a href="mission_detail/${row.m_code}"><h3>${row.m_name }</h3></a></li>
								<li>포인트 : ${row.m_point }p</li>
								<li>탄소배출감소량 : ${row.m_carbon }g</li>
							</ul>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

	<!-- 마감 미션 -->
		<div id="end_div" style="display: none">
			<div id="e_group_div" style="margin-top: 109px;">
			
			<!--  단체 미션 -->
				<c:forEach items="${gelist }" var="row">
					<div class="missionlist">
						<div class="submissionlist">
							<a href="mission_detail/${row.m_code}"><img class="img_list"
								src="<%=request.getContextPath()%>/img/${row.m_photo}"></a>
						</div>
						<div style="display: inline-block">
							<br><br>
							
						<!--  미션 간략 정보 -->
							<ul class="list">
								<li style="color: blue"><strong>종료된 미션입니다</strong></li>
								<li><h3>${row.m_name }</h3></li>
								<li>장소 : ${row.m_location }</li>
								<li>날짜 : ${row.m_date }</li>
							</ul>
						</div>
					</div>
				</c:forEach>
				
			<!--  상시 미션 -->	
				<c:forEach items="${selist }" var="row">
					<div class="missionlist">
						<div style="display: inline-block">
							<a href="mission_detail/${row.m_code}"><img class="img_list"
								src="<%=request.getContextPath()%>/img/${row.m_photo}"></a>
						</div>
						<div style="display: inline-block">
							<br><br>
							
						<!--  미션 간략 정보 -->
							<ul class="list">
								<li style="color: blue"><strong>종료된 미션입니다</strong></li>
								<li><a href="mission_detail/${row.m_code}"><h3>${row.m_name }</h3></a></li>
								<li>포인트 : ${row.m_point }</li>
								<li>탄소배출감소량 : ${row.m_carbon }</li>
							</ul>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
