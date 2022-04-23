$(document).ready(function(){
	
	$("#previewimg").hide();
	
	const inputImage = document.getElementById("input-image")
	inputImage.addEventListener("change", e => {
    	readImage(e.target);
    	$("#previewimg").show();
	})
	
	$.ajax({
		url : "/guideclasslist",
		type : "get",
		success : function(result){
			$("#r_class").html("<option value='direct' selected>직접입력</option>");
				for(var i=0;i<result.length;i++){
					$("#r_class").append("<option value='"+result[i] +"'>"+ result[i] +"</option>");
				}
					
		} // success  function end
	});  //missionname ajax
	
	
	$("#r_class").change(function(){
		if($("#r_class").val() == "direct"){
			$("#selboxDirect").show();
			$("#selboxDirect").attr("required",true);
			
		}else{
			$("#selboxDirect").hide();
			$("#selboxDirect").attr("required",false);
		}
	});
	
	$("#guideback").on('click',function(){
		location.href = "adminguide";
	});
	
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
