function search(num){
	if(num =='1'){
		document.getElementById("searchLoc").style.display = "";
		document.getElementById("searchMy").style.display = "none";
	}else{
		document.getElementById("searchMy").style.display = "";
		document.getElementById("searchLoc").style.display = "none";
	}
}

$(document).ready(function(){
	$("#bigloc").one('click',function(){
		$.ajax({
			url : "/bigloc",
			type : "get",
			success : function(result){
				for(var i=0;i<result.length;i++){
					$("#bigloc").append("<option value='"+result[i]+"'>"+result[i]+"</option>");
				}
			}
		});
	}); // bigloc button click end
	
	$("#bigloc").on("click",function(){
		$("#smallloc").html("<option value='none' selected disabled hidden>시/군/구</option>");
	});
	
	var bigloc;
	$("#smallloc").on('click',function(){
		var currentbigloc = $("#bigloc").val();
		if(bigloc != currentbigloc){
			bigloc = currentbigloc;
			$.ajax({
				url : "/smallloc",
				type : "get",
				data : {"bigloc" : bigloc},
				success : function(result){
					for(var i=0;i<result.length;i++){
						$("#smallloc").append("<option value='"+result[i]+"'>"+result[i]+"</option>");
					}
				}
				
			});
		}
		
	});  // smallloc button click end
	
	$("#locbtn").on("click",function(){
		
	});
	
}); // document ready end
