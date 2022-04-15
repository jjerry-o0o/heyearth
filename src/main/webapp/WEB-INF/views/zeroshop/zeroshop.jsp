<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>Hey,Earth | Zeroshop</title>
<link href="css/zeroshop/zeroshop.css" rel="stylesheet">
<script src="jquery-3.6.0.min.js"></script>
<script src="/js/zeroshop/zeroshop.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=27lk7yjxzo"></script>
</head>
<body>
<div class="zero_search">
		<input type="button" id="zerosearch1" name="findid" value = "지역으로 검색"onclick="search(1)" checked="checked" autofocus>
		  
		<input type="button" id="zerosearch2" name="findid" value = "내 주변에서 검색" onclick="search(2)">
</div>
<br>
<br>
<div class="zero_body">
	<div id="searchLoc">
		<div id="loc_menu">
			<label for="location" class="Locmenu">지역 선택</label>
			<select name="bigloc" id="bigloc">
				<option class="Locopt" value="none" selected disabled hidden>광역시/도</option>
			</select>
			<select name="smallloc" id="smallloc">
				<option class="Locopt" value="none" selected disabled hidden>시/군/구</option>
			</select>
			<input type="button" value="검색" id="locbtn">
		</div>
		<div id="loc_context">
		</div>
		<div id="modal" class="modal-overlay" id="modal">
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
	
	<div id="searchMy" style="display:none;">
		<h2 class="maptitle">지구를 지키는 가게들</h2>
		<div id="mapname">
		</div>
		<div id="map"></div>
	</div>
</div>
<script>
	
navigator.geolocation.getCurrentPosition(function(pos){
	var latitude = pos.coords.latitude;   // 현재 위치 위도
	var longitude = pos.coords.longitude;   // 현재 위치 경도
	
	
	var mapOptions = {
		//center: new naver.maps.LatLng(latitude, longitude),  // 지도의 중앙 위치
		center: new naver.maps.LatLng(latitude, longitude),  // 지도의 중앙 위치
		zoom: 17  // 숫자가 높을수록 더 줌된 상태
	};

	var map = new naver.maps.Map('map', mapOptions);  // map 변수 생성
});

function getDistanceFromLatLonInKm(lat1,lng1,lat2,lng2) {
	function deg2rad(deg) { 
		return deg * (Math.PI/180) 
	} 
	var R = 6371; // Radius of the earth in km 
	var dLat = deg2rad(lat2-lat1); // deg2rad below 
	var dLon = deg2rad(lng2-lng1); 
	var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.sin(dLon/2) * Math.sin(dLon/2); 
	var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
	var d = R * c; // Distance in km 
	return d; 
}
</script>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>