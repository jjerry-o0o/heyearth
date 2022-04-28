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
<script src="/js/admin/adminmembermission.js"></script>
</head>
<body>

<h1 class='adminmain'>'${missionlist[0].id}'님이 참여하신 미션 페이지입니다.</h1><br>
<input type="hidden" id="id" value="${missionlist[0].id }">

<div class="mission_choose">
		<input type="button" id="groupmission" name="findid" value = "단체미션" onclick="mission(1)" checked="checked" autofocus>
		  
		<input type="button" id="solomission" name="findid" value = "상시미션" onclick="mission(2)">
</div>
<br>
<br>
<div class="admincontext">
	<div id="groupmissionpage">
		<c:forEach items="${missionlist}" var="missionlist">
		
			<c:if test="${missionlist.m_type == 'group' }">
				<c:if test="${missionlist.m_name != 'none'}">		
					<div class='review'>
	 
						<div class='reviewinfo'><img class='reviewimg' src="img/${missionlist.p_photo }"></div>
						<div class='reviewinfo'><span class='reviewmission'>${missionlist.m_name }</span><br>
						받은 신고 수 : <span style="color:red;font-size:20px; font-weight:700;">${missionlist.p_redcard }</span><br>
						날짜 : ${missionlist.m_date }<br>
						장소 : ${missionlist.m_location }<br>
						<c:if test="${missionlist.p_star != 0 }">
							별점 : ${missionlist.p_star }<br>
						</c:if>
						<c:if test="${missionlist.p_review != null }">
							<div class='reviewcontent'>${missionlist.p_review }</div>
						</c:if>
						<c:if test="${missionlist.p_review == null }">
							아직 리뷰가 없습니다.
						</c:if>
						</div><br>
						<input type="button" class="reviewbtn" value="수정하기" onclick='missionmod(${missionlist.p_code})'>
						<input type="button" class="reviewbtn" value="삭제하기" onclick='missiondel(${missionlist.p_code})'>
					</div>
				</c:if>
				<c:if test="${missionlist.m_name == 'none' }">
					<div class='noreview'>
						참여한 미션이 없습니다.
						
					</div>
				</c:if>
			</c:if>
		</c:forEach> 
	</div>
	
	<div id="solomissionpage" style="display:none;">
		<c:forEach items="${missionlist}" var="missionlist">
			<c:if test="${missionlist.m_type == 'solo' }">
				<c:if test="${missionlist.m_name != 'none'}">		
					<div class='review'>
						<div class='reviewinfo'><img class='reviewimg' src="img/${missionlist.p_photo }"></div>
						<div class='reviewinfo'><span class='reviewmission'>${missionlist.m_name }</span><br>
						받은 신고 수 : <span style="color:red;font-size:20px; font-weight:700;">${missionlist.p_redcard }</span><br>
						<c:if test="${missionlist.p_star != 0 }">
							별점 : ${missionlist.p_star }<br>
						</c:if>
						<c:if test="${missionlist.p_review != null }">
							<div class='reviewcontent'>${missionlist.p_review }</div>
						</c:if>
						<c:if test="${missionlist.p_review == null }">
							아직 리뷰가 없습니다.
						</c:if>
						</div><br>
						<input type="button" class="reviewbtn" value="수정하기" onclick='missionmod(${missionlist.p_code})'>
						<input type="button" class="reviewbtn" value="삭제하기" onclick='missiondel(${missionlist.p_code})'>
					</div>
				</c:if>
				<c:if test="${missionlist.m_name == 'none' }">
					<div class='noreview'>
						참여한 미션이 없습니다.
						
					</div>
				</c:if>
			</c:if>
		</c:forEach> 
	</div>
	
	<br>
	<br>
	<br>
	<br>
	<input type="button" class="reviewbtn" value="목록으로" onclick='missionback()'>
	<br>
	<br>
	<br>
</div>

</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>