function search(num){
	if(num =='1'){
		document.getElementById("searchLoc").style.display = "";
		document.getElementById("searchMy").style.display = "none";
		document.getElementById("zerosearch1").style.backgroundColor = "#FFDDD0";
		document.getElementById("zerosearch2").style.backgroundColor = "#EAE8E8";
		document.getElementById("zerosearch1").style.fontWeight = "bold";
		document.getElementById("zerosearch2").style.fontWeight = "normal";
	}else{
		document.getElementById("searchMy").style.display = "";
		document.getElementById("searchLoc").style.display = "none";
		document.getElementById("zerosearch2").style.backgroundColor = "#FFDDD0";
		document.getElementById("zerosearch1").style.backgroundColor = "#EAE8E8";
		document.getElementById("zerosearch2").style.fontWeight = "bold";
		document.getElementById("zerosearch1").style.fontWeight = "normal";
	}
}

$(document).ready(function(){
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
	
	$("#smallloc").on('click',function(){
		var bigloc = $("#bigloc").val();
		if(bigclicked == 'ok'){
			bigclicked = 'no';
			$.ajax({
				url : "/smallloc",
				type : "get",
				data : {"bigloc" : bigloc},
				success : function(result){
					for(var i=0;i<result.length;i++){
						$("#smallloc").append("<option class='Locopt' value='"+result[i]+"'>"+result[i]+"</option>");
					}
				}
				
			});
		}
		
	});  // smallloc button click end
	
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
							$("#loc_context").html("<div class='Loczeroshop'><img class='Zeroshopimg' src='img/"+result[0].s_photo +"'><div class='Zeroshopname'>"+ result[0].s_name +"</div></div>");
							for(var i=1;i<result.length;i++){
								$("#loc_context").append("<div class='Loczeroshop'><img class='Zeroshopimg' src='img/"+result[i].s_photo+"'><div class='Zeroshopname'>"+ result[i].s_name+"</div></div>");
							}
						}
					}
					
			});
		}
	});
	
}); // document ready end
