<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/adminheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hey,Earth | Admin Page</title>
<link href="css/admin/adminlist.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
<script src="jquery-3.6.0.min.js"></script>
<script src="/js/admin/adminmission.js"></script>
</head>
<body>

<h1 class='adminmain'>'환경 지킴이 모집중' 관리 페이지입니다.</h1><br>

<div>
<input class="addbtn" id='missionadd' type='button' value='등록하기' onclick='missioninsert()'>
</div>

<div class="mission_choose">
		<input type="button" id="groupmission" name="findid" value = "단체미션" onclick="mission(1)" checked="checked" autofocus>
		  
		<input type="button" id="solomission" name="findid" value = "상시미션" onclick="mission(2)">
</div>
<br>
<br>
<div class="mission_body">
	<div id="groupmissionpage">
		<table class='adminlisttable' id='admingroupmissiontable'>
		<tr><th>미션명</th><th>날짜</th><th> </th><th> </th><th> </th></tr>
		<c:forEach items="${missionlist}" var="missionlist">
			<tr><td class='tabname'>${missionlist.m_name}</td><td class='missiondate'>${missionlist.m_date }</td>
			<td><input class='tabreviewbtn' id='missionreview' type='button' value='후기보러가기' onclick='missionreview(${missionlist.m_code })'></td>
			<td><input class='tabmodbtn' id='missionmod' type='button' value='수정' onclick='missionmod(${missionlist.m_code})'></td>
			<td><input class='tabdelbtn' id='missiondel' type='button' value='삭제' onclick='missiondel(${missionlist.m_code})'></td></tr>
		</c:forEach> 
		</table>
	</div>
	
	<div id="solomissionpage" style="display:none;">
		<table class='adminlisttable' id='adminsolomissiontable'>
		
		</table>
	</div>
</div>

</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>