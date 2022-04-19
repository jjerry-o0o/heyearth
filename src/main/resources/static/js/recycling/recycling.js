function search(num){
	if(num =='1'){
		document.getElementById("recyclingFile").style.display = "";
		document.getElementById("recyclingKeyword").style.display = "none";
	}else{
		document.getElementById("recyclingKeyword").style.display = "";
		document.getElementById("recyclingFile").style.display = "none";
	}
}

$(document).ready(function (){

	
	
	$("#file").on('change', function(){ 
		var formData = new FormData();
		
	formData.append("uploadFile", $("#file")[0].files[0]);	
		
		$.ajax({
			url: '/recycling',
			data: formData,
			type:'post',
			processData : false ,
			contentType : false ,
			success : function(savedFileName){
				$("#preview1").attr("src", "http://localhost:8080/upload/" + savedFileName);
		}//success
		});//ajax
	});//on
	
	
});//ready