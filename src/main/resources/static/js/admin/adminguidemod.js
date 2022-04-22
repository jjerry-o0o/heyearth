$(document).ready(function(){
	const inputImage = document.getElementById("input-image")
	inputImage.addEventListener("change", e => {
    	readImage(e.target)
	})
	
	$.ajax({
		url : "/guideclasslist",
		type : "get",
		success : function(result){
			var class_name = $("#r_class").val();
			$("#r_class").html("<option value='direct' selected>직접입력</option>");
				for(var i=0;i<result.length;i++){
					if(class_name == result[i]){
						$("#r_class").append("<option value='"+result[i] +"' selected>"+ result[i] +"</option>");
					}else{					
						$("#r_class").append("<option value='"+result[i] +"'>"+ result[i] +"</option>");
					}
				}
					
		} // success  function end
	});  //missionname ajax
	
	$("#selboxDirect").hide();
	$("#selboxDirect").attr("required",false);
	
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
