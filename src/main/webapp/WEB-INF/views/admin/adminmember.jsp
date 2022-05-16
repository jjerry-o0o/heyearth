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
<script src="/js/admin/adminmember.js"></script>
</head>
<body>

<h1 class='adminmain'>'회원 관리' 페이지입니다.</h1><br>

<div class='admincontext'>
	<table class='adminlisttable'>
		<tr><th>닉네임</th><th>마지막 접속일</th><th> </th><th>  </th><th> </th><th> </th></tr>
		<c:forEach items="${memberlist}" var="memberlist">
			<c:if test="${memberlist.redcard == 0}">
				<tr><td class='tabname'>${memberlist.id}</td>
				<td class='tabname'>${memberlist.lastjoin }</td>
				<td><input class="tabmodbtn" id='membermod' type='button' value='회원정보 수정' onclick="membermod('${memberlist.id}')"></td>
				<td><input class="tabmodbtn" id='memberboard' type='button' value='작성한 글 확인' onclick="memberboard('${memberlist.id}')"></td>
				<td><input class="tabdelbtn" id='membermission' type='button' value='참여 미션 확인' onclick="membermission('${memberlist.id}')"></td>
				<c:if test="${memberlist.del == 'N' }">
					<td><input class="tabdelbtn" id='memberdel' type='button' value='탈퇴' onclick="memberdel('${memberlist.id}')"></td>
				</c:if>
				</tr>
			</c:if>
			<c:if test="${memberlist.redcard == 1}">
				<tr><td style='background-color:#FFE8E6' class='tabname'>${memberlist.id}</td>
				<td class='tabname'>${memberlist.lastjoin }</td>
				<td><input class="tabmodbtn" id='membermod' type='button' value='회원정보 수정' onclick="membermod('${memberlist.id}')"></td>
				<td><input class="tabmodbtn" id='memberboard' type='button' value='작성한 글 확인' onclick="memberboard('${memberlist.id}')"></td>
				<td><input class="tabdelbtn" id='membermission' type='button' value='참여 미션 확인' onclick="membermission('${memberlist.id}')"></td>
				<c:if test="${memberlist.del == 'N' }">
					<td><input class="tabdelbtn" id='memberdel' type='button' value='탈퇴' onclick="memberdel('${memberlist.id}')"></td>
				</c:if>
				</tr>
			</c:if>
			<c:if test="${memberlist.redcard == 2}">
				<tr><td style='background-color:#FFC8C4' class='tabname'>${memberlist.id}</td>
				<td class='tabname'>${memberlist.lastjoin }</td>
				<td><input class="tabmodbtn" id='membermod' type='button' value='회원정보 수정' onclick="membermod('${memberlist.id}')"></td>
				<td><input class="tabmodbtn" id='memberboard' type='button' value='작성한 글 확인' onclick="memberboard('${memberlist.id}')"></td>
				<td><input class="tabdelbtn" id='membermission' type='button' value='참여 미션 확인' onclick="membermission('${memberlist.id}')"></td>
				<c:if test="${memberlist.del == 'N' }">
					<td><input class="tabdelbtn" id='memberdel' type='button' value='탈퇴' onclick="memberdel('${memberlist.id}')"></td>
				</c:if>
				</tr>
			</c:if>
			<c:if test="${memberlist.redcard >= 3}">
				<tr><td style='background-color:#FE988F' class='tabname'>${memberlist.id}</td>
				<td class='tabname'>${memberlist.lastjoin }</td>
				<td><input class="tabmodbtn" id='membermod' type='button' value='회원정보 수정' onclick="membermod('${memberlist.id}')"></td>
				<td><input class="tabmodbtn" id='memberboard' type='button' value='작성한 글 확인' onclick="memberboard('${memberlist.id}')"></td>
				<td><input class="tabdelbtn" id='membermission' type='button' value='참여 미션 확인' onclick="membermission('${memberlist.id}')"></td>
				<c:if test="${memberlist.del == 'N' }">
					<td><input class="tabdelbtn" id='memberdel' type='button' value='탈퇴' onclick="memberdel('${memberlist.id}')"></td>
				</c:if>
				</tr>
			</c:if>
		</c:forEach> 
	</table>
	<div id="modal" class="modal-overlay">
		<div class="modal-window">
			<div class="close-area" id="modalclose">X</div>
			<div class="modaltitle">
				<h1 class="modalh1" id="modalh1">탈퇴 이유를 선택해주세요.</h1>
			</div>
			<div class="modalcontent" id="modalcontent">
				<form action='/adminmemberdel' method="post">
					<div id="delid"></div>
					<input class='delreason' type="radio" name="delreason" value="RED" required>레드카드 3회 이상 누적<br>
					<input class='delreason' type="radio" name="delreason" value="CON">2년 이상 접속하지 않음<br>
					<input class='delreason' type="radio" name="delreason" value="OUT">부적절한 행동 적발<br>
					<input class="modalbtn" type="submit" id="delreasonbtn" value="탈퇴"> 
				</form>
			</div>
			<div id="modalbtn">
			</div>
		</div>
	</div>
</div>

</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>