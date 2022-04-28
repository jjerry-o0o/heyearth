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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
<script src="jquery-3.6.0.min.js"></script>
<script src="/js/zeroshop/zeroshop.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=27lk7yjxzo"></script>
</head>
<body>

<!-- Talk Talk Banner Script start -->
	<script type="text/javascript" src="https://partner.talk.naver.com/banners/script"></script>
	<div class="talk_banner_div" data-id="114553" style="position: fixed; right: 100px; bottom: 30px; z-index: 99;"></div>
<!-- Talk Talk Banner Script end -->


<div class="zero_search">
		<input type="button" id="zerosearch2" name="findid" value = "내 주변에서 검색"onclick="search(2)" checked="checked" autofocus>
		  
		<input type="button" id="zerosearch1" name="findid" value = "지역으로 검색" onclick="search(1)">
</div>
<br>
<br>
<div class="zero_body">
	<div id="searchLoc" style="display:none;">
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
	
	<div id="searchMy">
		<h2 class="maptitle">지구를 지키는 가게들</h2>
		<p class="mapinform">(반경 10km이내의 가게들만 표시됩니다.)</p>
		<div id="mapname">
			<img src='img/loading.png' class='maploading'>
		</div>
		<div id="map"></div>
	</div>
</div>
<script>
var map;
navigator.geolocation.getCurrentPosition(function(pos){
	var latitude = pos.coords.latitude;   // 현재 위치 위도
	var longitude = pos.coords.longitude;   // 현재 위치 경도
	
	
	var mapOptions = {
		center: new naver.maps.LatLng(latitude, longitude),  // 지도의 중앙 위치
		zoom: 17  // 숫자가 높을수록 더 줌된 상태
	};

	map = new naver.maps.Map('map', mapOptions);  // map 변수 생성
	
	var markerOptions = {
		position : new naver.maps.LatLng(latitude, longitude),
		map : map,
		icon : {
			url : '/img/user.png',
			size : new naver.maps.Size(50,52),
			origin : new naver.maps.Point(0,0),
			anchor : new naver.maps.Point(25,26)
		}
	};
	
	var marker = new naver.maps.Marker(markerOptions);
	
	$.ajax({
		url : "/mapfirst",
		type : "get",
		success : function(){
			latlong(latitude,longitude);
		}
	});
	
});

var markers = new Array();  // 마커 정보를 담는 배열
var infoWindows = new Array();   // 정보창을 담는 배열

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

function latlong(latitude,longitude){
	$.ajax({
		url : "/zeroshoplist",
		type : "get",
		data : {"latitude" : latitude, "longitude" : longitude},
		success : function(zeroshop){
			var list = [];
			for(var i=0;i<zeroshop.length;i++){
				var distance = getDistanceFromLatLonInKm(latitude,longitude,zeroshop[i].latitude,zeroshop[i].longitude);
				if(distance <= 10){
					var tmp = new Object();
					tmp.distance = distance;
					tmp.code = zeroshop[i].s_code;
					tmp.name = zeroshop[i].s_name;
					tmp.photo = zeroshop[i].s_photo;
					tmp.latitude = zeroshop[i].latitude;
					tmp.longitude = zeroshop[i].longitude;
					tmp.url = zeroshop[i].s_url;
					tmp.inform = zeroshop[i].s_inform;
					tmp.location = zeroshop[i].s_location;
					tmp.call = zeroshop[i].s_call;
					tmp.close = zeroshop[i].s_close;
					tmp.hour = zeroshop[i].s_hour;
					
					list.push(tmp);
					//console.log("거리> " + tmp.distance);
				}
			}
			
			list.sort(function(l1,l2){
				return l1.distance - l2.distance;
			});
			
			if(list == null){
				$("#mapname").html("근처에 가게가 없습니다.");
			}
			else{
				
				for(var i=0;i<list.length;i++){
					var marker = new naver.maps.Marker({
						map : map,
						position : new naver.maps.LatLng(list[i].latitude, list[i].longitude)
					});
					
					var contentString = [
				        '<div class="iw_inner">',
				        '<h3>' + list[i].name +'</h3>',
				        '<p>'+ list[i].inform + '<br />' +list[i].location +'<br />',
				    ].join('');
					
					var tmp = "";
					if(list[i].hour != null){
						tmp = "영업시간 : " + list[i].hour + "<br />";
						contentString += tmp;
					}
					if(list[i].close != null){
						tmp = "휴무일 : " + list[i].close + "<br />"
						contentString += tmp;
					}
					if(list[i].call != null){
						tmp = list[i].call + "<br />";
						contentString += tmp;
					}
					tmp = "<a href='" + list[i].url +"' target='_blank' class='mapzeroshopurl'>" + list[i].url + "</a></p></div>";
					contentString += tmp;
					
					
					var infoWindow = new naver.maps.InfoWindow({
						content : contentString
					});
					
					markers.push(marker);
					infoWindows.push(infoWindow);
				}
				
				$("#mapname").html("<div class='mapzeroshop'><a href='#' class='mapzeroshopname' onclick='showmap(0)'>1. "+ list[0].name +"</a><img class='mapzeroshopimg' src='img/"+list[0].photo +"' onerror=\"this.src='/img/noimage.jpg'\"></div>");
				 for(var i=1;i<list.length;i++){
					$("#mapname").append("<div class='mapzeroshop'><a href='#' class='mapzeroshopname' onclick='showmap("+ i + ")'>" + (i+1) +". " + list[i].name +"</a><img class='mapzeroshopimg' src='img/"+list[i].photo +"' onerror=\"this.src='/img/noimage.jpg'\"></div>");
					
				}
				 
				for(var i=0; i<markers.length;i++){
					naver.maps.Event.addListener(markers[i],'click',getClickHandler(i));
				}
				 
				
			}

		}
		
	});
}

function showmap(index){
	
	var marker = markers[index];
	var infoWindow = infoWindows[index];
	
	if(infoWindow.getMap()){
		infoWindow.close();
	}else{
		infoWindow.open(map,marker);
	}
	infoWindow.open(map,marker);
	
}

function getClickHandler(seq){
	return function(e){
		var marker = markers[seq],
		infoWindow = infoWindows[seq];
		
		if(infoWindow.getMap()){
			infoWindow.close();
		}else{
			infoWindow.open(map,marker);
		}
	}
}

</script>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>