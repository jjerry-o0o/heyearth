// 지역검색 & 현재위치 검색 변환
function search(num){
	if(num =='1'){
		document.getElementById("searchLoc").style.display = "";
		document.getElementById("searchMy").style.display = "none";
		document.getElementById("zerosearch1").style.backgroundColor = "#1A271D";
		document.getElementById("zerosearch2").style.backgroundColor = "#f6f5f0";
		document.getElementById("zerosearch1").style.color = "#f6f5f0";
		document.getElementById("zerosearch2").style.color = "#1A271D";
		
	}else{
		document.getElementById("searchMy").style.display = "";
		document.getElementById("searchLoc").style.display = "none";
		document.getElementById("zerosearch2").style.backgroundColor = "#1A271D";
		document.getElementById("zerosearch1").style.backgroundColor = "#f6f5f0";
		document.getElementById("zerosearch2").style.color = "#f6f5f0";
		document.getElementById("zerosearch1").style.color = "#1A271D";
	}
}



// 제로샵 모달창
function zeroshopdetail(code){
	$.ajax({
		url : "/zeroshopdetail",
		type : "get",
		data : {"scode" : code},
		success : function(result){
			document.getElementById("modal").style.display = "flex";
			document.body.classList.add("stop-scroll");
			$("#modalupper").html("<img id='modalimg' src='img/"+result.s_photo+"' onerror=\"this.src='/img/noimage.jpg'\">");
			$("#modalh2").text(result.s_name);
			$("#modalcontent").html("분류 : " + result.s_inform + "<br>");
			$("#modalcontent").append("위치 : " + result.s_location + "<br>");
			if(result.s_call != null){
				$("#modalcontent").append("전화번호 : " + result.s_call + "<br>");
			}
			if(result.s_close != null){
				$("#modalcontent").append("휴무일 : " + result.s_close + "<br>");
			}
			if(result.s_hour != null){
				$("#modalcontent").append("영업시간 : " + result.s_hour);
			}
			$("#modalbtn").html("<div id='modalsite'><a id='modala' href='"+ result.s_url + "' target='_blank'>Site</a></div>");
			$("#modalbtn").append("<div id='modalmap'><a id='modala' href='https://map.naver.com/v5/search/"+ result.s_location +"/address/' target='_blank'>Map</a></div>")
			// https://map.naver.com/v5/search/%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C%20%EA%B4%80%EC%95%85%EA%B5%AC%20%EC%A1%B0%EC%9B%90%EB%A1%9C18%EA%B8%B8%2015/address/
		}
	});
}

$(document).ready(function(){
	
	// 광역시/도 버튼 클릭
	$("#bigloc").one('click',function(){
		$.ajax({
			url : "/bigloc",
			type : "get",
			success : function(result){
				for(var i=0;i<result.length;i++){
					$("#bigloc").append("<option class='Locopt' value='"+result[i]+"'>"+result[i]+"</option>");
				}
			}
		});
	}); // bigloc button click end
	var bigclicked='no';
	
	$("#bigloc").on("click",function(){
		$("#smallloc").html("<option class='Locopt' value='none' selected disabled hidden>시/군/구</option>");
		bigclicked='ok';
	});
	
	// 시/도/군 버튼 클릭
	$("#smallloc").on('click',function(){
		var bigloc = $("#bigloc").val();
		if(bigclicked == 'ok'){
			bigclicked = 'no';
			$.ajax({
				url : "/smallloc",
				type : "get",
				data : {"bigloc" : bigloc},
				success : function(result){
					$("#smallloc").append("<option class='Locopt' value='전체'>전체</option>")
					for(var i=0;i<result.length;i++){
						$("#smallloc").append("<option class='Locopt' value='"+result[i]+"'>"+result[i]+"</option>");
					}
				}
				
			});
		}
		
	});  // smallloc button click end
	
	// 지역별 제로샵 검색 버튼 클릭
	$("#locbtn").on("click",function(){
		var bigloc = $("#bigloc").val();
		var smallloc = $("#smallloc").val();
		if(bigloc == null || smallloc == null){
			alert("지역을 선택해주세요");
		}
		else{
			$.ajax({
					url : "/loczeroshop",
					type : "get",
					data : {"bigloc" : $("#bigloc").val(), "smallloc" : $("#smallloc").val()},
					success : function(result){
						if(result[0].s_name == "none"){
							$("#loc_context").html("<div class='Nozeroshop'>존재하는 가게가 없습니다.</div>");
						}
						else{
							$("#loc_context").html("<a href='#' class='Zeroshopclick' onclick='zeroshopdetail("+result[0].s_code+")'><div class='Loczeroshop'><div class='Zeroshopname'>"+ result[0].s_name +"</div><img class='Zeroshopimg' src='img/"+result[0].s_photo +"' onerror=\"this.src='/img/noimage.jpg'\"></div></a>");
							
							for(var i=1;i<result.length;i++){
								$("#loc_context").append("<a href='#' class='Zeroshopclick' onclick='zeroshopdetail("+result[i].s_code+")'><div class='Loczeroshop'><div class='Zeroshopname'>"+ result[i].s_name+"</div><img class='Zeroshopimg' src='img/"+result[i].s_photo+"' onerror=\"this.src='/img/noimage.jpg'\"></div></a>");
							}
						}
					}
					
			});
		}
	});
	
	// 모달창 닫기버튼
	$("#modalclose").on("click",function(){
		document.getElementById("modal").style.display = "none";
		document.body.classList.remove("stop-scroll");
	});
	
	// 모달창 외부클릭시 모달창 닫기
	modal.addEventListener("click", e => {
    	const evTarget = e.target
    	if(evTarget.classList.contains("modal-overlay")) {
        	modal.style.display = "none";
        	document.body.classList.remove("stop-scroll");
    	}
	});
	
	// 현재 위치 기반 지도 생성
	/*document.write("<script type='text/javascript' src='https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=27lk7yjxzo'></script>");
	
	navigator.geolocation.getCurrentPosition(function(pos){
		var latitude = pos.coords.latitude;   // 현재 위치 위도
		var longitude = pos.coords.longitude;   // 현재 위치 경도
		
		var mapOptions = {
			center : new naver.maps.LatLng(latitude, longitude),   // 지도의 중앙 위치
			zoom : 17   // 숫자가 높을수록 더 줌된 상태
		}
		
		var map = new naver.maps.Map('map', mapOptions);
	})*/
	
}); // document ready end
