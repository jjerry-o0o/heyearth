$(document).ready(function(){
	$("#missionback").one('click',function(){
		location.href = "adminmission";
	});
	
	const inputImage = document.getElementById("input-image")
	inputImage.addEventListener("change", e => {
    	readImage(e.target)
	})
	
	var type = "group";
	
	$("#m_type1").click(function(){   // 그룹선택
		$("#selboxDirect").show();
		$("#selboxDirect").attr("required",true);
		type = "group";
		$("#m_inform").val("");
		$("#m_carbon").val("");
		$("#m_point").val("");
		$("#selboxDirect").val("");
		$("#m_location").val("");
		$("#m_date").val("");
		$("#m_personnel").val("");
		$("#m_photo").val("eco.jpg");
		document.getElementById("previewimg").src="img/eco.jpg";
		
		$("#location").html("<input id='m_location' name='m_location' class='admintd' type='text' required>");
		$("#date").html("<input id='m_date' name='m_date' class='admintd' type='date' required>");
		$("#personnel").html("<input id='m_personnel' name='m_personnel' class='admintd' min='1' type='number' required>");

	})
	
	$("#m_type2").click(function(){   // 상시선택
		$("#selboxDirect").show();
		$("#selboxDirect").attr("required",true);
		type = "solo";
		$("#m_inform").val("");
		$("#m_carbon").val("");
		$("#m_point").val("");
		$("#selboxDirect").val("");
		$("#m_location").val("");
		$("#m_date").val("");
		$("#m_personnel").val("");
		$("#m_photo").val("eco.jpg");
		document.getElementById("previewimg").src="img/eco.jpg";
		
		$("#location").html("어디서나<input type='hidden' name='m_location' value='어디서나'>");
		$("#date").html("상시<input type='hidden' name='m_date' value='2025-12-31'>");
		$("#personnel").html("1<input type='hidden' name='m_personnel' value='1'>");
		
		
		
	})
	
	
	$("#m_name").change(function(){
		if($("#m_name").val() == "direct"){
			$("#selboxDirect").show();
			$("#selboxDirect").attr("required",true);
			
		}else{
			$("#selboxDirect").hide();
			$("#selboxDirect").attr("required",false);
			$.ajax({
				url : "/missioninfo1",
				type : "get",
				data : {"m_name" : $("#m_name").val(), "m_type" : type},
				success : function(result){
					$("#m_inform").val(result.m_inform);
					$("#m_carbon").val(result.m_carbon);
					$("#m_point").val(result.m_point);
					$("#m_photo").val(result.m_photo);
					document.getElementById("previewimg").src="img/"+result.m_photo;
				}
			});
			
		}
	})
	
	firstnameclick($("#m_name").val());
	
})

function readImage(input){
	if(input.files && input.files[0]){
		// FileReader 인스턴스 생성
		const reader = new FileReader()
		
		// 이미지가 로드된 경우
		reader.onload = e =>{
			const previewImage = document.getElementById("previewimg")
			previewImage.src = e.target.result
		}
		
		// reader가 이미지 읽도록 하기
		reader.readAsDataURL(input.files[0])
	}
}


function firstnameclick(name){
	var m_type;
	if(document.getElementById('m_type1').checked){
		m_type = document.getElementById('m_type1').value;
	}else{
		m_type = document.getElementById("m_type2").value;
	}

	// 이름 불러오기
	if(m_type == "group"){		
		$.ajax({
				url : "/missionname",
				type : "get",
				data : {"m_type" : m_type},
				success : function(result){
					if(name == "none"){					
						$("#m_name").html("<option value='direct' selected>직접입력</option>");
						for(var i=0;i<result.length;i++){
							$("#m_name").append("<option value='"+result[i] +"'>"+ result[i] +"</option>");
						}
					}else{
						$("#m_name").html("<option value='direct'>직접입력</option>")
						
						for(var i=0;i<result.length;i++){
							if(result[i] == name){
								$("#m_name").append("<option value='"+result[i] +"' selected>"+ result[i] +"</option>");
							}else{						
								$("#m_name").append("<option value='"+result[i] +"'>"+ result[i] +"</option>");
							}
						}
					}
				} // success  function end
			});  //missionname ajax
	}else{
		alert("상시");
		$("#m_name").html("<option value='direct' selected>직접입력</option>");
	}

}


function nameclick(name){
	var m_type;
	if(document.getElementById('m_type1').checked){
		m_type = document.getElementById('m_type1').value;
	}else{
		m_type = document.getElementById("m_type2").value;
	}


	// 이름 불러오기
	if(m_type == "group"){		
		$.ajax({
				url : "/missionname",
				type : "get",
				data : {"m_type" : m_type},
				success : function(result){
					$("#m_name").html("<option value='direct' selected>직접입력</option>");
						for(var i=0;i<result.length;i++){
							$("#m_name").append("<option value='"+result[i] +"'>"+ result[i] +"</option>");
						}
					
				} // success  function end
			});  //missionname ajax
	}else{
		$("#m_name").html("<option value='direct' selected>직접입력</option>");
	}

}
