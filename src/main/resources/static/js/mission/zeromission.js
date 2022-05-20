$(document).ready(function (){
	

    //사진 업로드&프리뷰
	var savedFileName = "";
	$("#file").on('change', function(){ 
		var formData = new FormData();
		
	formData.append("uploadFile", $("#file")[0].files[0]);			
		$.ajax({
			url: '/zeromission',
			data: formData,
			type:'post',
			processData : false ,
			contentType : false ,
			success : function(data){
				$("#preview1").attr("src", "/img/" + data);
				savedFileName = data;
				document.querySelector("#ocrreceipt").onclick = ocrreceipt(data);
				
			}//success
		});//ajax
	});//on
	
	//OCR Document 영수증  
	function ocrreceipt(data){
		let savedFileName = data;
		return function(){
			$.ajax({
			url : '/ocrreceipt',
			data: {"savedFileName" : savedFileName},
			type: 'post',
			success: function(data){
				var json = JSON.parse(data.json); //OCR 영수증 변환 값
				var list = data.list; //모든 제로웨이스트샵 리스트
				
				if(json.images[0].inferResult != "ERROR"){
				if(json.images[0].receipt.result.storeInfo.name != null){
				var title = json.images[0].receipt.result.storeInfo.name.text; // 가게 이름
				var total = json.images[0].receipt.result.totalPrice.price.formatted.value; // 총 구매 금액
				
				$("#preview1").css("display", "none");	
				$("#canvas").css("display", ""); // 캔버스 이미지로 변경	
				
				//캔버스 로드
				var canvas = document.getElementById("canvas");
				var context = canvas.getContext("2d");
				
				var image = new Image();
				image.src = "/img/" + savedFileName;
				image.onload = function(){
					context.drawImage(image, 0 ,0, image.width, image.height);
					context.strokeStyle="green";
					context.lineWidth=4;
										
					var canvas_x = json.images[0].receipt.result.storeInfo.name.boundingPolys[0].vertices[0].x;
					var canvas_y = json.images[0].receipt.result.storeInfo.name.boundingPolys[0].vertices[0].y;
					var width = json.images[0].receipt.result.storeInfo.name.boundingPolys[0].vertices[1].x - canvas_x;
					var height = json.images[0].receipt.result.storeInfo.name.boundingPolys[0].vertices[3].y - canvas_y;

					var canvas_x2 = json.images[0].receipt.result.totalPrice.price.boundingPolys[0].vertices[0].x;
					var canvas_y2 = json.images[0].receipt.result.totalPrice.price.boundingPolys[0].vertices[0].y;
					var width2 = json.images[0].receipt.result.totalPrice.price.boundingPolys[0].vertices[1].x - canvas_x2;
					var height2 = json.images[0].receipt.result.totalPrice.price.boundingPolys[0].vertices[3].y - canvas_y2;
					
					context.strokeRect(canvas_x, canvas_y, width, height); //가게 이름 강조
					context.strokeRect(canvas_x2, canvas_y2, width2, height2); // 총 구매 금액 강조
					
				}//onload
			}
			
				// 모든 제로웨이스트샵 이름으로 배열 만들기
				let zerolist = [];
				for(var i=0; i< list.length; i++) {
					zerolist.push(list[i].s_name); 
				}

				// 배열 안에 해당 영수증의 가게 이름이 존재하면 제로웨이스트샵 정보와 링크 제공, 적립 포인트 계산, form으로 정보 보내기 
				if(title != null){
				if(zerolist.includes(title)){ 
				
				var index1 = list.findIndex(obj => obj.s_name == title);
				$("#a").css("display", "");	
				$("#p_photo").val(savedFileName);
				$("#p_point").val(parseInt(total)/10);
				$("#p_location").val(title);

				$("#img").html('');
				$("#store").html('');
		
				$("#img").append("<a target='_blank' href='"+list[index1].s_url+"'><img src='/img/"+list[index1].s_photo+"' width=200px height=200px></a><br>");
				$("#store").append("<br><br>방문한 가게와 주소 : <strong style='font-size:18px;color:green;'>" + title + "</strong><br>");
				$("#store").append("<strong>" + list[index1].s_location + "</strong><br>");
				$("#store").append("총 구매 금액 : <strong style='font-size:18px;color:green;'>" + total + "원</strong><br>");
				$("#store").append("적립가능한 포인트 : <strong style='font-size:18px;color:#1A271D;'>" + parseInt(total)/10 + "p</strong><br>");
				$("#store").append("<strong style='color:#1A271D;'>총 구매 금액의 10분의 1이 포인트로 적립됩니다!</strong>");
				}else{
					$("#nozero").append("죄송합니다. 아직  해당 매장이 헤이얼스 제로웨이스트샵 목록에 존재하지 않습니다. 게시판의 요청탭에서 글을 작성해주세요! <br>");
					$("#board").css("display", "");	
				}				
				}else{
					alert("해당영수증의 가게명을 인식할 수 없습니다. 다시 업로드 해주세요!");
				}
				
				}else{
					alert("해당 영수증을 인식할 수 없습니다. 다시 업로드 해주세요!")
				}
				}//success
			});//ajax
		}
	}
		
});//ready
	
//제로웨이스트샵 등록 요청하기
function board(){
	location.href="/boardinput";
}