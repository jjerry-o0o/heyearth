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
					var previewbox = document.getElementById("previewbox");
					$('#previebox div').empty();
					var previewdiv = document.createElement("div");
					previewbox.appendChild(previewdiv);
					var previewa = document.createElement("a");
					previewa.href = "#";
					previewdiv.appendChild(previewa);
					var previewimg = document.createElement("img");
					previewa.appendChild(previewimg);
					previewimg.src = "img/"+rdto[0].r_photo;
					previewimg.width = 300;
					previewimg.height = 300;

					var previewp = document.createElement("p");
					previewp.setAttribute("id","previewp");
					previewp.innerHTML = "분류 : "+rdto[0].r_name;
					previewa.appendChild(previewp);
					
					previewa.addEventListener('click',() => {recyclingway(rdto[0].r_code)});

					for(var i=1; i<rdto.length; i++){
						var previewbox = document.getElementById("previewbox");
						var previewdiv = document.createElement("div");
						previewbox.appendChild(previewdiv);
						var previewa = document.createElement("a");
						previewa.href = "#";
						previewdiv.appendChild(previewa);
						var previewimg = document.createElement("img");
						previewa.appendChild(previewimg);
						previewimg.src = "img/"+rdto[i].r_photo;
						previewimg.width = 300;
						previewimg.height = 300;
						previewimg.alt = rdto[i].r_code ;

						var previewp = document.createElement("p");
						previewp.setAttribute("id","previewp");
						previewp.innerText = "분류 : "+rdto[i].r_name;
						previewa.appendChild(previewp);
	
						//var previewp2 = document.createElement("p");
						//previewp2.innerText = rdto[i].r_code ;
						//previewa.appendChild(previewp2);
						//for(var i =0; i < previewa.childNodes.length; i++){
						//alert("--"+previewa.childNodes[2].innerText+"--");
							
						//}
						previewa.addEventListener('click',(e) => {
							//alert(e.target.alt);
							//e.target = 클릭 이벤트가 발생한 대상(요소)
							//alt = 이미지의 alt값
							recyclingway(e.target.alt);
							});
					}//for end
			}//success
			});//ajax
}//function

function recyclingway(r_code){
	$.ajax({
		url : "/recyclingway",
		type : "get",
		data : {"r_code" : r_code},
		success : function(rdto){
			var modal = document.getElementById("modal");
			modal.style.display = "flex";
			
			$("#modalupper").html("<img id='modalimg' src='img/"+rdto.r_photo+"'>");
			$("#modalh2").text(rdto.r_name);
			$("#modalcontent").text("분류 : " + rdto.r_name + "<br>");
			$("#modalcontent").text("배출 방법 : " + rdto.r_way);
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
	
	$("#modal").on("click",function(){
		document.getElementById("modal").style.display = "none";
	});
	
	modal.addEventListener("click", e => {
		const evTarget = e.target
		if(evTarget.classList.contains("modal-overlay")) {
			modal.style.display = "none";
		}
	});
	

	
});//ready