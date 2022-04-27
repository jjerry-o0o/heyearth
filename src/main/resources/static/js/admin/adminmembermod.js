$(document).ready(function(){
	/*const inputImage = document.getElementById("input-image")
	inputImage.addEventListener("change", e => {
    	readImage(e.target);
    	$("#previewimg").show();
    	$("#imageremove").show();
	})
	
	$("#imageremove").on("click",function(){
		$("#previewimg").hide();
		$("#photo").val("none");
		$("#input-image").val("");
		$("#imageremove").hide();
	});
	*/
	
	$("#memberback").on('click',function(){
		location.href = "adminmember";
	});
	/*
	if($("#photo").val() != "none"){
		$("#previewimg").attr("src","img/"+$("#photo").val());
		$("#previewimg").show();
		$("#imageremove").show();
	}else{
		$("#previewimg").hide();
		$("#imageremove").hide();
	}*/
	
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
