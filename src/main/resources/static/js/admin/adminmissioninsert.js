$(document).ready(function(){
	
	$("#previewimg").hide();   // 이미지 미리보기창 안보이게
	
	$("#missionback").one('click',function(){   // 미션리스트 목록으로
		location.href = "adminmission";
	});
	
	const inputImage = document.getElementById("input-image")  // 이미지 띄우기
	inputImage.addEventListener("change", e => {
    	readImage(e.target);
    	$("#previewimg").show();   // 이미지 미리보기창 보이게
	})
	
	var type = "group";   // 현재 미션 타입을 저장
	
	$("#m_type1").click(function(){   // 그룹선택
		$("#selboxDirect").show();   // 직접입력창 띄우기
		$("#selboxDirect").attr("required",true);  // 무조건 입력하도록
		type = "group";
		$("#m_inform").val("");   // 다른 입력값 초기화
		$("#m_carbon").val("");
		$("#m_point").val("");
		$("#selboxDirect").val("");
		$("#m_location").val("");
		$("#m_date").val("");
		$("#m_personnel").val("");
		$("#m_photo").val("");
		$("#previewimg").hide();
		$("#input-image").attr("required",true);
		$("#input-image").val("");
		
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
		$("#m_photo").val("");
		$("#previewimg").hide();
		$("#input-image").attr("required",true);
		$("#input-image").val("");
		
		$("#location").html("어디서나<input type='hidden' name='m_location' value='어디서나'>");
		$("#date").html("상시<input type='hidden' name='m_date' value='2025-12-31'>");
		$("#personnel").html("1<input type='hidden' name='m_personnel' value='1'>");
		
		
		
	})
	
	
	$("#m_name").change(function(){    // 미션명을 바꾼다면
		if($("#m_name").val() == "direct"){   // 직접입력을 선택
			$("#selboxDirect").show();
			$("#selboxDirect").attr("required",true);
			$("#m_inform").val("");
			$("#m_carbon").val("");
			$("#m_point").val("");
			$("#m_photo").val("");
			$("#m_location").val("");
			$("#m_date").val("");
			$("#m_personnel").val("");
			$("#previewimg").hide();
			$("#input-image").attr("required",true);
			$("#input-image").val("");
			
		}else{    // 존재하는 미션 이름을 선택
			$("#selboxDirect").hide();
			$("#selboxDirect").attr("required",false);
			$("#m_location").val("");
			$("#m_date").val("");
			$("#m_personnel").val("");
			$("#input-image").val("");
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
					$("#previewimg").show();
					$("#input-image").attr("required",false);
				}
			});
			
		}
	})
	
	firstnameclick($("#m_name").val());   // 페이지 로드시 이름목록 채우기
	
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
