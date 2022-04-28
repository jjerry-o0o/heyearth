$(document).ready(function(){
	
	$("#missionback").one('click',function(){
		location.href = "adminmission";
	});
	
	const inputImage = document.getElementById("input-image")
	inputImage.addEventListener("change", e => {
    	readImage(e.target)
	})

	if($("#m_type").val() == "solo"){
		$("#location").html("어디서나<input type='hidden' name='m_location' value='어디서나'>");
		$("#date").html("상시<input type='hidden' name='m_date' value='2025-12-31'>");
		$("#personnel").html("1<input type='hidden' name='m_personnel' value='1'>");
	}
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

