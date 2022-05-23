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
<script src="jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/js/mypage/mypage.js"></script>
</head>
<body>

<c:if test="${userdto.redcard == 1}">
 <div id="pop" class="pop">
        <div class="layerBox">
            <h1 class="title">NOTICE</h1>
            <div class="cont">
                <p>미션 인증 사진 신고로 인해 레드카드를 받았습니다.<br>
                <span class="name">${sessionScope.session_id}</span>님의 누적 레드카드 횟수는 <span class="span">${userdto.redcard } 회</span>입니다.<br><br>
                <span class="span">레드카드 1회 : 경고</span><br>
                레드카드 2회 : 모든 포인트 소멸<br>
                레드카드 3회 : 회원 강퇴</p>
            </div>
            <div class="close">
                <span id="check" class="btnTodayHide"><input type="checkbox" value="checkbox" name="chkbox" id="chkday"/><label for="chkday">일주일간 보지 않기</label></span>
                <span id="close" class="btnClose"> <a href="#0">Close</a></span>
            </div>
        </div>
    </div>
    </c:if>
   
    <c:if test="${userdto.redcard == 2}">
     <div id="pop2" class="pop">
        <div class="layerBox">
            <h1 class="title">NOTICE</h1>
            <div class="cont">
                 <p>미션 인증 사진 신고로 인해 레드카드를 받았습니다.<br>
                <span class="name">${sessionScope.session_id}</span>님의 누적 레드카드 횟수는 <span class="span">${userdto.redcard } 회</span>입니다.<br><br>
                레드카드 1회 : 경고<br>
                <span class="span">레드카드 2회 : 모든 포인트 소멸</span><br>
                레드카드 3회 : 회원 강퇴</p>
            </div>
            <div class="close">
                <span id="check2" class="btnTodayHide"><input type="checkbox" value="checkbox" name="chkbox2" id="chkday2"/><label for="chkday2">일주일간 보지 않기</label></span>
                <span id="close2" class="btnClose"> <a href="#0">Close</a></span>
            </div>
        </div>
    </div>
    </c:if>
<!-- Talk Talk Banner Script start -->
	<script type="text/javascript" src="https://partner.talk.naver.com/banners/script"></script>
	<div class="talk_banner_div" data-id="114553" style="position: fixed; right: 100px; bottom: 30px; z-index: 99;"></div>
<!-- Talk Talk Banner Script end -->

	<!-- header import -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<!-- end of header import -->
<section class="boardSection">
<input type="hidden" id="redcard" name="redcard" value="${userdto.redcard }">
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
					<input type=button id="myboard_btn" value="작성게시물 및 댓글" onclick="boardlist()">
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
				<div style="display: grid; grid-template-columns: 50% auto; margin-left: auto; margin-right: auto;">
				<div id="updateDiv"  style="display: inline-block;">
				</div>
				</div>
			</form>
			<form action="/couponinsert" method="post">
				<div id="couponDiv">
				</div>
				</form>
				<div id="myMissionDiv">
				</div>
				<div id="myboardlist_div">
				</div>
				<div id="myguidelist_div">
				</div>
		</div>
	</div>
</section>
	
	<!-- footer import -->
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	<!-- end of footer import -->
</body>
</html>