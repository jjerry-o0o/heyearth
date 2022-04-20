function search(num){
	if(num =='1'){
		document.getElementById("recyclingFile").style.display = "";
		document.getElementById("recyclingKeyword").style.display = "none";
	}else{
		document.getElementById("recyclingKeyword").style.display = "";
		document.getElementById("recyclingFile").style.display = "none";
	}
}

function r_class(num){
			var r_class;
			if(num == '1') {
				r_class = "종이류";
			}else if (num == '2'){
				r_class = "유리병";
			}else if (num == '3'){
				r_class = "금속캔";
			}else if (num == '4'){
				r_class = "플라스틱류";
			}else if (num == '5'){
				r_class = "비닐류";
			}else if (num == '6'){
				r_class = "스티로품류";
			}else if (num == '7'){
				r_class = "의류 및 원단류";
			}else if (num == '8'){
				r_class = "전지류";
			}else if (num == '9'){
				r_class = "형광등";
			}else if (num == '10'){
				r_class = "고철류";
			}else if (num == '11'){
				r_class = "기타";
			}
			$.ajax({
				url: '/keywordrecycling',
				type:'get',
				data : {"r_class" : r_class},
				
				success : function(rdto){
					$("#previewbox").html("<div><a href='#' onclick='recyclingway("+rdto[0].r_code+")'><img id='r_photo' width=300 height=300 src='img/"+rdto[0].r_photo+"'></a>"
							+ "<p>분류 : " + rdto[0].r_name + "</p></div>");
					for(var i=1; i<rdto.length; i++){
						$("#previewbox").append("<div><img id='r_photo' width=300 height=300 src='img/"+rdto[i].r_photo+"'>"
							+ "<p>분류 : "+ rdto[i].r_name + "</p></div>");
					}
			}//success
			});//ajax
}//function

function recyclingway(r_code){
			alert('hi');
	$.ajax({
		url : "/recyclingway",
		type : "get",
		data : {"r_code" : r_code},
		success : function(rdto){
			document.getElementById("modal").style.display = "flex";
			$("#modalupper").html("<img id='modaling' src='img/"+rdto.r_photo+"'>");
		}//success end
	})//ajax end
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