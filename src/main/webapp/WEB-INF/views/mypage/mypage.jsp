<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>마이페이지 | heyEarth</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- CSS -->
<link rel="stylesheet" href="/css/mypage/mypage.css"/>

<!-- js -->
<script type="text/javascript" src="/js/mypage/mypage.js"></script>
<script src="jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
	});
</script>

</head>
<body>
	<!-- header import -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<!-- end of header import -->

<section class="boardSection">
	<h1>What's up ${sessionScope.session_id} !</h1>
	<div id="menu">
	
		<table id="menu_table">
			<tr class="menu_tr">
				<td class="menu_td">
					<input type=button id="profil_div" name="${sessionScope.session_id}" value="${sessionScope.session_id}님의 정보" onclick = "profil_div()" checked="checked"/>
				</td>
			</tr>
			<tr class="menu_tr">
				<td id="m_mission" class="btn">
					<input type=button id="mymission" value="나의 활동" onclick = "mymission()">
				</td>
			</tr>
			<tr class="menu_tr">
				<td id="m_board" class="btn">
					<input type=button id="myboard_btn" value="작성게시물" onclick="boardlist()">
				</td>
			</tr>
			<tr class="menu_tr">
				<td id="m_guide" class="btn">
					<input type=button id="myguide" value="자주 보는 배출가이드" onclick = "myguide()">
				</td>
			</tr>
		</table>
		
		<div id="mymenu_div">
			<form action="/update" method="post">
				<div id="updateDiv">
				</div>
				<div id="myMissionDiv">
				</div>
				
				<div id="myboardlist_div">
					<table id="boardlist_tb">
					</table>
				</div>
			</form>
		</div>
		
				<div id="modal" class="modal-overlay">
					<div class="modal-window">
					<div class="close-area" id="modalclose">X</div>
						<div class="modalupper" id="modalupper">
							
						</div>
							<div class="modaltitle">
								<h2 class="modalh2" id="modalh2"></h2>
							</div>
						<div class="modalcontent" id="modalcontent">
						</div>
						
						<div id="modalbtn">
						</div>
					</div>
				</div>
	</div>
</section>
	
	<!-- footer import -->
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	<!-- end of footer import -->
</body>
</html>