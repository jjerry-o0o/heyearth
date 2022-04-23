$(document).ready(function(){
	$("#reviewback").on('click',function(){
		const code = document.getElementById("m_code");
		location.href = "adminmissionreview?code="+code.value;
	});
	
	const inputImage = document.getElementById("input-image")
	inputImage.addEventListener("change", e => {
    	readImage(e.target)
	})
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

