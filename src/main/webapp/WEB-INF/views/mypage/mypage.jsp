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

<style>
	section{
		width : 90%;
		margin : 20px auto;
		padding : 20px;
		color : #1A271D;
	}
	h1{
		text-align: center;
	}
	h3{
		text-align: center;
	}
	#menu{
		display: flex;
		align-content: center;
	}
	#mymenu_div{
		width : 70%;
		height : 500px;
		margin : 10px;
		padding : 10px;
		border : 1px dashed gray;
	}
	#menu_table{
		border-collapse: collapse;
		width : 30%;
		margin : 10px;
		padding : 10px;
		border : 2px solid #1A271D;
	}
	tr{
		border-bottom: 1px solid gray;
		height:20%;
	}
	tr:first-child{
		height : 30%;
	}
	tr:last-child{
		border-style: none;
	}
	tr:hover{
		background-color: #1A271D;
		color : white;
	}
	#profil_div{
		width : 100%;
		height : 170px;
		margin-top: 10px;
		border-style: none;
		background-color: #F6F5F0;
		color: #1A271D;
		font-size: large;
		font-weight: bold;
	}
	#profil_div:hover{
		background-color: #1A271D;
		color : #F6F5F0;
	}
	#name{
		width : 50%;
		display: inline-block;
		text-align: center;
		margin : 0px;
		padding:10px 0px;
		vertical-align: middle;
	}
	#point {
		font-size: large;
		text-align: center;
		border: 1px solid gray;
		border-radius : 10px;
 		margin : 0px 0px;
		padding : 5px 0px;
		width: 30%;
		background-color: #F6F5F0;
		color : black;
	}
	#pointP p{
		margin: 0px 0px;
	}
	#carbon{
		font-size: large;
		text-align: center;
		border: 1px solid gray;
		border-radius : 10px;
 		margin : 0px 0px; 
		padding : 5px 0px;
		width: 30%;
		background-color: #F6F5F0;
		color : black;
	}
	#carbonP p{
		margin: 0px 0px;
	}
	#successP{
		font-size: 25px;
		text-align: center;
		margin-top: 200px;
	}
</style>
</head>
<body>
	<!-- header import -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<!-- end of header import -->

<section class="boardSection">
	<h1>What's up ${sessionScope.session_id} !</h1>
	<div id="menu">
	
		<table id="menu_table">
			<tr>
				<td>
					<input type=button id="profil_div" name="${sessionScope.session_id}" value="${sessionScope.session_id}님의 정보" onclick = "profil_div()" checked="checked"/>
				</td>
			</tr>
			<tr>
				<td id="m_mission" class="btn">
					<input type=button id="mymission" value="나의 활동" onclick = "mymission()">
				</td>
			</tr>
			<tr>
				<td id="m_board" class="btn">
					<input type=button id="myboard" value="작성 게시글" onclick = "myboard()">
				</td>
			</tr>
			<tr>
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
			</form>
			
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
	</div>
</section>
	
	<!-- footer import -->
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	<!-- end of footer import -->
</body>
</html>