$(document).ready(function(){
	
	var curtype = $("#curtype").val();
	
	if(curtype == 'que'){
		$("#queopt").attr("selected","true");
	}else if(curtype == 'req'){
		$("#reqopt").attr("selected","true");
	}
	
	$("#boardback").one('click',function(){
		location.href = "adminboard";
	});
	
	$("#imageremove").on("click",function(){
		$("#previewimg").hide();
		$("#b_img").val("none");
		$("#input-image").val("");
		$("#imageremove").hide();
	});
	
	const inputImage = document.getElementById("input-image")
	inputImage.addEventListener("change", e => {
    	readImage(e.target);
    		$("#previewimg").show();
    		$("#imageremove").show();
	})

	if($("#b_img").val() != 'none'){
		document.getElementById("previewimg").src="img/"+$("#b_img").val();
		$("#previewimg").show();
		$("#imageremove").show();
	}else{
		$("#previewimg").hide();
		$("#imageremove").hide();
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

